unit MODULO_DE_DATOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Refresh, RefreshQ;

type
  TDatos = class(TDataModule)
    Clientes_DS: TDataSource;
    Mayores_DS: TDataSource;
    Menores_DS: TDataSource;
    Multas_DS: TDataSource;
    Videos_DS: TDataSource;
    Total_DS: TDataSource;
    Clientes: TSelfRefreshTable;
    Mayores: TSelfRefreshTable;
    Total: TSelfRefreshTable;
    Multas: TSelfRefreshTable;
    Menores: TSelfRefreshTable;
    Videos: TSelfRefreshTable;
    Base: TDatabase;
    SESION: TSession;
    Query_General: TSelfRefreshQuery;
    Query_General_DS: TDataSource;
    SeleccionesDS: TDataSource;
    Selecciones: TSelfRefreshTable;
    Query_Peliculas: TSelfRefreshQuery;
    Query_Peliculas_DS: TDataSource;
    Debe_DS: TDataSource;
    Debe: TSelfRefreshTable;
    Tarjetas_DS: TDataSource;
    Tarjetas: TSelfRefreshTable;
    Cheques_DS: TDataSource;
    Cheques: TSelfRefreshTable;
    Promo3x2DS: TDataSource;
    Promo3x2: TSelfRefreshTable;
    procedure ClientesAfterPost(DataSet: TDataSet);
    procedure MayoresAfterPost(DataSet: TDataSet);
    procedure MenoresAfterPost(DataSet: TDataSet);
    procedure VideosAfterPost(DataSet: TDataSet);
    procedure TotalAfterPost(DataSet: TDataSet);
    procedure MultasAfterPost(DataSet: TDataSet);
    procedure DatosCreate(Sender: TObject);
    procedure SeleccionesAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Datos: TDatos;

implementation

{$R *.DFM}
//***** Función de Encriptado de clave para copia
Function Encripta(X:String): String; Far; External 'Control.dll';

procedure TDatos.ClientesAfterPost(DataSet: TDataSet);
begin
  Clientes.FlushBuffers;
end;

procedure TDatos.MayoresAfterPost(DataSet: TDataSet);
begin
  Mayores.FlushBuffers;
end;

procedure TDatos.MenoresAfterPost(DataSet: TDataSet);
begin
  Menores.FlushBuffers;
end;

procedure TDatos.VideosAfterPost(DataSet: TDataSet);
begin
  Videos.FlushBuffers;
end;

procedure TDatos.TotalAfterPost(DataSet: TDataSet);
begin
  Total.FlushBuffers;
end;

procedure TDatos.MultasAfterPost(DataSet: TDataSet);
begin
  Multas.FlushBuffers;
end;

procedure TDatos.DatosCreate(Sender: TObject);
begin
  Sesion.AddPassword(Encripta('ÃÚßÚ'));
end;

procedure TDatos.SeleccionesAfterPost(DataSet: TDataSet);
begin
  Selecciones.FlushBuffers;
end;

end.
