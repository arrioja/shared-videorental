unit ULista_Cliente_Prn;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, quickrpt, DB, DBTables, Qrctrls,Ulista_clientes;

type
  TLista_Cliente_Prn = class(TForm)
    Reporte: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lista_Cliente_Prn: TLista_Cliente_Prn;

implementation

{$R *.DFM}

end.
