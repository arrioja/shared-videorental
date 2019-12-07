unit UPedir_Clave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls;

type
  Pocas_Letras = class(Exception);
  Mala_Clave = class(Exception);

  TPedir_Clave = class(TForm)
    Label1: TLabel;
    Password_Edit: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure Password_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pedir_Clave: TPedir_Clave;

implementation

uses Uprincipal;

{$R *.DFM}

procedure TPedir_Clave.OKBtnClick(Sender: TObject);
begin
  try
    Begin
      If Length(Password_Edit.Text) < 6 then
         Begin
           Raise Pocas_Letras.Create(' ');
         end;
      If (Password_Edit.Text <> Clave_Leida) then
         Begin
           Raise Mala_Clave.Create(' ');
         end;
    end;
  except
    On Pocas_Letras do
       Begin
         ShowMessage('La Clave de Acceso debe tener obligatoriamente '+
                     'seis (6) caracteres, por favor corrija el problema.');
         Password_Edit.SetFocus;
         Pedir_Clave.ModalResult:=MrNone;
       end;
    On Mala_Clave do
       Begin
         Showmessage('La Clave de Acceso introducida es incorrecta, el '+
                     'Acceso a éste módulo ha sido denegado, intentelo de nuevo.');
         Password_Edit.SetFocus;
         Pedir_Clave.ModalResult:=MrNone;         
       end;
  end;

end;

procedure TPedir_Clave.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPedir_Clave.Password_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       OKBtn.Setfocus;
     end;
end;

procedure TPedir_Clave.FormShow(Sender: TObject);
begin
  Password_Edit.Text:='';
  Password_Edit.Setfocus;  
end;

end.

