unit UMostrar_Seleccion;

interface

uses
  Windows,  Messages,  SysUtils,  Classes,  Graphics,  Controls,  Forms,
  Dialogs,  ExtCtrls,  StdCtrls,  Buttons,  
  Graphlbl,  Gradpan,  jpeg, GradBtn, Grids,
  DBGrids, Modulo_de_Datos;

type
  TMostrar_Seleccion = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TLabel;
    Label1: TLabel;
    Panel_de_Fondo: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    GradBtn2: TGradBtn;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    GradBtn1: TGradBtn;
    procedure GradBtn2Click(Sender: TObject);
    procedure GradBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mostrar_Seleccion: TMostrar_Seleccion;

implementation

uses uconfirmar, UVista_Grande_Pelicula, UPrincipal, UPrimera_Entrada,
  UAlquilar_y_Devolver;

{$R *.DFM}

procedure TMostrar_Seleccion.GradBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TMostrar_Seleccion.GradBtn1Click(Sender: TObject);
begin
  Try
    Begin
      If Datos.Query_General.RecordCount > 0 Then
        Begin
          Confirmar:=TConfirmar.Create(Self);
          Confirmar.ShowModal;
          If Confirmar.ModalResult = MrOK Then
            Begin
              Datos.Selecciones.Open;
              Datos.Selecciones.IndexName:='';
              Datos.Selecciones.Setkey;
              Datos.Selecciones.FieldByName('Num_Reg').AsString:=Datos.Query_General.Fieldbyname('Num_Reg').AsString;
              If Datos.Selecciones.GotoKey = True Then Datos.Selecciones.Delete;
              Datos.Query_General.DisableControls;
              Datos.Query_General.Sql.Clear;
              Datos.Query_General.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                                      'Videos.Foto_Miniatura, Videos.Foto_Grande, Selecciones.Codigo_Cliente, '+
                                      'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                                      'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                                      '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
              Datos.Query_General.ParamByName('Cod_Cliente').AsString:=Principal.MaskEdit1.Text;
              Datos.Query_General.Open;
              Datos.Query_General.EnableControls;
              Datos.Selecciones.Close;
            end;
        end;
    end
  Finally
  end;
end;

procedure TMostrar_Seleccion.DBGrid1CellClick(Column: TColumn);
begin
  Try
    Begin
      Image1.Picture.LoadFromFile(Datos.Query_General.Fieldbyname('Foto_Miniatura').AsString);
      Image1.Cursor:=CrHandPoint;
    end
  Except
    On EInvalidGraphic do
      Begin
        Image1.Picture:=Nil;
        Image1.Cursor:=CrNo;
      end;
    On EFOpenError do
      Begin
        Image1.Picture:=Nil;
        Image1.Cursor:=CrNo;
      end;
  end;
end;

procedure TMostrar_Seleccion.Image1DblClick(Sender: TObject);
begin
  If Image1.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
          Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Query_General.Fieldbyname('Foto_Grande').AsString);
          Vista_Grande_Pelicula.ShowModal;
        end
      Finally
      end;
    end;
end;

end.
