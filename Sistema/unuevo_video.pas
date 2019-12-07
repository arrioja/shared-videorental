unit unuevo_video;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Spin, Mask, DB, DBTables, Gauges;

type
  TNuevo_video = class(TForm)
    OKBtn: TBitBtn;
    CancelarBtn: TBitBtn;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Progreso: TGauge;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Video_Doble_Check: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Bevel4: TBevel;
    GroupBox3: TGroupBox;
    MaskEdit6: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox2: TComboBox;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    SpinEdit2: TSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelarBtnClick(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    Procedure Limpiar_Todo;
    Procedure Calcular_Nuevo_Codigo;
    procedure FormShow(Sender: TObject);
    procedure SpinEdit2Exit(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure SpinEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Video_Doble_CheckKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Nuevo_video: TNuevo_video;
  movienumber,Precio:Integer;
  moviecode,primero,Titulo,Categoria:String;
  Censura:Char;

implementation

uses uprincipal, MODULO_DE_DATOS;

{$R *.DFM}

procedure TNuevo_video.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  principal.enabled:=true;
end;

procedure TNuevo_video.CancelarBtnClick(Sender: TObject);
begin
  close;
end;

procedure TNuevo_video.RadioButton3Click(Sender: TObject);
begin
  spinedit2.enabled:=true;
end;

procedure TNuevo_video.RadioButton2Click(Sender: TObject);
begin
  spinedit2.value:=2;
  spinedit2.enabled:=false;
end;

procedure TNuevo_video.RadioButton1Click(Sender: TObject);
begin
  spinedit2.value:=1;
  spinedit2.enabled:=false;
end;

procedure TNuevo_video.Calcular_Nuevo_Codigo;
var
  stri   :string;
  y      :integer;
begin
  randomize;
  primero:='001';
  RadioButton1.Checked := True;
  moviecode:=maskedit1.text;
  combobox2.itemindex:=0;
  combobox1.itemindex:=0;
  movienumber:=0;
  while length(inttostr(movienumber)) < 4 do
    Begin
      movienumber:=random(9999);
    end;

  stri:=inttostr(movienumber);

  for y:=1 to 4 do
    begin
      moviecode[y]:=stri[y];
    end;
  for y:=6 to 8 do
    begin
      moviecode[y]:=primero[y-5];
    end;
  Datos.Videos.indexname:='';
  Datos.Videos.setkey;
  Datos.Videos.fieldbyname('Codigo_video').asstring:=moviecode;
  while Datos.Videos.gotokey = true do
    begin
      Datos.Videos.setkey;
      movienumber:=0;
      while length(inttostr(movienumber)) < 4 do
        Begin
          movienumber:=random(9999);
        end;
      stri:=inttostr(movienumber);
      for y:=1 to 4 do
        begin
          moviecode[y]:=stri[y];
        end;
      for y:=6 to 8 do
        begin
          moviecode[y]:=primero[y-5];
        end;
      Datos.Videos.fieldbyname('Codigo_video').asstring:=moviecode;
    end;
  maskedit1.text:=moviecode;
  maskedit3.text:='000000';
end;

procedure TNuevo_video.FormActivate(Sender: TObject);
Begin
  Edit1.text:='';
  Calcular_Nuevo_Codigo;
end;

Procedure TNuevo_Video.Limpiar_Todo;
Begin
  Progreso.Progress:=0;
  Video_Doble_Check.Checked:=False;
  CheckBox1.Checked:=False;
  SpinEdit2.Value;
  RadioButton1.Checked;
  MaskEdit3.Text:='0';
  Combobox2.Itemindex:=-1;
  MaskEdit2.Text:=Principal.Fecha_Total;
  Combobox1.Text:='';
  Edit1.Text:='';
  MaskEdit4.Text:='';
  MaskEdit5.Text:='';
  MaskEdit6.Text:='';
  Calcular_Nuevo_Codigo;
end;

procedure TNuevo_video.OKBtnClick(Sender: TObject);
var
  bien:boolean;
  y,x:integer;
  ejemnum:integer;
  st:string;
  Desglozar:string[8];
  Codigo_Video_a_Buscar:string[4];
begin
moviecode:=maskedit1.text;
{La siguiente parte es de la comprobación del
   título de la película.}
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
    Datos.Videos.SetKey;
    Datos.Videos.Fieldbyname('Codigo_Video').AsString:=MaskEdit1.Text;
    If Datos.Videos.GotoKey = False Then
      Begin
        Progreso.maxvalue:=Spinedit2.value;
        for ejemnum := 1 to spinedit2.value do
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
                 Datos.Videos.FieldByName('Ingresos_por_Multa').asinteger:=0;
                 Datos.Videos.Fieldbyname('Video_Doble').asboolean:=Video_Doble_Check.Checked;
                 Datos.Videos.Fieldbyname('Estreno').asboolean:=Checkbox1.Checked;
                 Datos.Videos.Fieldbyname('DVD').asboolean:=Checkbox2.Checked;
                 Datos.Videos.fieldbyname('Codigo_Cliente').asstring:='';
                 Datos.Videos.fieldbyname('Fecha_Alquiler').asstring:='';
                 Datos.Videos.fieldbyname('Fecha_Entrega').asstring:='';
                 Datos.Videos.fieldbyname('Dias_Alquiler').asinteger:=0;
                 Datos.Videos.fieldbyname('Multado').asboolean:=False;
                 Datos.Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
                 Datos.Videos.fieldbyname('Cliente_Autorizado').asstring:='';
                 Datos.Videos.fieldbyname('Veces_de_Alquiler').asinteger:=0;
                 Datos.Videos.fieldbyname('Veces_de_Multa').asinteger:=0;
                 Datos.Videos.Fieldbyname('Anaquel').AsString:=MaskEdit4.Text;
                 Datos.Videos.Fieldbyname('Linea').AsString:=MaskEdit5.Text;
                 Datos.Videos.Fieldbyname('Posicion').AsString:=MaskEdit6.Text;
                 Datos.Videos.Post;
                 Datos.Videos.FlushBuffers;
                 Datos.Videos.Refresh;
           end;

         Desglozar:=MaskEdit1.Text;
         Codigo_Video_a_Buscar:='';
         Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                                Desglozar[3]+Desglozar[4];
         Datos.Total.Refresh;
         Datos.Total.indexname:='';
         Datos.Total.Last;
         Datos.Total.Insert;
         Datos.Total.Fieldbyname('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
         Datos.Total.Fieldbyname('Nombre_Video').Asstring:=Edit1.Text;
         Datos.Total.Fieldbyname('Alquiler_Total').Asinteger:=0;
         Datos.Total.Fieldbyname('Multa_Total').Asinteger:=0;
         Datos.Total.Fieldbyname('Ingreso_Total').Asinteger:=0;
         Datos.Total.Fieldbyname('Veces_de_Alquiler_Total').Asinteger:=0;
         Datos.Total.Fieldbyname('Veces_de_Multa_Total').Asinteger:=0;
         Datos.Total.Fieldbyname('Valor_Total').Asinteger:=strtoint(MaskEdit3.Text)*
                                                      SpinEdit2.Value;
         Datos.Total.Fieldbyname('Cantidad_de_Ejemplares').Asinteger:=SpinEdit2.Value;
         Datos.Total.Post;
         Datos.Total.Refresh;
         Limpiar_Todo;
         MaskEdit1.SetFocus;
      end
    else
      Begin
        Showmessage('Ya existe un video con ese código, deberá cambiarlo '+
                    'para poder incluir el nuevo video, de lo contrario no '+
                    'podrá hacer la inclusión.');
        MaskEdit1.Setfocus;
      end;
  end;
end;


procedure TNuevo_video.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Combobox1.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit4.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.FormShow(Sender: TObject);
begin
  Progreso.Progress:=0;
  Video_Doble_Check.Checked:=False;
  CheckBox1.Checked:=False;
  MaskEdit2.Text:=Principal.Fecha_Total;
  MaskEdit1.Setfocus;
end;

procedure TNuevo_video.SpinEdit2Exit(Sender: TObject);
begin
  if length(inttostr(Spinedit2.Value)) = 0 then
     Begin
       Radiobutton1.Checked:=True;
       Spinedit2.Value:=1;
     end;
end;

procedure TNuevo_video.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit2.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Combobox2.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit3.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.SpinEdit2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Video_Doble_Check.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.Video_Doble_CheckKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    OKBtn.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit1.Setfocus;
    end;
end;

procedure TNuevo_video.MaskEdit6KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Radiobutton1.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit5.setfocus;
    key:=#3;
  end;
end;

procedure TNuevo_video.MaskEdit5KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    MaskEdit6.setfocus;
    key:=#3;
  end;
end;

end.
