program Actualiza_Imagenes;

uses
  Sharemem,  
  Forms,
  Liberador in 'Liberador.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
