unit UEsperar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg, Gauges;

type
  TEsperar = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Gauge1: TGauge;
    Bevel3: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Esperar: TEsperar;

implementation

{$R *.DFM}

end.
