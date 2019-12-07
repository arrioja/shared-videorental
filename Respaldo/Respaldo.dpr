program Respaldo;

uses
  Forms,
  URespaldar in 'URespaldar.pas' {Respaldar};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TRespaldar, Respaldar);
  Application.Run;
end.
