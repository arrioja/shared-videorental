unit UAutorizacion;

interface

uses
  Windows,  SysUtils,  Classes,  Graphics,  Forms,  Controls,  StdCtrls,
  Buttons,  ExtCtrls,  Dialogs,  messages;

type
  TAutorizacion = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Image1: TImage;
    Login: TEdit;
    OKBtn: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    Function  Comprobar(X:String):Boolean;
    procedure LoginKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
//    procedure FijarVentana(var m: TWMWINDOWPOSCHANGED); message WM_WINDOWPOSCHANGING ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Autorizacion: TAutorizacion;
  Contador_de_Intentos:Integer;
  Entrar:Boolean;

implementation


uses Modulo_de_datos, UPrincipal;

// **************      Funciones importadas de Control.Dll   **************
Function Nombre_Computador : String; Far; External 'Control.dll';
Function NombreUsuario     : String; Far; External 'Control.dll';
Function Encripta(X:String): String; Far; External 'Control.dll';


{$R *.DFM}

// Procedimiento para fijar la ventana de petición de Claves
// y que no pueda moverse, con esto se logra la completa
// atención del usuario a esta ventana.
//Procedure TAutorizacion.FijarVentana(var m : TWMWINDOWPOSCHANGED);
//Begin
//  m.windowpos.x := 312;
//  m.windowpos.y := 200;
//end;

procedure TAutorizacion.FormShow(Sender: TObject);
begin
  Contador_de_Intentos:=0;
  Login.Text:='';
  Password.Text:='';
  Login.Setfocus;
end;

Function TAutorizacion.Comprobar(X:String):Boolean;
Begin
  If X <> '' Then
    Begin
      If Datos.TablaUsuarios.FieldByname('Clave').AsString = Encripta(X) Then
        Comprobar:=True
      else
        Comprobar:=False;
    end
  else
    Comprobar:=False;
end;

procedure TAutorizacion.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Password.SetFocus;
      Key:=#3;
    end;
end;

procedure TAutorizacion.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      OKBtn.Setfocus;
      Key:=#0;
    end;
end;


procedure TAutorizacion.OKBtnClick(Sender: TObject);
begin
  With Datos.TablaUsuarios do
    Begin
      Indexname:='Login_Index';
      Setkey;
      Fieldbyname('Login').asstring:=Login.text;
      If (gotokey = true) then   // si se encuentra el Registro (Login)
        Begin
          If Comprobar(Password.Text) = False Then   // Si la Clave es Incorrecta
            Begin
              Contador_de_Intentos:=Contador_de_Intentos+1;
              If Contador_de_Intentos >= 3 Then
                 Begin
                   Messagedlg('Usted ha ingresado tres códigos de acceso '
                             +'erróneos, por razones de seguridad, el sistema '
                             +'no puede permitirle la entrada, por favor, inténtelo '
                             +'de nuevo cuando recuerde la clave. . .      Si usted '
                             +'está seguro(a) que la clave es la correcta, entonces '
                             +'comuníquese con el Supervisor de turno para solucionar '
                             +'este inconveniente.'
                             +'                                                     '
                             +'                                                     '
                             +'                                       << SALIENDO DEL MODULO >>',mterror,[mbok],0);
                   Entrar:=True;
                   Autorizacion.ModalResult:=MrNo;
                 end
              Else  // En caso de que queden más intentos
                 Begin
                   Showmessage('La clave de ingreso es inválida, por favor inténtelo de nuevo');
                   Password.SetFocus;
                 end;
            end
          Else   // si la clave es Correcta
            Begin
              Datos.TablaAccesos.IndexName:='';
              Datos.TablaAccesos.Setkey;
              Datos.TablaAccesos.Fieldbyname('Login').AsString:=Login.text;
              Datos.TablaAccesos.Gotokey;
              Entrar:=True;
              Label3.Caption:=Datos.TablaUsuarios.Fieldbyname('Cedula').AsString;
              Autorizacion.ModalResult:=MrOk;
            end;
        end
      Else  // si no se encuentra el Registro (Login)
        Begin
          messagedlg('El Login que ha especificado como identificación '
                    +'no se encuentra en nuestros registros, debe introducir '
                    +'el mismo login que le ha sido asignado.',mterror,[mbok],0);
          Password.Text:='';
          Login.Text:='';
          Login.Setfocus;
        end;
    end;  // del With
end;

procedure TAutorizacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Canclose:=Entrar;
end;

procedure TAutorizacion.FormCreate(Sender: TObject);
begin
  Entrar:=False;
end;

procedure TAutorizacion.BitBtn2Click(Sender: TObject);
begin
  Entrar:=True;
end;

end.

