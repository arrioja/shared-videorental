program Conversor_BsF;

uses
  Forms,
  Principal in 'Principal.pas' {Form1},
  uconfirmar in 'uconfirmar.pas' {Confirmar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TConfirmar, Confirmar);
  Application.Run;
end.
