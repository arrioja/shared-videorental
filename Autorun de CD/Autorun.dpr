program Autorun;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Principal};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Instalaci�n de V�deo Rental 2000 � (Evaluaci�n)';
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
