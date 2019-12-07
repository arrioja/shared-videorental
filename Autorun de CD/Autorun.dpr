program Autorun;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Principal};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Instalación de Vídeo Rental 2000 ® (Evaluación)';
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
