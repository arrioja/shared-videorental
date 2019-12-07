unit unuevo_cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, ComCtrls,
  Numedit, addbtn95, Barcd4, ToolEdit, CurrEdit, Spin;

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

  Tnuevo_cliente = class(TForm)
    OKBtn: TBitBtn;
    CancelarBtn: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    PageControl1: TPageControl;
    Hoja_1: TTabSheet;
    Label4: TLabel;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    Edit3: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Memo1: TMemo;
    Label9: TLabel;
    RadioGroup1: TRadioGroup;
    Label11: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Hoja_2: TTabSheet;
    Hoja_3: TTabSheet;
    Hoja_4: TTabSheet;
    Label12: TLabel;
    Ciudad_edit: TEdit;
    Estado_edit: TEdit;
    Profesion_Edit: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    PageControl3: TPageControl;
    Adultos_Hoja: TTabSheet;
    Menor_Hoja: TTabSheet;
    PageControl4: TPageControl;
    Persona_1_Hoja: TTabSheet;
    Persona_2_Hoja: TTabSheet;
    Persona_3_Hoja: TTabSheet;
    Persona_4_Hoja: TTabSheet;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Nombre_Adulto_Edit1: TEdit;
    Apellido_Adulto_Edit1: TEdit;
    Fecha_Nac_Mask1: TMaskEdit;
    Label31: TLabel;
    Edad_Label1: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Nombre_Adulto_Edit2: TEdit;
    Apellido_Adulto_Edit2: TEdit;
    Fecha_Nac_Mask2: TMaskEdit;
    Label36: TLabel;
    Edad_Label2: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Nombre_Adulto_Edit3: TEdit;
    Apellido_Adulto_Edit3: TEdit;
    Fecha_Nac_Mask3: TMaskEdit;
    Label42: TLabel;
    Edad_Label3: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Nombre_Adulto_Edit4: TEdit;
    Apellido_Adulto_Edit4: TEdit;
    Fecha_Nac_Mask4: TMaskEdit;
    Label48: TLabel;
    Edad_Label4: TLabel;
    PageControl5: TPageControl;
    Menor_1_Hoja: TTabSheet;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Edad_Label5: TLabel;
    Nombre_Menor_Edit1: TEdit;
    Apellido_Menor_Edit1: TEdit;
    Fecha_Nac_Mask5: TMaskEdit;
    Menor_2_Hoja: TTabSheet;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label60: TLabel;
    Edad_Label6: TLabel;
    Nombre_Menor_Edit2: TEdit;
    Apellido_Menor_Edit2: TEdit;
    Fecha_Nac_Mask6: TMaskEdit;
    Menor_3_Hoja: TTabSheet;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Edad_Label7: TLabel;
    Nombre_Menor_Edit3: TEdit;
    Apellido_Menor_Edit3: TEdit;
    Fecha_Nac_Mask7: TMaskEdit;
    Menor_4_Hoja: TTabSheet;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label72: TLabel;
    Edad_Label8: TLabel;
    Nombre_Menor_Edit4: TEdit;
    Apellido_Menor_Edit4: TEdit;
    Fecha_Nac_Mask8: TMaskEdit;
    Label47: TLabel;
    Label30: TLabel;
    Parentesco_Adulto_Edit1: TEdit;
    Label35: TLabel;
    Parentesco_Adulto_Edit2: TEdit;
    Label41: TLabel;
    Parentesco_Adulto_Edit3: TEdit;
    Parentesco_Adulto_Edit4: TEdit;
    Label37: TLabel;
    Label43: TLabel;
    Label49: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    Label71: TLabel;
    Postal_Edit: TNumEdit;
    GroupBox2: TGroupBox;
    Label79: TLabel;
    Nombre_Tarjeta_Edit: TEdit;
    Label78: TLabel;
    Label77: TLabel;
    GroupBox1: TGroupBox;
    Label76: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    GroupBox3: TGroupBox;
    ChequeBtn: TRadioButton95;
    EfectivoBtn: TRadioButton95;
    TarjetaBTn: TRadioButton95;
    VisaBtn: TRadioButton95;
    MCBtn: TRadioButton95;
    AmericanBtn: TRadioButton95;
    OtrasBtn: TRadioButton95;
    DinersBtn: TRadioButton95;
    Edit2: TNumEdit;
    Edit1: TEdit;
    DescuentoBtn: TBitBtn;
    Barras: TPrintBarcode;
    Label8: TLabel;
    NumEdit1: TNumEdit;
    GroupBox4: TGroupBox;
    ChequeBtn2: TRadioButton95;
    EfectivoBtn2: TRadioButton95;
    TarjetaBTn2: TRadioButton95;
    GroupBox5: TGroupBox;
    Label762: TLabel;
    Label732: TLabel;
    Label742: TLabel;
    Label752: TLabel;
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
    Numero_Tarjeta_Edit: TNumEdit;
    Fecha_Vence_Tarjeta_Mask: TMaskEdit;
    Numero_Tarjeta_Edit2: TNumEdit;
    Fecha_Vence_Tarjeta_Mask2: TMaskEdit;
    Numero_Cheque_Edit: TNumEdit;
    Nombre_Banco_Edit: TEdit;
    Cantidad_Cheque_Edit: TNumEdit;
    Fecha_Emision_Cheque_Mask: TMaskEdit;
    Numero_Cheque_Edit2: TNumEdit;
    Nombre_Banco_Edit2: TEdit;
    Cantidad_Cheque_Edit2: TNumEdit;
    Fecha_Emision_Cheque_Mask2: TMaskEdit;
    BitBtn1: TBitBtn;
    Empleo_Hoja: TTabSheet;
    Label23: TLabel;
    Nombre_Empresa_Edit: TEdit;
    Label24: TLabel;
    Telefono_Empresa_Mask: TMaskEdit;
    Label25: TLabel;
    Fax_Empresa_Mask: TMaskEdit;
    Label26: TLabel;
    Direccion_Empresa_Memo: TMemo;
    GroupBox7: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox8: TGroupBox;
    CurrencyEdit1: TCurrencyEdit;
    Alerta: TSpinEdit;
    Label81: TLabel;
    Label80: TLabel;
    DateEdit1: TDateEdit;
    CheckBox4: TCheckBox;
    procedure CancelarBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure OtrasBtnClick(Sender: TObject);
    procedure DinersBtnClick(Sender: TObject);
    Procedure Limpiar_Controles;
    procedure Fecha_Nac_Mask1Exit(Sender: TObject);
    procedure Fecha_Nac_Mask2Exit(Sender: TObject);
    procedure Fecha_Nac_Mask3Exit(Sender: TObject);
    procedure Fecha_Nac_Mask4Exit(Sender: TObject);
    procedure Fecha_Nac_Mask5Exit(Sender: TObject);
    procedure Calcular_Codigo;
    procedure Fecha_Nac_Mask6Exit(Sender: TObject);
    procedure Fecha_Nac_Mask7Exit(Sender: TObject);
    procedure Fecha_Nac_Mask8Exit(Sender: TObject);
    procedure ChequeBtnClick(Sender: TObject);
    procedure EfectivoBtnClick(Sender: TObject);
    procedure TarjetaBTnClick(Sender: TObject);
    procedure Ciudad_editKeyPress(Sender: TObject; var Key: Char);
    procedure Estado_editKeyPress(Sender: TObject; var Key: Char);
    procedure Postal_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Profesion_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Numero_Cheque_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Banco_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Tarjeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Numero_Tarjeta_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Empresa_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Telefono_Empresa_MaskKeyPress(Sender: TObject;
      var Key: Char);
    procedure Fax_Empresa_MaskKeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Adulto_Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Adulto_Edit1KeyPress(Sender: TObject;
      var Key: Char);
    procedure Fecha_Nac_Mask1KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Adulto_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Adulto_Edit2KeyPress(Sender: TObject;
      var Key: Char);
    procedure Fecha_Nac_Mask2KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Adulto_Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Adulto_Edit3KeyPress(Sender: TObject;
      var Key: Char);
    procedure Fecha_Nac_Mask3KeyPress(Sender: TObject; var Key: Char);
    procedure Fecha_Nac_Mask4KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Adulto_Edit4KeyPress(Sender: TObject;
      var Key: Char);
    procedure Nombre_Adulto_Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure DescuentoBtnClick(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure EfectivoBtn2Click(Sender: TObject);
    procedure ChequeBtn2Click(Sender: TObject);
    procedure TarjetaBTn2Click(Sender: TObject);
    procedure Numero_Cheque_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Banco_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure VisaBtn2Click(Sender: TObject);
    procedure Nombre_Tarjeta_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Numero_Tarjeta_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure NumEdit1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  nuevo_cliente: Tnuevo_cliente;
  no_hay_nombre:boolean;
  codigo:integer;
  cedula:integer;
  nombre:string;
  direccion:string;
  deposito:integer;
  fecha:string;
  Autoriza_Inscripcion,Autoriza_Deposito:String;
  Monto_Descontado_Inscripcion,Monto_Descontado_Deposito:real;


  implementation

uses uprincipal, UPedir_Clave, uconfirmar, UCaja, MODULO_DE_DATOS,
  UAutorizacion;

{$R *.DFM}
Function Nombre_Computador : String; Far; External 'Control.dll';

procedure Tnuevo_cliente.CancelarBtnClick(Sender: TObject);
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


procedure Tnuevo_cliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Principal.enabled:=true;
end;

procedure Tnuevo_cliente.FormActivate(Sender: TObject);
Begin
  edit1.text:='';
  edit2.text:=floatToStr(Precio_de_Inscripcion);
  Numedit1.text:=floatToStr(Precio_Deposito);
  Maskedit1.text:='00.000.000';
  Maskedit3.text:='';
  Calcular_Codigo;
end;

procedure Tnuevo_cliente.Calcular_Codigo;
begin
  Datos.Clientes.Refresh;
  Datos.Clientes.indexname:='';
  randomize;
  codigo:=random(9999);
     While (length(inttostr(codigo))<4) do
        Begin
          codigo:=random(9999);
        end;
{ojo, en la siguiente parte se comprueba la
 existencia del código en la base de datos,
 si existe se cambia hasta que no exista, si
 no existe, se deja sin modificaciones, y al
 final, se muestra en su respectivo cuadro de
 edicción.}

  Datos.Clientes.setkey;
  Datos.Clientes.fieldbyname('Codigo_cliente').asinteger:=codigo;
  while Datos.Clientes.gotokey = true do
      begin
        Datos.Clientes.setkey;
        codigo:=random(9999);
        while (length(inttostr(codigo))<4) do
           Begin
             codigo:=random(9999);
           end;
        Datos.Clientes.fieldbyname('Codigo_Cliente').asinteger:=codigo;
      end;
  maskedit3.text:=inttostr(codigo);
end;

procedure Tnuevo_cliente.MaskEdit1Exit(Sender: TObject);
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

procedure Tnuevo_cliente.OKBtnClick(Sender: TObject);
var
bien      :boolean;
cont      :integer;
hay_chars :boolean;
begin
{***********Comprobación Inicial de los Datos Introducidos***************}
 try
   bien:=false;
   if edit1.text = '' then
       bien:=false
   else
      begin
        for cont:= 1 to length(edit1.text) do
           begin
              if edit1.text[cont] <> #32 then
                begin
                  bien:=true;
                end;
           end;
      end;

   if bien = False then
       begin
         raise falta_nombre.create(' ');
       end;

   bien:=false;
   if edit3.text = '' then
       bien:=false
   else
      begin
        for cont:= 1 to length(edit3.text) do
           begin
              if edit3.text[cont] <> #32 then
                begin
                  bien:=true;
                end;
           end;
      end;

   if bien = False then
       begin
         raise falta_apellido.create(' ');
       end;

  bien:=false;
   if ((maskedit1.text = '') or (Maskedit1.text = '00.000.000')
       or (length(maskedit1.text)<=0)) then
       bien:=false
   else
      begin
        for cont:= 1 to length(maskedit1.text) do
           begin
             if (maskedit1.text[cont] <> #46) and (maskedit1.text[cont] <> #32)then
                begin
                  bien:=true;
                end;
           end;
      end;

   if bien = False then
       begin
         raise falta_cedula.create(' ');
       end;

//Se comprueba que cada una de las fechas de nacimiento estén bién
//La del cliente
       Try
         Begin
           strtodate(maskedit4.text);
         end
       except
           on econverterror do raise Mala_fecha.create(' ');
       end;
       If (StrToDate(Principal.Fecha_Total) < strtodate(Maskedit4.Text)) then
          Begin
            raise Fecha_es_Menor.create(' ');
          end;


//La de la 1 persona autorizada cliente
       Hay_Chars:=False;
       If((Fecha_Nac_Mask1.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask1.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask1.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;


//La de la 2 persona autorizada cliente
       Hay_Chars:=False;
       If((Fecha_Nac_Mask2.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask2.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask2.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;



//La de la 3 persona autorizada cliente
       Hay_Chars:=False;
       If((Fecha_Nac_Mask3.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask3.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask3.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;



//La de la 4 persona autorizada cliente
       Hay_Chars:=False;
       If((Fecha_Nac_Mask4.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask4.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask4.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;




//La del 1 niño inscrito
       Hay_Chars:=False;
       If((Fecha_Nac_Mask5.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask5.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask5.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;



//La del 2 niño inscrito
       Hay_Chars:=False;
       If((Fecha_Nac_Mask6.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask6.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask6.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;



//La del 3 niño inscrito
       Hay_Chars:=False;
       If((Fecha_Nac_Mask7.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask7.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask7.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;




//La del 4 niño inscrito
       Hay_Chars:=False;
       If((Fecha_Nac_Mask8.Text<>'  /  /    ') and (Hay_Chars = False)) then
          Begin
            Hay_Chars:=True;
          end;
       If (Hay_Chars = True) then
          Begin
            try
              Begin
                strtodate(Fecha_Nac_Mask8.text);
              end
            except
              on econverterror do raise Mala_fecha.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) < strtodate(Fecha_Nac_Mask8.Text)) then
               Begin
                 raise Fecha_es_Menor.create(' ');
               end;
          end;

   try
       strtoint(edit2.text);
   except
       on econverterror do
          raise Mal_deposito.create(' ');
       end;

//Se comprueba que cada una de las fechas de nacimiento estén bién
//La del Hasta del Cliente free
       Try
         Begin
           If ((DateEdit1.Enabled = True) AND (DateEdit1.Text <> '  /  /    ')) Then
             strtodate(DateEdit1.Text);
         end
       except
           on econverterror do raise Mala_fecha.create(' ');
       end;
       If (StrToDate(Principal.Fecha_Total) < strtodate(Maskedit4.Text)) then
          Begin
            raise Fecha_es_Menor.create(' ');
          end;

//Comprobación de las formas de pago con sus respectivas casillas
//Las del Cheque
//el numero del cheque
If ChequeBtn.checked = True then
   Begin
     bien:=false;
     if Numero_Cheque_Edit.text = '' then
       bien:=false
     else
       begin
         for cont:= 1 to length(Numero_Cheque_Edit.text) do
           begin
             if Numero_Cheque_Edit.text[cont] <> #32 then
               begin
                 bien:=true;
               end;
           end;
       end;
     if bien <> true then
       begin
         raise Falta_Numero_Cheque.create(' ');
       end;

//el nombre del banco
     bien:=false;
     if Nombre_Banco_Edit.text = '' then
       bien:=false
     else
       begin
         for cont:= 1 to length(Nombre_Banco_Edit.text) do
           begin
             if Nombre_Banco_Edit.text[cont] <> #32 then
               begin
                 bien:=true;
               end;
           end;
       end;
     if bien <> true then
       begin
         raise Falta_Nombre_Banco.create(' ');
       end;

// LA cantidad del cheque
     bien:=false;
     if Cantidad_Cheque_Edit.text = '' then
       bien:=false
     else
       begin
         for cont:= 1 to length(Cantidad_Cheque_Edit.text) do
           begin
             if Cantidad_Cheque_Edit.text[cont] <> #32 then
               begin
                 bien:=true;
               end;
           end;
       end;
     if bien <> true then
       begin
         raise Falta_Cantidad_Cheque.create(' ');
       end;

// La fecha del cheque
       Try
         Begin
           strtodate(Fecha_Emision_Cheque_Mask.text);
         end
       except
           on econverterror do raise Mala_fecha_cheque.create(' ');
       end;
   end;

// de la tarjeta de crédito
If TarjetaBtn.checked = True then
   Begin
     //Se comprueba el nombre de la tarjeta si el boton otras esta presionado
     If otrasBtn.Checked = True then
        Begin
          bien:=false;
          if Nombre_Tarjeta_Edit.text = '' then
             bien:=false
          else
             begin
               for cont:= 1 to length(Nombre_Tarjeta_Edit.text) do
                 begin
                   if Nombre_Tarjeta_Edit.text[cont] <> #32 then
                     begin
                       bien:=true;
                     end;
                 end;
             end;
          if bien <> true then
            begin
              raise Falta_Nombre_Tarjeta.create(' ');
            end;
        end;

//Se comprueba el numero de la tarjeta
     bien:=false;
     if Numero_Tarjeta_Edit.text = '' then
        bien:=false
     else
        begin
          for cont:= 1 to length(Numero_Tarjeta_Edit.text) do
            begin
              if Numero_Tarjeta_Edit.text[cont] <> #32 then
                begin
                  bien:=true;
                end;
            end;
        end;
     if bien <> true then
        begin
          raise Falta_Numero_Tarjeta.create(' ');
        end;

//Se comprueba la fecha de vencimiento de la tarjeta
          Begin
            try
              Begin
                strtodate(Fecha_Vence_Tarjeta_Mask.text);
              end
            except
              on econverterror do raise Mala_fecha_tarjeta.create(' ');
            end;
            If (StrToDate(Principal.Fecha_Total) >= strtodate(Fecha_Vence_Tarjeta_Mask.Text)) then
               Begin
                 raise Fecha_Menor_tarjeta.create(' ');
               end;
          end;
   end;

        Datos.Clientes.Refresh;
        Datos.Clientes.indexname:='';
        Datos.Clientes.indexname:='cedula_indice';
        Datos.Clientes.setkey;
        Datos.Clientes.fieldbyname('cedula_Cliente').asstring:=Maskedit1.text;
        bien:=true;
        if (Datos.Clientes.gotokey = true) then
             begin
               bien:=false;
               messagedlg('El número de Cédula que ha introducido '
               +'ya se encuentra en nuestros registros, debe introducir '
               +'un número que no se encuentre registrado.',mterror,[mbok],0);
             end;

        If Bien = True Then
          Begin
            Datos.Clientes.Refresh;
            Datos.Clientes.indexname:='';
            Datos.Clientes.indexname:='';
            Datos.Clientes.setkey;
            Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit3.text;
            bien:=true;
            if (Datos.Clientes.gotokey = true) then
                 begin
                   bien:=false;
                   messagedlg('El Código de Cliente introducido '
                   +'ya se encuentra en nuestros registros, el mismo, pertenece al (la) Sr(a): '+
                    Datos.Clientes.fieldbyname('Nombres_Cliente').asstring+' '+
                    Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring+'.'+
                    ' Debe introducir un Código que no se encuentre registrado.',mterror,[mbok],0);
                   MaskEdit3.Setfocus;
                 end;
          end;

        if (bien = true) then
             begin
               //Actualización de la Base Usuarios
               Datos.Clientes.Refresh;
               Datos.Clientes.last;
               Datos.Clientes.insert;
               Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
               Datos.Clientes.fieldbyname('Cedula_Cliente').asstring:=maskedit1.text;
               Datos.Clientes.fieldbyname('Nombres_Cliente').asstring:=Edit1.text;
               Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring:=Edit3.text;
               If Radiogroup1.itemindex = 0 then
                  Datos.Clientes.fieldbyname('Sexo_Cliente').asboolean:=False;
               If Radiogroup1.itemindex = 1 then
                  Datos.Clientes.fieldbyname('Sexo_Cliente').asboolean:=True;
               Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asstring:=Maskedit4.text;
               Datos.Clientes.fieldbyname('Telefono_1_Cliente').asstring:=Maskedit2.text;
               Datos.Clientes.fieldbyname('Telefono_2_Cliente').asstring:=Maskedit5.text;
               Datos.Clientes.fieldbyname('Ciudad_Cliente').asstring:=Ciudad_Edit.Text;
               Datos.Clientes.fieldbyname('Fecha_Inscripcion').asstring:=Principal.Fecha_Total;
               Datos.Clientes.fieldbyname('Estado_Cliente').asstring:=Estado_Edit.Text;
               Datos.Clientes.fieldbyname('Postal_Cliente').asstring:=Postal_Edit.Text;
               Datos.Clientes.fieldbyname('Profesion_Cliente').asstring:=Profesion_Edit.Text;
               Datos.Clientes.fieldbyname('Direccion_Cliente').assign(Memo1.lines);
               Datos.Clientes.fieldbyname('Cliente_Multado').asboolean:=False;
               Datos.Clientes.fieldbyname('Tiene_Pelicula').asboolean:=False;
               If ChequeBtn.Checked = True then
                  Datos.Clientes.fieldbyname('Forma_de_Pago').asstring:='CH';
               If EfectivoBtn.Checked = True then
                  Datos.Clientes.fieldbyname('Forma_de_Pago').asstring:='EF';
               If TarjetaBtn.Checked = True then
                  Datos.Clientes.fieldbyname('Forma_de_Pago').asstring:='TC';
               If ChequeBtn2.Checked = True then
                  Datos.Clientes.fieldbyname('Forma_de_Deposito').asstring:='CH';
               If EfectivoBtn2.Checked = True then
                  Datos.Clientes.fieldbyname('Forma_de_Deposito').asstring:='EF';
               If TarjetaBtn2.Checked = True then
                  Datos.Clientes.fieldbyname('Forma_de_Deposito').asstring:='TC';
               Datos.Clientes.fieldbyname('Nombre_Empresa').asstring:=Nombre_Empresa_Edit.Text;
               Datos.Clientes.fieldbyname('Telefono_Empresa').asstring:=Telefono_Empresa_Mask.Text;
               Datos.Clientes.fieldbyname('Fax_Empresa').asstring:=Fax_Empresa_Mask.Text;
               Datos.Clientes.fieldbyname('Direccion_Empresa').assign(Direccion_Empresa_Memo.lines);
               Datos.Clientes.Fieldbyname('Alquiler_Free').AsBoolean:=CheckBox1.Checked;
               Datos.Clientes.Fieldbyname('Multa_Free').AsBoolean:=CheckBox2.Checked;
               Datos.Clientes.Fieldbyname('Sobregiro').AsBoolean:=CheckBox3.Checked;
               Datos.Clientes.Fieldbyname('Monto_Inscripcion').AsInteger:=StrToInt(Edit2.Text);
               Datos.Clientes.Fieldbyname('Monto_Deposito').AsInteger:=StrToInt(NumEdit1.Text);
               Datos.Clientes.Fieldbyname('Maximo_Deuda').AsCurrency:=CurrencyEdit1.Value;
               Datos.Clientes.Fieldbyname('Maximo_Peliculas').Asinteger:=Alerta.Value;
               Datos.Clientes.Fieldbyname('Ultima_Visita').AsString:=Principal.Fecha_Total;
               If ((DateEdit1.Enabled = True) AND (DateEdit1.Text <> '  /  /    ')) Then
                 Datos.Clientes.Fieldbyname('Free_Hasta').AsString:=DateEdit1.Text
               else
                 Datos.Clientes.Fieldbyname('Free_Hasta').AsString:='';
               Datos.Clientes.Post;
               Datos.Clientes.FlushBuffers;
               Datos.Clientes.Refresh;

               //Actualización de la Base Pago_Por_Cheque
               If ChequeBtn.Checked = True then
                  BEgin
                    Datos.Cheques.Refresh;
                    Datos.Cheques.last;
                    Datos.Cheques.insert;
                    Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                    Datos.Cheques.fieldbyname('Tipo').asstring:='I';
                    Datos.Cheques.fieldbyname('Numero_Cheque').asstring:=Numero_Cheque_Edit.Text;
                    Datos.Cheques.fieldbyname('Nombre_Banco').asstring:=Nombre_Banco_Edit.Text;
                    Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring:=Cantidad_cheque_Edit.Text;
                    Datos.Cheques.fieldbyname('Fecha_Emision').asstring:=Fecha_Emision_Cheque_Mask.Text;
                    Datos.Cheques.Post;
                    Datos.Cheques.FlushBuffers;
                    Datos.Cheques.Refresh;
                  end;

               If ChequeBtn2.Checked = True then
                  BEgin
                    Datos.Cheques.Refresh;
                    Datos.Cheques.last;
                    Datos.Cheques.insert;
                    Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                    Datos.Cheques.fieldbyname('Tipo').asstring:='D';
                    Datos.Cheques.fieldbyname('Numero_Cheque').asstring:=Numero_Cheque_Edit2.Text;
                    Datos.Cheques.fieldbyname('Nombre_Banco').asstring:=Nombre_Banco_Edit2.Text;
                    Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring:=Cantidad_cheque_Edit2.Text;
                    Datos.Cheques.fieldbyname('Fecha_Emision').asstring:=Fecha_Emision_Cheque_Mask2.Text;
                    Datos.Cheques.Post;
                    Datos.Cheques.FlushBuffers;
                    Datos.Cheques.Refresh;
                  end;

               //Actualización de la Base Pago_Por_Tarjeta
               If TarjetaBtn.Checked = True then
                  BEgin
                    Datos.Tarjetas.Refresh;
                    Datos.Tarjetas.last;
                    Datos.Tarjetas.insert;
                    Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                    Datos.Tarjetas.fieldbyname('Tipo').asstring:='I';
                    Datos.Tarjetas.fieldbyname('Visa').asboolean:=VisaBtn.Checked;
                    Datos.Tarjetas.fieldbyname('Master').asboolean:=MCBtn.Checked;
                    Datos.Tarjetas.fieldbyname('American').asboolean:=AmericanBtn.Checked;
                    Datos.Tarjetas.fieldbyname('Diners').asboolean:=DinersBtn.Checked;
                    Datos.Tarjetas.fieldbyname('Otras').asboolean:=OtrasBtn.Checked;
                    Datos.Tarjetas.fieldbyname('Nombre_Otra').asstring:=Nombre_Tarjeta_Edit.Text;
                    Datos.Tarjetas.fieldbyname('Numero_Tarjeta').asstring:=Numero_Tarjeta_Edit.Text;
                    Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring:=Fecha_Vence_Tarjeta_Mask.Text;
                    Datos.Tarjetas.Post;
                    Datos.Tarjetas.FlushBuffers;
                    Datos.Tarjetas.Refresh;
                  end;

               If TarjetaBtn2.Checked = True then
                  BEgin
                    Datos.Tarjetas.Refresh;
                    Datos.Tarjetas.last;
                    Datos.Tarjetas.insert;
                    Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                    Datos.Tarjetas.fieldbyname('Tipo').asstring:='D';
                    Datos.Tarjetas.fieldbyname('Visa').asboolean:=VisaBtn2.Checked;
                    Datos.Tarjetas.fieldbyname('Master').asboolean:=MCBtn2.Checked;
                    Datos.Tarjetas.fieldbyname('American').asboolean:=AmericanBtn2.Checked;
                    Datos.Tarjetas.fieldbyname('Diners').asboolean:=DinersBtn2.Checked;
                    Datos.Tarjetas.fieldbyname('Otras').asboolean:=OtrasBtn2.Checked;
                    Datos.Tarjetas.fieldbyname('Nombre_Otra').asstring:=Nombre_Tarjeta_Edit2.Text;
                    Datos.Tarjetas.fieldbyname('Numero_Tarjeta').asstring:=Numero_Tarjeta_Edit2.Text;
                    Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring:=Fecha_Vence_Tarjeta_Mask2.Text;
                    Datos.Tarjetas.Post;
                    Datos.Tarjetas.FlushBuffers;
                    Datos.Tarjetas.Refresh;
                  end;


               //Actualización de la base Autorizados
               Datos.Mayores.Refresh;
               Datos.Mayores.Last;
               Datos.Mayores.Insert;
               Datos.Mayores.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
               Datos.Mayores.fieldbyname('Nombre1').asstring:=Nombre_Adulto_Edit1.Text;
               Datos.Mayores.fieldbyname('Apellido1').asstring:=Apellido_Adulto_Edit1.Text;
               Datos.Mayores.fieldbyname('Fecha_Nacimiento1').asstring:=Fecha_Nac_Mask1.Text;
               Datos.Mayores.fieldbyname('Parentesco1').asstring:=Parentesco_Adulto_Edit1.Text;
               Datos.Mayores.fieldbyname('Nombre2').asstring:=Nombre_Adulto_Edit2.Text;
               Datos.Mayores.fieldbyname('Apellido2').asstring:=Apellido_Adulto_Edit2.Text;
               Datos.Mayores.fieldbyname('Fecha_Nacimiento2').asstring:=Fecha_Nac_Mask2.Text;
               Datos.Mayores.fieldbyname('Parentesco2').asstring:=Parentesco_Adulto_Edit2.Text;
               Datos.Mayores.fieldbyname('Nombre3').asstring:=Nombre_Adulto_Edit3.Text;
               Datos.Mayores.fieldbyname('Apellido3').asstring:=Apellido_Adulto_Edit3.Text;
               Datos.Mayores.fieldbyname('Fecha_Nacimiento3').asstring:=Fecha_Nac_Mask3.Text;
               Datos.Mayores.fieldbyname('Parentesco3').asstring:=Parentesco_Adulto_Edit3.Text;
               Datos.Mayores.fieldbyname('Nombre4').asstring:=Nombre_Adulto_Edit4.Text;
               Datos.Mayores.fieldbyname('Apellido4').asstring:=Apellido_Adulto_Edit4.Text;
               Datos.Mayores.fieldbyname('Fecha_Nacimiento4').asstring:=Fecha_Nac_Mask4.Text;
               Datos.Mayores.fieldbyname('Parentesco4').asstring:=Parentesco_Adulto_Edit4.Text;
               Datos.Mayores.Post;
               Datos.Mayores.FlushBuffers;
               Datos.Mayores.Refresh;

               //Actualización de la base Menores.
               Datos.Menores.Refresh;
               Datos.Menores.Last;
               Datos.Menores.Insert;
               Datos.Menores.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
               Datos.Menores.fieldbyname('Nombre1').asstring:=Nombre_Menor_Edit1.Text;
               Datos.Menores.fieldbyname('Apellido1').asstring:=Apellido_Menor_Edit1.Text;
               Datos.Menores.fieldbyname('Fecha_Nacimiento1').asstring:=Fecha_Nac_Mask5.Text;
               Datos.Menores.fieldbyname('Nombre2').asstring:=Nombre_Menor_Edit2.Text;
               Datos.Menores.fieldbyname('Apellido2').asstring:=Apellido_Menor_Edit2.Text;
               Datos.Menores.fieldbyname('Fecha_Nacimiento2').asstring:=Fecha_Nac_Mask6.Text;
               Datos.Menores.fieldbyname('Nombre3').asstring:=Nombre_Menor_Edit3.Text;
               Datos.Menores.fieldbyname('Apellido3').asstring:=Apellido_Menor_Edit3.Text;
               Datos.Menores.fieldbyname('Fecha_Nacimiento3').asstring:=Fecha_Nac_Mask7.Text;
               Datos.Menores.fieldbyname('Nombre4').asstring:=Nombre_Menor_Edit4.Text;
               Datos.Menores.fieldbyname('Apellido4').asstring:=Apellido_Menor_Edit4.Text;
               Datos.Menores.fieldbyname('Fecha_Nacimiento4').asstring:=Fecha_Nac_Mask8.Text;
               Datos.Menores.Post;
               Datos.Menores.FlushBuffers;
               Datos.Menores.Refresh;

               // Actualizaciones de las Transacciones
               Datos.Transacciones.Last;
               Datos.Transacciones.Edit;
               Datos.Transacciones.Append;
               Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit3.Text;
               Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
               Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
               Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
               Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
               Datos.Transacciones.Fieldbyname('Inscripcion').AsInteger:=StrToInt(Edit2.Text);
               If TarjetaBtn2.Checked = True Then
                 Datos.Transacciones.Fieldbyname('Deposito').AsInteger:=0
               else
                 Datos.Transacciones.Fieldbyname('Deposito').AsInteger:=StrToInt(NumEdit1.Text);
               Datos.Transacciones.Fieldbyname('Rebaja_Inscripcion').AsCurrency:=Monto_Descontado_Inscripcion;
               Datos.Transacciones.Fieldbyname('Autoriza_Inscripcion').AsString:=Autoriza_Inscripcion;
               Datos.Transacciones.Fieldbyname('Rebaja_Deposito').AsCurrency:=Monto_Descontado_Deposito;
               Datos.Transacciones.Fieldbyname('Autoriza_Deposito').AsString:=Autoriza_Deposito;
               Datos.Transacciones.Fieldbyname('Marca').AsString:='I';
               Datos.Transacciones.Post;


               // Actualización de la Base de Ingresos
               Datos.Inscripciones.Refresh;
               Datos.Inscripciones.Indexname:='';
               Datos.Inscripciones.Setkey;
               Datos.Inscripciones.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                 If Datos.Inscripciones.Gotokey = True then
                   Begin
                     Datos.Inscripciones.Edit;
                     Datos.Inscripciones.FieldByName('Cantidad').Asinteger:=Datos.Inscripciones.FieldByName('Cantidad').Asinteger+
                                                                     strtoint(Edit2.Text);
                     Datos.Inscripciones.Post;
                     Datos.Inscripciones.FlushBuffers;
                     Datos.Inscripciones.Refresh;
                   end
                 else
                   Begin
                     Datos.Inscripciones.Refresh;
                     Datos.Inscripciones.Last;
                     Datos.Inscripciones.Insert;
                     Datos.Inscripciones.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                     Datos.Inscripciones.FieldByName('Cantidad').Asstring:=Edit2.Text;;
                     Datos.Inscripciones.Post;
                     Datos.Inscripciones.FlushBuffers;
                     Datos.Inscripciones.Refresh;
                   end;
               Limpiar_Controles;
               MaskEdit3.Setfocus;
               Monto_Descontado_Inscripcion:=0;
               Monto_Descontado_Deposito:=0;
               Autoriza_Inscripcion:='';
               Autoriza_Deposito:='';
             end;
{***********************************************************************}
  except
       on falta_nombre do
          begin
            showmessage(' El nombre del nuevo cliente es inválido, '
            +' por favor Corrija');
          end;
       on mala_fecha do
          begin
            messagedlg('Por favor, corrija el siguiente problema: " '+
                       'Alguna de las fechas de nacimiento indicadas no '+
                       'son válidas. Todas las fechas introducidas deben '+
                       'ser de la forma: (dd/mm/aaaa)".',mterror,[mbok],0);
          end;
       on Fecha_es_Menor do
          begin
            messagedlg('Por favor, corrija el siguiente problema: " '+
                       'Alguna de las fechas de nacimiento indicadas son '+
                       'mayores que la fecha actual".',mterror,[mbok],0);
          end;
       on mal_deposito do
          begin
            messagedlg('El Valor del Depósito que ha introducido no es un '
            +'entero válido, por favor corrija para poder continuar.',mterror,[mbok],0);
          end;
       on falta_apellido do
          begin
            showmessage(' El Apellido del Cliente es Inválido, '
            +' por favor Corrija');
          end;
       on falta_cedula do
          begin
            showmessage(' La Cédula del Cliente es Inválida, '
            +' por favor Corrija');
          end;
       on Falta_Ciudad do
          begin
            showmessage(' Existe un error en la ciudad de residencia del cliente, '
            +' por favor Corrija');
          end;
       on Falta_Estado do
          begin
            showmessage(' Existe un error en el estado de residencia del cliente, '
            +' por favor Corrija');
          end;
       on Falta_Postal do
          begin
            showmessage(' Existe un error en la codigo postal del cliente, '
            +' por favor Corrija');
          end;
       on Falta_Numero_Cheque do
          begin
            showmessage(' Existe un error en el número del cheque del pago,'
            +' por favor Corrija');
          end;
       on Falta_Nombre_Banco do
          begin
            showmessage(' Existe un error en el nombre del banco emisor del cheque,'
            +' por favor Corrija');
          end;
       on Falta_Cantidad_Cheque do
          begin
            showmessage(' Existe un error en la cantidad del cheque,'
            +' por favor Corrija');
          end;
       on Mala_Fecha_Cheque do
          begin
            showmessage(' La Fecha de emisión del cheque no es válida dd/mm/aaaa,'
            +' por favor Corrija');
          end;
       on Falta_Nombre_Tarjeta do
          begin
            showmessage(' Existe un error en el nombre de la tarjeta de crédito,'
            +' por favor Corrija');
          end;
       on Falta_Numero_Tarjeta do
          begin
            showmessage(' Existe un error en el numero de la tarjeta de crédito,'
            +' por favor Corrija');
          end;
       on Mala_Fecha_Tarjeta do
          begin
            showmessage(' La Fecha de vencimiento de la tarjeta de crédito no es válida dd/mm/aaaa,'
            +' por favor Corrija');
          end;
       on Fecha_Menor_Tarjeta do
          begin
            showmessage(' La Tarjeta de Crédito ya ha expirado, la transacción no es posible.,'
            +' por favor Corrija');
          end;
//       on EdatabaseError do
//          Begin
//            Showmessage('Ha Ocurrido un ERROR grave con la Base de datos del sistema, '+
//                        'Por favor, contacte a Pedro Arrioja por el Teléfono: 016-796-13-06 '+
//                        'para una revisión inmediata y corrección del problema; para la '+
//                        'inmediata protección de los archivos, Vídeo Rental se Cerrará.');
//            
//            Application.Terminate;
//          end;
  end;
end;


procedure Tnuevo_cliente.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit1.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Edit3.setfocus;
    key:=#3;
  end;

end;

procedure Tnuevo_cliente.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit4.setfocus;
    key:=#3;
  end;

end;

procedure Tnuevo_cliente.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit2.setfocus;
    key:=#3;
  end;

end;

procedure Tnuevo_cliente.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit5.setfocus;
    key:=#3;
  end;

end;

procedure Tnuevo_cliente.MaskEdit5KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    If Edit2.Enabled = True then
       Begin
         Edit2.setfocus;
       end
    else
       Begin
         Ciudad_Edit.Setfocus;
       End;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Ciudad_edit.setfocus;
    key:=#3;
  end;
end;



procedure Tnuevo_cliente.FormShow(Sender: TObject);
begin
  Autoriza_Inscripcion:='';Autoriza_Deposito:='';
  Monto_Descontado_Inscripcion:=0;Monto_Descontado_Deposito:=0;
  PageControl1.ActivePage:=Hoja_1;
  PageControl3.ActivePage:=Adultos_Hoja;
  PageControl4.ActivePage:=Persona_1_Hoja;
  PageControl5.ActivePage:=Menor_1_Hoja;
  Nombre_Tarjeta_Edit.Enabled:=False;
  EfectivoBtn.Checked:=True;
  Alerta.Value:=5;
  MaskEdit3.Setfocus;
end;


procedure Tnuevo_cliente.Limpiar_Controles;
Begin
  MaskEdit3.Text:='';
  Edit1.Text:='';
  Edit3.Text:='';
  Maskedit1.text:='00.000.000';
  MaskEdit4.Text:='';
  MaskEdit2.Text:='';
  MaskEdit5.Text:='';
  CheckBox4.Checked:=False;
  DateEdit1.Text:='';
  CheckBox4.Enabled:=False;
  DateEdit1.Enabled:=False;
  edit2.text:=FloatToStr(Precio_de_Inscripcion);
  Numedit1.text:=FloatToStr(Precio_Deposito);
  Ciudad_Edit.Text:='';
  Estado_Edit.Text:='';
  Postal_Edit.Text:='';
  Profesion_Edit.Text:='';
  Memo1.Lines.Clear;
  RadioGroup1.Itemindex:=0;
  EfectivoBtn.Checked:=True;
  EfectivoBtn2.Checked:=True;
  Nombre_Adulto_Edit1.Text:='';
  Apellido_Adulto_Edit1.Text:='';
  Fecha_Nac_Mask1.Text:='';
  Parentesco_Adulto_Edit1.Text:='';
  Edad_Label1.Caption:='0';
  Nombre_Adulto_Edit2.Text:='';
  Apellido_Adulto_Edit2.Text:='';
  Fecha_Nac_Mask2.Text:='';
  Parentesco_Adulto_Edit2.Text:='';
  Edad_Label2.Caption:='0';
  Nombre_Adulto_Edit3.Text:='';
  Apellido_Adulto_Edit3.Text:='';
  Fecha_Nac_Mask3.Text:='';
  Parentesco_Adulto_Edit3.Text:='';
  Edad_Label3.Caption:='0';
  Nombre_Adulto_Edit4.Text:='';
  Apellido_Adulto_Edit4.Text:='';
  Fecha_Nac_Mask4.Text:='';
  Parentesco_Adulto_Edit4.Text:='';
  Edad_Label4.Caption:='0';
  Nombre_Menor_Edit1.Text:='';
  Apellido_Menor_Edit1.Text:='';
  Fecha_Nac_Mask5.Text:='';
  Edad_Label5.Caption:='0';
  Nombre_Menor_Edit2.Text:='';
  Apellido_Menor_Edit2.Text:='';
  Fecha_Nac_Mask6.Text:='';
  Edad_Label6.Caption:='0';
  Nombre_Menor_Edit3.Text:='';
  Apellido_Menor_Edit3.Text:='';
  Fecha_Nac_Mask7.Text:='';
  Edad_Label7.Caption:='0';
  Nombre_Menor_Edit4.Text:='';
  Apellido_Menor_Edit4.Text:='';
  Fecha_Nac_Mask8.Text:='';
  Edad_Label8.Caption:='0';
  Nombre_Empresa_Edit.Text:='';
  Telefono_Empresa_Mask.Text:='';
  Fax_Empresa_Mask.Text:='';
  Direccion_Empresa_Memo.Lines.Clear;
  CheckBox1.Checked:=False;
  CheckBox2.Checked:=False;
  CheckBox3.Checked:=False;
  Alerta.Value:=5;
  CurrencyEdit1.Value:=5000;
  PageControl1.ActivePage:=Hoja_1;
  PageControl3.ActivePage:=Adultos_Hoja;
  PageControl4.ActivePage:=Persona_1_Hoja;
  PageControl5.ActivePage:=Menor_1_Hoja;
  Nombre_Tarjeta_Edit.Enabled:=False;
  Calcular_Codigo;
  MaskEdit3.Setfocus;
end;

procedure Tnuevo_cliente.OtrasBtnClick(Sender: TObject);
begin
  Nombre_Tarjeta_Edit.Enabled:=True;
  Nombre_Tarjeta_Edit.Text:='';
end;

procedure Tnuevo_cliente.DinersBtnClick(Sender: TObject);
begin
  Nombre_Tarjeta_Edit.Enabled:=False;
  Nombre_Tarjeta_Edit.Text:=(Sender as TRadioButton95).Caption;
end;


procedure Tnuevo_cliente.Fecha_Nac_Mask1Exit(Sender: TObject);
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

procedure Tnuevo_cliente.Fecha_Nac_Mask2Exit(Sender: TObject);
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

procedure Tnuevo_cliente.Fecha_Nac_Mask3Exit(Sender: TObject);
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

procedure Tnuevo_cliente.Fecha_Nac_Mask4Exit(Sender: TObject);
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

procedure Tnuevo_cliente.Fecha_Nac_Mask5Exit(Sender: TObject);
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

procedure Tnuevo_cliente.Fecha_Nac_Mask6Exit(Sender: TObject);
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

procedure Tnuevo_cliente.Fecha_Nac_Mask7Exit(Sender: TObject);
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

procedure Tnuevo_cliente.Fecha_Nac_Mask8Exit(Sender: TObject);
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

procedure Tnuevo_cliente.ChequeBtnClick(Sender: TObject);
begin
  Numero_Cheque_Edit.Visible:=True;
  Nombre_Banco_Edit.Visible:=True;
  Cantidad_Cheque_Edit.Visible:=True;
  Fecha_Emision_Cheque_Mask.Visible:=True;
  Fecha_Emision_Cheque_Mask.Text:=Principal.Fecha_Total;
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
  Cantidad_Cheque_Edit.Text:=Edit2.Text;
  Numero_Cheque_Edit.setfocus;

end;


procedure Tnuevo_cliente.EfectivoBtnClick(Sender: TObject);
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

procedure Tnuevo_cliente.TarjetaBTnClick(Sender: TObject);
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
  Nombre_Tarjeta_Edit.Text:=VisaBtn.Caption;

  VisaBtn.setfocus;

end;

procedure Tnuevo_cliente.Ciudad_editKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    begin
      estado_edit.setfocus;
      key:=#3;
    end;
end;

procedure Tnuevo_cliente.Estado_editKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    begin
      Postal_edit.setfocus;
      key:=#3;
    end;
end;

procedure Tnuevo_cliente.Postal_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Profesion_edit.setfocus;
      key:=#3;
    end;
end;

procedure Tnuevo_cliente.Profesion_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
   Begin
     memo1.setfocus;
     key:=#3;
   end;
end;

procedure Tnuevo_cliente.Numero_Cheque_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Nombre_Banco_Edit.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Banco_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Emision_Cheque_Mask.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Tarjeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Numero_Tarjeta_Edit.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Numero_Tarjeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Vence_Tarjeta_Mask.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Empresa_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Telefono_Empresa_Mask.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Telefono_Empresa_MaskKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fax_Empresa_MAsk.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Fax_Empresa_MaskKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Direccion_Empresa_Memo.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Adulto_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit1.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Adulto_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask1.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Fecha_Nac_Mask1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit1.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Adulto_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Adulto_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Fecha_Nac_Mask2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Adulto_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit3.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Adulto_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask3.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Fecha_Nac_Mask3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit3.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Fecha_Nac_Mask4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit4.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Adulto_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask4.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Adulto_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit4.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Menor_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit1.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Menor_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Menor_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit3.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Menor_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit4.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Menor_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask5.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Menor_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask6.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Menor_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask7.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Apellido_Menor_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask8.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.DescuentoBtnClick(Sender: TObject);
begin
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Autorizacion:=TAutorizacion.Create(Self);
      Autorizacion.Showmodal;
      If Autorizacion.Modalresult = MrOK then
         Begin
           If Datos.TablaAccesos.Fieldbyname('60').AsBoolean = True Then
             Begin
               Autoriza_Inscripcion:=Datos.TablaUsuarios.Fieldbyname('Cedula').AsString;
               Edit2.Enabled:=True;
               Edit2.Setfocus;
             end
           else
             Begin
               messagedlg('Usted no está autorizado para hacer descuentos '
               +'de inscripciones; contacte con algún supervisor o chequee '
               +'sus privilegios de acceso en el sistema....',mterror,[mbok],0);
               Edit2.Enabled:=False;
               Edit1.Setfocus;
             end;
         end;
    end
  Finally
    Begin
      Autorizacion.Free;
      Autorizacion:=Nil;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure Tnuevo_cliente.Edit2Exit(Sender: TObject);
begin
  Monto_Descontado_Inscripcion:=Precio_de_Inscripcion-StrToFloat(Edit2.text);
  If Monto_Descontado_Inscripcion = 0 Then Autoriza_Inscripcion:='' else
    If Monto_Descontado_Inscripcion < 0 Then
      Begin
        Monto_Descontado_Inscripcion:=0;
        Edit2.Text:=FloatToStr(Precio_de_Inscripcion);
        Autoriza_Inscripcion:='';
      end;
  Edit2.Enabled:=False;
end;

procedure Tnuevo_cliente.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePage = Hoja_2 then
     Begin
       Cantidad_Cheque_Edit.Text:=Edit2.Text;
     end;
end;

procedure Tnuevo_cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #27 then
  begin
    Key:=#3;
  end;
end;

procedure Tnuevo_cliente.MaskEdit3Change(Sender: TObject);
begin
  Barras.Text:=MaskEdit3.Text;
end;

procedure Tnuevo_cliente.BitBtn1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Autorizacion:=TAutorizacion.Create(Self);
      Autorizacion.Showmodal;
      If Autorizacion.Modalresult = MrOK then
         Begin
           If Datos.TablaAccesos.Fieldbyname('61').AsBoolean = True Then
             Begin
               Autoriza_Deposito:=Datos.TablaUsuarios.Fieldbyname('Cedula').AsString;
               NumEdit1.Enabled:=True;
               NumEdit1.SetFocus;
             end
           else
             Begin
               messagedlg('Usted no está autorizado para hacer descuentos '
               +'de Depósitos; contacte con algún supervisor o chequee '
               +'sus privilegios de acceso en el sistema....',mterror,[mbok],0);
               Edit2.Enabled:=False;
               Edit1.Setfocus;
             end;
         end;
    end
  Finally
    Begin
      Autorizacion.Free;
      Autorizacion:=Nil;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure Tnuevo_cliente.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Edit1.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.EfectivoBtn2Click(Sender: TObject);
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

procedure Tnuevo_cliente.ChequeBtn2Click(Sender: TObject);
begin
  Numero_Cheque_Edit2.Visible:=True;
  Nombre_Banco_Edit2.Visible:=True;
  Cantidad_Cheque_Edit2.Visible:=True;
  Fecha_Emision_Cheque_Mask2.Visible:=True;
  Fecha_Emision_Cheque_Mask2.Text:=Principal.Fecha_Total;
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
  Numero_Cheque_Edit2.setfocus;
end;

procedure Tnuevo_cliente.TarjetaBTn2Click(Sender: TObject);
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

  VisaBtn2.setfocus;
end;

procedure Tnuevo_cliente.Numero_Cheque_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Nombre_Banco_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Nombre_Banco_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Emision_Cheque_Mask2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.VisaBtn2Click(Sender: TObject);
begin
  Nombre_Tarjeta_Edit2.Enabled:=False;
  Nombre_Tarjeta_Edit2.Text:=(Sender as TRadioButton95).Caption;
end;

procedure Tnuevo_cliente.Nombre_Tarjeta_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Numero_Tarjeta_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.Numero_Tarjeta_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Vence_Tarjeta_Mask2.setfocus;
    key:=#3;
  end;
end;

procedure Tnuevo_cliente.NumEdit1Exit(Sender: TObject);
begin
  Monto_Descontado_Deposito:=Precio_Deposito-StrToInt(Numedit1.text);
  If Monto_Descontado_Deposito = 0 Then Autoriza_Deposito:='' else
    If Monto_Descontado_Deposito < 0 Then
      Begin
        Monto_Descontado_Deposito:=0;
        Numedit1.text:=FloatToStr(Precio_Deposito);
        Autoriza_Deposito:='';
      end;
  NumEdit1.Enabled:=False;
end;

procedure Tnuevo_cliente.CheckBox1Click(Sender: TObject);
begin
  If CheckBox1.Checked = False Then
    Begin
      Checkbox4.Enabled:=False;
      CheckBox4.Checked:=False;
      DateEdit1.Text:='';
      DateEdit1.Enabled:=False;
    end
  else
    Begin
      Checkbox4.Enabled:=True;
      DateEdit1.Text:='';
    end;
end;

procedure Tnuevo_cliente.CheckBox4Click(Sender: TObject);
begin
  If CheckBox4.Checked = True Then
    DateEdit1.Enabled:=True
  else
    Begin
      DateEdit1.Text:='';
      DateEdit1.Enabled:=False;
    end;
end;

end.
