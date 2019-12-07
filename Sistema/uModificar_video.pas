unit UModificar_video;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Spin, Mask, DB, DBTables, ComCtrls, Gauges;

type
  TModificar_video = class(TForm)
    OKBTn: TBitBtn;
    CancelBtn: TBitBtn;
    Bevel1: TBevel;
    RadioGroup1: TRadioGroup;
    Gauge1: TGauge;
    Label7: TLabel;
    Bevel3: TBevel;
    GroupBox1: TGroupBox;
    Video_Doble_Check: TCheckBox;
    Bevel5: TBevel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    MaskEdit3: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label8: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    MaskEdit6: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBTnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Video_Doble_CheckKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modificar_video: TModificar_video;
  movienumber:integer;
  primero:string;
  Titulo:string;
  Categoria:String;
  Censura:Char;
  Precio:Integer;




implementation

uses uprincipal, ULista_Videos, MODULO_DE_DATOS;

{$R *.DFM}

procedure TModificar_video.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF Desde_Principal = True then
    Begin
      Principal.Enabled:=True;
    end
  else
    Begin
      If Ultima_Video = 'Lista_Videos' then
        Begin
          Lista_Videos.Enabled:=True;
        end;
    end;
end;

procedure TModificar_video.CancelBtnClick(Sender: TObject);
begin
close;
end;

procedure TModificar_video.OKBTnClick(Sender: TObject);
var
  bien:boolean;
  y,x:integer;
  Codiguis:string;
  Ejemplaris:integer;
  ejemnum:integer;
  Desglozar:string;
  Codigo_a_Modificar:string;
  st:string;

begin
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
IF Bien <> False then
Begin
  Bien:=False;
  Try
    Precio:=strtoint(Maskedit3.text);
    Bien:=true;
  Except
   on econverterror do
     Begin
       messagedlg('El Valor del Precio no es un número '
       +'entero válido, por favor, corrija el problema '
       +'para poder proseguir',mterror,[mbok],0);
       Maskedit3.setfocus;
     end;
   end;
End;

IF Bien <> False then
Begin
  Bien:=False;
  Try
    strtodate(Maskedit2.text);
    Bien:=true;
  Except
   on econverterror do
     Begin
       messagedlg('La Fecha indicada no es una fecha válida '
       +'del tipo dd/mm/aaaa; por favor, corrija el problema '
       +'para poder proseguir',mterror,[mbok],0);
       Maskedit2.setfocus;
     end;
   end;
End;

if (bien = true) then
  begin
    OKBtn.Enabled:=False;
    CancelBtn.Enabled:=False;
    for ejemnum := 1 to 1 do
       begin
{***********************************************************************}
{  En esta parte se comprueba el número de ejemplares a modificar y se
   repite la grabación tantas veces como ejemplares se quieran incluir,
   para ello se comprueba el número del ejemplar de la película, se comienza
   desde el primer ejemplar del mísmo código hasta que ya no se consigan más
   ejemplares del mísmo código. }

   If Radiogroup1.Itemindex = 1 then
      Begin

     Codiguis:=Maskedit1.text;
     st:='001';
     Codiguis[7]:='0';
     Codiguis[8]:='0';
     Codiguis[9]:='1';
     Ejemplaris:=strtoint(st);
     Datos.Videos.indexname:='';
     Datos.Videos.setkey;
     Datos.Videos.fieldbyname('codigo_Video').asstring:=Codiguis;
     While (Ejemplaris <=999) do
       Begin
        Datos.Videos.Last;
        Datos.Videos.First;

        If Datos.Videos.Gotokey then
          Begin
            Datos.Videos.Edit;
            Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codiguis;
            Datos.Videos.fieldbyname('Titulo_Video').asstring:=Titulo;
            Datos.Videos.fieldbyname('Categoria_Video').asstring:=Combobox1.text;
            Datos.Videos.Fieldbyname('Estreno').asboolean:=Checkbox1.Checked;
            Datos.Videos.Fieldbyname('DVD').asboolean:=Checkbox2.Checked;
            Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring:=Maskedit2.text;
            Datos.Videos.fieldbyname('Clase_Video').asstring:=combobox2.text;
            Datos.Videos.fieldbyname('Precio_Video').asinteger:=Precio;
            Datos.Videos.Fieldbyname('Video_Doble').asboolean:=Video_Doble_Check.Checked;
            Datos.Videos.Post;
          end;

         Gauge1.Progress:=Ejemplaris;
         Ejemplaris:=Ejemplaris+1;
         st:=inttostr(Ejemplaris);
         if length(st) = 1 then
            begin
              Codiguis[7]:='0';
              Codiguis[8]:='0';
              Codiguis[9]:=st[1];
            end;

         if length(st) = 2 then
            begin
              for y:=8 to 9 do
                 begin
                   Codiguis[7]:='0';
                   Codiguis[8]:=st[1];
                   Codiguis[9]:=st[2];
                 end;
            end;

         if length(st) = 3 then
            begin
              for y:=7 to 9 do
                 begin
                   Codiguis[7]:=st[1];
                   Codiguis[8]:=st[2];
                   Codiguis[9]:=st[3];

                 end;
            end;
         Datos.Videos.setkey;
         Datos.Videos.fieldbyname('codigo_Video').asstring:=Codiguis;
       end;

        Datos.Historia.Refresh;
        Gauge1.Progress:=999;
        Desglozar:='';
        Desglozar:=MaskEdit1.Text;
        Codigo_a_Modificar:='';
        Codigo_a_Modificar:=Desglozar[1]+Desglozar[2]+Desglozar[3]+Desglozar[4];
        Gauge1.Maxvalue:=Datos.Historia.Recordcount;
        Gauge1.Progress:=0;
        Datos.Historia.First;
        While Not(Datos.Historia.EOF) do
          Begin
            If Datos.Historia.Fieldbyname('Codigo_Video').Asstring = Codigo_a_Modificar then
              Begin
                Datos.Historia.Edit;
                Datos.Historia.fieldbyname('Nombre_Video').asstring:=Titulo;
                Datos.Historia.Post;
                Datos.Historia.Next;
              End
            else
              BEgin
                Datos.Historia.Next;
              end;
            Gauge1.Progress:=Gauge1.Progress+1;
          end;

        Datos.Total.Refresh;
        Datos.Total.IndexName:='';
        Datos.Total.Setkey;
        Datos.Total.Fieldbyname('Codigo_Video').Asstring:=Codigo_a_Modificar;
        Datos.Total.Gotokey;
        Datos.Total.Edit;
        Datos.Total.fieldbyname('Nombre_Video').asstring:=Titulo;
        Datos.Total.Fieldbyname('Valor_Total').Asinteger:=strtoint(MaskEdit3.Text)*
                                                    Datos.Total.Fieldbyname('Cantidad_de_Ejemplares').Asinteger;
        Datos.Total.Post;
      end;
{***********************************************************************}
{En las siguientes 11 líneas se ejecuta la acción de grabar en la base
 de datos Videos.db}
      If Radiogroup1.Itemindex = 0 then
        Begin
         Gauge1.Progress:=999;
         Datos.Videos.indexname:='';
         Datos.Videos.setkey;
         Datos.Videos.fieldbyname('codigo_Video').asstring:=Maskedit1.text;
         Datos.Videos.gotokey;
         Datos.Videos.Edit;


         Desglozar:='';
         Desglozar:=MaskEdit1.Text;
         Codigo_a_Modificar:='';
         Codigo_a_Modificar:=Desglozar[1]+Desglozar[2]+Desglozar[3]+Desglozar[4];
         Datos.Total.IndexName:='';
         Datos.Total.Setkey;
         Datos.Total.Fieldbyname('Codigo_Video').Asstring:=Codigo_a_Modificar;
         Datos.Total.Gotokey;
         Datos.Total.Edit;
         Datos.Total.Fieldbyname('Valor_Total').Asinteger:=(Datos.Total.Fieldbyname('Valor_Total').Asinteger -
                                                      Datos.Videos.fieldbyname('Precio_Video').asinteger)+
                                                      Strtoint(MaskEdit3.Text);
         Datos.Total.Post;
         Datos.Videos.fieldbyname('Titulo_Video').asstring:=Titulo;
         Datos.Videos.fieldbyname('Categoria_Video').asstring:=Combobox1.text;
         Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring:=Maskedit2.text;
         Datos.Videos.fieldbyname('Clase_Video').asstring:=combobox2.text;
         Datos.Videos.fieldbyname('Precio_Video').asinteger:=Precio;
         Datos.Videos.Fieldbyname('Estreno').asboolean:=Checkbox1.Checked;
         Datos.Videos.Fieldbyname('DVD').asboolean:=Checkbox2.Checked;
         Datos.Videos.Fieldbyname('Video_Doble').asboolean:=Video_Doble_Check.Checked;
         Datos.Videos.fieldbyname('Anaquel').asstring:=MaskEdit4.Text;
         Datos.Videos.fieldbyname('Linea').asstring:=MaskEdit5.Text;
         Datos.Videos.fieldbyname('Posicion').asstring:=MaskEdit6.Text;
         Datos.Videos.Post;
        end;
       end;
//   Luego de Haber Eliminado el Video, se limpian los campos y se
//   vuelve a pedir otro video a eliminar
     MaskEdit1.Text:='';
     MaskEdit2.Text:='';
     MaskEdit3.Text:='';
     Video_Doble_Check.Checked:=False;
     CheckBox1.Checked:=False;
     CheckBox2.Checked:=False;     
     Edit1.Text:='';
     Combobox1.Text:='';
     Combobox2.Text:='';
     Gauge1.progress:=0;
     MaskEdit4.Text:='';
     MaskEdit5.Text:='';
     MaskEdit6.Text:='';
     RadioGroup1.Itemindex:=0;
     Maskedit1.SetFocus;
//     Showmessage('La Información de el(los) vídeo(s) ha(n) sido modificado(s).');
     OKBtn.Enabled:=True;
     CancelBtn.Enabled:=True;
  end;
end;


procedure TModificar_video.FormCreate(Sender: TObject);
begin
  randomize;
end;

procedure TModificar_video.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Combobox1.setfocus;
    key:=#3;
  end;

end;

procedure TModificar_video.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
    Video_Doble_Check.SetFocus;
    key:=#3;
  end;
end;

procedure TModificar_video.FormShow(Sender: TObject);
begin
  If Desde_Principal =  True then
    Begin
      MaskEdit1.Setfocus;
    end
  else
    Begin
    Datos.Videos.Refresh;
    Datos.Videos.indexname:='';
    Datos.Videos.setkey;
    Datos.Videos.fieldbyname('Codigo_Video').asstring:=Maskedit1.Text;
    If (Datos.Videos.gotokey = true) then
       Begin
         MaskEdit2.Enabled:=True;
         MaskEdit3.Enabled:=True;
         Video_Doble_Check.Enabled:=True;
         CheckBox1.Enabled:=True;
         CheckBox2.Enabled:=True;
         Edit1.Enabled:=True;
         Combobox1.Enabled:=True;
         Combobox2.Enabled:=True;
         RadioGroup1.Enabled:=True;
         OKBTN.Enabled:=True;
         Edit1.Text:=Datos.Videos.fieldbyname('Titulo_Video').asstring;
         Combobox1.Text:=Datos.Videos.fieldbyname('Categoria_Video').asstring;
         MaskEdit2.Text:=Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring;
         combobox2.text:=Datos.Videos.fieldbyname('Clase_Video').asstring;
         MaskEdit3.Text:=Datos.Videos.fieldbyname('Precio_Video').asstring;
         Video_Doble_Check.Checked:=Datos.Videos.fieldbyname('Video_Doble').asboolean;
         Edit1.Setfocus;
       end;
    end;
end;



procedure TModificar_video.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key = #13) then
  begin
    Datos.Videos.Refresh;
    Datos.Videos.indexname:='';
    Datos.Videos.setkey;
    Datos.Videos.fieldbyname('Codigo_Video').asstring:=Maskedit1.Text;
    If (Datos.Videos.gotokey = true) then
       Begin
         MaskEdit2.Enabled:=True;
         MaskEdit3.Enabled:=True;
         Video_Doble_Check.Enabled:=True;
         CheckBox1.Enabled:=True;
         CheckBox2.Enabled:=True;         
         Edit1.Enabled:=True;
         Combobox1.Enabled:=True;
         Combobox2.Enabled:=True;
         RadioGroup1.Enabled:=True;
         MaskEdit4.Enabled:=True;
         MaskEdit5.Enabled:=True;
         MaskEdit6.Enabled:=True;
         OKBTN.Enabled:=True;
         Edit1.Text:=Datos.Videos.fieldbyname('Titulo_Video').asstring;
         Combobox1.Text:=Datos.Videos.fieldbyname('Categoria_Video').asstring;
         MaskEdit2.Text:=Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring;
         combobox2.text:=Datos.Videos.fieldbyname('Clase_Video').asstring;
         Checkbox1.Checked:=Datos.Videos.Fieldbyname('Estreno').asboolean;
         Checkbox2.Checked:=Datos.Videos.Fieldbyname('DVD').asboolean;
         MaskEdit3.Text:=Datos.Videos.fieldbyname('Precio_Video').asstring;
         MaskEdit4.Text:=Datos.Videos.fieldbyname('Anaquel').asstring;
         MaskEdit5.Text:=Datos.Videos.fieldbyname('Linea').asstring;
         MaskEdit6.Text:=Datos.Videos.fieldbyname('Posicion').asstring;
         Video_Doble_Check.Checked:=Datos.Videos.fieldbyname('Video_Doble').asboolean;
         Edit1.Setfocus;
       end
    else
       Begin
         MaskEdit1.Text:='';
         MaskEdit2.Text:='';
         MaskEdit3.Text:='';
         Video_Doble_Check.Checked:=False;
         CheckBox1.Checked:=False;
         Edit1.Text:='';
         Combobox1.Text:='';
         Combobox2.Text:='';
         CheckBox1.Checked:=False;
         CheckBox2.Checked:=False;
         MaskEdit4.Text:='';
         MaskEdit5.Text:='';
         MaskEdit6.Text:='';
         Gauge1.progress:=0;
         RadioGroup1.Itemindex:=0;
         Showmessage('El Código del video que ha introducido no se encuentra '+
                     'registrado, por favor, corrija el problema para poder '+
                     'continuar.');
         Maskedit1.SetFocus;
       end;
  end;
end;


procedure TModificar_video.MaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Combobox2.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_video.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Maskedit3.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_video.Video_Doble_CheckKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    RadioGroup1.setfocus;
    key:=#3;
  end;
end;

procedure TModificar_video.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  begin
    Maskedit2.setfocus;
    key:=#3;
  end;
end;

end.
