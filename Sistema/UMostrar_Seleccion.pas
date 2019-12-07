unit UMostrar_Seleccion;

interface

uses
  Windows,  Messages,  SysUtils,  Classes,  Graphics,  Controls,  Forms,
  Dialogs,  ExtCtrls,  StdCtrls,  Buttons,  
  Graphlbl,  Gradpan,  jpeg, GradBtn, Grids,
  DBGrids, Modulo_de_Datos, ComCtrls;

type
  TMostrar_Seleccion = class(TForm)
    Panel_de_Fondo: TPanel;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    ImprimirBtn: TBitBtn;
    BitBtn2: TBitBtn;
    Factura: TRichEdit;
    BitBtn1: TBitBtn;
    procedure GradBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mostrar_Seleccion: TMostrar_Seleccion;

implementation

uses uconfirmar, UPrincipal, UAlquilar_y_Devolver;

{$R *.DFM}

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
              Datos.QuerySeleccion.DisableControls;
              Datos.QuerySeleccion.Sql.Clear;
              Datos.QuerySeleccion.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                                           'Selecciones.Codigo_Cliente, '+
                                           '(Videos.Anaquel+'' - ''+Videos.Linea+'' - ''+Videos.Posicion) As Ubicacion, '+
//                                           '(Personal_Interno.Apellidos+'' ''+Personal_Interno.Nombres) As Name, '+
                                           'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                                           'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                                           '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
              Datos.QuerySeleccion.ParamByName('Cod_Cliente').AsString:=Alquilar_y_Devolver.MaskEdit1.Text;
              Datos.QuerySeleccion.Open;
              Datos.QuerySeleccion.EnableControls;
//              Datos.Selecciones.Close;
            end;
        end;
    end
  Finally
  end;
end;

procedure TMostrar_Seleccion.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TMostrar_Seleccion.ImprimirBtnClick(Sender: TObject);
begin
  Datos.QuerySeleccion.First;
  Factura.Lines.Add('----------------------------------------');
  Factura.Lines.Add(' Codigo   ---   Ubicación  ');
  While Not Datos.QuerySeleccion.EOF do
    Begin
      Factura.Lines.Add(Datos.QuerySeleccion.Fieldbyname('Codigo_Video').AsString+
                        '      '+Datos.QuerySeleccion.Fieldbyname('Ubicacion').AsString);
      Datos.QuerySeleccion.Next;
    end;
    Factura.Lines.Add('----------------------------------------');
    Factura.Lines.Add(#13);
    Factura.Lines.Add(#13);
    Factura.Lines.Add(#13);
    Factura.Lines.SaveToFile('Seleccion.txt');
    Factura.Print('Listado de Selección de VídeoRental 2000');
end;

procedure TMostrar_Seleccion.FormShow(Sender: TObject);
begin
  Datos.QuerySeleccion.DisableControls;
  Datos.QuerySeleccion.Sql.Clear;
  Datos.QuerySeleccion.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                               'Selecciones.Codigo_Cliente, '+
                               '(Videos.Anaquel+'' - ''+Videos.Linea+'' - ''+Videos.Posicion) As Ubicacion, '+
                               'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                               'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                               '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
  Datos.QuerySeleccion.ParamByName('Cod_Cliente').AsString:=Alquilar_y_Devolver.MaskEdit1.Text;
  Datos.QuerySeleccion.Open;
  Datos.QuerySeleccion.EnableControls;
  If Datos.QuerySeleccion.RecordCount >=1 Then
    Begin
      ImprimirBtn.Enabled:=True;
      BitBtn1.Enabled:=True;
    end;
end;

procedure TMostrar_Seleccion.BitBtn1Click(Sender: TObject);
begin
  Try
    Begin
      Confirmar:=TConfirmar.Create(Self);
      Confirmar.Label1.Caption:='Limpiar Selección?';
      Confirmar.BitBtn1.Hint:='Limpiar la selección hecha por el cliente';
      Confirmar.BitBtn1.Hint:='Cancelar la eliminaxión de los videos en la selección';
      Confirmar.ShowModal;
      If Confirmar.ModalResult = MrOK Then
        Begin
          Datos.QuerySeleccion.First;
          While Not Datos.QuerySeleccion.EOF do
            Begin
              Datos.Selecciones.Open;
              Datos.Selecciones.IndexName:='';
              Datos.Selecciones.Setkey;
              Datos.Selecciones.FieldByName('Num_Reg').AsString:=Datos.QuerySeleccion.Fieldbyname('Num_Reg').AsString;
              If Datos.Selecciones.GotoKey = True Then Datos.Selecciones.Delete
              else Datos.QuerySeleccion.Next;
            end;
          Datos.QuerySeleccion.DisableControls;
          Datos.QuerySeleccion.Sql.Clear;
          Datos.QuerySeleccion.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                                       'Selecciones.Codigo_Cliente, '+
                                       '(Videos.Anaquel+'' - ''+Videos.Linea+'' - ''+Videos.Posicion) As Ubicacion, '+
                                       'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                                       'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                                       '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
          Datos.QuerySeleccion.ParamByName('Cod_Cliente').AsString:=Alquilar_y_Devolver.MaskEdit1.Text;
          Datos.QuerySeleccion.Open;
          Datos.QuerySeleccion.EnableControls;
        end;
    end
  Finally
    Confirmar.Free;
    Confirmar:=Nil;
  end;
end;

end.
