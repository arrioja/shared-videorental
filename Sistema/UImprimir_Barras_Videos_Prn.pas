unit UImprimir_Barras_Videos_Prn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxGIF, Qrctrls, QuickRpt, ExtCtrls, barqr4,UImprimir_Barras_Videos;

type
  TImprimir_Barras_Videos_Prn = class(TForm)
    Reporte: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    Barra_1: TQRBarcode;
    Barra_2: TQRBarcode;
    Barra_3: TQRBarcode;
    Barra_4: TQRBarcode;
    Barra_5: TQRBarcode;
    Barra_6: TQRBarcode;
    Barra_7: TQRBarcode;
    Barra_8: TQRBarcode;
    Barra_10: TQRBarcode;
    Barra_9: TQRBarcode;
    QRLabel1: TQRLabel;
    Codigo_1: TQRLabel;
    Codigo_2: TQRLabel;
    Codigo_3: TQRLabel;
    Codigo_4: TQRLabel;
    Codigo_5: TQRLabel;
    Codigo_6: TQRLabel;
    Codigo_7: TQRLabel;
    Codigo_8: TQRLabel;
    Codigo_9: TQRLabel;
    Codigo_10: TQRLabel;
    Barra_11: TQRBarcode;
    Barra_12: TQRBarcode;
    Barra_13: TQRBarcode;
    Barra_14: TQRBarcode;
    Barra_15: TQRBarcode;
    Barra_16: TQRBarcode;
    Barra_17: TQRBarcode;
    Barra_18: TQRBarcode;
    Barra_20: TQRBarcode;
    Barra_19: TQRBarcode;
    Codigo_11: TQRLabel;
    Codigo_12: TQRLabel;
    Codigo_13: TQRLabel;
    Codigo_14: TQRLabel;
    Codigo_15: TQRLabel;
    Codigo_16: TQRLabel;
    Codigo_17: TQRLabel;
    Codigo_18: TQRLabel;
    Codigo_19: TQRLabel;
    Codigo_20: TQRLabel;
    Barra_22: TQRBarcode;
    Barra_21: TQRBarcode;
    Codigo_21: TQRLabel;
    Codigo_22: TQRLabel;
    Barra_23: TQRBarcode;
    Barra_24: TQRBarcode;
    Codigo_23: TQRLabel;
    Codigo_24: TQRLabel;
    Barra_25: TQRBarcode;
    Barra_26: TQRBarcode;
    Barra_27: TQRBarcode;
    Barra_28: TQRBarcode;
    Barra_29: TQRBarcode;
    Barra_30: TQRBarcode;
    Barra_32: TQRBarcode;
    Barra_31: TQRBarcode;
    Codigo_25: TQRLabel;
    Codigo_26: TQRLabel;
    Codigo_27: TQRLabel;
    Codigo_28: TQRLabel;
    Codigo_29: TQRLabel;
    Codigo_30: TQRLabel;
    Codigo_31: TQRLabel;
    Codigo_32: TQRLabel;
    Barra_34: TQRBarcode;
    Barra_33: TQRBarcode;
    Codigo_33: TQRLabel;
    Codigo_34: TQRLabel;
    Barra_35: TQRBarcode;
    Barra_36: TQRBarcode;
    Codigo_35: TQRLabel;
    Codigo_36: TQRLabel;
    procedure ReporteNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imprimir_Barras_Videos_Prn: TImprimir_Barras_Videos_Prn;

implementation

{$R *.DFM}

procedure TImprimir_Barras_Videos_Prn.ReporteNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  Case Imprimir_Barras_Videos.Cuenta_Personas of
    1:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=Imprimir_Barras_Videos.Listado.Cells[3,1];
      end;
    2:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
      end;
    3:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
      end;
    4:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
      end;
    5:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
      end;
    6:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
      end;
    7:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
      end;
    8:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
      end;
    9:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
      end;
   10:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
      end;
   11:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
      end;
   12:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
      end;
   13:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
      end;
   14:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
      end;
   15:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
      end;
   16:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
      end;
   17:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
      end;
   18:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
      end;
   19:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
      end;
   20:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
      end;
   21:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
      end;
   22:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
      end;
   23:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
      end;
   24:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
      end;
   25:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
      end;
   26:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
      end;
   27:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
      end;
   28:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
      end;
   29:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
      end;
   30:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
        Codigo_30.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,30]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,30]+'  ';
        Barra_30.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,30];
      end;
   31:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
        Codigo_30.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,30]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,30]+'  ';
        Barra_30.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,30];
        Codigo_31.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,31]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,31]+'  ';
        Barra_31.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,31];
      end;
   32:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
        Codigo_30.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,30]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,30]+'  ';
        Barra_30.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,30];
        Codigo_31.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,31]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,31]+'  ';
        Barra_31.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,31];
        Codigo_32.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,32]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,32]+'  ';
        Barra_32.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,32];
      end;
   33:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
        Codigo_30.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,30]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,30]+'  ';
        Barra_30.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,30];
        Codigo_31.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,31]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,31]+'  ';
        Barra_31.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,31];
        Codigo_32.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,32]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,32]+'  ';
        Barra_32.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,32];
        Codigo_33.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,33]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,33]+'  ';
        Barra_33.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,33];
      end;
   34:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
        Codigo_30.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,30]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,30]+'  ';
        Barra_30.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,30];
        Codigo_31.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,31]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,31]+'  ';
        Barra_31.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,31];
        Codigo_32.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,32]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,32]+'  ';
        Barra_32.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,32];
        Codigo_33.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,33]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,33]+'  ';
        Barra_33.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,33];
        Codigo_34.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,34]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,34]+'  ';
        Barra_34.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,34];
      end;
   35:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
        Codigo_30.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,30]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,30]+'  ';
        Barra_30.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,30];
        Codigo_31.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,31]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,31]+'  ';
        Barra_31.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,31];
        Codigo_32.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,32]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,32]+'  ';
        Barra_32.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,32];
        Codigo_33.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,33]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,33]+'  ';
        Barra_33.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,33];
        Codigo_34.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,34]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,34]+'  ';
        Barra_34.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,34];
        Codigo_35.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,35]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,35]+'  ';
        Barra_35.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,35];
      end;
   36:Begin
        Codigo_1.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,1]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,1]+'  ';
        Barra_1.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,1];
        Codigo_2.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,2]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,2]+'  ';
        Barra_2.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,2];
        Codigo_3.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,3]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,3]+'  ';
        Barra_3.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,3];
        Codigo_4.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,4]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,4]+'  ';
        Barra_4.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,4];
        Codigo_5.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,5]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,5]+'  ';
        Barra_5.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,5];
        Codigo_6.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,6]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,6]+'  ';
        Barra_6.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,6];
        Codigo_7.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,7]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,7]+'  ';
        Barra_7.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,7];
        Codigo_8.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,8]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,8]+'  ';
        Barra_8.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,8];
        Codigo_9.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,9]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,9]+'  ';
        Barra_9.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,9];
        Codigo_10.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,10]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,10]+'  ';
        Barra_10.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,10];
        Codigo_11.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,11]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,11]+'  ';
        Barra_11.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,11];
        Codigo_12.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,12]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,12]+'  ';
        Barra_12.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,12];
        Codigo_13.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,13]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,13]+'  ';
        Barra_13.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,13];
        Codigo_14.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,14]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,14]+'  ';
        Barra_14.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,14];
        Codigo_15.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,15]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,15]+'  ';
        Barra_15.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,15];
        Codigo_16.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,16]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,16]+'  ';
        Barra_16.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,16];
        Codigo_17.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,17]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,17]+'  ';
        Barra_17.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,17];
        Codigo_18.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,18]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,18]+'  ';
        Barra_18.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,18];
        Codigo_19.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,19]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,19]+'  ';
        Barra_19.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,19];
        Codigo_20.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,20]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,20]+'  ';
        Barra_20.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,20];
        Codigo_21.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,21]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,21]+'  ';
        Barra_21.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,21];
        Codigo_22.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,22]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,22]+'  ';
        Barra_22.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,22];
        Codigo_23.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,23]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,23]+'  ';
        Barra_23.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,23];
        Codigo_24.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,24]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,24]+'  ';
        Barra_24.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,24];
        Codigo_25.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,25]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,25]+'  ';
        Barra_25.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,25];
        Codigo_26.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,26]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,26]+'  ';
        Barra_26.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,26];
        Codigo_27.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,27]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,27]+'  ';
        Barra_27.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,27];
        Codigo_28.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,28]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,28]+'  ';
        Barra_28.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,28];
        Codigo_29.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,29]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,29]+'  ';
        Barra_29.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,29];
        Codigo_30.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,30]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,30]+'  ';
        Barra_30.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,30];
        Codigo_31.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,31]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,31]+'  ';
        Barra_31.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,31];
        Codigo_32.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,32]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,32]+'  ';
        Barra_32.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,32];
        Codigo_33.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,33]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,33]+'  ';
        Barra_33.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,33];
        Codigo_34.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,34]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,34]+'  ';
        Barra_34.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,34];
        Codigo_35.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,35]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,35]+'  ';
        Barra_35.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,35];
        Codigo_36.Caption:='  '+Imprimir_Barras_Videos.Listado.Cells[2,36]+'  /'+
                          '  '+Imprimir_Barras_Videos.Listado.Cells[0,36]+'  ';
        Barra_36.Text:=         Imprimir_Barras_Videos.Listado.Cells[3,36];
      end;
  end;
end;

end.
