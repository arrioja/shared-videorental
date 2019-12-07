unit UIncluir_Operador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Barcd4, RxLookup, ToolEdit;

type
  Falta_Nombre   = Class(Exception);
  Falta_Apellido = Class(Exception);
  Falta_Cedula   = Class(Exception);
  Falta_Login    = Class(Exception);
  Falta_Clave    = Class(Exception);
  Mala_Clave     = Class(Exception);
  Mala_Fecha     = Class(Exception);
  Cedula_Existe  = Class(Exception);
  Login_Existe   = Class(Exception);

  TIncluir_Operador = class(TForm)
    Label1: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    IncluirBtn: TSpeedButton;
    CerrarBtn: TSpeedButton;
    Cedula: TMaskEdit;
    Nombre: TEdit;
    Apellido: TEdit;
    Bevel1: TBevel;
    Login: TEdit;
    Clave: TEdit;
    Sexo: TRadioGroup;
    Label10: TLabel;
    Confirmacion: TEdit;
    Bevel2: TBevel;
    Fecha: TDateEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    procedure CerrarBtnClick(Sender: TObject);
    procedure CedulaKeyPress(Sender: TObject; var Key: Char);
    Procedure Limpia_Controles;
    Procedure Habilitar_Controles(X:Boolean);
    procedure IncluirBtnClick(Sender: TObject);
    procedure CedulaExit(Sender: TObject);
    procedure LoginKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Incluir_Operador: TIncluir_Operador;

Const
  Salto = #13;

implementation

uses Modulo_de_Datos;

{$R *.DFM}

//  **************  FUNCIONES EN CONTROL.DLL  *********************
Function  Comprueba(Cadena:String):Boolean; Far; External 'Control.dll';
Function  Encripta(X:String): String; Far; External 'Control.dll';
Procedure Muestra_Error(Muestra,Verbo:String); Far; External 'Control.dll';

procedure TIncluir_Operador.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TIncluir_Operador.CedulaKeyPress(Sender: TObject; var Key: Char);
begin
end;


//Vacía los controles de la ventana
Procedure TIncluir_Operador.Limpia_Controles;
Begin
  Cedula.text:='';
  Nombre.text:='';
  Apellido.Text:='';
  Sexo.Itemindex:=0;
  Login.Text:='';
  Clave.Text:='';
  Confirmacion.Text:='';
  Fecha.Text:='';
  CheckBox1.Checked:=False;
  CheckBox2.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
  CheckBox6.Checked:=False;
  CheckBox7.Checked:=False;
  CheckBox8.Checked:=False;
end;

//Se habilitan o Deshabilitan los Controles para asegurar que no hayan
//modificaciones durente el proceso de actualización.
Procedure TIncluir_Operador.Habilitar_Controles(X:Boolean);
Begin
  Cedula.Enabled:=X;
  Nombre.Enabled:=X;
  Apellido.Enabled:=X;
  Sexo.Enabled:=X;
  Login.Enabled:=X;
  Clave.Enabled:=X;
  Confirmacion.Enabled:=X;
  Fecha.Enabled:=X;
  IncluirBtn.Enabled:=X;
  CerrarBtn.Enabled:=X;
  CheckBox1.Enabled:=X;
  CheckBox2.Enabled:=X;
  CheckBox3.Enabled:=X;
  CheckBox4.Enabled:=X;
  CheckBox5.Enabled:=X;
  CheckBox6.Enabled:=X;
  CheckBox7.Enabled:=X;
  CheckBox8.Enabled:=X;
end;

procedure TIncluir_Operador.IncluirBtnClick(Sender: TObject);
var
  Bien:Boolean;
  Cont:Integer;
begin
//   Desde este punto se hacen las comprobaciones de la existencia de los valores a incluir
 try
//   Comprobación de la exixtencia de un número de Cédula.
  bien:=false;
   if ((Cedula.text = '') or (Cedula.text = '00.000.000')
       or (length(Cedula.text)<=0)) then
       bien:=false
   else
        for cont:= 1 to length(Cedula.text) do
             if (Cedula.text[cont] <> #46) and (Cedula.text[cont] <> #32)then
                  bien:=true;

   if bien = False then
         raise falta_cedula.create(' ');

// Comprobación del nombre del Usuario
   if Comprueba(Nombre.Text) = False then
         Raise Falta_Nombre.create(' ');

// Comprobación del Apellido del Usuario
   if Comprueba(Apellido.Text) = False then
         Raise Falta_Apellido.create(' ');

// Comprobación del Login del Usuario
   if Comprueba(Login.Text) = False then
         Raise Falta_Login.create(' ');

// Comprobación de la Clave del Usuario
   if Comprueba(Clave.Text) = False then
         Raise Falta_Clave.create(' ');

// Comprobación de la Fecha de ingreso del Usuario
   Try
     StrtoDate(Fecha.Text);
   except
     on EConvertError do
       Raise Mala_Fecha.Create('Error de conversión de String a Fecha.');
   end;

// Se comprueba que la Clave y la Confirmación sean Iguales.
  If Clave.Text <> Confirmacion.Text Then
    Raise Mala_Clave.Create('La Clave y su confirmación deben ser iguales');

//*****************************************************************
//Parte para la inclusión de los datos
        Datos.TablaUsuarios.indexname:='Cedula_Index';
        Datos.TablaUsuarios.setkey;
        Datos.TablaUsuarios.fieldbyname('Cedula').asstring:=Cedula.text;
        if (Datos.TablaUsuarios.gotokey = true) then
             begin
               messagedlg('El número de Cédula que ha introducido '
               +'ya se encuentra en nuestros registros, debe introducir '
               +'un número que no se encuentre registrado.',mterror,[mbok],0);
               Cedula.Setfocus;
             end
        Else
          Begin
            Datos.TablaUsuarios.indexname:='Login_Index';
            Datos.TablaUsuarios.setkey;
            Datos.TablaUsuarios.fieldbyname('Login').asstring:=Login.text;
            if (Datos.TablaUsuarios.gotokey = true) then
               begin
                 messagedlg('El Login (Identificación) ha introducido '
                 +'ya se encuentra en nuestros registros, debe introducir '
                 +'un Login que no se encuentre registrado.',mterror,[mbok],0);
                 Login.Setfocus;
               end
            Else
               begin
                 Habilitar_Controles(False);
                 //Actualización de la Base Usuarios
                 Datos.TablaUsuarios.last;
                 Datos.TablaUsuarios.Append;
                 Datos.TablaUsuarios.fieldbyname('Cedula').Asstring:=Cedula.text;
                 Datos.TablaUsuarios.fieldbyname('Nombres').Asstring:=Nombre.text;
                 Datos.TablaUsuarios.fieldbyname('Apellidos').Asstring:=Apellido.Text;
                 Datos.TablaUsuarios.fieldbyname('Sexo').Asstring:=Sexo.Items.Strings[Sexo.Itemindex];
                 Datos.TablaUsuarios.fieldbyname('Login').Asstring:=Login.Text;
                 Datos.TablaUsuarios.fieldbyname('Clave').Asstring:=Encripta(Clave.Text);
                 Datos.TablaUsuarios.fieldbyname('Fecha_Ingreso').Asstring:=Fecha.Text;
                 Datos.TablaUsuarios.fieldbyname('Conectada').AsBoolean:=False;
                 Datos.TablaUsuarios.fieldbyname('Asistente').Asstring:='Robby.aal';
                 Datos.TablaUsuarios.Post;

                 Datos.TablaAccesos.indexname:='';
                 Datos.TablaAccesos.setkey;
                 Datos.TablaAccesos.fieldbyname('Login').asstring:=Login.text;
                 if (Datos.TablaAccesos.gotokey = False) then
                   begin
                     Datos.TablaAccesos.Edit;
                     Datos.TablaAccesos.Append;
                     Datos.TablaAccesos.fieldbyname('Login').asstring:=Login.text;
                     Datos.TablaAccesos.fieldbyname('0').AsBoolean:=True;
                     For Cont:=1 to 253 do
                       Begin
                         Datos.TablaAccesos.fieldbyname(IntToStr(Cont)).AsBoolean:=False;
                       end;
                     Datos.TablaAccesos.fieldbyname('60').AsBoolean:=CheckBox1.Checked;
                     Datos.TablaAccesos.fieldbyname('61').AsBoolean:=CheckBox2.Checked;
                     Datos.TablaAccesos.fieldbyname('62').AsBoolean:=CheckBox3.Checked;
                     Datos.TablaAccesos.fieldbyname('63').AsBoolean:=CheckBox4.Checked;
                     Datos.TablaAccesos.fieldbyname('64').AsBoolean:=CheckBox5.Checked;
                     Datos.TablaAccesos.fieldbyname('65').AsBoolean:=CheckBox6.Checked;
                     Datos.TablaAccesos.fieldbyname('67').AsBoolean:=CheckBox7.Checked;
                     Datos.TablaAccesos.fieldbyname('68').AsBoolean:=CheckBox8.Checked;
                     Datos.TablaAccesos.Post;
                   end;
                 Limpia_Controles;
                 Habilitar_Controles(True);
                 Cedula.Setfocus;
               end;
          end;
//*****************************************************************
//Exepciones (Comprobación de Errores)
 Except
   on Cedula_Existe do
     Begin
       messagedlg('Por favor, corrija el siguiente problema: '+Salto+
                'La Cédula del Usuario que se desea incluir, ya se'+Salto+
                'encuentra registrada en el sistema, por favor confirme'+Salto+
                'el número de cédula e inténtelo de nuevo.',mterror,[mbok],0);
       Cedula.Setfocus;
     end;
   on Mala_Fecha do
     Begin
       messagedlg('Por favor, corrija el siguiente problema: '+Salto+
                'La Fecha que se ha ingresado al sistema, no es '+Salto+
                'una fecha válida, debe ingresar una fecha del'+Salto+
                'tipo:  dd/mm/aaaa para poder continuar.',mterror,[mbok],0);
       Fecha.Setfocus;
     end;
   on Mala_Clave do
     Begin
       messagedlg('Por favor, corrija el siguiente problema: '+Salto+
                'La Clave y su confirmación no coinciden entre,'+Salto+
                'sí.   Ámbas deben ser iguales para poder hacer'+Salto+
                'la inclusión del Usuario.',mterror,[mbok],0);
       Clave.Setfocus;
     end;
   on Falta_Clave do
     Begin
       Muestra_Error('Clave','F');
       Clave.Setfocus;
     end;
   on Falta_Login do
     Begin
       Muestra_Error('Login','M');
       Login.Setfocus;
     end;
   on Falta_Nombre do
     Begin
       Muestra_Error('Nombre','M');
       Nombre.Setfocus;
     end;
   on Falta_Cedula do
     Begin
       Muestra_Error('Cedula','F');
       Cedula.Setfocus;
     end;
   on Falta_Apellido do
     Begin
       Muestra_Error('Apellido','M');
       Apellido.Setfocus;
     end;
 end;
end;

procedure TIncluir_Operador.CedulaExit(Sender: TObject);
var
  Cedula_str:string;
  cont:integer;
begin
 if length(Cedula.text) <= 0 then
    Begin
      Cedula.text:='00.000.000'
    end
 else
    Begin
      //se comprueban los espacios en blanco y se suplantan
      //cada uno de ellos por ceros para que no haya errores en la
      //insersión por falta de caracteres
      Cedula_str:=Cedula.Text;
      For Cont:= 1 to length(Cedula_str) do
        Begin
          if (cedula_str[cont] = #32) then
            Begin
              Cedula_str[cont]:='0';
            end;
        end;
      Cedula.Text:=Cedula_str;
    end;
end;

procedure TIncluir_Operador.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

end.
