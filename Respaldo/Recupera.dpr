program Recupera;

uses
  Forms,
  URecuperar in 'URecuperar.pas' {Recuperar},
  UConfirmar_Recuperacion in 'UConfirmar_Recuperacion.pas' {Confirmar_Recuperacion};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TRecuperar, Recuperar);
  Application.CreateForm(TConfirmar_Recuperacion, Confirmar_Recuperacion);
  Application.Run;
end.
