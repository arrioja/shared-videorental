program Generador;

uses
  Forms,
  UGenerador in 'UGenerador.pas' {Registro};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TRegistro, Registro);
  Application.Run;
end.
