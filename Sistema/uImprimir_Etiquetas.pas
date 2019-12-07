unit uImprimir_Etiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Spin, Printers, Menus, Numedit;

type
  TImprimir_Etiquetas = class(TForm)
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    ImprimirBtn: TBitBtn;
    CerrarBtn: TBitBtn;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit3: TNumEdit;
    procedure CerrarBtnClick(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imprimir_Etiquetas: TImprimir_Etiquetas;

implementation

uses Uprincipal;

{$R *.DFM}

procedure TImprimir_Etiquetas.CerrarBtnClick(Sender: TObject);
begin
  Principal.Enabled:=True;
  Close;
end;

procedure TImprimir_Etiquetas.ImprimirBtnClick(Sender: TObject);
var
  Ruta_Programa:String;
  Imagen: TBitmap;
  cuenta_hojas,c,y:integer;
begin
  Ruta_Programa:=ExtractFilePath(Application.ExeName);
  Imagen := TBitmap.Create;
  Imagen.LoadFromFile(Ruta_Programa+'Imagenes\SuLogo.bmp');

For Cuenta_hojas:=1 to Spinedit1.Value do
   Begin
     y:=0;
       With Printer do
         Begin
           Begindoc;
         For c:=1 to 8 do
            Begin
                Canvas.Rectangle(250,0+y,2000,250+y);
                Canvas.moveto(1620,0+y);
                Canvas.Lineto(1620,250+y);
                Canvas.moveto(620,0+y);
                Canvas.Lineto(620,250+y);
                Canvas.font.name:='Brush Script MT';
                Canvas.font.size:=24;
                Canvas.Textout(650,3+y,Edit1.Text);
                Canvas.Textout(650,120+y,Edit2.Text);
                Canvas.font.size:=8;
                Canvas.font.name:='Arial';
                Canvas.Textout(1640,40+y,'Código:  ___________');
                Canvas.Textout(1640,110+y,'Ejemplar:___________');
                Canvas.Textout(1640,180+y,'Clase  :___________');

                Canvas.font.size:=12;
                Canvas.font.name:='Arial';
                Canvas.Textout(1800,15+y,Edit3.Text);
                Canvas.Textout(1800,155+y,Combobox1.Text);

                Canvas.Draw(260,10+y,Imagen);
              y:=y+350;
            end;
         Enddoc;
         end;
      end;
end;
procedure TImprimir_Etiquetas.FormShow(Sender: TObject);
begin
  Edit1.Text:='';
  Edit1.Text:='';
  Edit1.Text:='';
  Spinedit1.Value:=1;
  Edit1.Setfocus;
end;

procedure TImprimir_Etiquetas.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      Edit2.SetFocus;
      Key:=#3;
    end;
end;

procedure TImprimir_Etiquetas.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      Edit3.SetFocus;
      Key:=#3;
    end;
end;

procedure TImprimir_Etiquetas.Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      Combobox1.SetFocus;
      Key:=#3;
    end;
end;

procedure TImprimir_Etiquetas.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      ImprimirBtn.SetFocus;
      Key:=#3;
    end;
end;

end.
