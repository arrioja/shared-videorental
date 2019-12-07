unit UListado_Costo_Videos_Prn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,UListado_Costo_Videos,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TListado_Costo_Videos_Prn = class(TForm)
    Reporte: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Costo_Videos_Prn: TListado_Costo_Videos_Prn;

implementation

{$R *.DFM}

end.
