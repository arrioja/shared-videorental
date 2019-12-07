unit UListado_Clientes_Ultimos_Videos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Db, DBTables, ExtCtrls, Grids, DBGrids, RefreshQ;

type
  TListado_Clientes_Ultimos_Videos = class(TForm)
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Bevel3: TBevel;
    GroupBox1: TGroupBox;
    Edit1: TMaskEdit;
    Bevel2: TBevel;
    ImprimirBtn: TBitBtn;
    Label1: TLabel;
    Query1: TSelfRefreshQuery;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Clientes_Ultimos_Videos: TListado_Clientes_Ultimos_Videos;

implementation

uses Uprincipal, MODULO_DE_DATOS, UListado_Clientes_Ultimos_Videos_Prn;

{$R *.DFM}

procedure TListado_Clientes_Ultimos_Videos.FormShow(Sender: TObject);
begin
  Query1.SQL.Clear;
  Edit1.Text:='';
  Edit1.SetFocus;
  Label1.Caption:='';
end;

procedure TListado_Clientes_Ultimos_Videos.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
      Datos.Videos.IndexName:='';    
      Datos.Videos.Setkey;
      Datos.Videos.Fieldbyname('Codigo_Video').Asstring:=Edit1.Text;
      If Datos.Videos.Gotokey = True Then
        Begin
          Label1.Caption:=Datos.Videos.Fieldbyname('Titulo_Video').Asstring;
          Query1.SQL.Clear;
          Query1.SQL.Add('Select Registro.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, Registro.Fecha_Salida from Registro,Usuarios '+
                         'Where ((Registro.Codigo_Cliente = Usuarios.Codigo_Cliente) AND (Registro.Codigo_Video = "'+Edit1.Text+'")) '+
                         'Order BY Registro.Fecha_Salida Descending');
          Query1.Open;
        end
      else
        Begin
          Query1.SQL.Clear;
          Label1.Caption:='EL VIDEO NO EXISTE !!!';
          Edit1.Text:='';
          Edit1.Setfocus;
        end;
    end;
end;

procedure TListado_Clientes_Ultimos_Videos.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TListado_Clientes_Ultimos_Videos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Principal.Enabled:=True;
end;

procedure TListado_Clientes_Ultimos_Videos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #27 Then Close;
end;

procedure TListado_Clientes_Ultimos_Videos.ImprimirBtnClick(
  Sender: TObject);
begin
  Try
    Begin
      Listado_Clientes_Ultimos_Videos_Prn:=TListado_Clientes_Ultimos_Videos_Prn.Create(Self);
      Listado_Clientes_Ultimos_Videos_Prn.QrLabel6.Caption:='Clientes que alquilaron: '+Label1.Caption;
      Listado_Clientes_Ultimos_Videos_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Listado_Clientes_Ultimos_Videos_Prn.Free;
      Listado_Clientes_Ultimos_Videos_Prn:=Nil;
    end;
  end;
end;

end.
