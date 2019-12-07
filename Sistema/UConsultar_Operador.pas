unit UConsultar_Operador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Barcd4, RxLookup, ToolEdit,
  Menus;

type
  TConsultar_Operador = class(TForm)
    Label1: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
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
    PopupMenu1: TPopupMenu;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    procedure CerrarBtnClick(Sender: TObject);
    procedure CedulaKeyPress(Sender: TObject; var Key: Char);
    Procedure Limpia_Controles;
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
  Consultar_Operador: TConsultar_Operador;
  Cedula_Vieja: String;


Const
  Salto = #13;

implementation

uses Modulo_de_Datos, uconfirmar;

{$R *.DFM}

//  **************  FUNCIONES EN CONTROL.DLL  *********************

procedure TConsultar_Operador.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TConsultar_Operador.CedulaKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Buscar;
      Key:=#3;
    end;
end;


//Vacía los controles de la ventana
Procedure TConsultar_Operador.Limpia_Controles;
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
end;

procedure TConsultar_Operador.CedulaExit(Sender: TObject);
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

procedure TConsultar_Operador.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;


Procedure TConsultar_Operador.Buscar;
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
        end;
    end
  else
    Begin
      Limpia_Controles;
      Cedula.Enabled:=True;
      messagedlg('La cédula que desea buscar, no se encuentra en '+
                 'nuestros registros, asegúrese que la cédula sea la correcta'+
                 'e inténtentelo de nuevo.',mterror,[mbok],0);
      Cedula.Setfocus;
    end
end;

procedure TConsultar_Operador.SpeedButton1Click(Sender: TObject);
begin
  Buscar;
end;

procedure TConsultar_Operador.FormShow(Sender: TObject);
begin
  Cedula_Vieja:='';
  Cedula.Setfocus;
end;

end.
