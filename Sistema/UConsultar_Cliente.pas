
unit UConsultar_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, ComCtrls,
  Numedit, addbtn95, Spin, ToolEdit, CurrEdit, Barcd4, Menus;

type
   Falta_nombre          = class (Exception);
   Mala_fecha            = class (Exception);
   Mal_deposito          = class (Exception);
   Falta_apellido        = class (Exception);
   Falta_cedula          = class (Exception);
   Fecha_es_Menor        = class (Exception);
   Falta_Ciudad          = class (Exception);
   Falta_Estado          = class (Exception);
   Falta_Postal          = class (Exception);
   Falta_Numero_Cheque   = class (Exception);
   Falta_Nombre_BAnco    = class (Exception);
   Falta_Cantidad_Cheque = class (Exception);
   Mala_Fecha_Cheque     = class (Exception);
   Falta_Nombre_Tarjeta  = class (Exception);
   Falta_Numero_Tarjeta  = class (Exception);
   Mala_Fecha_Tarjeta    = class (Exception);
   Fecha_Menor_Tarjeta   = class (Exception);

  TConsultar_Cliente = class(TForm)
    CancelarBtn: TBitBtn;
    Bevel3: TBevel;
    PageControl1: TPageControl;
    Hoja_1: TTabSheet;
    Label4: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Barras: TPrintBarcode;
    Label8: TLabel;
    MaskEdit3: TMaskEdit;
    Edit3: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    Ciudad_edit: TEdit;
    Estado_edit: TEdit;
    Profesion_Edit: TEdit;
    Postal_Edit: TNumEdit;
    Edit2: TNumEdit;
    Edit1: TEdit;
    NumEdit1: TNumEdit;
    Hoja_2: TTabSheet;
    GroupBox1: TGroupBox;
    Label76: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Numero_Cheque_Edit: TNumEdit;
    Nombre_Banco_Edit: TEdit;
    Cantidad_Cheque_Edit: TNumEdit;
    Fecha_Emision_Cheque_Mask: TMaskEdit;
    GroupBox2: TGroupBox;
    Label79: TLabel;
    Label78: TLabel;
    Label77: TLabel;
    Nombre_Tarjeta_Edit: TEdit;
    VisaBtn: TRadioButton95;
    MCBtn: TRadioButton95;
    AmericanBtn: TRadioButton95;
    OtrasBtn: TRadioButton95;
    DinersBtn: TRadioButton95;
    Numero_Tarjeta_Edit: TNumEdit;
    Fecha_Vence_Tarjeta_Mask: TMaskEdit;
    GroupBox3: TGroupBox;
    ChequeBtn: TRadioButton95;
    EfectivoBtn: TRadioButton95;
    TarjetaBTn: TRadioButton95;
    Hoja_3: TTabSheet;
    GroupBox4: TGroupBox;
    ChequeBtn2: TRadioButton95;
    EfectivoBtn2: TRadioButton95;
    TarjetaBTn2: TRadioButton95;
    GroupBox5: TGroupBox;
    Label762: TLabel;
    Label732: TLabel;
    Label742: TLabel;
    Label752: TLabel;
    Numero_Cheque_Edit2: TNumEdit;
    Nombre_Banco_Edit2: TEdit;
    Cantidad_Cheque_Edit2: TNumEdit;
    Fecha_Emision_Cheque_Mask2: TMaskEdit;
    GroupBox6: TGroupBox;
    Label792: TLabel;
    Label782: TLabel;
    Label772: TLabel;
    Nombre_Tarjeta_Edit2: TEdit;
    VisaBtn2: TRadioButton95;
    MCBtn2: TRadioButton95;
    AmericanBtn2: TRadioButton95;
    OtrasBtn2: TRadioButton95;
    DinersBtn2: TRadioButton95;
    Numero_Tarjeta_Edit2: TNumEdit;
    Fecha_Vence_Tarjeta_Mask2: TMaskEdit;
    Hoja_4: TTabSheet;
    PageControl3: TPageControl;
    Adultos_Hoja: TTabSheet;
    Label43: TLabel;
    Label49: TLabel;
    PageControl4: TPageControl;
    Persona_1_Hoja: TTabSheet;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Edad_Label1: TLabel;
    Label30: TLabel;
    Label37: TLabel;
    Nombre_Adulto_Edit1: TEdit;
    Apellido_Adulto_Edit1: TEdit;
    Fecha_Nac_Mask1: TMaskEdit;
    Parentesco_Adulto_Edit1: TEdit;
    Persona_2_Hoja: TTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Edad_Label2: TLabel;
    Label35: TLabel;
    Label53: TLabel;
    Nombre_Adulto_Edit2: TEdit;
    Apellido_Adulto_Edit2: TEdit;
    Fecha_Nac_Mask2: TMaskEdit;
    Parentesco_Adulto_Edit2: TEdit;
    Persona_3_Hoja: TTabSheet;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Edad_Label3: TLabel;
    Label41: TLabel;
    Label55: TLabel;
    Nombre_Adulto_Edit3: TEdit;
    Apellido_Adulto_Edit3: TEdit;
    Fecha_Nac_Mask3: TMaskEdit;
    Parentesco_Adulto_Edit3: TEdit;
    Persona_4_Hoja: TTabSheet;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Edad_Label4: TLabel;
    Label47: TLabel;
    Label59: TLabel;
    Nombre_Adulto_Edit4: TEdit;
    Apellido_Adulto_Edit4: TEdit;
    Fecha_Nac_Mask4: TMaskEdit;
    Parentesco_Adulto_Edit4: TEdit;
    Menor_Hoja: TTabSheet;
    PageControl5: TPageControl;
    Menor_1_Hoja: TTabSheet;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Edad_Label5: TLabel;
    Label61: TLabel;
    Nombre_Menor_Edit1: TEdit;
    Apellido_Menor_Edit1: TEdit;
    Fecha_Nac_Mask5: TMaskEdit;
    Menor_2_Hoja: TTabSheet;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label60: TLabel;
    Edad_Label6: TLabel;
    Label65: TLabel;
    Nombre_Menor_Edit2: TEdit;
    Apellido_Menor_Edit2: TEdit;
    Fecha_Nac_Mask6: TMaskEdit;
    Menor_3_Hoja: TTabSheet;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Edad_Label7: TLabel;
    Label67: TLabel;
    Nombre_Menor_Edit3: TEdit;
    Apellido_Menor_Edit3: TEdit;
    Fecha_Nac_Mask7: TMaskEdit;
    Menor_4_Hoja: TTabSheet;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label72: TLabel;
    Edad_Label8: TLabel;
    Label71: TLabel;
    Nombre_Menor_Edit4: TEdit;
    Apellido_Menor_Edit4: TEdit;
    Fecha_Nac_Mask8: TMaskEdit;
    Empleo_Hoja: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Telefono_Empresa_Mask: TMaskEdit;
    Fax_Empresa_Mask: TMaskEdit;
    Direccion_Empresa_Memo: TMemo;
    GroupBox7: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox8: TGroupBox;
    Label81: TLabel;
    Label80: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Alerta: TSpinEdit;
    Nombre_Empresa_Edit: TEdit;
    PopupMenu1: TPopupMenu;
    procedure CancelarBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DinersBtnClick(Sender: TObject);
    procedure Fecha_Nac_Mask1Exit(Sender: TObject);
    procedure Fecha_Nac_Mask2Exit(Sender: TObject);
    procedure Fecha_Nac_Mask3Exit(Sender: TObject);
    procedure Fecha_Nac_Mask4Exit(Sender: TObject);
    procedure Fecha_Nac_Mask5Exit(Sender: TObject);
    procedure Fecha_Nac_Mask6Exit(Sender: TObject);
    procedure Fecha_Nac_Mask7Exit(Sender: TObject);
    procedure Fecha_Nac_Mask8Exit(Sender: TObject);
    procedure ChequeBtnClick(Sender: TObject);
    procedure EfectivoBtnClick(Sender: TObject);
    procedure TarjetaBTnClick(Sender: TObject);
    Procedure Limpiar_Todo;
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure ChequeBtn2Click(Sender: TObject);
    procedure EfectivoBtn2Click(Sender: TObject);
    procedure TarjetaBTn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  Consultar_Cliente: TConsultar_Cliente;
  no_hay_nombre:boolean;
  codigo:integer;
  cedula:integer;
  nombre:string;
  direccion:string;
  deposito:integer;
  fecha:string;


  implementation

uses uprincipal, UPedir_Clave, uconfirmar, Ulista_clientes,
  UHistorial_Videos, ualquilar_y_devolver, MODULO_DE_DATOS;

{$R *.DFM}

procedure TConsultar_Cliente.CancelarBtnClick(Sender: TObject);
begin
  close;
end;


Procedure Mensaje_de_Error;
Begin
  Showmessage('Los Datos que ha introducido en el campo de '+
              'Fecha de Nacimiento son incorrectos, por favor '+
              'corrija para poder continuar.');
end;


Procedure Mensaje_de_Fecha_Menor;
Begin
  Showmessage(' La fecha de Nacimiento no puede ser menor que la fecha '+
              'actual, por favor corrija el problema para poder continuar.');
end;


procedure TConsultar_Cliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Desde_Principal = False then
    Begin
      If Ultima_Cliente = 'Alquilar y Devolver' then
        Begin
          Datos.Videos.Refresh;
          Datos.Videos.Cancelrange;
          Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
          Datos.Videos.setrange([Alquilar_y_Devolver.Maskedit1.text]
                               ,[Alquilar_y_Devolver.Maskedit1.text]);
          Datos.Videos.Refresh;
          Datos.Videos.First;
          Alquilar_y_Devolver.Enabled:=True;
        end;
    end;
end;

procedure TConsultar_Cliente.MaskEdit1Exit(Sender: TObject);
var
  Cedula_str:string;
  cont:integer;
begin
 if length(maskedit1.text) <= 0 then
    Begin
      maskedit1.text:='00.000.000'
    end
 else
    Begin
      //se comprueban los espacios en blanco y se suplantan
      //cada uno de ellos por ceros.
      Cedula_str:=Maskedit1.Text;
      For Cont:= 1 to length(Cedula_str) do
        Begin
          if (cedula_str[cont] = #32) then
            Begin
              Cedula_str[cont]:='0';
            end;
        end;
      Maskedit1.Text:=Cedula_str;
    end;
end;

Procedure TConsultar_Cliente.Limpiar_Todo;
Begin
  Edit1.text:='';
  Edit3.text:='';
  MaskEdit1.text:='';
  MaskEdit4.text:='';
  MaskEdit2.text:='';
  MaskEdit5.text:='';
  Edit2.text:='';
  Memo1.lines.Clear;
  Ciudad_Edit.text:='';
  Estado_Edit.text:='';
  CheckBox1.Checked:=False;
  CheckBox2.Checked:=False;
  CheckBox3.Checked:=False;
  CurrencyEdit1.Value:=0;
  Alerta.Value:=0;
  Postal_Edit.text:='';
  EfectivoBtn2.Checked:=True;
  Profesion_Edit.text:='';
  Nombre_Empresa_Edit.text:='';
  Telefono_Empresa_Mask.text:='';
  Fax_Empresa_Mask.text:='';
  Direccion_Empresa_Memo.lines.Clear;
  Radiogroup1.ItemIndex:=0;
  EfectivoBtn.Checked:=True;
  Nombre_Adulto_Edit1.Text:='';
  Nombre_Adulto_Edit2.Text:='';
  Nombre_Adulto_Edit3.Text:='';
  Nombre_Adulto_Edit4.Text:='';
  Apellido_Adulto_Edit1.Text:='';
  Apellido_Adulto_Edit2.Text:='';
  Apellido_Adulto_Edit3.Text:='';
  Apellido_Adulto_Edit4.Text:='';
  Fecha_Nac_Mask1.Text:='';
  Fecha_Nac_Mask2.Text:='';
  Fecha_Nac_Mask3.Text:='';
  Fecha_Nac_Mask4.Text:='';
  Parentesco_Adulto_Edit1.Text:='';
  Parentesco_Adulto_Edit2.Text:='';
  Parentesco_Adulto_Edit3.Text:='';
  Parentesco_Adulto_Edit4.Text:='';
  Nombre_Menor_Edit1.Text:='';
  Nombre_Menor_Edit2.Text:='';
  Nombre_Menor_Edit3.Text:='';
  Nombre_Menor_Edit4.Text:='';
  Apellido_Menor_Edit1.Text:='';
  Apellido_Menor_Edit2.Text:='';
  Apellido_Menor_Edit3.Text:='';
  Apellido_Menor_Edit4.Text:='';
  Fecha_Nac_Mask5.Text:='';
  Fecha_Nac_Mask6.Text:='';
  Fecha_Nac_Mask7.Text:='';
  Fecha_Nac_Mask8.Text:='';
end;


procedure TConsultar_Cliente.FormShow(Sender: TObject);
begin
  If Desde_Principal = True then
    Begin
      MaskEdit3.Text:='';
      PageControl1.ActivePage:=Hoja_1;
      PageControl3.ActivePage:=Adultos_Hoja;
      PageControl4.ActivePage:=Persona_1_Hoja;
      PageControl5.ActivePage:=Menor_1_Hoja;
      Edad_Label1.Caption:='0';
      Edad_Label2.Caption:='0';
      Edad_Label3.Caption:='0';
      Edad_Label4.Caption:='0';
      Edad_Label5.Caption:='0';
      Edad_Label6.Caption:='0';
      Edad_Label7.Caption:='0';
      Edad_Label8.Caption:='0';
      EfectivoBtn.Checked:=True;
      Limpiar_Todo;
      MaskEdit3.Setfocus;
    end
  else
    Begin
    Datos.Clientes.Refresh;
    Datos.Clientes.indexname:='';
    Datos.Clientes.setkey;
    Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
    If (Datos.Clientes.gotokey = true) then
       Begin
         Limpiar_Todo;
         //Se ponen todos los datos en sus respectivas casillas:
         Edit1.text:=Datos.Clientes.fieldbyname('Nombres_Cliente').asstring;
         Edit3.text:=Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring;
         MaskEdit1.text:=Datos.Clientes.fieldbyname('Cedula_Cliente').asstring;
         MaskEdit4.text:=Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asstring;
         MaskEdit2.text:=Datos.Clientes.fieldbyname('Telefono_1_Cliente').asstring;
         MaskEdit5.text:=Datos.Clientes.fieldbyname('Telefono_2_Cliente').asstring;
         Edit2.text:=Datos.Clientes.fieldbyname('Deposito_Cliente').asstring;
         Memo1.lines.add(Datos.Clientes.fieldbyname('Direccion_Cliente').asstring);
         Ciudad_Edit.text:=Datos.Clientes.fieldbyname('Ciudad_Cliente').asstring;
         Estado_Edit.text:=Datos.Clientes.fieldbyname('Estado_Cliente').asstring;
         Postal_Edit.text:=Datos.Clientes.fieldbyname('Postal_Cliente').asstring;
         Profesion_Edit.text:=Datos.Clientes.fieldbyname('Profesion_Cliente').asstring;
         Nombre_Empresa_Edit.text:=Datos.Clientes.fieldbyname('Nombre_Empresa').asstring;
         Telefono_Empresa_Mask.text:=Datos.Clientes.fieldbyname('Telefono_Empresa').asstring;
         Fax_Empresa_Mask.text:=Datos.Clientes.fieldbyname('Fax_Empresa').asstring;
         Direccion_Empresa_Memo.lines.add(Datos.Clientes.fieldbyname('Direccion_Empresa').asstring);

         If Datos.Clientes.Fieldbyname('Sexo_Cliente').asboolean = False then
            Begin
              Radiogroup1.ItemIndex:=0;
            end
         else
            Begin
              Radiogroup1.ItemIndex:=1;
            end;

         If Datos.Clientes.Fieldbyname('Forma_de_Pago').asstring = 'CH' then
            Begin
              Datos.Cheques.refresh;            
              Datos.Cheques.indexname:='';
              Datos.Cheques.setkey;
              Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
              Datos.Cheques.gotokey;
              Numero_Cheque_Edit.text:=Datos.Cheques.fieldbyname('Numero_Cheque').asstring;
              Nombre_Banco_Edit.text:=Datos.Cheques.fieldbyname('Nombre_Banco').asstring;
              Cantidad_Cheque_Edit.text:=Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring;
              Fecha_Emision_Cheque_Mask.text:=Datos.Cheques.fieldbyname('Fecha_Emision').asstring;
              ChequeBtn.Checked:=True;
            end;
         If Datos.Clientes.Fieldbyname('Forma_de_Pago').asstring = 'EF' then
            Begin
              EfectivoBtn.Checked:=True;
            end;
         If Datos.Clientes.Fieldbyname('Forma_de_Pago').asstring = 'TC' then
            Begin
              Datos.Tarjetas.Refresh;
              Datos.Tarjetas.indexname:='';
              Datos.Tarjetas.setkey;
              Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
              Datos.Tarjetas.gotokey;
              VisaBtn.Checked:=Datos.Tarjetas.fieldbyname('Visa').asboolean;
              MCBtn.Checked:=Datos.Tarjetas.fieldbyname('Master').asboolean;
              AmericanBtn.Checked:=Datos.Tarjetas.fieldbyname('American').asboolean;
              DinersBtn.Checked:=Datos.Tarjetas.fieldbyname('Diners').asboolean;
              OtrasBtn.Checked:=Datos.Tarjetas.fieldbyname('Otras').asboolean;
              Nombre_Tarjeta_Edit.text:=Datos.Tarjetas.fieldbyname('Nombre_Otra').asstring;
              Numero_Tarjeta_Edit.text:=Datos.Tarjetas.fieldbyname('Numero_Tarjeta').asstring;
              Fecha_Vence_Tarjeta_Mask.text:=Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring;
              TarjetaBtn.Checked:=True;
            end;

         Datos.Mayores.Refresh;
         Datos.Mayores.indexname:='';
         Datos.Mayores.setkey;
         Datos.Mayores.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
         Datos.Mayores.gotokey;
         Nombre_Adulto_Edit1.Text:=Datos.Mayores.Fieldbyname('Nombre1').Asstring;
         Nombre_Adulto_Edit2.Text:=Datos.Mayores.Fieldbyname('Nombre2').Asstring;
         Nombre_Adulto_Edit3.Text:=Datos.Mayores.Fieldbyname('Nombre3').Asstring;
         Nombre_Adulto_Edit4.Text:=Datos.Mayores.Fieldbyname('Nombre4').Asstring;
         Apellido_Adulto_Edit1.Text:=Datos.Mayores.Fieldbyname('Apellido1').Asstring;
         Apellido_Adulto_Edit2.Text:=Datos.Mayores.Fieldbyname('Apellido2').Asstring;
         Apellido_Adulto_Edit3.Text:=Datos.Mayores.Fieldbyname('Apellido3').Asstring;
         Apellido_Adulto_Edit4.Text:=Datos.Mayores.Fieldbyname('Apellido4').Asstring;
         Fecha_Nac_Mask1.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento1').Asstring;
         Fecha_Nac_Mask2.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento2').Asstring;
         Fecha_Nac_Mask3.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento3').Asstring;
         Fecha_Nac_Mask4.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento4').Asstring;
         Parentesco_Adulto_Edit1.Text:=Datos.Mayores.Fieldbyname('Parentesco1').Asstring;
         Parentesco_Adulto_Edit2.Text:=Datos.Mayores.Fieldbyname('Parentesco2').Asstring;
         Parentesco_Adulto_Edit3.Text:=Datos.Mayores.Fieldbyname('Parentesco3').Asstring;
         Parentesco_Adulto_Edit4.Text:=Datos.Mayores.Fieldbyname('Parentesco4').Asstring;

         Datos.Menores.Refresh;
         Datos.Menores.indexname:='';
         Datos.Menores.setkey;
         Datos.Menores.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
         Datos.Menores.gotokey;
         Nombre_Menor_Edit1.Text:=Datos.Menores.Fieldbyname('Nombre1').Asstring;
         Nombre_Menor_Edit2.Text:=Datos.Menores.Fieldbyname('Nombre2').Asstring;
         Nombre_Menor_Edit3.Text:=Datos.Menores.Fieldbyname('Nombre3').Asstring;
         Nombre_Menor_Edit4.Text:=Datos.Menores.Fieldbyname('Nombre4').Asstring;
         Apellido_Menor_Edit1.Text:=Datos.Menores.Fieldbyname('Apellido1').Asstring;
         Apellido_Menor_Edit2.Text:=Datos.Menores.Fieldbyname('Apellido2').Asstring;
         Apellido_Menor_Edit3.Text:=Datos.Menores.Fieldbyname('Apellido3').Asstring;
         Apellido_Menor_Edit4.Text:=Datos.Menores.Fieldbyname('Apellido4').Asstring;
         Fecha_Nac_Mask5.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento1').Asstring;
         Fecha_Nac_Mask6.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento2').Asstring;
         Fecha_Nac_Mask7.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento3').Asstring;
         Fecha_Nac_Mask8.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento4').Asstring;

//Se coloca la edad de todas las personas autorizadas y de todos los niños

      IF (Fecha_Nac_Mask1.Text<>'  /  /    ') then
         Begin
           Edad_Label1.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask1.Text))/360));
         end
      Else
         Begin
           Edad_Label1.Caption:='0';
         end;

      IF (Fecha_Nac_Mask2.Text<>'  /  /    ') then
         Begin
           Edad_Label2.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask2.Text))/360));
         end
      Else
         Begin
           Edad_Label2.Caption:='0';
         end;

      IF (Fecha_Nac_Mask3.Text<>'  /  /    ') then
         Begin
           Edad_Label3.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask3.Text))/360));
         end
      Else
         Begin
           Edad_Label3.Caption:='0';
         end;

      IF (Fecha_Nac_Mask4.Text<>'  /  /    ') then
         Begin
           Edad_Label4.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask4.Text))/360));
         end
      Else
         Begin
           Edad_Label4.Caption:='0';
         end;

      IF (Fecha_Nac_Mask5.Text<>'  /  /    ') then
         Begin
           Edad_Label5.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask5.Text))/360));
         end
      Else
         Begin
           Edad_Label5.Caption:='0';
         end;

      IF (Fecha_Nac_Mask6.Text<>'  /  /    ') then
         Begin
           Edad_Label6.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask6.Text))/360));
         end
      Else
         Begin
           Edad_Label6.Caption:='0';
         end;

      IF (Fecha_Nac_Mask7.Text<>'  /  /    ') then
         Begin
           Edad_Label7.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask7.Text))/360));
         end
      Else
         Begin
           Edad_Label7.Caption:='0';
         end;

      IF (Fecha_Nac_Mask8.Text<>'  /  /    ') then
         Begin
           Edad_Label8.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask8.Text))/360));
         end
      Else
         Begin
           Edad_Label8.Caption:='0';
         end;
       end;
    end;
end;

procedure TConsultar_Cliente.DinersBtnClick(Sender: TObject);
begin
  Nombre_Tarjeta_Edit.Text:=(Sender as TRadioButton95).Caption;
end;


procedure TConsultar_Cliente.Fecha_Nac_Mask1Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      IF ((Fecha_Nac_Mask1.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask1.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label1.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask1.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label1.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.Fecha_Nac_Mask2Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      IF ((Fecha_Nac_Mask2.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask2.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label2.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask2.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label2.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.Fecha_Nac_Mask3Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      IF ((Fecha_Nac_Mask3.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask3.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label3.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask3.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label3.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.Fecha_Nac_Mask4Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      IF ((Fecha_Nac_Mask4.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask4.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label4.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask4.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label4.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.Fecha_Nac_Mask5Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      IF ((Fecha_Nac_Mask5.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask5.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label5.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask5.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label5.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.Fecha_Nac_Mask6Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      IF ((Fecha_Nac_Mask6.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask6.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label6.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask6.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label6.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.Fecha_Nac_Mask7Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      IF ((Fecha_Nac_Mask7.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask7.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label7.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask7.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label7.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.Fecha_Nac_Mask8Exit(Sender: TObject);
var
  hay_chars:boolean;
begin
  Hay_Chars:=False;
      If((Fecha_Nac_Mask8.Text<>'  /  /    ') and
            (Hay_Chars = False)) then
             Begin
               Hay_Chars:=True;
             end;

  If (Hay_Chars = True) then
     Begin
       Try
          Begin
            If StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask8.Text) then
               Begin
                 Mensaje_de_Fecha_Menor;
               end
            else
               Begin
                 Edad_Label8.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask8.Text))/360));
               end;
          end
       except
          On EconvertError do
             Begin
               Mensaje_de_Error;
             end;
       end;
     end
  else
     Begin
       Edad_Label8.Caption:='0';
     end;
end;

procedure TConsultar_Cliente.ChequeBtnClick(Sender: TObject);
begin
  Numero_Cheque_Edit.Visible:=True;
  Nombre_Banco_Edit.Visible:=True;
  Cantidad_Cheque_Edit.Visible:=True;
  Fecha_Emision_Cheque_Mask.Visible:=True;
  Label73.Visible:=True;
  Label74.Visible:=True;
  Label75.Visible:=True;
  Label76.Visible:=True;

  VisaBtn.Visible:=False;
  MCBtn.Visible:=False;
  AmericanBtn.Visible:=False;
  DinersBtn.Visible:=False;
  OtrasBtn.Visible:=False;
  Label77.Visible:=False;
  Label78.Visible:=False;
  Label79.Visible:=False;
  Nombre_Tarjeta_Edit.Visible:=False;
  Numero_Tarjeta_Edit.Visible:=False;
  Fecha_Vence_Tarjeta_Mask.Visible:=False;
  Nombre_Tarjeta_Edit.Text:='';
  Numero_Tarjeta_Edit.Text:='';
  Fecha_Vence_Tarjeta_Mask.Text:='';
end;


procedure TConsultar_Cliente.EfectivoBtnClick(Sender: TObject);
begin
  Numero_Cheque_Edit.Visible:=False;
  Nombre_Banco_Edit.Visible:=False;
  Cantidad_Cheque_Edit.Visible:=False;
  Fecha_Emision_Cheque_Mask.Visible:=False;
  Label73.Visible:=False;
  Label74.Visible:=False;
  Label75.Visible:=False;
  Label76.Visible:=False;

  VisaBtn.Visible:=False;
  MCBtn.Visible:=False;
  AmericanBtn.Visible:=False;
  DinersBtn.Visible:=False;
  OtrasBtn.Visible:=False;
  Label77.Visible:=False;
  Label78.Visible:=False;
  Label79.Visible:=False;
  Nombre_Tarjeta_Edit.Visible:=False;
  Numero_Tarjeta_Edit.Visible:=False;
  Fecha_Vence_Tarjeta_Mask.Visible:=False;
  Nombre_Tarjeta_Edit.Text:='';
  Numero_Tarjeta_Edit.Text:='';
  Fecha_Vence_Tarjeta_Mask.Text:='';
  Numero_Cheque_Edit.Text:='';
  Nombre_Banco_Edit.Text:='';
  Cantidad_Cheque_Edit.Text:='';
  Fecha_Emision_Cheque_Mask.Text:='';
end;

procedure TConsultar_Cliente.TarjetaBTnClick(Sender: TObject);
begin
  Numero_Cheque_Edit.Visible:=False;
  Nombre_Banco_Edit.Visible:=False;
  Cantidad_Cheque_Edit.Visible:=False;
  Fecha_Emision_Cheque_Mask.Visible:=False;
  Numero_Cheque_Edit.Text:='';
  Nombre_Banco_Edit.Text:='';
  Cantidad_Cheque_Edit.Text:='';
  Fecha_Emision_Cheque_Mask.Text:='';
  Label73.Visible:=False;
  Label74.Visible:=False;
  Label75.Visible:=False;
  Label76.Visible:=False;

  VisaBtn.Visible:=True;
  MCBtn.Visible:=True;
  AmericanBtn.Visible:=True;
  DinersBtn.Visible:=True;
  OtrasBtn.Visible:=True;
  Label77.Visible:=True;
  Label78.Visible:=True;
  Label79.Visible:=True;
  Nombre_Tarjeta_Edit.Visible:=True;
  Numero_Tarjeta_Edit.Visible:=True;
  Fecha_Vence_Tarjeta_Mask.Visible:=True;
  If VisaBtn.Checked     = True then Nombre_Tarjeta_Edit.Text:=VisaBtn.Caption;
  If MCBtn.Checked       = True then Nombre_Tarjeta_Edit.Text:=MCBtn.Caption;
  If AmericanBtn.Checked = True then Nombre_Tarjeta_Edit.Text:=AmericanBtn.Caption;
  If DinersBtn.Checked   = True then Nombre_Tarjeta_Edit.Text:=DinersBtn.Caption;
  If OtrasBtn.Checked    = True then Nombre_Tarjeta_Edit.Text:='';
end;

procedure TConsultar_Cliente.MaskEdit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key = #13) then
  begin
    Datos.Clientes.indexname:='';
    Datos.Clientes.setkey;
    Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
    If (Datos.Clientes.gotokey = true) then
       Begin
         Limpiar_Todo;
         //Se ponen todos los datos en sus respectivas casillas:
         Edit1.text:=Datos.Clientes.fieldbyname('Nombres_Cliente').asstring;
         Edit3.text:=Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring;
         MaskEdit1.text:=Datos.Clientes.fieldbyname('Cedula_Cliente').asstring;
         MaskEdit4.text:=Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asstring;
         MaskEdit2.text:=Datos.Clientes.fieldbyname('Telefono_1_Cliente').asstring;
         MaskEdit5.text:=Datos.Clientes.fieldbyname('Telefono_2_Cliente').asstring;
         Edit2.text:=Datos.Clientes.fieldbyname('Monto_Inscripcion').asstring;
         Memo1.lines.add(Datos.Clientes.fieldbyname('Direccion_Cliente').asstring);
         Ciudad_Edit.text:=Datos.Clientes.fieldbyname('Ciudad_Cliente').asstring;
         Estado_Edit.text:=Datos.Clientes.fieldbyname('Estado_Cliente').asstring;
         Postal_Edit.text:=Datos.Clientes.fieldbyname('Postal_Cliente').asstring;
         Profesion_Edit.text:=Datos.Clientes.fieldbyname('Profesion_Cliente').asstring;
         Nombre_Empresa_Edit.text:=Datos.Clientes.fieldbyname('Nombre_Empresa').asstring;
         Telefono_Empresa_Mask.text:=Datos.Clientes.fieldbyname('Telefono_Empresa').asstring;
         Fax_Empresa_Mask.text:=Datos.Clientes.fieldbyname('Fax_Empresa').asstring;
         Direccion_Empresa_Memo.lines.add(Datos.Clientes.fieldbyname('Direccion_Empresa').asstring);

         If Datos.Clientes.Fieldbyname('Sexo_Cliente').asboolean = False then
            Begin
              Radiogroup1.ItemIndex:=0;
            end
         else
            Begin
              Radiogroup1.ItemIndex:=1;
            end;

         If Datos.Clientes.Fieldbyname('Forma_de_Pago').asstring = 'CH' then
            Begin
              Datos.Cheques.refresh;
              Datos.Cheques.indexname:='Codigo_Tipo_Index';
              Datos.Cheques.setkey;
              Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
              Datos.Cheques.fieldbyname('Tipo').asstring:='I';
              Datos.Cheques.gotokey;
              Numero_Cheque_Edit.text:=Datos.Cheques.fieldbyname('Numero_Cheque').asstring;
              Nombre_Banco_Edit.text:=Datos.Cheques.fieldbyname('Nombre_Banco').asstring;
              Cantidad_Cheque_Edit.text:=Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring;
              Fecha_Emision_Cheque_Mask.text:=Datos.Cheques.fieldbyname('Fecha_Emision').asstring;
              ChequeBtn.Checked:=True;
            end;
         If Datos.Clientes.Fieldbyname('Forma_de_Pago').asstring = 'EF' then
            Begin
              EfectivoBtn.Checked:=True;
            end;
         If Datos.Clientes.Fieldbyname('Forma_de_Pago').asstring = 'TC' then
            Begin
              Datos.Tarjetas.Refresh;
              Datos.Tarjetas.indexname:='Codigo_Tipo_Index';
              Datos.Tarjetas.setkey;
              Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
              Datos.Tarjetas.fieldbyname('Tipo').asstring:='I';
              Datos.Tarjetas.gotokey;
              VisaBtn.Checked:=Datos.Tarjetas.fieldbyname('Visa').asboolean;
              MCBtn.Checked:=Datos.Tarjetas.fieldbyname('Master').asboolean;
              AmericanBtn.Checked:=Datos.Tarjetas.fieldbyname('American').asboolean;
              DinersBtn.Checked:=Datos.Tarjetas.fieldbyname('Diners').asboolean;
              OtrasBtn.Checked:=Datos.Tarjetas.fieldbyname('Otras').asboolean;
              Nombre_Tarjeta_Edit.text:=Datos.Tarjetas.fieldbyname('Nombre_Otra').asstring;
              Numero_Tarjeta_Edit.text:=Datos.Tarjetas.fieldbyname('Numero_Tarjeta').asstring;
              Fecha_Vence_Tarjeta_Mask.text:=Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring;
              TarjetaBtn.Checked:=True;
            end;

         If Datos.Clientes.Fieldbyname('Forma_de_Deposito').asstring = 'CH' then
            Begin
              Datos.Cheques.refresh;
              Datos.Cheques.indexname:='Codigo_Tipo_Index';
              Datos.Cheques.setkey;
              Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
              Datos.Cheques.fieldbyname('Tipo').asstring:='D';
              Datos.Cheques.gotokey;
              Numero_Cheque_Edit2.text:=Datos.Cheques.fieldbyname('Numero_Cheque').asstring;
              Nombre_Banco_Edit2.text:=Datos.Cheques.fieldbyname('Nombre_Banco').asstring;
              Cantidad_Cheque_Edit2.text:=Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring;
              Fecha_Emision_Cheque_Mask2.text:=Datos.Cheques.fieldbyname('Fecha_Emision').asstring;
              ChequeBtn2.Checked:=True;
            end;
         If Datos.Clientes.Fieldbyname('Forma_de_Deposito').asstring = 'EF' then
            Begin
              EfectivoBtn2.Checked:=True;
            end;
         If Datos.Clientes.Fieldbyname('Forma_de_Deposito').asstring = 'TC' then
            Begin
              Datos.Tarjetas.Refresh;
              Datos.Tarjetas.indexname:='Codigo_Tipo_Index';
              Datos.Tarjetas.setkey;
              Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
              Datos.Tarjetas.fieldbyname('Tipo').asstring:='D';
              Datos.Tarjetas.gotokey;
              VisaBtn2.Checked:=Datos.Tarjetas.fieldbyname('Visa').asboolean;
              MCBtn2.Checked:=Datos.Tarjetas.fieldbyname('Master').asboolean;
              AmericanBtn2.Checked:=Datos.Tarjetas.fieldbyname('American').asboolean;
              DinersBtn2.Checked:=Datos.Tarjetas.fieldbyname('Diners').asboolean;
              OtrasBtn2.Checked:=Datos.Tarjetas.fieldbyname('Otras').asboolean;
              Nombre_Tarjeta_Edit2.text:=Datos.Tarjetas.fieldbyname('Nombre_Otra').asstring;
              Numero_Tarjeta_Edit2.text:=Datos.Tarjetas.fieldbyname('Numero_Tarjeta').asstring;
              Fecha_Vence_Tarjeta_Mask2.text:=Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring;
              TarjetaBtn2.Checked:=True;
            end;

         CheckBox1.Checked:=Datos.Clientes.Fieldbyname('Alquiler_Free').AsBoolean;
         CheckBox2.Checked:=Datos.Clientes.Fieldbyname('Multa_Free').AsBoolean;
         CheckBox3.Checked:=Datos.Clientes.Fieldbyname('Sobregiro').AsBoolean;
         NumEdit1.Text:=Datos.Clientes.Fieldbyname('Monto_Deposito').AsString;
         CurrencyEdit1.Value:=Datos.Clientes.Fieldbyname('Maximo_Deuda').AsCurrency;
         Alerta.Value:=Datos.Clientes.Fieldbyname('Maximo_Peliculas').Asinteger;

         Datos.Mayores.Refresh;
         Datos.Mayores.indexname:='';
         Datos.Mayores.setkey;
         Datos.Mayores.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
         Datos.Mayores.gotokey;
         Nombre_Adulto_Edit1.Text:=Datos.Mayores.Fieldbyname('Nombre1').Asstring;
         Nombre_Adulto_Edit2.Text:=Datos.Mayores.Fieldbyname('Nombre2').Asstring;
         Nombre_Adulto_Edit3.Text:=Datos.Mayores.Fieldbyname('Nombre3').Asstring;
         Nombre_Adulto_Edit4.Text:=Datos.Mayores.Fieldbyname('Nombre4').Asstring;
         Apellido_Adulto_Edit1.Text:=Datos.Mayores.Fieldbyname('Apellido1').Asstring;
         Apellido_Adulto_Edit2.Text:=Datos.Mayores.Fieldbyname('Apellido2').Asstring;
         Apellido_Adulto_Edit3.Text:=Datos.Mayores.Fieldbyname('Apellido3').Asstring;
         Apellido_Adulto_Edit4.Text:=Datos.Mayores.Fieldbyname('Apellido4').Asstring;
         Fecha_Nac_Mask1.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento1').Asstring;
         Fecha_Nac_Mask2.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento2').Asstring;
         Fecha_Nac_Mask3.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento3').Asstring;
         Fecha_Nac_Mask4.Text:=Datos.Mayores.Fieldbyname('Fecha_Nacimiento4').Asstring;
         Parentesco_Adulto_Edit1.Text:=Datos.Mayores.Fieldbyname('Parentesco1').Asstring;
         Parentesco_Adulto_Edit2.Text:=Datos.Mayores.Fieldbyname('Parentesco2').Asstring;
         Parentesco_Adulto_Edit3.Text:=Datos.Mayores.Fieldbyname('Parentesco3').Asstring;
         Parentesco_Adulto_Edit4.Text:=Datos.Mayores.Fieldbyname('Parentesco4').Asstring;

         Datos.Menores.indexname:='';
         Datos.Menores.setkey;
         Datos.Menores.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
         Datos.Menores.gotokey;
         Nombre_Menor_Edit1.Text:=Datos.Menores.Fieldbyname('Nombre1').Asstring;
         Nombre_Menor_Edit2.Text:=Datos.Menores.Fieldbyname('Nombre2').Asstring;
         Nombre_Menor_Edit3.Text:=Datos.Menores.Fieldbyname('Nombre3').Asstring;
         Nombre_Menor_Edit4.Text:=Datos.Menores.Fieldbyname('Nombre4').Asstring;
         Apellido_Menor_Edit1.Text:=Datos.Menores.Fieldbyname('Apellido1').Asstring;
         Apellido_Menor_Edit2.Text:=Datos.Menores.Fieldbyname('Apellido2').Asstring;
         Apellido_Menor_Edit3.Text:=Datos.Menores.Fieldbyname('Apellido3').Asstring;
         Apellido_Menor_Edit4.Text:=Datos.Menores.Fieldbyname('Apellido4').Asstring;
         Fecha_Nac_Mask5.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento1').Asstring;
         Fecha_Nac_Mask6.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento2').Asstring;
         Fecha_Nac_Mask7.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento3').Asstring;
         Fecha_Nac_Mask8.Text:=Datos.Menores.Fieldbyname('Fecha_Nacimiento4').Asstring;

//Se coloca la edad de todas las personas autorizadas y de todos los niños

      IF (Fecha_Nac_Mask1.Text<>'  /  /    ') then
         Begin
           Edad_Label1.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask1.Text))/360));
         end
      Else
         Begin
           Edad_Label1.Caption:='0';
         end;

      IF (Fecha_Nac_Mask2.Text<>'  /  /    ') then
         Begin
           Edad_Label2.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask2.Text))/360));
         end
      Else
         Begin
           Edad_Label2.Caption:='0';
         end;

      IF (Fecha_Nac_Mask3.Text<>'  /  /    ') then
         Begin
           Edad_Label3.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask3.Text))/360));
         end
      Else
         Begin
           Edad_Label3.Caption:='0';
         end;

      IF (Fecha_Nac_Mask4.Text<>'  /  /    ') then
         Begin
           Edad_Label4.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask4.Text))/360));
         end
      Else
         Begin
           Edad_Label4.Caption:='0';
         end;

      IF (Fecha_Nac_Mask5.Text<>'  /  /    ') then
         Begin
           Edad_Label5.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask5.Text))/360));
         end
      Else
         Begin
           Edad_Label5.Caption:='0';
         end;

      IF (Fecha_Nac_Mask6.Text<>'  /  /    ') then
         Begin
           Edad_Label6.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask6.Text))/360));
         end
      Else
         Begin
           Edad_Label6.Caption:='0';
         end;

      IF (Fecha_Nac_Mask7.Text<>'  /  /    ') then
         Begin
           Edad_Label7.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask7.Text))/360));
         end
      Else
         Begin
           Edad_Label7.Caption:='0';
         end;

      IF (Fecha_Nac_Mask8.Text<>'  /  /    ') then
         Begin
           Edad_Label8.Caption:=floattostr(int((StrToDate(Principal.Fecha_Total)-strtodate(Fecha_Nac_Mask8.Text))/360));
         end
      Else
         Begin
           Edad_Label8.Caption:='0';
         end;


//Se termina el proceso de carga de datos.

         key:=#3;
       end
    else
       Begin
         Edad_Label1.Caption:='0';
         Edad_Label2.Caption:='0';
         Edad_Label3.Caption:='0';
         Edad_Label4.Caption:='0';
         Edad_Label5.Caption:='0';
         Edad_Label6.Caption:='0';
         Edad_Label7.Caption:='0';
         Edad_Label8.Caption:='0';
         Limpiar_Todo;
         Showmessage('El código que ha ingresado no se encuentra, por '+
                     'favor, corrija el problema y continúe la búsqueda.');
         MaskEdit3.Text:='';
         Maskedit3.Setfocus;
         key:=#3;
       end;
  end;
end;

procedure TConsultar_Cliente.ChequeBtn2Click(Sender: TObject);
begin
  Numero_Cheque_Edit2.Visible:=True;
  Nombre_Banco_Edit2.Visible:=True;
  Cantidad_Cheque_Edit2.Visible:=True;
  Fecha_Emision_Cheque_Mask2.Visible:=True;
  Label732.Visible:=True;
  Label742.Visible:=True;
  Label752.Visible:=True;
  Label762.Visible:=True;

  VisaBtn2.Visible:=False;
  MCBtn2.Visible:=False;
  AmericanBtn2.Visible:=False;
  DinersBtn2.Visible:=False;
  OtrasBtn2.Visible:=False;
  Label772.Visible:=False;
  Label782.Visible:=False;
  Label792.Visible:=False;
  Nombre_Tarjeta_Edit2.Visible:=False;
  Numero_Tarjeta_Edit2.Visible:=False;
  Fecha_Vence_Tarjeta_Mask2.Visible:=False;
  Nombre_Tarjeta_Edit2.Text:='';
  Numero_Tarjeta_Edit2.Text:='';
  Fecha_Vence_Tarjeta_Mask2.Text:='';
  Cantidad_Cheque_Edit2.Text:=NumEdit1.Text;
end;

procedure TConsultar_Cliente.EfectivoBtn2Click(Sender: TObject);
begin
  Numero_Cheque_Edit2.Visible:=False;
  Nombre_Banco_Edit2.Visible:=False;
  Cantidad_Cheque_Edit2.Visible:=False;
  Fecha_Emision_Cheque_Mask2.Visible:=False;
  Label732.Visible:=False;
  Label742.Visible:=False;
  Label752.Visible:=False;
  Label762.Visible:=False;

  VisaBtn2.Visible:=False;
  MCBtn2.Visible:=False;
  AmericanBtn2.Visible:=False;
  DinersBtn2.Visible:=False;
  OtrasBtn2.Visible:=False;
  Label772.Visible:=False;
  Label782.Visible:=False;
  Label792.Visible:=False;
  Nombre_Tarjeta_Edit2.Visible:=False;
  Numero_Tarjeta_Edit2.Visible:=False;
  Fecha_Vence_Tarjeta_Mask2.Visible:=False;
  Nombre_Tarjeta_Edit2.Text:='';
  Numero_Tarjeta_Edit2.Text:='';
  Fecha_Vence_Tarjeta_Mask2.Text:='';
  Numero_Cheque_Edit2.Text:='';
  Nombre_Banco_Edit2.Text:='';
  Cantidad_Cheque_Edit2.Text:='';
  Fecha_Emision_Cheque_Mask2.Text:='';
end;

procedure TConsultar_Cliente.TarjetaBTn2Click(Sender: TObject);
begin
  Numero_Cheque_Edit2.Visible:=False;
  Nombre_Banco_Edit2.Visible:=False;
  Cantidad_Cheque_Edit2.Visible:=False;
  Fecha_Emision_Cheque_Mask2.Visible:=False;
  Numero_Cheque_Edit2.Text:='';
  Nombre_Banco_Edit2.Text:='';
  Cantidad_Cheque_Edit2.Text:='';
  Fecha_Emision_Cheque_Mask2.Text:='';
  Label732.Visible:=False;
  Label742.Visible:=False;
  Label752.Visible:=False;
  Label762.Visible:=False;

  VisaBtn2.Visible:=True;
  MCBtn2.Visible:=True;
  AmericanBtn2.Visible:=True;
  DinersBtn2.Visible:=True;
  OtrasBtn2.Visible:=True;
  Label772.Visible:=True;
  Label782.Visible:=True;
  Label792.Visible:=True;
  Nombre_Tarjeta_Edit2.Visible:=True;
  Numero_Tarjeta_Edit2.Visible:=True;
  Fecha_Vence_Tarjeta_Mask2.Visible:=True;
  Nombre_Tarjeta_Edit2.Text:=VisaBtn.Caption;
end;

end.
