program FECHA;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Principal};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
