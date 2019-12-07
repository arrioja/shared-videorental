unit UNuevo_Ejemplar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Mask, Gauges, ExtCtrls, Db, DBTables, Numedit;

type
  TNuevo_Ejemplar = class(TForm)
    OKBtn: TBitBtn;
    CerrarBtn: TBitBtn;
    GroupBox1: TGroupBox;
    MaskEdit1: TNumEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    Bevel3: TBevel;
    Progreso: TGauge;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    MaskEdit2: TMaskEdit;
    SpinEdit2: TSpinEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MaskEdit3: TMaskEdit;
    GroupBox3: TGroupBox;
    Video_Doble_Check: TCheckBox;
    Bevel1: TBevel;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure CerrarBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpinEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Nuevo_Ejemplar: TNuevo_Ejemplar;
  Numero_Actual_de_Ejemplares:integer;
  Codigo_a_Buscar:string;

implementation

uses Uprincipal, MODULO_DE_DATOS;

{$R *.DFM}



procedure TNuevo_Ejemplar.MaskEdit1KeyPress(Sender: TObject; var Key: Char);

begin
  If Key = #13 then
    begin
      Numero_Actual_de_Ejemplares:=0;
      Datos.Total.Refresh;
      Datos.Total.indexname:='';
      Datos.Total.setkey;
      Datos.Total.fieldbyname('Codigo_Video').asstring:=Maskedit1.Text;
      If (Datos.Total.gotokey = true) then
        Begin
          Numero_Actual_de_Ejemplares:=Datos.Total.fieldbyname('Cantidad_de_Ejemplares').asinteger;
          If Numero_Actual_de_Ejemplares = 998 then
            Begin
              MessageDlg('Ya se ha llegado al tope máximo de ejemplares para esta cinta de Vídeo, '+
                         'si desea poder tener más capacidad para almacenar más ejemplares de los videos, '+
                         'por favor contacte a Pedro Arrioja a través del teléfono: 016-796-13-06. '+
                         'ó por el e-mail: videorental@cantv.net', mtError,
                         [mbOk], 1);
              Close;
            end
          else
            Begin
              Label11.Caption:=Datos.Total.Fieldbyname('Cantidad_de_Ejemplares').AsString;
              SpinEdit2.MaxValue:= 998 - Numero_Actual_de_Ejemplares;
              Codigo_a_Buscar:=Datos.Total.fieldbyname('Codigo_Video').asstring+'-001';
              Datos.Videos.Refresh;
              Datos.Videos.indexname:='';
              Datos.Videos.setkey;
              Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codigo_a_Buscar;
              If (Datos.Videos.gotokey = true) then
                Begin
                  Edit1.Text:=Datos.Videos.fieldbyname('Titulo_Video').asstring;
                  Combobox1.Text:=Datos.Videos.fieldbyname('Categoria_Video').asstring;
                  MaskEdit2.Text:=Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring;
                  CheckBox1.Checked:=Datos.Videos.fieldbyname('Estreno').asboolean;
                  combobox2.text:=Datos.Videos.fieldbyname('Clase_Video').asstring;
                  MaskEdit3.Text:=Datos.Videos.fieldbyname('Precio_Video').asstring;
                  Video_Doble_Check.Checked:=Datos.Videos.fieldbyname('Video_Doble').asboolean;
                end;
            end;
          MaskEdit2.Setfocus;
        end// del Total Gotokey = True
      else
        Begin
          Showmessage('El Código Introducido no se encuentra registrado, '+
                      'inténtelo de nuevo.');
          MaskEdit1.Text:='';
          MaskEdit2.Text:='';
          MaskEdit3.Text:='';
          Edit1.Text:='';
          Label11.Caption:='0';
          RadioButton1.Checked:=True;
          Progreso.Progress:=0;
          Combobox1.Text:='';
          Combobox2.Text:='';
          Video_Doble_Check.Checked:=False;
          MaskEdit1.Setfocus;
        end;//del else del total gotokey = True
      Key:=#3;
    end;//del Key 13
end;

procedure TNuevo_Ejemplar.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TNuevo_Ejemplar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Principal.Enabled:=True;
end;

procedure TNuevo_Ejemplar.FormShow(Sender: TObject);
begin
  MaskEdit1.Text:='';
  Label11.Caption:='0';
  MaskEdit2.Text:='';
  MaskEdit3.Text:='';
  Edit1.Text:='';
  RadioButton1.Checked:=True;
  Progreso.Progress:=0;
  Combobox1.Text:='';
  Combobox2.Text:='';
  Video_Doble_Check.Checked:=False;
  MaskEdit1.Setfocus;
end;

procedure TNuevo_Ejemplar.RadioButton1Click(Sender: TObject);
begin
  spinedit2.value:=1;
  spinedit2.enabled:=false;
end;

procedure TNuevo_Ejemplar.RadioButton2Click(Sender: TObject);
begin
  spinedit2.value:=2;
  spinedit2.enabled:=false;
end;

procedure TNuevo_Ejemplar.RadioButton3Click(Sender: TObject);
begin
  spinedit2.enabled:=True;
end;

procedure TNuevo_Ejemplar.OKBtnClick(Sender: TObject);
var
  bien:boolean;
  y,x:integer;
  ejemnum:integer;
  st:string;
  moviecode:string;
  Titulo:string;
  Precio:integer;
begin
{La siguiente parte es de la comprobación del
   título de la película.}
Precio:=0;
bien:=false;
if edit1.text = '' then
   begin
   end
else
   begin
     st:=edit1.text;
     for x:=1 to length(st) do
       if st[x]<>#32 then
         begin
           bien:=true;
           titulo:=st;
         end;
   end;
if bien = false then
    begin
       messagedlg('El título de la Película que Usted '
       +'ha introducido, no es un nombre válido, por favor '
       +'corrija el problema para poder continuar.',mterror,[mbok],0);
       edit1.setfocus;
    end;

{La Siguiente parte es la comprobación del
  precio de la película.}
if bien <> false then
   Begin
     Try
       Begin
         Precio:=strtoint(Maskedit3.text);
       end
     Except
        on econverterror do
           Begin
             messagedlg('El Valor del Precio no es un número '
                       +'entero válido, por favor, corrija el problema '
                       +'para poder proseguir',mterror,[mbok],0);
             Bien:=False;
             Maskedit3.setfocus;
           end;
     end;
   end;

{La Siguiente parte es la comprobación de la
  fecha de la película.}
if bien <> false then
   Begin
     Try
       Begin
         strtodate(Maskedit2.text);
       end
     Except
        on econverterror do
          Begin
            messagedlg('El Valor de la Fecha que usted ha '
                      +'introducido, no es una fecha válida de la forma "dd/mm/aaa", o '
                      +'bién, la fecha no existe.',mterror,[mbok],0);
            Bien:=False;
            Maskedit2.setfocus;
          end;
     end;
   end;

if (bien = true) then
  begin
    Progreso.maxvalue:=Spinedit2.value;
    MovieCode:=Codigo_a_Buscar;
    for ejemnum := Numero_Actual_de_Ejemplares+1 to
                   Numero_Actual_de_Ejemplares+spinedit2.value do
       begin
       Progreso.Progress:=Ejemnum;
{***********************************************************************}
{  En esta parte se comprueba el número de ejemplares a incluir y se
   repite la grabación tantas veces como ejemplares se quieran incluir,
   para ello se comprueba el tamaño del texto en el spinedit y se
   selecciona si es unidades, decenas o centenas}

         st:=inttostr(ejemnum);
         if length(st) = 1 then
            begin
              moviecode[6]:='0';
              moviecode[7]:='0';
              moviecode[8]:=st[1];
            end;

         if length(st) = 2 then
            begin
              for y:=7 to 8 do
                 begin
                   moviecode[6]:='0';
                   moviecode[y]:=st[y-6];
                 end;
            end;

         if length(st) = 3 then
            begin
              for y:=6 to 8 do
                 begin
                   moviecode[y]:=st[y-5];
                 end;
            end;
{***********************************************************************}
{En las siguientes líneas se ejecuta la acción de grabar en la base
 de datos Videos.db}
         Datos.Videos.Refresh;
         Datos.Videos.last;
         Datos.Videos.insert;
         Datos.Videos.fieldbyname('Codigo_video').asstring:=Moviecode;
         Datos.Videos.fieldbyname('Titulo_video').asstring:=Titulo;
         Datos.Videos.fieldbyname('Categoria_video').asstring:=Combobox1.text;
         Datos.Videos.fieldbyname('Fecha_Ingreso_video').asstring:=Maskedit2.text;
         Datos.Videos.fieldbyname('Clase_video').asstring:=combobox2.text;
         Datos.Videos.fieldbyname('Precio_video').asinteger:=Precio;
         Datos.Videos.fieldbyname('Numero_Ejemplar_video').asinteger:=Ejemnum;
         Datos.Videos.Fieldbyname('Video_Alquilado').asboolean:=False;
         Datos.Videos.FieldByName('Ingresos_del_Video').asinteger:=0;
         Datos.Videos.FieldByName('Ingresos_por_Alquiler').asinteger:=0;
         Datos.Videos.Fieldbyname('Estreno').asboolean:=CheckBox1.Checked;
         Datos.Videos.FieldByName('Ingresos_por_Multa').asinteger:=0;
         Datos.Videos.Fieldbyname('Video_Doble').asboolean:=Video_Doble_Check.Checked;
         Datos.Videos.fieldbyname('Codigo_Cliente').asstring:='';
         Datos.Videos.fieldbyname('Fecha_Alquiler').asstring:='';
         Datos.Videos.fieldbyname('Fecha_Entrega').asstring:='';
         Datos.Videos.fieldbyname('Dias_Alquiler').asinteger:=0;
         Datos.Videos.fieldbyname('Multado').asboolean:=False;
         Datos.Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
         Datos.Videos.fieldbyname('Cliente_Autorizado').asstring:='';
         Datos.Videos.fieldbyname('Veces_de_Alquiler').asinteger:=0;
         Datos.Videos.fieldbyname('Veces_de_Multa').asinteger:=0;
         Datos.Videos.Post;
         Datos.Videos.FlushBuffers;         
         Datos.Videos.Refresh;
       end;

      Datos.Total.Refresh;
      Datos.Total.indexname:='';
      Datos.Total.setkey;
      Datos.Total.fieldbyname('Codigo_Video').asstring:=Maskedit1.Text;
      Datos.Total.gotokey;
      Datos.Total.Edit;
      Datos.Total.Fieldbyname('Valor_Total').Asinteger:=
                        ((Datos.Total.Fieldbyname('Valor_Total').Asinteger)+
                         (strtoint(MaskEdit3.Text)*SpinEdit2.Value));
      Datos.Total.Fieldbyname('Cantidad_de_Ejemplares').Asinteger:=
                         Datos.Total.Fieldbyname('Cantidad_de_Ejemplares').Asinteger
                         +SpinEdit2.Value;
      Datos.Total.Post;
      Datos.Total.FlushBuffers;      
      Datos.Total.Refresh;
      Showmessage('Los Nuevos Ejemplares han sido incluidos Satisfactoriamente.');
//      close;
  end;
end;

procedure TNuevo_Ejemplar.MaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      MaskEdit3.Setfocus;
      Key:=#3;
    end;
end;

procedure TNuevo_Ejemplar.MaskEdit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      RadioButton1.Setfocus;
      Key:=#3;
    end;
end;

procedure TNuevo_Ejemplar.SpinEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      OKBtn.Setfocus;
      Key:=#3;
    end;
end;

end.
