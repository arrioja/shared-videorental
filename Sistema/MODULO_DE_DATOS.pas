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
    Cheques_DS: TDataSource;
    Tarjetas_DS: TDataSource;
    Multas_DS: TDataSource;
    Inscripciones_DS: TDataSource;
    Alquileres_DS: TDataSource;
    Deudas_DS: TDataSource;
    Videos_DS: TDataSource;
    Historia_DS: TDataSource;
    Total_DS: TDataSource;
    Debe_DS: TDataSource;
    Registro_DS: TDataSource;
    Clientes: TSelfRefreshTable;
    Cheques: TSelfRefreshTable;
    Mayores: TSelfRefreshTable;
    Total: TSelfRefreshTable;
    Multas: TSelfRefreshTable;
    Inscripciones: TSelfRefreshTable;
    Menores: TSelfRefreshTable;
    Tarjetas: TSelfRefreshTable;
    Videos: TSelfRefreshTable;
    Debe: TSelfRefreshTable;
    Registro: TSelfRefreshTable;
    Deudas: TSelfRefreshTable;
    Alquileres: TSelfRefreshTable;
    Historia: TSelfRefreshTable;
    Base: TDatabase;
    SESION: TSession;
    TablaAccesos_DS: TDataSource;
    TablaAccesos: TSelfRefreshTable;
    TablaUsuarios_DS: TDataSource;
    TablaUsuarios: TSelfRefreshTable;
    TablaHistConex_DS: TDataSource;
    TablaHistConex: TSelfRefreshTable;
    Transacciones_DS: TDataSource;
    Transacciones: TSelfRefreshTable;
    Query_General: TSelfRefreshQuery;
    Query_General_DS: TDataSource;
    Cierres_DS: TDataSource;
    Cierres: TSelfRefreshTable;
    Empresa_DS: TDataSource;
    Empresa: TSelfRefreshTable;
    Facturas_DS: TDataSource;
    Facturas: TSelfRefreshTable;
    Promo3x2DS: TDataSource;
    Promo3x2: TSelfRefreshTable;
    TablaMiscelaneosDS: TDataSource;
    TablaMiscelaneos: TSelfRefreshTable;
    QuerySeleccion: TSelfRefreshQuery;
    QuerySeleccionDS: TDataSource;
    SeleccionesDS: TDataSource;
    Selecciones: TSelfRefreshTable;
    procedure ClientesAfterPost(DataSet: TDataSet);
    procedure MayoresAfterPost(DataSet: TDataSet);
    procedure MenoresAfterPost(DataSet: TDataSet);
    procedure ChequesAfterPost(DataSet: TDataSet);
    procedure TarjetasAfterPost(DataSet: TDataSet);
    procedure VideosAfterPost(DataSet: TDataSet);
    procedure HistoriaAfterPost(DataSet: TDataSet);
    procedure TotalAfterPost(DataSet: TDataSet);
    procedure DebeAfterPost(DataSet: TDataSet);
    procedure RegistroAfterPost(DataSet: TDataSet);
    procedure MultasAfterPost(DataSet: TDataSet);
    procedure InscripcionesAfterPost(DataSet: TDataSet);
    procedure AlquileresAfterPost(DataSet: TDataSet);
    procedure DeudasAfterPost(DataSet: TDataSet);
    procedure DatosCreate(Sender: TObject);
    procedure TablaAccesosAfterPost(DataSet: TDataSet);
    procedure TablaUsuariosAfterPost(DataSet: TDataSet);
    procedure TablaHistConexAfterPost(DataSet: TDataSet);
    procedure EmpresaAfterPost(DataSet: TDataSet);
    procedure FacturasAfterPost(DataSet: TDataSet);
    procedure TransaccionesAfterPost(DataSet: TDataSet);
    procedure CierresAfterPost(DataSet: TDataSet);
    procedure Promo3x2AfterPost(DataSet: TDataSet);
    procedure TablaMiscelaneosAfterPost(DataSet: TDataSet);
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

procedure TDatos.ChequesAfterPost(DataSet: TDataSet);
begin
  Cheques.FlushBuffers;
end;

procedure TDatos.TarjetasAfterPost(DataSet: TDataSet);
begin
  Tarjetas.FlushBuffers;
end;

procedure TDatos.VideosAfterPost(DataSet: TDataSet);
begin
  Videos.FlushBuffers;
end;

procedure TDatos.HistoriaAfterPost(DataSet: TDataSet);
begin
  Historia.FlushBuffers;
end;

procedure TDatos.TotalAfterPost(DataSet: TDataSet);
begin
  Total.FlushBuffers;
end;

procedure TDatos.DebeAfterPost(DataSet: TDataSet);
begin
  Debe.FlushBuffers;
end;

procedure TDatos.RegistroAfterPost(DataSet: TDataSet);
begin
  Registro.FlushBuffers;
end;

procedure TDatos.MultasAfterPost(DataSet: TDataSet);
begin
  Multas.FlushBuffers;
end;

procedure TDatos.InscripcionesAfterPost(DataSet: TDataSet);
begin
  Inscripciones.FlushBuffers;
end;

procedure TDatos.AlquileresAfterPost(DataSet: TDataSet);
begin
  Alquileres.FlushBuffers;
end;

procedure TDatos.DeudasAfterPost(DataSet: TDataSet);
begin
  Deudas.FlushBuffers;
end;

procedure TDatos.DatosCreate(Sender: TObject);
begin
  Sesion.AddPassword(Encripta('ÃÚßÚ'));
end;

procedure TDatos.TablaAccesosAfterPost(DataSet: TDataSet);
begin
  TablaAccesos.FlushBuffers;
end;

procedure TDatos.TablaUsuariosAfterPost(DataSet: TDataSet);
begin
  TablaUsuarios.FlushBuffers;
end;

procedure TDatos.TablaHistConexAfterPost(DataSet: TDataSet);
begin
  TablaHistConex.FlushBuffers;
end;

procedure TDatos.EmpresaAfterPost(DataSet: TDataSet);
begin
  Empresa.FlushBuffers;
end;

procedure TDatos.FacturasAfterPost(DataSet: TDataSet);
begin
  Facturas.FlushBuffers;
end;

procedure TDatos.TransaccionesAfterPost(DataSet: TDataSet);
begin
  Transacciones.FlushBuffers;
end;

procedure TDatos.CierresAfterPost(DataSet: TDataSet);
begin
  Cierres.FlushBuffers;
end;

procedure TDatos.Promo3x2AfterPost(DataSet: TDataSet);
begin
  Promo3x2.Flushbuffers;
end;

procedure TDatos.TablaMiscelaneosAfterPost(DataSet: TDataSet);
begin
  TablaMiscelaneos.Flushbuffers;
end;

end.
