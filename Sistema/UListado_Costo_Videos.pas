unit UListado_Costo_Videos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, Db, DBTables, Buttons, ExtCtrls, Grids, DBGrids, Counter,
  RefreshQ;

type
  TListado_Costo_Videos = class(TForm)
    Bevel1: TBevel;
    Bevel3: TBevel;
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Menu_Videos: TPopupMenu;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    ImprimirBtn: TBitBtn;
    Bevel2: TBevel;
    Label1: TLabel;
    Counter1: TCounter;
    Query1: TSelfRefreshQuery;
    Query2: TSelfRefreshQuery;
    procedure BitBtn1Click(Sender: TObject);
    Procedure Formar_Listado;
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listado_Costo_Videos: TListado_Costo_Videos;

implementation

uses Uprincipal, UListado_Costo_Videos_Prn;

{$R *.DFM}

procedure TListado_Costo_Videos.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

Procedure TListado_Costo_Videos.Formar_Listado;
Begin
  If Edit1.Text = '' Then
    BEgin
      If RadioGroup1.Itemindex = 0 Then
        Begin
          Query1.SQL.Clear;
          Query1.SQL.Add('Select Codigo_Video, Titulo_Video, Fecha_Ingreso_Video, Precio_Video from Videos Order By Codigo_Video');
          Query1.Open;
        end;
      If RadioGroup1.Itemindex = 1 Then
        Begin
          Query1.SQL.Clear;
          Query1.SQL.Add('Select Codigo_Video, Titulo_Video, Fecha_Ingreso_Video, Precio_Video from Videos Order By Titulo_Video');
          Query1.Open;
        end;
      If RadioGroup1.Itemindex = 2 Then
        Begin
          Query1.SQL.Clear;
          Query1.SQL.Add('Select Codigo_Video, Titulo_Video, Fecha_Ingreso_Video, Precio_Video from Videos Order By Fecha_Ingreso_Video');
          Query1.Open;
        end;
      If RadioGroup1.Itemindex = 3 Then
        Begin
          Query1.SQL.Clear;
          Query1.SQL.Add('Select Codigo_Video, Titulo_Video, Fecha_Ingreso_Video, Precio_Video from Videos Order By Precio_Video');
          Query1.Open;
        end;
    end
  else
    Begin
      If RadioGroup1.Itemindex = 0 Then
        Begin
          Query1.SQL.Clear;
          Query1.SQL.Add('Select Codigo_Video, Titulo_Video, Fecha_Ingreso_Video, Precio_Video from Videos '+
                     'Where (Codigo_Video LIKE "'+EDit1.Text+'%") Order By Codigo_Video');
          Query1.Open;
        end;
      If RadioGroup1.Itemindex = 1 Then
        Begin
          Query1.SQL.Clear;
          Query1.SQL.Add('Select Codigo_Video, Titulo_Video, Fecha_Ingreso_Video, Precio_Video from Videos '+
                     'Where (Titulo_Video LIKE "'+EDit1.Text+'%") Order By Titulo_Video');
          Query1.Open;
        end;
      If RadioGroup1.Itemindex = 2 Then
        Begin
          Showmessage('Sólo se permiten búsquedas en el Código y en tl Título');
        end;
      If RadioGroup1.Itemindex = 3 Then
        Begin
          Showmessage('Sólo se permiten búsquedas en el Código y en tl Título');
        end;
    end;
end;



procedure TListado_Costo_Videos.Edit1Exit(Sender: TObject);
begin
  Formar_Listado;
end;

procedure TListado_Costo_Videos.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Formar_Listado;
end;

procedure TListado_Costo_Videos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #27 Then
    Close;
end;

procedure TListado_Costo_Videos.RadioGroup1Click(Sender: TObject);
begin
  Formar_Listado;
end;

procedure TListado_Costo_Videos.FormShow(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=0;
  Edit1.Text:='';
  Edit1.Setfocus;
  Query2.sql.Clear;
  Query2.SQL.Add('Select SUM(Precio_Video) as Precio from Videos');
  Query2.Open;
  Query2.First;
  Counter1.Value:=Query2.Fieldbyname('Precio').Asstring;
end;

procedure TListado_Costo_Videos.ImprimirBtnClick(Sender: TObject);
begin
  Try
    Begin
      Listado_Costo_Videos_Prn:=TListado_Costo_Videos_Prn.Create(Self);
      Listado_Costo_Videos_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Listado_Costo_Videos_Prn.Free;
      Listado_Costo_Videos_Prn:=Nil;
    end;
  End;
end;

end.
