unit UBienvenida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Gauges, StdCtrls;

type
  TBienvenida = class(TForm)
    Image1: TImage;
    Progreso: TGauge;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bienvenida: TBienvenida;

implementation

{$R *.DFM}

end.
