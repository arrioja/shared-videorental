unit URecaudos_Por_Fecha;

interface
                               //FormatFloat('#,##0.00',0);
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Mask, Counter, ExtCtrls, Gauges, Refresh,
  RefreshQ;

type
  TRecaudos_Por_Fecha = class(TForm)
    Edit1: TMaskEdit;
    Edit2: TMaskEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    Gauge1: TGauge;
    Bevel1: TBevel;
    Query1: TSelfRefreshQuery;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Cantidad: TLabel;
    procedure Calcular;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Recaudos_Por_Fecha: TRecaudos_Por_Fecha;

implementation

uses Uprincipal;

{$R *.DFM}

procedure TRecaudos_Por_Fecha.Calcular;
var
  Inicio,Fin:String;
  Suma:Real;
  A,B:String;
begin
  Inicio:='';
  Fin:='';
  Try
    Begin
      StrToDate(Edit1.Text);
      StrTodate(Edit2.Text);
      A:=Edit1.Text;
      B:=Edit2.Text;
      Inicio:=A[4]+A[5]+A[6]+A[1]+A[2]+A[3]+A[7]+A[8]+A[9]+A[10];
      Fin:=B[4]+B[5]+B[6]+B[1]+B[2]+B[3]+B[7]+B[8]+B[9]+B[10];
      Query1.SQL.Clear;
      Query1.SQL.Add('Select Codigo_Cliente, SUM(COSTO) as COSTE from Registro '+
                     'Where (Fecha_Salida Between "'+Inicio+'" and "'+Fin+'") '+
                     'Group BY Codigo_Cliente');
      Query1.Open;
      Cantidad.Caption:=FormatFloat('#,##0.00',0);
      Suma:=0;
      Gauge1.MaxValue:=Query1.RecordCount;
      Query1.First;
      Gauge1.Progress:=Query1.RecNo;
      While Not Query1.Eof do
        Begin
          Suma:=Suma+Query1.Fieldbyname('Coste').AsInteger;
          Cantidad.Caption:=FormatFloat('#,##0.00',Suma);
          Query1.Next;
          Gauge1.Progress:=Query1.RecNo;
          Application.ProcessMessages;
        end;
    end
  Except
    On EConvertError do
      Begin
        Showmessage('La Fecha de Inicio o la Fecha de Fin, no son válidas, por favor corrija');
      end;
  end;
end;

procedure TRecaudos_Por_Fecha.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit2.SetFocus;
    end;
end;

procedure TRecaudos_Por_Fecha.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
      Calcular;
    end;
end;

procedure TRecaudos_Por_Fecha.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TRecaudos_Por_Fecha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Principal.Enabled:=True;
end;

procedure TRecaudos_Por_Fecha.FormShow(Sender: TObject);
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Cantidad.Caption:=FormatFloat('#,##0.00',0);
  Gauge1.Progress:=0;
  Edit1.Setfocus;
end;

procedure TRecaudos_Por_Fecha.BitBtn1Click(Sender: TObject);
begin
  Calcular;
end;

end.
