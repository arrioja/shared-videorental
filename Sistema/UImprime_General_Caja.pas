unit UImprime_General_Caja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxGIF, Qrctrls, QuickRpt, ExtCtrls,Modulo_de_Datos;

type
  TImprime_General_Caja = class(TForm)
    Reporte: TQuickRep;
    DetailBand1: TQRBand;
    Total: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    q2: TQRLabel;
    q3: TQRLabel;
    q4: TQRLabel;
    q5: TQRLabel;
    q1: TQRLabel;
    q6: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel21: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape1: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel35: TQRLabel;
    procedure ReporteNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imprime_General_Caja: TImprime_General_Caja;

implementation

uses UPrincipal;

{$R *.DFM}

procedure TImprime_General_Caja.ReporteNeedData(Sender: TObject;
  var MoreData: Boolean);
Var
  X:Byte;
begin
  For X:=1 to 2 do;
  
end;

end.
