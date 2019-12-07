unit UListado_Videos_Alquilados_Prn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,UListado_Videos_Alquilados,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TListado_Videos_Alquilados_Prn = class(TForm)
    Reporte: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Videos_Alquilados_Prn: TListado_Videos_Alquilados_Prn;

implementation

{$R *.DFM}

end.
