unit UCambiarLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type

  No_Iguales      = class(Exception);
  Mal_Login       = class(Exception);
  Mal_Anterior    = Class(Exception);
  Sin_Nuevo_Login = class(Exception);

  TCambiarLogin = class(TForm)
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Anterior_Edit: TEdit;
    Nueva_Edit: TEdit;
    Confirma_Edit: TEdit;
    OKBtn: TBitBtn;
    CancelarBtn: TBitBtn;
    procedure Anterior_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nueva_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Confirma_EditKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CambiarLogin: TCambiarLogin;

implementation

uses Modulo_de_Datos,UPrincipal;

{$R *.DFM}

Function Encripta(X:String): String; Far; External 'Control.dll';
Function Comprueba(Cadena:String):Boolean; Far; External 'Control.dll';


procedure TCambiarLogin.Anterior_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       Nueva_Edit.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambiarLogin.Nueva_EditKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
     Begin
       Confirma_Edit.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambiarLogin.Confirma_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       OKBtn.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambiarLogin.OKBtnClick(Sender: TObject);
begin
  try
    Begin
      If Comprueba(Anterior_Edit.Text) = False then
         Begin
           Raise Mal_Anterior.Create(' ');
         end;
      If Comprueba(Nueva_Edit.Text) = False then
         Begin
           Raise Sin_Nuevo_Login.Create(' ');
         end;
      If Nueva_edit.Text <> Confirma_Edit.Text then
        Begin
          raise No_Iguales.create(' ');
        end;
      If Usuario.Login <> Anterior_Edit.Text then
        Begin
          Raise Mal_Login.Create(' ');
        end;

      With Datos.TablaUsuarios do
        Begin
          Indexname:='Login_Index';
          Open;Setkey;
          Fieldbyname('Login').asstring:=Nueva_Edit.Text;
          If GotoKey = False Then
            Begin
              Indexname:='Cedula_Index';
              Setkey;
              Fieldbyname('Cedula').asstring:=Usuario.Cedula;
              GotoKey;
              Edit;
              Fieldbyname('Login').AsString:=Nueva_Edit.Text;
              Post;
              Usuario.Login:=Nueva_Edit.Text;
              With Datos.TablaAccesos do
                Begin
                  Indexname:='';
                  Open;
                  Setkey;
                  Fieldbyname('Login').asstring:=Anterior_Edit.Text;
                  GotoKey;
                  Edit;
                  Fieldbyname('Login').AsString:=Nueva_Edit.Text;
                  Post;
                end;
              Showmessage('El Login de Acceso ha sido cambiado con éxito. !');
              CambiarLogin.Close;
            end
          else
            Begin
              Showmessage('El nuevo Login que usted desea, ya está siendo utilizado '+
                          'por otra persona, por favor inténtelo de nuevo con otro '+
                          'Login de Acceso que no este siendo utilizado.');
            end;
        end;
    end
  except
    On No_Iguales do
       Begin
         Showmessage('El nuevo login introducido y la confirmación del '+
                     'mismo no coinciden, por favor inténtelo de nuevo.');
         Nueva_Edit.SetFocus;
       end;
    On Mal_Login do
       Begin
         Showmessage('Lo lamento, Usted no está autorizado para cambiar el login '+
                     'de acceso de otros usuarios, sólo el suyo.     Por favor inténtelo de nuevo.');
         Anterior_Edit.SetFocus;
       end;
    On Mal_Anterior do
       Begin
         Showmessage('El login de acceso anterior "NO" debe estar en blanco '+
                     'ni contener sólo espacios.');
         Anterior_Edit.SetFocus;
       end;
    On Sin_Nuevo_Login do
       Begin
         Showmessage('El nuevo login de acceso "NO" debe estar en blanco '+
                     'ni contener sólo espacios.');
         Nueva_Edit.SetFocus;
       end;
  end;
end;

procedure TCambiarLogin.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCambiarLogin.FormShow(Sender: TObject);
begin
  Anterior_Edit.Text:='';
  Nueva_Edit.Text:='';
  Confirma_Edit.Text:='';
  Anterior_Edit.setfocus;
end;

end.
