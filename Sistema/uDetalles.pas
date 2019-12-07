unit uDetalles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBTables, Grids, DBGrids, ExtCtrls, DBIndex,
  RXClock, RefreshQ;

type
  TDetalles = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    Query1: TSelfRefreshQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detalles: TDetalles;

implementation

uses ualquilar_y_devolver, UHistorial_Cliente, MODULO_DE_DATOS;

{$R *.DFM}

procedure TDetalles.FormShow(Sender: TObject);
begin
  Query1.Sql.Clear;
  Query1.Sql.add('Select Historia.Nombre_Video, Historia.Fecha_de_Alquiler, Historia.Fecha_de_Devolucion '+
                 'from Historia, Usuarios Where ((Codigo_Cliente = "'+Historial_Cliente.Maskedit1.text+'") AND (Historia.Codigo_Cliente = Usuarios.Codigo_Cliente)) '+
                 'Order by Historia.Nombre_Video');
  Query1.Open;
  Label1.Caption:=inttostr(Query1.RecordCount);

end;
procedure TDetalles.BitBtn1Click(Sender: TObject);
begin
  Close;
end;


procedure TDetalles.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then
    Close;
end;

procedure TDetalles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Historial_Cliente.Enabled:=True;
end;



end.
