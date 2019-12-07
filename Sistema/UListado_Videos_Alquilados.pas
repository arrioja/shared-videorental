unit UListado_Videos_Alquilados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RefreshQ;

type
  TListado_Videos_Alquilados = class(TForm)
    Bevel1: TBevel;
    Bevel4: TBevel;
    Bevel3: TBevel;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    ImprimirBtn: TBitBtn;
    Query1: TSelfRefreshQuery;
    procedure BitBtn1Click(Sender: TObject);
    Procedure Listar;
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Videos_Alquilados: TListado_Videos_Alquilados;

implementation

uses Uprincipal, UListado_Videos_Alquilados_Prn;

{$R *.DFM}


Procedure TListado_Videos_Alquilados.Listar;
Begin
  With Radiogroup1 do
     Begin
       Query1.Disablecontrols;
     if itemindex=0 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Usuarios.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, Videos.Fecha_Alquiler, Videos.Codigo_Video, Videos.Titulo_Video from Videos,Usuarios '+
                         'Where ((Videos.Video_Alquilado = "True") AND (Usuarios.Codigo_Cliente = Videos.Codigo_Cliente)) ORDER BY Usuarios.Codigo_Cliente');
          Query1.Open;
        end;
     if itemindex=1 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Usuarios.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, Videos.Fecha_Alquiler, Videos.Codigo_Video, Videos.Titulo_Video from Videos,Usuarios '+
                         'Where ((Videos.Video_Alquilado = "True") AND (Usuarios.Codigo_Cliente = Videos.Codigo_Cliente)) ORDER BY Usuarios.Nombres_Cliente');
          Query1.Open;
        end;
     if itemindex=2 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Usuarios.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, Videos.Fecha_Alquiler, Videos.Codigo_Video, Videos.Titulo_Video from Videos,Usuarios '+
                         'Where ((Videos.Video_Alquilado = "True") AND (Usuarios.Codigo_Cliente = Videos.Codigo_Cliente)) ORDER BY Usuarios.Apellidos_Cliente');
          Query1.Open;
        end;
     if itemindex=3 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Usuarios.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, Videos.Fecha_Alquiler, Videos.Codigo_Video, Videos.Titulo_Video from Videos,Usuarios '+
                         'Where ((Videos.Video_Alquilado = "True") AND (Usuarios.Codigo_Cliente = Videos.Codigo_Cliente)) ORDER BY Videos.Fecha_Alquiler');
          Query1.Open;
        end;
     if itemindex=4 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Usuarios.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, Videos.Fecha_Alquiler, Videos.Codigo_Video, Videos.Titulo_Video from Videos,Usuarios '+
                         'Where ((Videos.Video_Alquilado = "True") AND (Usuarios.Codigo_Cliente = Videos.Codigo_Cliente)) ORDER BY Videos.Codigo_Video');
          Query1.Open;
        end;
     if itemindex=5 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Usuarios.Codigo_Cliente, Usuarios.Nombres_Cliente, Usuarios.Apellidos_Cliente, Videos.Fecha_Alquiler, Videos.Codigo_Video, Videos.Titulo_Video from Videos,Usuarios '+
                         'Where ((Videos.Video_Alquilado = "True") AND (Usuarios.Codigo_Cliente = Videos.Codigo_Cliente)) ORDER BY Videos.Titulo_Video');
          Query1.Open;
        end;
       Query1.EnableControls;
     end;
end;


procedure TListado_Videos_Alquilados.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TListado_Videos_Alquilados.FormShow(Sender: TObject);
begin
  RadioGroup1.Itemindex:=0;
  Listar;
end;

procedure TListado_Videos_Alquilados.RadioGroup1Click(Sender: TObject);
begin
  Listar;
end;

procedure TListado_Videos_Alquilados.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #27 Then Close;
end;

procedure TListado_Videos_Alquilados.ImprimirBtnClick(Sender: TObject);
begin
  Try
    Begin
      Listado_Videos_Alquilados_Prn:=TListado_Videos_Alquilados_Prn.Create(Self);
      Listado_Videos_Alquilados_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Listado_Videos_Alquilados_Prn.Free;
      Listado_Videos_Alquilados_Prn:=Nil;
    end;
  end;
end;

end.
