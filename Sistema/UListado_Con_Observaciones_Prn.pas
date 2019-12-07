unit UListado_Con_Observaciones_Prn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,UListado_Con_Observaciones,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TListado_Con_Observaciones_Prn = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Con_Observaciones_Prn: TListado_Con_Observaciones_Prn;

implementation

{$R *.DFM}

end.
