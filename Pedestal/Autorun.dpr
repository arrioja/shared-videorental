program Autorun;

uses
  Sharemem,
  Forms,
  UPrincipal in 'UPrincipal.pas' {Principal},
  MODULO_DE_DATOS in 'MODULO_DE_DATOS.pas' {Datos: TDataModule},
  UMostrar_Seleccion in 'UMostrar_Seleccion.pas' {Mostrar_Seleccion},
  UPrimera_Entrada in 'UPrimera_Entrada.pas' {Primera_entrada},
  uconfirmar in 'uconfirmar.pas' {Confirmar},
  UVista_Grande_Pelicula in 'UVista_Grande_Pelicula.pas' {Vista_Grande_Pelicula},
  UAlquilar_y_Devolver in 'UAlquilar_y_Devolver.pas' {Alquilar_y_devolver};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Módulo de Autoservicio de Vídeo Rental 2000 ®';
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDatos, Datos);
  Application.Run;
end.
