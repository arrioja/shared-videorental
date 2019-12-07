unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, marquee, Hemibtn, anifile, StdCtrls,Menus,
  OnlyOne, HarmFade, FX, ALed, RXCtrls,ShellAPI;

type
  TPrincipal = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Esfera: THemisphereButton;
    Marquee1: TMarquee;
    Bevel3: TBevel;
    PopupMenu1: TPopupMenu;
    OnlyOne1: TOnlyOne;
    Timer1: TTimer;
    Transicion: THarmFade;
    Bevel5: TBevel;
    HemisphereButton1: THemisphereButton;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    procedure EsferaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HemisphereButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;
  x:boolean;

implementation

{$R *.DFM}


procedure TPrincipal.EsferaClick(Sender: TObject);
begin
  Application.Terminate;
end;



procedure TPrincipal.Timer1Timer(Sender: TObject);
begin
  If x = True then
    Begin
      Transicion.Dissolve;
      Transicion.BMPFrom.LoadFromFile('Presen.Bmp');
      Transicion.BMPTo.LoadFromFile('Logo.Bmp');
    end
  else
    Begin
      Transicion.Dissolve;
      Transicion.BMPFrom.LoadFromFile('Logo.Bmp');
      Transicion.BMPTo.LoadFromFile('Presen.Bmp');
    end;
  x:= NOT(X);
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  X:=True;
  Transicion.BMPFrom.LoadFromFile('Logo.Bmp');
  Transicion.BMPTo.LoadFromFile('Presen.Bmp');
end;

procedure TPrincipal.HemisphereButton1Click(Sender: TObject);
begin
  ShellExecute(0,0,'Setup.exe',0,'',0);
  Application.Terminate;
end;

end.
