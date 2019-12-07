unit ULista_Deudores_Prn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls,ULista_Deudores;

type
  TLista_Deudores_Prn = class(TForm)
    Reporte: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lista_Deudores_Prn: TLista_Deudores_Prn;

implementation

{$R *.DFM}

end.
