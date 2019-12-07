unit UListado_PDF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GradBtn, ExtCtrls,FMXUtils;

type
  TListado_PDF = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_PDF: TListado_PDF;

implementation

{$R *.DFM}

procedure TListado_PDF.GradBtn1Click(Sender: TObject);
begin
  ExecuteFile('Prueba.pdf','','',1);
end;

procedure TListado_PDF.GradBtn6Click(Sender: TObject);
begin
  Close;
end;

end.
