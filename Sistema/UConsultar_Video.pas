unit UConsultar_Video;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Spin, Mask, DB, DBTables, ComCtrls, Gauges;

type
  TConsultar_video = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    MaskEdit2: TMaskEdit;
    CancelBtn: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit1: TMaskEdit;
    GroupBox1: TGroupBox;
    Video_Doble_Check: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelBtnClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Consultar_video: TConsultar_video;
  movienumber:integer;
  primero:string;
  Titulo:string;
  Categoria:String;
  Censura:Char;
  Precio:Integer;




implementation

uses uprincipal, uconfirmar, ULista_Videos, MODULO_DE_DATOS,
  ualquilar_y_devolver;

{$R *.DFM}

procedure TConsultar_video.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF Desde_Principal = False then
    Begin
      If Ultima_Video = 'Lista_Videos' then
        Begin
          Lista_Videos.Enabled:=True;
        end;
      If Ultima_Video = 'Alquilar y Devolver' then
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

procedure TConsultar_video.CancelBtnClick(Sender: TObject);
begin
close;
end;

procedure TConsultar_video.ComboBox1Change(Sender: TObject);
begin
if combobox1.itemindex=18 then
  begin
    combobox2.itemindex:=4;
    combobox2.enabled:=false;
  end
else
    combobox2.enabled:=true;

end;

procedure TConsultar_video.FormShow(Sender: TObject);
begin
  If Desde_Principal = True then
    Begin
      MaskEdit1.Text:='';
      MaskEdit2.Text:='';
      MaskEdit3.Text:='';
      Video_Doble_Check.Checked:=False;
      Edit1.Text:='';
      Combobox1.Text:='';
      Combobox2.Text:='';

      MaskEdit2.Enabled:=False;
      MaskEdit3.Enabled:=False;
      Video_Doble_Check.Enabled:=False;
      Edit1.Enabled:=False;
      Combobox1.Enabled:=False;
      Combobox2.Enabled:=False;
      MaskEdit1.Setfocus;
    end
  else
    Begin
    MaskEdit2.Enabled:=False;
    MaskEdit3.Enabled:=False;
    Video_Doble_Check.Enabled:=False;
    Edit1.Enabled:=False;
    Combobox1.Enabled:=False;
    Combobox2.Enabled:=False;
    Datos.Videos.Refresh;
    Datos.Videos.indexname:='';
    Datos.Videos.setkey;
    Datos.Videos.fieldbyname('Codigo_Video').asstring:=Maskedit1.Text;
    If (Datos.Videos.gotokey = true) then
       Begin
         Edit1.Text:=Datos.Videos.fieldbyname('Titulo_Video').asstring;
         Combobox1.Text:=Datos.Videos.fieldbyname('Categoria_Video').asstring;
         MaskEdit2.Text:=Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring;
         combobox2.text:=Datos.Videos.fieldbyname('Clase_Video').asstring;
         MaskEdit3.Text:=Datos.Videos.fieldbyname('Precio_Video').asstring;
         Video_Doble_Check.Checked:=Datos.Videos.fieldbyname('Video_Doble').asboolean;
       end;
    end;
end;



procedure TConsultar_video.MaskEdit1KeyPress(Sender: TObject;
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
         Edit1.Text:=Datos.Videos.fieldbyname('Titulo_Video').asstring;
         Combobox1.Text:=Datos.Videos.fieldbyname('Categoria_Video').asstring;
         MaskEdit2.Text:=Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring;
         combobox2.text:=Datos.Videos.fieldbyname('Clase_Video').asstring;
         MaskEdit3.Text:=Datos.Videos.fieldbyname('Precio_Video').asstring;
         Video_Doble_Check.Checked:=Datos.Videos.fieldbyname('Video_Doble').asboolean;
       end
    else
       Begin
         MaskEdit1.Text:='';
         MaskEdit2.Text:='';
         MaskEdit3.Text:='';
         Video_Doble_Check.Checked:=False;
         Edit1.Text:='';
         Combobox1.Text:='';
         Combobox2.Text:='';
         Showmessage('El Código del video que ha introducido no se encuentra '+
                     'registrado, por favor, corrija el problema para poder '+
                     'continuar.');
         Maskedit1.SetFocus;
       end;
  end;
end;



end.
