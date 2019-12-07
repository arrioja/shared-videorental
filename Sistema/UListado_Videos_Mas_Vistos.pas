unit UListado_Videos_Mas_Vistos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, Buttons, Grids, DBGrids, ExtCtrls, RefreshQ;

type
  TListado_Videos_Mas_Vistos = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TMaskEdit;
    Edit2: TMaskEdit;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ImprimirBtn: TBitBtn;
    Query1: TSelfRefreshQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure Listar;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Videos_Mas_Vistos: TListado_Videos_Mas_Vistos;

implementation

uses Uprincipal, UListado_Videos_Mas_Vistos_Prn;

{$R *.DFM}


procedure TListado_Videos_Mas_Vistos.Listar;
var
  Inicio,Fin:String;
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
      Query1.SQL.Add('Select Registro.Codigo_Video, Videos.Titulo_Video, COUNT(Registro.Codigo_Video) AS Numero, SUM(Registro.Costo) as Coste from Registro,Videos '+
                     'Where ((Registro.Codigo_Video = Videos.Codigo_Video) AND ((Registro.Fecha_Salida >= "'+Inicio+'") AND (Registro.Fecha_Salida <= "'+Fin+'"))) '+
                     'Group BY Registro.Codigo_Video,Videos.Titulo_Video ORDER BY Numero Descending');
      Query1.Open;
    end
  Except
    On EConvertError do
      Begin
        Showmessage('La Fecha de Inicio o la Fecha de Fin, no son válidas, por favor corrija');
      end;
  end;
end;


procedure TListado_Videos_Mas_Vistos.BitBtn2Click(Sender: TObject);
begin
  Listar;
end;

procedure TListado_Videos_Mas_Vistos.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit2.Setfocus;
    end;
end;

procedure TListado_Videos_Mas_Vistos.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
      Listar;
    end;
end;

procedure TListado_Videos_Mas_Vistos.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TListado_Videos_Mas_Vistos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #27 Then
    Begin
      Close;
    end;
end;

procedure TListado_Videos_Mas_Vistos.FormShow(Sender: TObject);
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit1.Setfocus;
end;

procedure TListado_Videos_Mas_Vistos.ImprimirBtnClick(Sender: TObject);
begin
  Try
    Begin
      Listado_Videos_Mas_Vistos_Prn:=TListado_Videos_Mas_Vistos_Prn.Create(Self);
      Listado_Videos_Mas_Vistos_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Listado_Videos_Mas_Vistos_Prn.Free;
      Listado_Videos_Mas_Vistos_Prn:=Nil;
    end
  End;
end;

end.
