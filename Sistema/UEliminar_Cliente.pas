unit UEliminar_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, ComCtrls,
  Numedit, addbtn95, Barcd4, Menus;

type
  Tiene_Videos = Class(Exception);


  TEliminar_Cliente = class(TForm)
    EliminarBtn: TBitBtn;
    CancelarBtn: TBitBtn;
    Bevel2: TBevel;
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
    PopupMenu1: TPopupMenu;
    procedure CancelarBtnClick(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure EliminarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure Limpiar_Todo;
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  Eliminar_Cliente: TEliminar_Cliente;
  no_hay_nombre:boolean;
  codigo:integer;
  cedula:integer;
  nombre:string;
  direccion:string;
  deposito:integer;
  fecha:string;


  implementation

uses uprincipal, UPedir_Clave, uconfirmar, MODULO_DE_DATOS;

{$R *.DFM}
Function Nombre_Computador : String; Far; External 'Control.dll';


procedure TEliminar_Cliente.CancelarBtnClick(Sender: TObject);
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


procedure TEliminar_Cliente.MaskEdit1Exit(Sender: TObject);
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

procedure TEliminar_Cliente.EliminarBtnClick(Sender: TObject);
begin
 try
   Begin
     Try
       Begin
         Confirmar:=TConfirmar.Create(Self);
         Confirmar.Bitbtn1.Hint:='Eliminar Cliente';
         Confirmar.Bitbtn2.Hint:='Cancelar la Eliminción';
         Confirmar.Label1.caption:='Eliminar Cliente ?.';
         Confirmar.Caption:='C o n f i r m a r .';
         Confirmar.showmodal;
         if Confirmar.modalresult = mrok then
           begin
             EliminarBtn.Enabled:=False;
             CancelarBtn.Enabled:=False;
             Datos.Clientes.Refresh;
             Datos.Clientes.First;
             Datos.Clientes.indexname:='';
             Datos.Clientes.Setkey;
             Datos.Clientes.Fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
             Datos.Clientes.Gotokey;
             If Datos.Clientes.Fieldbyname('Tiene_Pelicula').asboolean = False then
               Begin
                 If Datos.Clientes.Fieldbyname('Forma_de_Pago').AsString = 'CH' then
                   Begin
                     Datos.Cheques.Refresh;
                     Datos.Cheques.First;
                     Datos.Cheques.indexname:='Codigo_Tipo_Index';
                     Datos.Cheques.Setkey;
                     Datos.Cheques.Fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
                     Datos.Cheques.Fieldbyname('Tipo').asstring:='I';
                     Datos.Cheques.Gotokey;
                     Datos.Cheques.Delete;
                     Datos.Cheques.FlushBuffers;
                     Datos.Cheques.Refresh;
                   end;
                 If Datos.Clientes.Fieldbyname('Forma_de_Pago').AsString = 'TC' then
                   Begin
                     Datos.Tarjetas.Refresh;
                     Datos.Tarjetas.First;
                     Datos.Tarjetas.indexname:='Codigo_Tipo_Index';
                     Datos.Tarjetas.Setkey;
                     Datos.Tarjetas.Fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
                     Datos.Tarjetas.Fieldbyname('Tipo').asstring:='I';
                     Datos.Tarjetas.Gotokey;
                     Datos.Tarjetas.Delete;
                     Datos.Tarjetas.FlushBuffers;
                     Datos.Tarjetas.Refresh;
                   end;

                 If Datos.Clientes.Fieldbyname('Forma_de_Deposito').AsString = 'CH' then
                   Begin
                     Datos.Cheques.Refresh;
                     Datos.Cheques.First;
                     Datos.Cheques.indexname:='Codigo_Tipo_Index';
                     Datos.Cheques.Setkey;
                     Datos.Cheques.Fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
                     Datos.Cheques.Fieldbyname('Tipo').asstring:='D';
                     Datos.Cheques.Gotokey;
                     Datos.Cheques.Delete;
                     Datos.Cheques.FlushBuffers;
                     Datos.Cheques.Refresh;
                     Datos.Transacciones.Last;
                     Datos.Transacciones.Edit;
                     Datos.Transacciones.Append;
                     Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit3.Text;
                     Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
                     Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
                     Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
                     Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
                     Datos.Transacciones.Fieldbyname('Retiro').AsInteger:=StrToInt(Edit2.Text);
                     Datos.Transacciones.Fieldbyname('Marca').AsString:='R';
                     Datos.Transacciones.Post;
                   end;
                 If Datos.Clientes.Fieldbyname('Forma_de_Deposito').AsString = 'TC' then
                   Begin
                     Datos.Tarjetas.Refresh;
                     Datos.Tarjetas.First;
                     Datos.Tarjetas.indexname:='Codigo_Tipo_Index';
                     Datos.Tarjetas.Setkey;
                     Datos.Tarjetas.Fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
                     Datos.Tarjetas.Fieldbyname('Tipo').asstring:='D';
                     Datos.Tarjetas.Gotokey;
                     Datos.Tarjetas.Delete;
                     Datos.Tarjetas.FlushBuffers;
                     Datos.Tarjetas.Refresh;
                     Datos.Transacciones.Last;
                     Datos.Transacciones.Edit;
                     Datos.Transacciones.Append;
                     Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit3.Text;
                     Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
                     Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
                     Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
                     Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
                     Datos.Transacciones.Fieldbyname('Retiro').AsInteger:=StrToInt(Edit2.Text);
                     Datos.Transacciones.Fieldbyname('Marca').AsString:='R';
                     Datos.Transacciones.Post;
                   end;

                 Datos.Clientes.Delete;
                 Datos.Clientes.FlushBuffers;
                 Datos.Clientes.Refresh;

                 Datos.Debe.First;
                 While NOT Datos.Debe.EOF do
                   Begin
                     IF Datos.Debe.Fieldbyname('Codigo_Cliente').AsString = Maskedit3.Text Then Datos.Debe.Delete else Datos.Debe.Next;
                   end;

                 Datos.Mayores.Refresh;
                 Datos.Mayores.First;
                 Datos.Mayores.indexname:='';
                 Datos.Mayores.Setkey;
                 Datos.Mayores.Fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
                 Datos.Mayores.Gotokey;
                 Datos.Mayores.Delete;
                 Datos.Mayores.Refresh;

                 Datos.Menores.Refresh;
                 Datos.Menores.First;
                 Datos.Menores.indexname:='';
                 Datos.Menores.Setkey;
                 Datos.Menores.Fieldbyname('Codigo_Cliente').asstring:=Maskedit3.Text;
                 Datos.Menores.Gotokey;
                 Datos.Menores.Delete;
                 Datos.Menores.Refresh;

                 Datos.Historia.Refresh;
                 Datos.Historia.First;
                 Datos.Historia.Edit;
                 While Not(Datos.Historia.EOF) do
                   Begin
                     If Datos.Historia.Fieldbyname('Codigo_Cliente').Asstring = MaskEdit3.Text then
                       Begin
                         Datos.Historia.Delete;
                         Datos.Historia.FlushBuffers;
                       End
                     else
                       BEgin
                         Datos.Historia.Next;
                       end;
                   end;
                 Limpiar_Todo;
                 MaskEdit3.Setfocus;
//                 Showmessage('Los datos del cliente han sido Eliminados, haga click en el botón '+
//                             'de abajo para volver a la pantalla principal del programa '+
//                             'o presione la tecla Enter.');
//                 Close;
               end
             else
               Begin
                 Raise Tiene_Videos.Create (' ');
               end;
           end
         else
           Begin
             Maskedit3.Text:='';
             Limpiar_Todo;
             EliminarBtn.Enabled:=False;
             MaskEdit3.Setfocus;
           end;
       end
     except
//          on EdatabaseError do
//             Begin
//               Showmessage('Ha Ocurrido un ERROR grave con la Base de datos del sistema, '+
//                           'Por favor, contacte a Pedro Arrioja por el Teléfono: 016-796-13-06 '+
//                           'para una revisión inmediata y corrección del problema; para la '+
//                           'inmediata protección de los archivos, Vídeo Rental se Cerrará.');
//               Application.Terminate;
//             end;
          on Tiene_Videos do
             Begin
               Showmessage('El Cliente Que ha seleccionado, no puede ser eliminado, ya '+
                        'que el mismo posee uno o más videos en alquiler y ningún cliente '+
                        'será borrado mientras posea alguna cinta perteneciente a la videotienda.');
               Limpiar_Todo;
               MaskEdit3.Text:='';
               EliminarBtn.Enabled:=False;
               MaskEdit3.Setfocus;
             end;
     end;
   end
  Finally
    Begin
      Confirmar.Free;
      Confirmar:=Nil;
      EliminarBtn.Enabled:=True;
      CancelarBtn.Enabled:=True;
    end;
  end;
end;


Procedure TEliminar_Cliente.Limpiar_Todo;
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
  Radiogroup1.ItemIndex:=0;
end;


procedure TEliminar_Cliente.FormShow(Sender: TObject);
begin
  MaskEdit3.Text:='';
  PageControl1.ActivePage:=Hoja_1;
  Limpiar_Todo;
  EliminarBtn.Enabled:=False;
  MaskEdit3.Setfocus;
end;

procedure TEliminar_Cliente.MaskEdit3KeyPress(Sender: TObject;
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
         EliminarBtn.Enabled:=True;
         //Se ponen todos los datos en sus respectivas casillas:
         Edit1.text:=Datos.Clientes.fieldbyname('Nombres_Cliente').asstring;
         Edit3.text:=Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring;
         MaskEdit1.text:=Datos.Clientes.fieldbyname('Cedula_Cliente').asstring;
         MaskEdit4.text:=Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asstring;
         MaskEdit2.text:=Datos.Clientes.fieldbyname('Telefono_1_Cliente').asstring;
         MaskEdit5.text:=Datos.Clientes.fieldbyname('Telefono_2_Cliente').asstring;
         Edit2.text:=Datos.Clientes.fieldbyname('Monto_Inscripcion').asstring;
         NumEdit1.text:=Datos.Clientes.fieldbyname('Monto_Deposito').asstring;
         Memo1.lines.add(Datos.Clientes.fieldbyname('Direccion_Cliente').asstring);
         Ciudad_Edit.text:=Datos.Clientes.fieldbyname('Ciudad_Cliente').asstring;
         Estado_Edit.text:=Datos.Clientes.fieldbyname('Estado_Cliente').asstring;
         Postal_Edit.text:=Datos.Clientes.fieldbyname('Postal_Cliente').asstring;
         Profesion_Edit.text:=Datos.Clientes.fieldbyname('Profesion_Cliente').asstring;

         If Datos.Clientes.Fieldbyname('Sexo_Cliente').asboolean = False then
            Begin
              Radiogroup1.ItemIndex:=0;
            end
         else
            Begin
              Radiogroup1.ItemIndex:=1;
            end;
//Se termina el proceso de carga de datos.
         key:=#3;
       end
    else
       Begin
         Limpiar_Todo;
         Showmessage('El código que ha ingresado no se encuentra, por '+
                     'favor, corrija el problema y continúe la búsqueda.');
         MaskEdit3.Text:='';
         Maskedit3.Setfocus;
         key:=#3;
       end;
  end;
end;

procedure TEliminar_Cliente.MaskEdit3Change(Sender: TObject);
begin
  Barras.Text:=MaskEdit3.Text;
end;

end.
