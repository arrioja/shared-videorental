unit uImprimir_Carnets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Spin,Printers, Menus;

type
  TImprimir_Carnets = class(TForm)
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imprimir_Carnets: TImprimir_Carnets;

implementation

uses Uprincipal;

{$R *.DFM}

procedure TImprimir_Carnets.BitBtn2Click(Sender: TObject);
begin
  Principal.Enabled:=True;
  Close;
end;

procedure TImprimir_Carnets.BitBtn1Click(Sender: TObject);
var
cuenta_impresiones:integer;
begin
  For cuenta_impresiones:=1 to Spinedit1.Value do
    Begin
      With Printer do
        Begin
          Begindoc;
          Canvas.Rectangle(0,0,990,690);
          Canvas.Rectangle(30,30,430,520);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(460,30,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(450,200,'Código:      __________');
          Canvas.Textout(450,300,'Nombres:_______________');
          Canvas.Textout(450,400,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(80,545,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(50,595,'que alquila Cintas de Vídeos.');
          Canvas.Textout(80,645,'Aquí vá el número telefónico, Fax o Email si los tiene.');


          Canvas.Rectangle(1300,0,2290,690);
          Canvas.Rectangle(1330,30,1730,520);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(1760,30,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(1750,200,'Código:      __________');
          Canvas.Textout(1750,300,'Nombres:_______________');
          Canvas.Textout(1750,400,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(1380,545,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(1350,595,'que alquila Cintas de Vídeos.');
          Canvas.Textout(1380,645,'Aquí vá el número telefónico, Fax o Email si los tiene.');




          Canvas.Rectangle(0,800,990,1490);
          Canvas.Rectangle(30,830,430,1320);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(460,830,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(450,1000,'Código:      __________');
          Canvas.Textout(450,1100,'Nombres:_______________');
          Canvas.Textout(450,1200,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(80,1345,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(50,1395,'que alquila Cintas de Vídeos.');
          Canvas.Textout(80,1445,'Aquí vá el número telefónico, Fax o Email si los tiene.');


          Canvas.Rectangle(1300,800,2290,1490);
          Canvas.Rectangle(1330,830,1730,1320);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(1760,830,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(1750,1000,'Código:      __________');
          Canvas.Textout(1750,1100,'Nombres:_______________');
          Canvas.Textout(1750,1200,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(1380,1345,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(1350,1395,'que alquila Cintas de Vídeos.');
          Canvas.Textout(1380,1445,'Aquí vá el número telefónico, Fax o Email si los tiene.');




          Canvas.Rectangle(0,1550,990,2240);
          Canvas.Rectangle(30,1580,430,2070);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(460,1580,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(450,1750,'Código:      __________');
          Canvas.Textout(450,1850,'Nombres:_______________');
          Canvas.Textout(450,1950,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(80,2095,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(50,2145,'que alquila Cintas de Vídeos.');
          Canvas.Textout(80,2195,'Aquí vá el número telefónico, Fax o Email si los tiene.');

          Canvas.Rectangle(1300,1550,2290,2240);
          Canvas.Rectangle(1330,1580,1730,2070);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(1760,1580,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(1750,1750,'Código:      __________');
          Canvas.Textout(1750,1850,'Nombres:_______________');
          Canvas.Textout(1750,1950,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(1380,2095,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(1350,2145,'que alquila Cintas de Vídeos.');
          Canvas.Textout(1380,2195,'Aquí vá el número telefónico, Fax o Email si los tiene.');





          Canvas.Rectangle(0,2300,990,2990);
          Canvas.Rectangle(30,2330,430,2820);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(460,2330,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(450,2500,'Código:      __________');
          Canvas.Textout(450,2600,'Nombres:_______________');
          Canvas.Textout(450,2700,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(80,2845,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(50,2895,'que alquila Cintas de Vídeos.');
          Canvas.Textout(80,2945,'Aquí vá el número telefónico, Fax o Email si los tiene.');


          Canvas.Rectangle(1300,2300,2290,2990);
          Canvas.Rectangle(1330,2330,1730,2820);
          Canvas.font.name:='Brush Script MT';
          Canvas.font.size:=24;
          Canvas.Textout(1760,2330,'Empresa c.a.');
          Canvas.font.size:=12;
          Canvas.Textout(1750,2500,'Código:      __________');
          Canvas.Textout(1750,2600,'Nombres:_______________');
          Canvas.Textout(1750,2700,'Apellidos:______________');
          Canvas.font.name:='Arial';
          Canvas.font.size:=8;
          Canvas.Textout(1380,2845,'En esta parte del Carnet va la Dirección de la empresa');
          Canvas.Textout(1350,2895,'que alquila Cintas de Vídeos.');
          Canvas.Textout(1380,2945,'Aquí vá el número telefónico, Fax o Email si los tiene.');
          Enddoc;
        end;
    End;
  close;
  Principal.Enabled:=True;
end;

procedure TImprimir_Carnets.FormShow(Sender: TObject);
begin
  Spinedit1.Value:=1;
end;

end.
