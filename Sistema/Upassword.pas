unit Upassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type

  No_Iguales      = class(Exception);
  Mala_Clave      = class(Exception);
  Sin_Nueva_Clave = class(Exception);


  TCambia_Password = class(TForm)
    Anterior_Edit: TEdit;
    Nueva_Edit: TEdit;
    Confirma_Edit: TEdit;
    OKBtn: TBitBtn;
    CancelarBtn: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure CancelarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Anterior_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nueva_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Confirma_EditKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    Procedure Encripta(Entrada:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cambia_Password: TCambia_Password;
  Salida:string[6];

implementation

uses Uprincipal;

{$R *.DFM}

procedure TCambia_Password.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCambia_Password.FormShow(Sender: TObject);
begin
  Anterior_Edit.Text:='';
  Nueva_Edit.Text:='';
  Confirma_Edit.Text:='';
  Anterior_Edit.setfocus;
end;

procedure TCambia_Password.Anterior_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       Nueva_Edit.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambia_Password.Nueva_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       Confirma_Edit.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambia_Password.Confirma_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       OKBtn.SetFocus;
       Key:=#3;
     end;
end;

Procedure TCambia_Password.Encripta(Entrada:string);
var
  Contador:integer;
Begin
  Salida:='';
  For Contador:=1 to 6 do
     Begin
       Salida:=Salida+Entrada[(6-Contador)+1];
     end;
end;

procedure TCambia_Password.OKBtnClick(Sender: TObject);
begin
  try
    Begin
      If Clave_Leida <> Anterior_Edit.Text then
        Begin
          Raise Mala_Clave.Create(' ');
        end;
      If (Length(Nueva_Edit.Text)< 6) then
         Begin
           Raise Sin_Nueva_Clave.Create(' ');
         end;
      If Nueva_edit.Text <> Confirma_Edit.Text then
        Begin
          raise No_Iguales.create(' ');
        end;
      Encripta(Nueva_Edit.Text);
//      DeleteFile('C:\Windows\System\Winpvr.txt');
      Rewrite(Pass_Arch);
      Writeln(Pass_Arch,Salida);
      Closefile(Pass_Arch);
      Clave_Leida:=Nueva_Edit.Text;
      Showmessage('La Clave de Acceso ha sido cambiada con éxito. !');
      Close;
    end
  except
    On No_Iguales do
       Begin
         Showmessage('La Nueva clave introducida y la confirmación de la '+
                     'misma no coinciden, por favor inténtelo de nuevo.');
         Nueva_Edit.SetFocus;
       end;
    On Mala_Clave do
       Begin
         Showmessage('La clave actual que usted ha introducido, es '+
                     'incorrecta, por favor inténtelo de nuevo.');
         Anterior_Edit.SetFocus;
       end;

    On Sin_Nueva_Clave do
       Begin
         Showmessage('La Nueva Clave de Acceso debe obligatoriamente tener '+
                     'seis (6) caracteres, por favor corrija el problema.');
         Nueva_Edit.SetFocus;
       end;
  end;
end;

end.
