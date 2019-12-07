unit UListado_JPG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GradBtn, ExtCtrls, FMXUtils;

type
  TListado_JPG = class(TForm)
    GradBtn1: TGradBtn;
    GradBtn2: TGradBtn;
    GradBtn3: TGradBtn;
    GradBtn4: TGradBtn;
    GradBtn5: TGradBtn;
    GradBtn6: TGradBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure GradBtn1Click(Sender: TObject);
    procedure GradBtn6Click(Sender: TObject);
    procedure GradBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_JPG: TListado_JPG;

implementation

{$R *.DFM}

procedure TListado_JPG.GradBtn1Click(Sender: TObject);
begin
  ExecuteFile('14115.jpg','','',1);
end;

procedure TListado_JPG.GradBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TListado_JPG.GradBtn2Click(Sender: TObject);
begin
  ExecuteFile('HiTech.jpg','','',1);
end;

end.
