unit UPedirClave;

interface                     //     Tratar de que sta ventana se localice en el centro de la pantalla
                              //     y hacer que no se mueva con el mismo procedimiento qye uso.

uses
  Windows,  SysUtils,  Classes,  Graphics,  Forms,  Controls,  StdCtrls,
  Buttons,  ExtCtrls,  Dialogs,  messages;

type
  TPedirClave = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Image1: TImage;
    Login: TEdit;
    Bevel3: TBevel;
    OKBtn: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    Function  Comprobar(X:String):Boolean;
    procedure LoginKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    Procedure Restringir_Menu;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
//    procedure FijarVentana(var m: TWMWINDOWPOSCHANGED); message WM_WINDOWPOSCHANGING ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PedirClave: TPedirClave;
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
//Procedure TPedirClave.FijarVentana(var m : TWMWINDOWPOSCHANGED);
//Begin
//  m.windowpos.x := 312;
//  m.windowpos.y := 200;
//end;

procedure TPedirClave.FormShow(Sender: TObject);
begin
  Contador_de_Intentos:=0;
  Login.Text:='';
  Password.Text:='';
  Login.Setfocus;
end;

Function TPedirClave.Comprobar(X:String):Boolean;
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

procedure TPedirClave.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Password.SetFocus;
      Key:=#3;
    end;
end;

procedure TPedirClave.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      OKBtn.Setfocus;
      Key:=#0;
    end;
end;


Procedure TPedirClave.Restringir_Menu;
var
  N,M,Y,X,Z:Integer;
  ST:String;
Begin
  Datos.TablaAccesos.IndexName:='';
  Datos.TablaAccesos.Setkey;
  Datos.TablaAccesos.FieldByname('Login').AsString:=Usuario.Login;
  Datos.TablaAccesos.Gotokey;
  Usuario.Imprime_Factura:=Datos.TablaAccesos.FieldByname('65').AsBoolean;
  for y:=0 to Principal.MainMenu1.Items.Count-1 do
    If Principal.MainMenu1.Items[Y].Count = 0 Then
      Begin
        ST:=IntToStr(Principal.MainMenu1.Items[Y].Tag);
        Principal.MainMenu1.Items[Y].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
        Application.Processmessages;
      end
    else
      Begin
        ST:=IntToStr(Principal.MainMenu1.Items[Y].Tag);
        Principal.MainMenu1.Items[Y].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
        Application.Processmessages;
        For X:=0 to Principal.MainMenu1.Items.Items[Y].Count-1 do
          Begin
            If Principal.MainMenu1.Items.Items[Y][x].Count = 0 Then
              Begin
                If Principal.MainMenu1.Items[Y][X].Caption <> '-' Then
                  Begin
                    ST:=IntToStr(Principal.MainMenu1.Items[Y][X].Tag);
                    Principal.MainMenu1.Items[Y][X].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
                  end;
                Application.Processmessages;
              end
            else
              Begin
                ST:=IntToStr(Principal.MainMenu1.Items[Y][X].Tag);
                Principal.MainMenu1.Items[Y][X].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
                Application.Processmessages;
                For Z:=0 to Principal.MainMenu1.Items.Items[Y].Items[x].Count-1 do
                  Begin
                    If Principal.MainMenu1.Items.Items[Y][x][Z].Count = 0 Then
                      Begin
                        ST:=IntToStr(Principal.MainMenu1.Items[Y][X][Z].Tag);
                        Principal.MainMenu1.Items[Y][X][Z].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
                        Application.Processmessages;
                      end
                    else
                      Begin
                        ST:=IntToStr(Principal.MainMenu1.Items[Y][X][Z].Tag);
                        Principal.MainMenu1.Items[Y][X][Z].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
                        Application.Processmessages;
                        For M:=0 to Principal.MainMenu1.Items.Items[Y].Items[x].Items[Z].Count-1 do
                          Begin
                            If Principal.MainMenu1.Items.Items[Y][x][Z][M].Count = 0 Then
                              Begin
                                ST:=IntToStr(Principal.MainMenu1.Items[Y][X][Z][M].Tag);
                                Principal.MainMenu1.Items[Y][X][Z][M].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
                                Application.Processmessages;
                              end
                            else
                              Begin
                                ST:=IntToStr(Principal.MainMenu1.Items[Y][X][Z][M].Tag);
                                Principal.MainMenu1.Items[Y][X][Z][M].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
                                Application.Processmessages;
                                For N:=0 to Principal.MainMenu1.Items.Items[Y].Items[x].Items[Z].Items[M].Count-1 do
                                  Begin
                                    If Principal.MainMenu1.Items.Items[Y][x][Z][M][n].Count = 0 Then
                                      Begin
                                        ST:=IntToStr(Principal.MainMenu1.Items[Y][X][Z][M][N].Tag);
                                        Principal.MainMenu1.Items[Y][X][Z][M][N].Enabled := Datos.TablaAccesos.Fieldbyname(St).asBoolean;
                                        Application.Processmessages;
                                      end;
                                  End;
                              end;
                          End;
                      end;
                  End;
              end;
          end;
      end;
end;

procedure TPedirClave.OKBtnClick(Sender: TObject);
var
  Ruta_Programa:String;
begin
  Ruta_Programa:=ExtractFilePath(Application.ExeName);
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
                             +'                                       << SALIENDO DEL PROGRAMA >>',mterror,[mbok],0);
                   Application.Terminate
                 end
              Else  // En caso de que queden más intentos
                 Begin
                   Showmessage('La clave de ingreso es inválida, por favor inténtelo de nuevo');
                   Password.SetFocus;
                 end;
            end
          Else   // si la clave es Correcta
            Begin
              If FieldByname('Conectada').AsBoolean = True Then
                Begin
                   Messagedlg('ATENCIÓN, según nuestros Registros, ésta clave '
                             +'esta siendo utilizada por otro usuario... '
                             +'por razones de seguridad y consistencia en las '
                             +'operaciones del Sistema, no se le permitirá el '
                             +'acceso momentaneamente, si está seguro que nadie más '
                             +'esta utilizando esta clave, por favor comuníquese '
                             +'INMEDIATAMENTE con el supervisor de turno...',mterror,[mbok],0);
                   Login.Text:='';
                   PassWord.Text:='';
                   Login.SetFocus;
                end
              else
                Begin
                  Usuario.Nombres:=FieldByname('Nombres').AsString;
                  Usuario.Apellidos:=FieldByname('Apellidos').AsString;
                  Usuario.Cedula:=FieldByname('Cedula').AsString;
                  Usuario.Login:=FieldByname('Login').AsString;
                  Usuario.Password:=FieldByname('Clave').AsString;
                  Edit;
                  FieldByname('Conectada').AsBoolean:=True;
                  Post;
                  Principal.Caption:='Vídeo Rental 2000 ®    ----     USUARIO:  '+
                                  Usuario.Nombres+' '+Usuario.Apellidos;
                  Entrar:=True;
                  Restringir_Menu;
                  Datos.TablaHistConex.Edit;
                  Datos.TablaHistConex.Append;
                  Datos.TablaHistConex.Fieldbyname('Cedula').AsString:=Usuario.Cedula;
                  Datos.TablaHistConex.FieldByname('Estacion').Asstring:=Nombre_computador;
                  Datos.TablaHistConex.FieldByname('Fecha_Conexion').AsString:=DateToStr(Date);
                  Datos.TablaHistConex.FieldByname('Hora_Conexion').AsString:=TimeToStr(Time);
                  Datos.TablaHistConex.Post;
                  Usuario.ActualReg:=Datos.TablaHistConex.FieldByname('NumReg').AsInteger;
                  PedirClave.Close;
                end;
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

procedure TPedirClave.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Canclose:=Entrar;
end;

procedure TPedirClave.FormCreate(Sender: TObject);
begin
  Entrar:=False;
end;

procedure TPedirClave.BitBtn2Click(Sender: TObject);
begin
  Entrar:=True;
//  Datos.Base.Connected:=False;
//  Datos.TablaUsuarios.Active:=False;
//  Datos.TablaHistConex.Active:=False;
//  Datos.TablaAccesos.Active:=False;
//  If Principal.Asis.Visible = True Then Principal.ASIS.Hide(True);
//  Application.Terminate;
end;

end.

