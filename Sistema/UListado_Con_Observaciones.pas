unit UListado_Con_Observaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls,
  RefreshQ;

type
  TListado_Con_Observaciones = class(TForm)
    Bevel4: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Menu_Clientes: TPopupMenu;
    DBMemo1: TDBMemo;
    Label33: TLabel;
    ImprimirBtn: TBitBtn;
    Query1: TSelfRefreshQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Listar;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Con_Observaciones: TListado_Con_Observaciones;

implementation

uses Uprincipal, UControl_Observaciones, UListado_Con_Observaciones_Prn,
  MODULO_DE_DATOS;

{$R *.DFM}


procedure TListado_Con_Observaciones.Listar;
Begin
  If RadioGroup1.Itemindex = 0 Then
    Begin
      Query1.SQL.Clear;
      Query1.SQL.Add('Select Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Observaciones From Usuarios '+
                     'Where Observaciones IS NOT NULL Order By Codigo_Cliente');
      Query1.OPen;
    end;
  If RadioGroup1.Itemindex = 1 Then
    Begin
      Query1.SQL.Clear;
      Query1.SQL.Add('Select Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Observaciones From Usuarios '+
                     'Where Observaciones IS NOT NULL Order By Cedula_Cliente');
      Query1.OPen;
    end;
  If RadioGroup1.Itemindex = 2 Then
    Begin
      Query1.SQL.Clear;
      Query1.SQL.Add('Select Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Observaciones From Usuarios '+
                     'Where Observaciones IS NOT NULL Order By Nombres_Cliente');
      Query1.OPen;
    end;
  If RadioGroup1.Itemindex = 3 Then
    Begin
      Query1.SQL.Clear;
      Query1.SQL.Add('Select Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Observaciones From Usuarios '+
                     'Where Observaciones IS NOT NULL Order By Apellidos_Cliente');
      Query1.OPen;
    end;

end;

procedure TListado_Con_Observaciones.FormShow(Sender: TObject);
begin
  Listar
end;

procedure TListado_Con_Observaciones.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TListado_Con_Observaciones.RadioGroup1Click(Sender: TObject);
begin
  Listar;
end;

procedure TListado_Con_Observaciones.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_F4) then
   Begin
     Try
       Begin
         Datos.Clientes.Open;
         Control_Observaciones:=TControl_Observaciones.Create(Self);
         Control_Observaciones.ABuscar.Caption:=Query1.Fieldbyname('Codigo_Cliente').Asstring;
         Control_Observaciones.Showmodal;
         Listar;
       end
     Finally
       Begin
         Datos.Clientes.Close;
         Control_Observaciones.Free;
         Control_Observaciones:=Nil;
       end;
     end;
   end;
end;

procedure TListado_Con_Observaciones.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #27 Then Close;
end;

procedure TListado_Con_Observaciones.ImprimirBtnClick(Sender: TObject);
begin
  Try
    Begin
      Listado_Con_Observaciones_Prn:=TListado_Con_Observaciones_Prn.Create(Self);
      Listado_Con_Observaciones_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Listado_Con_Observaciones_Prn.Free;
      Listado_Con_Observaciones_Prn:=Nil;
    end;
  end;
end;

end.
