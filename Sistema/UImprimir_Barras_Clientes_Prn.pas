unit UImprimir_Barras_Clientes_Prn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxGIF, Qrctrls, QuickRpt, ExtCtrls, barqr4,UImprimir_Barras_Clientes;

type
  TImprimir_Barras_Clientes_Prn = class(TForm)
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
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    Nombre_1: TQRLabel;
    Nombre_9: TQRLabel;
    QRLabel29: TQRLabel;
    Nombre_3: TQRLabel;
    Nombre_5: TQRLabel;
    Nombre_4: TQRLabel;
    Nombre_6: TQRLabel;
    Nombre_10: TQRLabel;
    Nombre_8: TQRLabel;
    Nombre_7: TQRLabel;
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
    Nombre_2: TQRLabel;
    procedure ReporteNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Imprimir_Barras_Clientes_Prn: TImprimir_Barras_Clientes_Prn;

implementation

{$R *.DFM}

procedure TImprimir_Barras_Clientes_Prn.ReporteNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  Case Imprimir_Barras_Clientes.Cuenta_Personas of
    1:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
      end;
    2:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
      end;
    3:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
      end;
    4:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
        Nombre_4.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,4];
        Barra_4.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,4];
      end;
    5:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
        Nombre_4.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,4];
        Barra_4.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,4];
        Nombre_5.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,5];
        Barra_5.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,5];
      end;
    6:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
        Nombre_4.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,4];
        Barra_4.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,4];
        Nombre_5.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,5];
        Barra_5.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,5];
        Nombre_6.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,6];
        Barra_6.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,6];
      end;
    7:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
        Nombre_4.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,4];
        Barra_4.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,4];
        Nombre_5.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,5];
        Barra_5.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,5];
        Nombre_6.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,6];
        Barra_6.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,6];
        Nombre_7.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,7];
        Barra_7.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,7];
      end;
    8:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
        Nombre_4.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,4];
        Barra_4.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,4];
        Nombre_5.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,5];
        Barra_5.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,5];
        Nombre_6.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,6];
        Barra_6.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,6];
        Nombre_7.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,7];
        Barra_7.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,7];
        Nombre_8.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,8];
        Barra_8.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,8];
      end;
    9:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
        Nombre_4.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,4];
        Barra_4.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,4];
        Nombre_5.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,5];
        Barra_5.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,5];
        Nombre_6.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,6];
        Barra_6.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,6];
        Nombre_7.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,7];
        Barra_7.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,7];
        Nombre_8.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,8];
        Barra_8.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,8];
        Nombre_9.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,9];
        Barra_9.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,9];
      end;
    10:Begin
        Nombre_1.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,1];
        Barra_1.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,1];
        Nombre_2.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,2];
        Barra_2.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,2];
        Nombre_3.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,3];
        Barra_3.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,3];
        Nombre_4.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,4];
        Barra_4.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,4];
        Nombre_5.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,5];
        Barra_5.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,5];
        Nombre_6.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,6];
        Barra_6.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,6];
        Nombre_7.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,7];
        Barra_7.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,7];
        Nombre_8.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,8];
        Barra_8.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,8];
        Nombre_9.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,9];
        Barra_9.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,9];
        Nombre_10.Caption:=Imprimir_Barras_Clientes.Listado.Cells[1,10];
        Barra_10.Text:=Imprimir_Barras_Clientes.Listado.Cells[0,10];
      end;
  end;
end;

end.
