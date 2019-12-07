unit UListado_Cliente_que_mas_Alquila_Prn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,UListado_Cliente_que_mas_Alquila,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TListado_Cliente_que_mas_Alquila_Prn = class(TForm)
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
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Cliente_que_mas_Alquila_Prn: TListado_Cliente_que_mas_Alquila_Prn;

implementation

{$R *.DFM}

end.
