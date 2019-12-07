unit UImprime_Detalle_Caja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxGIF, Qrctrls, QuickRpt, ExtCtrls,Modulo_de_Datos;

type
  TImprime_Detalle_Caja = class(TForm)
    Reporte: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel19: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel10: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imprime_Detalle_Caja: TImprime_Detalle_Caja;

implementation

uses UPrincipal;

{$R *.DFM}

end.
