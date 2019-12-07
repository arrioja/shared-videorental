program Emergencia;

uses
  Sharemem,
  Forms,
  UPrincipal in 'UPrincipal.pas' {Principal},
  uconfirmar in 'uconfirmar.pas' {Confirmar};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Utilidad de Regeneración de Indices de VideoRental';
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
