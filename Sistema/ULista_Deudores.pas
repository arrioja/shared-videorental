unit ULista_Deudores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Counter,
  RefreshQ;

type
  TLista_Deudores = class(TForm)
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    Bevel4: TBevel;
    BitBtn1: TBitBtn;
    Bevel3: TBevel;
    ImprimirBtn: TBitBtn;
    Label1: TLabel;
    Counter1: TCounter;
    Query1: TSelfRefreshQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Listar;    
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lista_Deudores: TLista_Deudores;

implementation

uses Uprincipal, ULista_Deudores_Prn;

{$R *.DFM}

procedure TLista_Deudores.Listar;
Begin
     if RadioGroup1.itemindex=0 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Debe.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, SUM(Debe.Monto) as Deudas from Usuarios, Debe '+
                         'Where ((Debe.Codigo_Cliente = Usuarios.Codigo_Cliente) AND (Debe.Monto > 0)) '+
                         'GROUP BY Debe.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente ORDER BY Debe.Codigo_Cliente');
          Query1.Open;
        end;
     if RadioGroup1.itemindex=1 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Debe.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, SUM(Debe.Monto) as Deudas from Usuarios, Debe '+
                         'Where ((Debe.Codigo_Cliente = Usuarios.Codigo_Cliente) AND (Debe.Monto > 0)) '+
                         'GROUP BY Debe.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente ORDER BY Usuarios.Nombres_Cliente');
          Query1.Open;
        end;
     if RadioGroup1.itemindex=2 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Debe.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, SUM(Debe.Monto) as Deudas from Usuarios, Debe '+
                         'Where ((Debe.Codigo_Cliente = Usuarios.Codigo_Cliente) AND (Debe.Monto > 0)) '+
                         'GROUP BY Debe.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente ORDER BY Usuarios.Apellidos_Cliente');
          Query1.Open;
        end;
end;

procedure TLista_Deudores.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TLista_Deudores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Principal.Enabled:=True;
end;

procedure TLista_Deudores.RadioGroup1Click(Sender: TObject);
begin
  Listar;
end;

procedure TLista_Deudores.FormShow(Sender: TObject);
var
  Suma:Integer;
begin
  Listar;
  Suma:=0;
  RadioGroup1.Itemindex:=0;
  Counter1.Value:='0';
  Query1.First;
  While Not Query1.EOF do
    Begin
      Suma:=Suma+Query1.Fieldbyname('Deudas').Asinteger;
      Query1.Next;
    end;
  Counter1.Value:=InttoStr(SUMA);
end;

procedure TLista_Deudores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 Then Close;
end;

procedure TLista_Deudores.ImprimirBtnClick(Sender: TObject);
begin
  Try
    Begin
      Lista_Deudores_Prn:=TLista_Deudores_Prn.Create(Self);
      Lista_Deudores_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Lista_Deudores_Prn.Free;
      Lista_Deudores_Prn:=Nil;
    end;
  end;
end;

end.
