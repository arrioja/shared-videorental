unit UVista_Grande_Pelicula;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, GradBtn;

type
  TVista_Grande_Pelicula = class(TForm)
    Image1: TImage;
    GradBtn2: TGradBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    GradBtn1: TGradBtn;
    GradBtn3: TGradBtn;
    procedure GradBtn2Click(Sender: TObject);
    procedure GradBtn3Click(Sender: TObject);
    procedure GradBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Vista_Grande_Pelicula: TVista_Grande_Pelicula;

implementation

{$R *.DFM}

procedure TVista_Grande_Pelicula.GradBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TVista_Grande_Pelicula.GradBtn3Click(Sender: TObject);
begin
  Image1.Height:=497;
  Image1.Width:=769;
//  Image1.Stretch:=True;
end;

procedure TVista_Grande_Pelicula.GradBtn1Click(Sender: TObject);
begin
  Image1.Height:=800;
  Image1.Width:=1100;
//  Image1.Stretch:=True;
end;

end.
