unit UCambiarClave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, UPrincipal, Modulo_de_Datos;

type

  No_Iguales      = class(Exception);
  Mala_Clave      = class(Exception);
  Sin_Nueva_Clave = class(Exception);


  TCambiarClave = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CambiarClave: TCambiarClave;

implementation

{$R *.DFM}

Function Encripta(X:String): String; Far; External 'Control.dll';
Function Comprueba(Cadena:String):Boolean; Far; External 'Control.dll';

procedure TCambiarClave.CancelarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCambiarClave.FormShow(Sender: TObject);
begin
  Anterior_Edit.Text:='';
  Nueva_Edit.Text:='';
  Confirma_Edit.Text:='';
  Anterior_Edit.setfocus;
end;

procedure TCambiarClave.Anterior_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       Nueva_Edit.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambiarClave.Nueva_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       Confirma_Edit.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambiarClave.Confirma_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
     Begin
       OKBtn.SetFocus;
       Key:=#3;
     end;
end;

procedure TCambiarClave.OKBtnClick(Sender: TObject);
begin
  try
    Begin
      If Usuario.Password <> Encripta(Anterior_Edit.Text) then
        Begin
          Raise Mala_Clave.Create(' ');
        end;
      If Comprueba(Nueva_Edit.Text) = False then
         Begin
           Raise Sin_Nueva_Clave.Create(' ');
         end;
      If Nueva_edit.Text <> Confirma_Edit.Text then
        Begin
          raise No_Iguales.create(' ');
        end;

      With Datos.TablaUsuarios do
        Begin
          Indexname:='Cedula_Index';
          Open;
          Setkey;
          Fieldbyname('Cedula').asstring:=Usuario.Cedula;
          GotoKey;
          Edit;
          Fieldbyname('Clave').AsString:=Encripta(Nueva_Edit.Text);
          Post;
          Usuario.Password:=Encripta(Nueva_Edit.Text);
        end;

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
         Showmessage('La Nueva Clave de Acceso "NO" debe estar en blanco '+
                     'ni contener sólo espacios.');
         Nueva_Edit.SetFocus;
       end;
  end;
end;

end.
