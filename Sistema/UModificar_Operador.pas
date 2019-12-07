unit UModificar_Operador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Barcd4, RxLookup, ToolEdit;

type
  Falta_Nombre   = Class(Exception);
  Falta_Apellido = Class(Exception);
  Falta_Cedula   = Class(Exception);
  Mala_Fecha     = Class(Exception);
  Cedula_Existe  = Class(Exception);
  Login_Existe   = Class(Exception);

  TModificar_Operador = class(TForm)
    Label1: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    IncluirBtn: TSpeedButton;
    CerrarBtn: TSpeedButton;
    Cedula: TMaskEdit;
    Nombre: TEdit;
    Apellido: TEdit;
    Bevel1: TBevel;
    Sexo: TRadioGroup;
    Bevel2: TBevel;
    Fecha: TDateEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    SpeedButton1: TSpeedButton;
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
    procedure SpeedButton1Click(Sender: TObject);
    Procedure Buscar;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modificar_Operador: TModificar_Operador;
  Cedula_Vieja: String;


Const
  Salto = #13;

implementation

uses Modulo_de_Datos;

{$R *.DFM}

//  **************  FUNCIONES EN CONTROL.DLL  *********************
Function  Comprueba(Cadena:String):Boolean; Far; External 'Control.dll';
Function  Encripta(X:String): String; Far; External 'Control.dll';
Procedure Muestra_Error(Muestra,Verbo:String); Far; External 'Control.dll';

procedure TModificar_Operador.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TModificar_Operador.CedulaKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Buscar;
      Key:=#3;
    end;
end;


//Vacía los controles de la ventana
Procedure TModificar_Operador.Limpia_Controles;
Begin
  Cedula.text:='';
  Nombre.text:='';
  Apellido.Text:='';
  Sexo.Itemindex:=0;
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
Procedure TModificar_Operador.Habilitar_Controles(X:Boolean);
Begin
  Cedula.Enabled:=X;
  Nombre.Enabled:=X;
  Apellido.Enabled:=X;
  Sexo.Enabled:=X;
  Fecha.Enabled:=X;
  IncluirBtn.Enabled:=X;
  CheckBox1.Enabled:=X;
  CheckBox2.Enabled:=X;
  CheckBox3.Enabled:=X;
  CheckBox4.Enabled:=X;
  CheckBox5.Enabled:=X;
  CheckBox6.Enabled:=X;
  CheckBox7.Enabled:=X;
  CheckBox8.Enabled:=X;  
end;

procedure TModificar_Operador.IncluirBtnClick(Sender: TObject);
var
  Bien:Boolean;
  cont:Integer;
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

// Comprobación de la Fecha de ingreso del Usuario
   Try
     StrtoDate(Fecha.Text);
   except
     on EConvertError do
       Raise Mala_Fecha.Create('Error de conversión de String a Fecha.');
   end;

//*****************************************************************
//Parte para la Modificación de los datos
        If Cedula_Vieja = Cedula.Text Then
          Begin
            Datos.TablaUsuarios.indexname:='Cedula_Index';
            Datos.TablaUsuarios.setkey;
            Datos.TablaUsuarios.fieldbyname('Cedula').asstring:=Cedula.text;
            Datos.TablaUsuarios.gotokey;
            Habilitar_Controles(False);
            //Actualización de la Base Usuarios
            Datos.TablaUsuarios.Edit;
            Datos.TablaUsuarios.fieldbyname('Nombres').Asstring:=Nombre.text;
            Datos.TablaUsuarios.fieldbyname('Apellidos').Asstring:=Apellido.Text;
            Datos.TablaUsuarios.fieldbyname('Sexo').Asstring:=Sexo.Items.Strings[Sexo.Itemindex];
            Datos.TablaUsuarios.fieldbyname('Fecha_Ingreso').Asstring:=Fecha.Text;
            Datos.TablaUsuarios.Post;
            Datos.TablaAccesos.indexname:='';
            Datos.TablaAccesos.setkey;
            Datos.TablaAccesos.fieldbyname('Login').asstring:=Datos.TablaUsuarios.fieldbyname('Login').Asstring;
            if (Datos.TablaAccesos.gotokey = True) then
              begin
                Datos.TablaAccesos.Edit;
                Datos.TablaAccesos.fieldbyname('0').AsBoolean:=True;
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
            Habilitar_Controles(False);
            Cedula.Enabled:=True;
            Cedula.Setfocus;
            Cedula_Vieja:='';
          end
        else // se ha cambiado la cédula
          Begin
            Datos.TablaUsuarios.indexname:='Cedula_Index';
            Datos.TablaUsuarios.setkey;
            Datos.TablaUsuarios.fieldbyname('Cedula').asstring:=Cedula.text;
            if (Datos.TablaUsuarios.gotokey = True) then
                 begin
                   messagedlg('El número de Cédula que ha introducido '
                   +'se encuentra asignado a otro operador, debe introducir '
                   +'un número que no se encuentre registrado.',mterror,[mbok],0);
                   Cedula.Setfocus;
                 end
            Else
              Begin
                Datos.TablaUsuarios.indexname:='Cedula_Index';
                Datos.TablaUsuarios.setkey;
                Datos.TablaUsuarios.fieldbyname('Cedula').asstring:=Cedula_Vieja;
                if (Datos.TablaUsuarios.gotokey = True) then
                  Begin
                    Habilitar_Controles(False);
                    //Actualización de la Base Usuarios
                    Datos.TablaUsuarios.Edit;
                    Datos.TablaUsuarios.fieldbyname('Cedula').Asstring:=Cedula.text;
                    Datos.TablaUsuarios.fieldbyname('Nombres').Asstring:=Nombre.text;
                    Datos.TablaUsuarios.fieldbyname('Apellidos').Asstring:=Apellido.Text;
                    Datos.TablaUsuarios.fieldbyname('Sexo').Asstring:=Sexo.Items.Strings[Sexo.Itemindex];
                    Datos.TablaUsuarios.fieldbyname('Fecha_Ingreso').Asstring:=Fecha.Text;
                    Datos.TablaUsuarios.Post;
                    Datos.TablaAccesos.indexname:='';
                    Datos.TablaAccesos.setkey;
                    Datos.TablaAccesos.fieldbyname('Login').asstring:=Datos.TablaUsuarios.fieldbyname('Login').Asstring;
                    if (Datos.TablaAccesos.gotokey = True) then
                      begin
                        Datos.TablaAccesos.Edit;
                        Datos.TablaAccesos.fieldbyname('0').AsBoolean:=True;
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
                    Habilitar_Controles(False);
                    Cedula.Enabled:=True;
                    Cedula.Setfocus;
                    Cedula_Vieja:='';
                  end;
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

procedure TModificar_Operador.CedulaExit(Sender: TObject);
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

procedure TModificar_Operador.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;


Procedure TModificar_Operador.Buscar;
Begin
  Datos.TablaUsuarios.indexname:='Cedula_Index';
  Datos.TablaUsuarios.setkey;
  Datos.TablaUsuarios.fieldbyname('Cedula').asstring:=Cedula.text;
  if (Datos.TablaUsuarios.gotokey = true) then
    Begin
      Cedula_Vieja:=Cedula.Text;
      Cedula.text:=Datos.TablaUsuarios.fieldbyname('Cedula').Asstring;
      Nombre.text:=Datos.TablaUsuarios.fieldbyname('Nombres').Asstring;
      Apellido.Text:=Datos.TablaUsuarios.fieldbyname('Apellidos').Asstring;
      If Datos.TablaUsuarios.fieldbyname('Sexo').Asstring = '&Masculino' Then Sexo.ItemIndex:=1 else Sexo.ItemIndex:=0;
      Fecha.Text:=Datos.TablaUsuarios.fieldbyname('Fecha_Ingreso').Asstring;

      Datos.TablaAccesos.indexname:='';
      Datos.TablaAccesos.setkey;
      Datos.TablaAccesos.fieldbyname('Login').asstring:=Datos.TablaUsuarios.fieldbyname('Login').Asstring;
      if (Datos.TablaAccesos.gotokey = True) then
        begin
          CheckBox1.Checked:=Datos.TablaAccesos.fieldbyname('60').AsBoolean;
          CheckBox2.Checked:=Datos.TablaAccesos.fieldbyname('61').AsBoolean;
          CheckBox3.Checked:=Datos.TablaAccesos.fieldbyname('62').AsBoolean;
          CheckBox4.Checked:=Datos.TablaAccesos.fieldbyname('63').AsBoolean;
          CheckBox5.Checked:=Datos.TablaAccesos.fieldbyname('64').AsBoolean;
          CheckBox6.Checked:=Datos.TablaAccesos.fieldbyname('65').AsBoolean;
          CheckBox7.Checked:=Datos.TablaAccesos.fieldbyname('67').AsBoolean;
          CheckBox8.Checked:=Datos.TablaAccesos.fieldbyname('68').AsBoolean;
        end;
      Habilitar_Controles(True);
      Nombre.Setfocus;
    end
  else
    Begin
      Limpia_Controles;
      Habilitar_Controles(False);
      Cedula.Enabled:=True;
      messagedlg('La cédula que desea buscar, no se encuentra en '+
                 'nuestros registros, asegúrese que la cédula sea la correcta'+
                 'e inténtentelo de nuevo.',mterror,[mbok],0);
      Cedula.Setfocus;
    end
end;

procedure TModificar_Operador.SpeedButton1Click(Sender: TObject);
begin
  Buscar;
end;

procedure TModificar_Operador.FormShow(Sender: TObject);
begin
  Cedula_Vieja:='';
  Cedula.Setfocus;
end;

end.
