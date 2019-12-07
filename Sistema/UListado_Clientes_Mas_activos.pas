unit UListado_Clientes_Mas_activos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Menus, Db, DBTables, RefreshQ, Grids, DBGrids, UPrincipal,
  Modulo_de_datos;

type
  TListado_Clientes_Mas_activos = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Query1: TSelfRefreshQuery;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure Listar_Clientes;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Clientes_Mas_activos: TListado_Clientes_Mas_activos;

implementation

{$R *.DFM}

procedure TListado_Clientes_Mas_activos.Listar_Clientes;
Begin
  Try
    Begin
      Query1.DisableControls;
      Query1.SQL.Clear;
      Query1.SQL.Add('Select * from usuarios where Ultima_Visita >= :Ultima');
      Query1.ParamByName('Ultima').ASDateTime:=StrToDate(Principal.Fecha_Total)-(SpinEdit1.Value*30);
      Query1.Open;
      Query1.EnableControls;
    end
  Except
    On EConvertError do
      Begin
        Messagedlg('Debe seleccionar una cantidad válida para el número '
                  +'de meses por el cual hacer la consulta.',mtWarning,[mbok],0);
      end;
  end;
end;
procedure TListado_Clientes_Mas_activos.BitBtn2Click(Sender: TObject);
begin
  Listar_Clientes;
end;

end.
