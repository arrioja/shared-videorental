program Generador;

uses
  Forms,
  UGenerar_Codigo in 'UGenerar_Codigo.pas' {Generar_Codigo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TGenerar_Codigo, Generar_Codigo);
  Application.Run;
end.
