unit ULista_Videos_Sacados_de_Estrenos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus,
  RefreshQ,Modulo_de_Datos, Gauges, Printers, RXDBCtrl;

type
  TLista_Videos_Sacados_de_Estrenos = class(TForm)
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Bevel3: TBevel;
    ImprimirBtn: TBitBtn;
    Query1: TSelfRefreshQuery;
    PrintDialog1: TPrintDialog;
    Gauge1: TGauge;
    Label1: TLabel;
    DBGrid1: TRxDBGrid;
    BitBtn2: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Listar;
    procedure FormShow(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lista_Videos_Sacados_de_Estrenos: TLista_Videos_Sacados_de_Estrenos;
  Impreso:Boolean;

implementation

uses Uprincipal, UHistorial_Videos, uModificar_video, UConsultar_Video,
  ualquilar_y_devolver, ULista_Videos_Prn;

{$R *.DFM}

procedure TLista_Videos_Sacados_de_Estrenos.RadioGroup1Click(Sender: TObject);
begin
  Listar;
end;

procedure TLista_Videos_Sacados_de_Estrenos.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TLista_Videos_Sacados_de_Estrenos.FormShow(Sender: TObject);
begin
  Impreso:=False;
  Listar;
end;

Procedure TLista_Videos_Sacados_de_Estrenos.Listar;
Begin
  Query1.DisableControls;
  Query1.Sql.Clear;
  Query1.Sql.add('Select Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video from Videos'
                +' where Sacar_de_estrenos = True ORDER BY Titulo_Video');
  Query1.Open;
  Query1.EnableControls;
end;

procedure TLista_Videos_Sacados_de_Estrenos.ImprimirBtnClick(Sender: TObject);
begin
  if (printdialog1.execute) then
    begin
      Try
        Begin
          Query1.DisableControls;
          Lista_Videos_Prn:=TLista_Videos_Prn.Create(Self);
          Lista_Videos_Prn.QRLabel6.Caption:='Vídeos por Sacar de Estrenos';
          Lista_Videos_Prn.Reporte.DataSet:=Lista_Videos_Sacados_de_Estrenos.Query1;
          Lista_Videos_Prn.QrDbtext1.Dataset:=Lista_Videos_Sacados_de_Estrenos.Query1;
          Lista_Videos_Prn.QrDbtext2.Dataset:=Lista_Videos_Sacados_de_Estrenos.Query1;
          Lista_Videos_Prn.QrDbtext3.Dataset:=Lista_Videos_Sacados_de_Estrenos.Query1;
          Lista_Videos_Prn.QrDbtext4.Dataset:=Lista_Videos_Sacados_de_Estrenos.Query1;
          Lista_Videos_Prn.Reporte.PrinterSettings.PrinterIndex:=Printer.printerindex;
          Lista_Videos_Prn.Reporte.PrinterSettings.copies:=printdialog1.copies;
          Lista_Videos_Prn.Reporte.Print;
          Query1.EnableControls;
          BitBtn1.Enabled:=False;
          ImprimirBtn.Enabled:=False;
          BitBtn2.Enabled:=True;
          Impreso:=True;
        end
      Finally
        Begin
          Lista_Videos_Prn.Free;
          Lista_Videos_Prn:=Nil;
          Printer.PrinterIndex:=-1;
        end;
      end;
    end;
  If Impreso = False Then
    Begin
      Showmessage('Ha decidido '+
                  'no imprimir el listado de videos a sacar de estrenos, '+
                  'con el objeto de que en un futuro pueda saber cuales fueron, '+
                  'deberá tomar nota de los videos que ha seleccionado.');
      BitBtn1.Enabled:=False;
      BitBtn2.Enabled:=True;
      Impreso:=True;
    end;
end;

procedure TLista_Videos_Sacados_de_Estrenos.RadioGroup2Click(Sender: TObject);
begin
  Listar;
end;

procedure TLista_Videos_Sacados_de_Estrenos.DBGrid1KeyPress(
  Sender: TObject; var Key: Char);
begin
  If key = #32 Then
      Dbgrid1.SelectedRows.CurrentRowSelected:= NOT Dbgrid1.SelectedRows.CurrentRowSelected;
end;

procedure TLista_Videos_Sacados_de_Estrenos.BitBtn2Click(Sender: TObject);
begin
  If Impreso = True Then
    Begin
      Gauge1.MaxValue:=Query1.RecordCount;
      Query1.DisableControls;
      Query1.First;
      While ( Not Query1.EOF) do
        Begin
          If Dbgrid1.SelectedRows.CurrentRowSelected = True Then
            Begin
              Dbgrid1.SelectedRows.CurrentRowSelected := False;
              Datos.Videos.IndexName:='';
              Datos.Videos.Setkey;
              Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Query1.Fieldbyname('Codigo_Video').AsString;
              If Datos.Videos.Gotokey = True Then
                Begin
                  Datos.Videos.Edit;
                  Datos.Videos.Fieldbyname('Estreno').AsBoolean:=False;
                  Datos.Videos.Fieldbyname('Sacar_de_Estrenos').AsBoolean:=False;
                  Datos.Videos.Post;
                end;
              Query1.Next;
              Gauge1.Progress:=Gauge1.Progress+1;
              Application.Processmessages;
            end
          else
            Begin
              Query1.Next;
              Gauge1.Progress:=Gauge1.Progress+1;
            end;
        end;
      If Query1.RecordCount > 0 Then Principal.Label2.Caption:='';
      Listar;
      Query1.EnableControls;
      BitBtn1.Enabled:=True;
      BitBtn2.Enabled:=False;
      ImprimirBtn.Enabled:=True;
      Impreso:=False;
    end;
end;

end.
