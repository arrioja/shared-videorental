unit UListado_Cliente_que_mas_Alquila;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Mask, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls,
  RefreshQ;

type
  TListado_Cliente_que_mas_Alquila = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TMaskEdit;
    Edit2: TMaskEdit;
    BitBtn2: TBitBtn;
    ImprimirBtn: TBitBtn;
    Query1: TSelfRefreshQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Listar;
    procedure FormShow(Sender: TObject);
    procedure Edit177KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2222KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Cliente_que_mas_Alquila: TListado_Cliente_que_mas_Alquila;

implementation

uses Uprincipal, UListado_Cliente_que_mas_Alquila_Prn;

{$R *.DFM}

procedure TListado_Cliente_que_mas_Alquila.Listar;
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
      Query1.SQL.Add('Select Registro.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, COUNT(Registro.Codigo_Cliente) AS Numero, SUM(Registro.Costo) as Coste from Registro,Usuarios '+
                     'Where ((Registro.Codigo_Cliente = Usuarios.Codigo_Cliente) AND ((Registro.Fecha_Salida >= "'+Inicio+'") AND (Registro.Fecha_Salida <="'+Fin+'"))) '+
                     'Group BY Registro.Codigo_Cliente,Usuarios.Nombres_Cliente,Usuarios.Apellidos_Cliente ORDER BY Numero Descending');
      Query1.Open;
   end
  Except
    On EConvertError do
      Begin
        Showmessage('La Fecha de Inicio o la Fecha de Fin, no son válidas, por favor corrija');
      end;
  end;
end;

procedure TListado_Cliente_que_mas_Alquila.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TListado_Cliente_que_mas_Alquila.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Principal.Enabled:=True;
end;

procedure TListado_Cliente_que_mas_Alquila.FormShow(Sender: TObject);
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit1.Setfocus;
end;


procedure TListado_Cliente_que_mas_Alquila.Edit177KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit2.Setfocus;
    end;
end;

procedure TListado_Cliente_que_mas_Alquila.Edit2222KeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key = #13 Then
  Begin
    Listar;
  end;
end;


procedure TListado_Cliente_que_mas_Alquila.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #27 Then
    Begin
      Close;
    end;
end;

procedure TListado_Cliente_que_mas_Alquila.BitBtn2Click(Sender: TObject);
begin
  Listar;
end;

procedure TListado_Cliente_que_mas_Alquila.ImprimirBtnClick(
  Sender: TObject);
begin
  Try
    Begin
      Listado_Cliente_que_mas_Alquila_Prn:=TListado_Cliente_que_mas_Alquila_Prn.Create(Self);
      Listado_Cliente_que_mas_Alquila_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Listado_Cliente_que_mas_Alquila_Prn.Free;
      Listado_Cliente_que_mas_Alquila_Prn:=Nil;
    end;
  end;
end;

end.
