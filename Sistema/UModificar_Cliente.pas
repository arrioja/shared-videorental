unit UModificar_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, ComCtrls,
  Numedit, addbtn95, Spin, ToolEdit, CurrEdit, Barcd4;

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

  TModificar_Cliente = class(TForm)
    OKBtn: TBitBtn;
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
    Nombre_Empresa_Edit: TEdit;
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
    DescuentoBtn: TBitBtn;
    CheckBox4: TCheckBox;
    DateEdit1: TDateEdit;
    Bevel1: TBevel;
    procedure CancelarBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure Fecha_Nac_Mask1Exit(Sender: TObject);
    procedure Fecha_Nac_Mask2Exit(Sender: TObject);
    procedure Fecha_Nac_Mask3Exit(Sender: TObject);
    Procedure Habilitar_Todo;
    Procedure DesHabilitar_Todo;    
    procedure Fecha_Nac_Mask4Exit(Sender: TObject);
    procedure Fecha_Nac_Mask5Exit(Sender: TObject);
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
    Procedure Limpiar_Todo;
    procedure Nombre_Adulto_Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Nombre_Menor_Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Apellido_Menor_Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure TarjetaBTn2Click(Sender: TObject);
    procedure EfectivoBtn2Click(Sender: TObject);
    procedure ChequeBtn2Click(Sender: TObject);
    procedure DescuentoBtnClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  Modificar_Cliente: TModificar_Cliente;
  no_hay_nombre:boolean;
  codigo:integer;
  cedula:integer;
  Pagado:integer;
  nombre:string;
  direccion:string;
  deposito:integer;
  fecha:string;


  implementation

uses uprincipal, UPedir_Clave, uconfirmar, Ulista_clientes,
  UHistorial_Videos, ualquilar_y_devolver, MODULO_DE_DATOS, UAutorizacion;

{$R *.DFM}

procedure TModificar_Cliente.CancelarBtnClick(Sender: TObject);
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


procedure TModificar_Cliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Desde_Principal = True then
    Begin
      Principal.enabled:=true;
    end
  else
    Begin
     If Ultima_Cliente = 'Lista_Clientes' then
       Begin
         Lista_Clientes.Enabled:=True;
       end;
      If Ultima_Cliente = 'Alquilar y Devolver' then
        Begin
          Alquilar_y_Devolver.Enabled:=True;
        end;
    end;
end;

procedure TModificar_Cliente.MaskEdit1Exit(Sender: TObject);
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

procedure TModificar_Cliente.OKBtnClick(Sender: TObject);
var
  bien      :boolean;
  cont      :integer;
  hay_chars :boolean;
  Cedula_Igual:Boolean;
  Copia_de_Cedula:string;
begin
{***********Comprobación Inicial de los Datos Introducidos***************}
 try
   Copia_de_Cedula:=MaskEdit1.Text;
   Cedula_Igual:=True;

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

   If Copia_de_Cedula <> MaskEdit1.Text then
      Cedula_Igual:=False;

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

        Datos.Clientes.indexname:='';
        Datos.Clientes.indexname:='cedula_indice';
        Datos.Clientes.setkey;
        Datos.Clientes.fieldbyname('cedula_Cliente').asstring:=Maskedit1.text;
        bien:=true;
        if ((Datos.Clientes.gotokey = true) and (Cedula_Igual = False)) then
             begin
               bien:=false;
               messagedlg('El número de Cédula que ha introducido '
               +'ya se encuentra en nuestros registros, debe introducir '
               +'un número que no se encuentre registrado.',mterror,[mbok],0);
             end;
        if (bien = true) then
             begin
                     //Actualización de la Base Usuarios
               Datos.Clientes.Edit;
               Datos.Clientes.fieldbyname('Cedula_Cliente').asstring:=maskedit1.text;
               Datos.Clientes.fieldbyname('Nombres_Cliente').asstring:=Edit1.text;
               Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring:=Edit3.text;
//               Datos.Clientes.fieldbyname('Deposito_Cliente').asstring:=Edit2.text;
               If Radiogroup1.itemindex = 0 then
                  Datos.Clientes.fieldbyname('Sexo_Cliente').asboolean:=False;
               If Radiogroup1.itemindex = 1 then
                  Datos.Clientes.fieldbyname('Sexo_Cliente').asboolean:=True;
               Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asstring:=Maskedit4.text;
               Datos.Clientes.fieldbyname('Telefono_1_Cliente').asstring:=Maskedit2.text;
               Datos.Clientes.fieldbyname('Telefono_2_Cliente').asstring:=Maskedit5.text;
               Datos.Clientes.fieldbyname('Ciudad_Cliente').asstring:=Ciudad_Edit.Text;
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

               //Actualización de la Base Pago_Por_Cheque
               If ChequeBtn.Checked = True then
                  BEgin
                    Datos.Cheques.IndexName:='Codigo_Tipo_Index';
                    Datos.Cheques.Setkey;
                    Datos.Cheques.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit3.Text;
                    Datos.Cheques.Fieldbyname('Tipo').AsString:='I';
                    If Datos.Cheques.GotoKey = True Then
                      Begin
                        Datos.Cheques.Edit;
                        Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                        Datos.Cheques.fieldbyname('Numero_Cheque').asstring:=Numero_Cheque_Edit.Text;
                        Datos.Cheques.fieldbyname('Nombre_Banco').asstring:=Nombre_Banco_Edit.Text;
                        Datos.Cheques.Fieldbyname('Tipo').AsString:='I';
                        Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring:=Cantidad_cheque_Edit.Text;
                        Datos.Cheques.fieldbyname('Fecha_Emision').asstring:=Fecha_Emision_Cheque_Mask.Text;
                        Datos.Cheques.Post;
                        Datos.Cheques.FlushBuffers;
                      end
                    else
                      Begin
                        Datos.Cheques.Last;
                        Datos.Cheques.Append;
                        Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                        Datos.Cheques.fieldbyname('Numero_Cheque').asstring:=Numero_Cheque_Edit.Text;
                        Datos.Cheques.fieldbyname('Nombre_Banco').asstring:=Nombre_Banco_Edit.Text;
                        Datos.Cheques.Fieldbyname('Tipo').AsString:='I';
                        Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring:=Cantidad_cheque_Edit.Text;
                        Datos.Cheques.fieldbyname('Fecha_Emision').asstring:=Fecha_Emision_Cheque_Mask.Text;
                        Datos.Cheques.Post;
                        Datos.Cheques.FlushBuffers;
                      end;
                  end;

               If ChequeBtn2.Checked = True then
                  BEgin
                    Datos.Cheques.IndexName:='Codigo_Tipo_Index';
                    Datos.Cheques.Setkey;
                    Datos.Cheques.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit3.Text;
                    Datos.Cheques.Fieldbyname('Tipo').AsString:='D';
                    If Datos.Cheques.GotoKey = True Then
                      Begin
                        Datos.Cheques.Edit;
                        Datos.Cheques.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                        Datos.Cheques.fieldbyname('Tipo').asstring:='D';
                        Datos.Cheques.fieldbyname('Numero_Cheque').asstring:=Numero_Cheque_Edit2.Text;
                        Datos.Cheques.fieldbyname('Nombre_Banco').asstring:=Nombre_Banco_Edit2.Text;
                        Datos.Cheques.fieldbyname('Cantidad_Cheque').asstring:=Cantidad_cheque_Edit2.Text;
                        Datos.Cheques.fieldbyname('Fecha_Emision').asstring:=Fecha_Emision_Cheque_Mask2.Text;
                        Datos.Cheques.Post;
                        Datos.Cheques.FlushBuffers;
                        Datos.Cheques.Refresh;
                      end
                    else
                      Begin
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
                  end;


               //Actualización de la Base Pago_Por_Tarjeta
               If TarjetaBtn.Checked = True then
                  BEgin
                    Datos.Tarjetas.IndexName:='Codigo_Tipo_Index';
                    Datos.Tarjetas.Setkey;
                    Datos.Tarjetas.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit3.Text;
                    Datos.Tarjetas.Fieldbyname('Tipo').AsString:='I';
                    IF Datos.Tarjetas.Gotokey = True Then
                      Begin
                        Datos.Tarjetas.Edit;
                        Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                        Datos.Tarjetas.fieldbyname('Visa').asboolean:=VisaBtn.Checked;
                        Datos.Tarjetas.Fieldbyname('Tipo').AsString:='I';
                        Datos.Tarjetas.fieldbyname('Master').asboolean:=MCBtn.Checked;
                        Datos.Tarjetas.fieldbyname('American').asboolean:=AmericanBtn.Checked;
                        Datos.Tarjetas.fieldbyname('Diners').asboolean:=DinersBtn.Checked;
                        Datos.Tarjetas.fieldbyname('Otras').asboolean:=OtrasBtn.Checked;
                        Datos.Tarjetas.fieldbyname('Nombre_Otra').asstring:=Nombre_Tarjeta_Edit.Text;
                        Datos.Tarjetas.fieldbyname('Numero_Tarjeta').asstring:=Numero_Tarjeta_Edit.Text;
                        Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring:=Fecha_Vence_Tarjeta_Mask.Text;
                        Datos.Tarjetas.Post;
                        Datos.Tarjetas.FlushBuffers;
                      end
                    else
                      Begin
                        Datos.Tarjetas.Last;
                        Datos.Tarjetas.Insert;
                        Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=maskedit3.text;
                        Datos.Tarjetas.fieldbyname('Visa').asboolean:=VisaBtn.Checked;
                        Datos.Tarjetas.fieldbyname('Master').asboolean:=MCBtn.Checked;
                        Datos.Tarjetas.Fieldbyname('Tipo').AsString:='I';
                        Datos.Tarjetas.fieldbyname('American').asboolean:=AmericanBtn.Checked;
                        Datos.Tarjetas.fieldbyname('Diners').asboolean:=DinersBtn.Checked;
                        Datos.Tarjetas.fieldbyname('Otras').asboolean:=OtrasBtn.Checked;
                        Datos.Tarjetas.fieldbyname('Nombre_Otra').asstring:=Nombre_Tarjeta_Edit.Text;
                        Datos.Tarjetas.fieldbyname('Numero_Tarjeta').asstring:=Numero_Tarjeta_Edit.Text;
                        Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring:=Fecha_Vence_Tarjeta_Mask.Text;
                        Datos.Tarjetas.Post;
                        Datos.Tarjetas.FlushBuffers;
                      end;
                  end;

               If TarjetaBtn2.Checked = True then
                  BEgin
                    Datos.Tarjetas.IndexName:='Codigo_Tipo_Index';
                    Datos.Tarjetas.Setkey;
                    Datos.Tarjetas.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit3.Text;
                    Datos.Tarjetas.Fieldbyname('Tipo').AsString:='D';
                    IF Datos.Tarjetas.Gotokey = True Then
                      Begin
                        Datos.Tarjetas.Edit;
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
                      end
                    else
                      Begin
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
                  end;

               //Actualización de la base Autorizados
               Datos.Mayores.Edit;
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

               //Actualización de la base Menores.
               Datos.Menores.Edit;
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

               Showmessage('Los datos del cliente han sido modificados, haga click en el botón '+
                           'de abajo para volver a la pantalla principal del programa '+
                           'o presione la tecla Enter.');
               Close;
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
//                      'Por favor, contacte a Pedro Arrioja por el Teléfono: 016-796-13-06 '+
//                        'para una revisión inmediata y corrección del problema; para la '+
//                        'inmediata protección de los archivos, Vídeo Rental se Cerrará.');
//            Application.Terminate;
//          end;
  end;
end;


procedure TModificar_Cliente.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit1.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Edit3.setfocus;
    key:=#3;
  end;

end;


Procedure TModificar_Cliente.Habilitar_Todo;
Begin
  Edit1.Enabled:=True;
  Edit3.Enabled:=True;
  MaskEdit1.Enabled:=True;
  MaskEdit4.Enabled:=True;
  MaskEdit2.Enabled:=True;
  MaskEdit5.Enabled:=True;
  Memo1.Enabled:=True;
  Ciudad_Edit.Enabled:=True;
  Estado_Edit.Enabled:=True;
  Postal_Edit.Enabled:=True;
  Profesion_Edit.Enabled:=True;
  Nombre_Empresa_Edit.Enabled:=True;
  Telefono_Empresa_Mask.Enabled:=True;
  Fax_Empresa_Mask.Enabled:=True;
  Direccion_Empresa_Memo.Enabled:=True;
  Radiogroup1.Enabled:=True;
  EfectivoBtn.Enabled:=True;
  ChequeBtn.Enabled:=True;
  TarjetaBtn.Enabled:=True;
  VisaBtn.Enabled:=True;
  MCBtn.Enabled:=True;
  AmericanBtn.Enabled:=True;
  DinersBtn.Enabled:=True;
  OtrasBtn.Enabled:=True;
  Nombre_Tarjeta_Edit.Enabled:=True;
  Fecha_Vence_Tarjeta_Mask.Enabled:=True;
  Numero_Cheque_Edit.Enabled:=True;
  Nombre_Banco_Edit.Enabled:=True;
  Fecha_Emision_Cheque_Mask.Enabled:=True;
  Numero_Tarjeta_Edit.Enabled:=True;
  Nombre_Adulto_Edit1.Enabled:=True;
  Nombre_Adulto_Edit2.Enabled:=True;
  Nombre_Adulto_Edit3.Enabled:=True;
  Nombre_Adulto_Edit4.Enabled:=True;
  Apellido_Adulto_Edit1.Enabled:=True;
  Apellido_Adulto_Edit2.Enabled:=True;
  Apellido_Adulto_Edit3.Enabled:=True;
  Apellido_Adulto_Edit4.Enabled:=True;
  Fecha_Nac_Mask1.Enabled:=True;
  Fecha_Nac_Mask2.Enabled:=True;
  Fecha_Nac_Mask3.Enabled:=True;
  Fecha_Nac_Mask4.Enabled:=True;
  Parentesco_Adulto_Edit1.Enabled:=True;
  Parentesco_Adulto_Edit2.Enabled:=True;
  Parentesco_Adulto_Edit3.Enabled:=True;
  Parentesco_Adulto_Edit4.Enabled:=True;
  Nombre_Menor_Edit1.Enabled:=True;
  Nombre_Menor_Edit2.Enabled:=True;
  Nombre_Menor_Edit3.Enabled:=True;
  Nombre_Menor_Edit4.Enabled:=True;
  Apellido_Menor_Edit1.Enabled:=True;
  Apellido_Menor_Edit2.Enabled:=True;
  Apellido_Menor_Edit3.Enabled:=True;
  Apellido_Menor_Edit4.Enabled:=True;
  Fecha_Nac_Mask5.Enabled:=True;
  Fecha_Nac_Mask6.Enabled:=True;
  Fecha_Nac_Mask7.Enabled:=True;
  Fecha_Nac_Mask8.Enabled:=True;
  OKBtn.Enabled:=True;
end;


Procedure TModificar_Cliente.DesHabilitar_Todo;
Begin
  Edit1.Enabled:=False;
  Edit3.Enabled:=False;
  MaskEdit1.Enabled:=False;
  MaskEdit4.Enabled:=False;
  MaskEdit2.Enabled:=False;
  MaskEdit5.Enabled:=False;
  Memo1.Enabled:=False;
  Ciudad_Edit.Enabled:=False;
  Estado_Edit.Enabled:=False;
  Postal_Edit.Enabled:=False;
  Profesion_Edit.Enabled:=False;
  Nombre_Empresa_Edit.Enabled:=False;
  Telefono_Empresa_Mask.Enabled:=False;
  Fax_Empresa_Mask.Enabled:=False;
  Direccion_Empresa_Memo.Enabled:=False;
  Radiogroup1.Enabled:=False;
  EfectivoBtn.Enabled:=False;
  ChequeBtn.Enabled:=False;
  TarjetaBtn.Enabled:=False;
  VisaBtn.Enabled:=False;
  MCBtn.Enabled:=False;
  AmericanBtn.Enabled:=False;
  DinersBtn.Enabled:=False;
  OtrasBtn.Enabled:=False;
  Nombre_Tarjeta_Edit.Enabled:=False;
  Fecha_Vence_Tarjeta_Mask.Enabled:=False;
  Numero_Tarjeta_Edit.Enabled:=False;
  Numero_Cheque_Edit.Enabled:=False;
  Nombre_Banco_Edit.Enabled:=False;
  Fecha_Emision_Cheque_Mask.Enabled:=False;
  Nombre_Adulto_Edit1.Enabled:=False;
  Nombre_Adulto_Edit2.Enabled:=False;
  Nombre_Adulto_Edit3.Enabled:=False;
  Nombre_Adulto_Edit4.Enabled:=False;
  Apellido_Adulto_Edit1.Enabled:=False;
  Apellido_Adulto_Edit2.Enabled:=False;
  Apellido_Adulto_Edit3.Enabled:=False;
  Apellido_Adulto_Edit4.Enabled:=False;
  Fecha_Nac_Mask1.Enabled:=False;
  Fecha_Nac_Mask2.Enabled:=False;
  Fecha_Nac_Mask3.Enabled:=False;
  Fecha_Nac_Mask4.Enabled:=False;
  Parentesco_Adulto_Edit1.Enabled:=False;
  Parentesco_Adulto_Edit2.Enabled:=False;
  Parentesco_Adulto_Edit3.Enabled:=False;
  Parentesco_Adulto_Edit4.Enabled:=False;
  Nombre_Menor_Edit1.Enabled:=False;
  Nombre_Menor_Edit2.Enabled:=False;
  Nombre_Menor_Edit3.Enabled:=False;
  Nombre_Menor_Edit4.Enabled:=False;
  Apellido_Menor_Edit1.Enabled:=False;
  Apellido_Menor_Edit2.Enabled:=False;
  Apellido_Menor_Edit3.Enabled:=False;
  Apellido_Menor_Edit4.Enabled:=False;
  Fecha_Nac_Mask5.Enabled:=False;
  Fecha_Nac_Mask6.Enabled:=False;
  Fecha_Nac_Mask7.Enabled:=False;
  Fecha_Nac_Mask8.Enabled:=False;
  OKBtn.Enabled:=False;
end;


Procedure TModificar_Cliente.Limpiar_Todo;
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
  Postal_Edit.text:='';
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






procedure TModificar_Cliente.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit4.setfocus;
    key:=#3;
  end;

end;

procedure TModificar_Cliente.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit2.setfocus;
    key:=#3;
  end;

end;

procedure TModificar_Cliente.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit5.setfocus;
    key:=#3;
  end;

end;

procedure TModificar_Cliente.MaskEdit5KeyPress(Sender: TObject; var Key: Char);
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

procedure TModificar_Cliente.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Ciudad_edit.setfocus;
    key:=#3;
  end;
end;



procedure TModificar_Cliente.FormShow(Sender: TObject);
begin
  If Desde_principal = True then
    Begin
      MaskEdit3.Text:='';
      Pagado:=0;      
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
      Nombre_Empresa_Edit.Text:='';
      Telefono_Empresa_Mask.Text:='';
      Fax_Empresa_Mask.Text:='';
      Direccion_Empresa_Memo.Lines.Clear;
      Nombre_Adulto_Edit1.Text:='';
      Nombre_Adulto_Edit2.Text:='';
      Nombre_Adulto_Edit3.Text:='';
      Nombre_Adulto_Edit4.Text:='';
      Apellido_Adulto_Edit1.Text:='';
      Apellido_Adulto_Edit2.Text:='';
      Apellido_Adulto_Edit3.Text:='';
      Apellido_Adulto_Edit4.Text:='';
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



      PageControl1.ActivePage:=Hoja_1;
      PageControl3.ActivePage:=Adultos_Hoja;
      PageControl4.ActivePage:=Persona_1_Hoja;
      PageControl5.ActivePage:=Menor_1_Hoja;
      Nombre_Tarjeta_Edit.Enabled:=False;
      Ciudad_Edit.Text:='';
      Estado_Edit.Text:='';
      Postal_Edit.Text:='';
      Profesion_Edit.Text:='';
      Fecha_Nac_Mask1.Text:='';
      Fecha_Nac_Mask2.Text:='';
      Fecha_Nac_Mask3.Text:='';
      Fecha_Nac_Mask4.Text:='';
      Fecha_Nac_Mask5.Text:='';
      Fecha_Nac_Mask6.Text:='';
      Fecha_Nac_Mask7.Text:='';
      Fecha_Nac_Mask8.Text:='';
      Edad_Label1.Caption:='0';
      Edad_Label2.Caption:='0';
      Edad_Label3.Caption:='0';
      Edad_Label4.Caption:='0';
      Edad_Label5.Caption:='0';
      Edad_Label6.Caption:='0';
      Edad_Label7.Caption:='0';
      Edad_Label8.Caption:='0';

      EfectivoBtn.Checked:=True;
      Deshabilitar_Todo;
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
         Habilitar_Todo;
         //Se ponen todos los datos en sus respectivas casillas:
         Edit1.text:=Datos.Clientes.fieldbyname('Nombres_Cliente').asstring;
         Edit3.text:=Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring;
         MaskEdit1.text:=Datos.Clientes.fieldbyname('Cedula_Cliente').asstring;
         MaskEdit4.text:=Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asstring;
         MaskEdit2.text:=Datos.Clientes.fieldbyname('Telefono_1_Cliente').asstring;
         MaskEdit5.text:=Datos.Clientes.fieldbyname('Telefono_2_Cliente').asstring;
         Edit2.text:=Datos.Clientes.fieldbyname('Deposito_Cliente').asstring;
         Pagado:=Strtoint(Edit2.Text);
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
         Edit1.Setfocus;
       end;
    end;
end;

procedure TModificar_Cliente.OtrasBtnClick(Sender: TObject);
begin
  Nombre_Tarjeta_Edit.Enabled:=True;
  Nombre_Tarjeta_Edit.Text:='';
end;

procedure TModificar_Cliente.DinersBtnClick(Sender: TObject);
begin
  Nombre_Tarjeta_Edit.Enabled:=False;
  Nombre_Tarjeta_Edit.Text:=(Sender as TRadioButton95).Caption;
end;


procedure TModificar_Cliente.Fecha_Nac_Mask1Exit(Sender: TObject);
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

procedure TModificar_Cliente.Fecha_Nac_Mask2Exit(Sender: TObject);
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

procedure TModificar_Cliente.Fecha_Nac_Mask3Exit(Sender: TObject);
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

procedure TModificar_Cliente.Fecha_Nac_Mask4Exit(Sender: TObject);
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

procedure TModificar_Cliente.Fecha_Nac_Mask5Exit(Sender: TObject);
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

procedure TModificar_Cliente.Fecha_Nac_Mask6Exit(Sender: TObject);
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

procedure TModificar_Cliente.Fecha_Nac_Mask7Exit(Sender: TObject);
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

procedure TModificar_Cliente.Fecha_Nac_Mask8Exit(Sender: TObject);
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

procedure TModificar_Cliente.ChequeBtnClick(Sender: TObject);
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
  Numero_Cheque_Edit.Enabled:=True;
end;


procedure TModificar_Cliente.EfectivoBtnClick(Sender: TObject);
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

procedure TModificar_Cliente.TarjetaBTnClick(Sender: TObject);
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

procedure TModificar_Cliente.Ciudad_editKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    begin
      estado_edit.setfocus;
      key:=#3;
    end;
end;

procedure TModificar_Cliente.Estado_editKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    begin
      Postal_edit.setfocus;
      key:=#3;
    end;
end;

procedure TModificar_Cliente.Postal_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      Profesion_edit.setfocus;
      key:=#3;
    end;
end;

procedure TModificar_Cliente.Profesion_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
   Begin
     memo1.setfocus;
     key:=#3;
   end;
end;

procedure TModificar_Cliente.Numero_Cheque_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Nombre_Banco_Edit.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Banco_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Emision_Cheque_Mask.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Tarjeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Numero_Tarjeta_Edit.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Numero_Tarjeta_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Vence_Tarjeta_Mask.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Empresa_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Telefono_Empresa_Mask.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Telefono_Empresa_MaskKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fax_Empresa_MAsk.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Fax_Empresa_MaskKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Direccion_Empresa_Memo.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Adulto_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit1.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Adulto_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask1.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Fecha_Nac_Mask1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit1.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Adulto_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Adulto_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask2.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Fecha_Nac_Mask2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Adulto_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit3.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Adulto_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask3.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Fecha_Nac_Mask3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit3.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Fecha_Nac_Mask4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Parentesco_Adulto_Edit4.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Adulto_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask4.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Adulto_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Adulto_Edit4.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Menor_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit1.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Menor_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit2.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Menor_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit3.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Nombre_Menor_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Apellido_Menor_Edit4.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Menor_Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask5.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Menor_Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask6.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Menor_Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask7.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Apellido_Menor_Edit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Fecha_Nac_Mask8.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_Cliente.Edit2Exit(Sender: TObject);
begin
  Edit2.Enabled:=False;
end;

procedure TModificar_Cliente.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePage = Hoja_2 then
     Begin
       Cantidad_Cheque_Edit.Text:=Edit2.Text;
     end;
end;

procedure TModificar_Cliente.MaskEdit3KeyPress(Sender: TObject;
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
         Habilitar_Todo;
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
         If Datos.Clientes.Fieldbyname('Free_Hasta').AsString = '' Then
           Begin
             CheckBox4.Enabled:=False;
             CheckBox4.Checked:=False;
             DateEdit1.Text:='';
             DateEdit1.Enabled:=False;
           end
         else
           Begin
             CheckBox4.Checked:=True;
             CheckBox4.Enabled:=False;
             DateEdit1.Text:=Datos.Clientes.Fieldbyname('Free_Hasta').AsString;
             DateEdit1.Enabled:=False;
           end;
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

procedure TModificar_Cliente.TarjetaBTn2Click(Sender: TObject);
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

procedure TModificar_Cliente.EfectivoBtn2Click(Sender: TObject);
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

procedure TModificar_Cliente.ChequeBtn2Click(Sender: TObject);
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

procedure TModificar_Cliente.DescuentoBtnClick(Sender: TObject);
begin
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Autorizacion:=TAutorizacion.Create(Self);
      Autorizacion.Showmodal;
      If Autorizacion.Modalresult = MrOK then
         Begin
           If Datos.TablaAccesos.Fieldbyname('68').AsBoolean = True Then
             Begin
               CheckBox1.Enabled:=True;
               CheckBox2.Enabled:=True;
               CheckBox3.Enabled:=True;
//               CheckBox4.Enabled:=True;
               If DateEdit1.Text <> '  /  /    ' Then
                 Begin
                   DateEdit1.Enabled:=True;
                   CheckBox4.Enabled:=True;
                 end
               else
                 Begin
                   DateEdit1.Enabled:=False;
                   CheckBox4.Enabled:=False;
                 end;
               CurrencyEdit1.Enabled:=True;
               Alerta.Enabled:=True;
               CheckBox1.Setfocus;
             end
           else
             Begin
               messagedlg('Usted no está autorizado para modificar '
               +'las excepciones de alquiler o de multa para los clientes '
               +'consulte con su supervisor o consulte el manual de Vídeo Rental.',mterror,[mbok],0);
               CheckBox1.Enabled:=False;
               CheckBox2.Enabled:=False;
               CheckBox3.Enabled:=False;
               If DateEdit1.Text <> '  /  /    ' Then
                 Begin
                   DateEdit1.Enabled:=True;
                   CheckBox4.Enabled:=True;
                 end
               else
                 Begin
                   DateEdit1.Enabled:=False;
                   CheckBox4.Enabled:=False;
                 end;
               CurrencyEdit1.Enabled:=False;
               Alerta.Enabled:=False;
               DescuentoBtn.Setfocus;
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

procedure TModificar_Cliente.CheckBox1Click(Sender: TObject);
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

procedure TModificar_Cliente.CheckBox4Click(Sender: TObject);
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
