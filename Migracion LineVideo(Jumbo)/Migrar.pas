unit Migrar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gauges, StdCtrls, Buttons, Db, DBTables, Refresh, Grids, DBGrids,
  DBCtrls, ExtCtrls;

type
  Tfghjvb64 = class(TForm)
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Tablota: TSelfRefreshTable;
    DBNavigator1: TDBNavigator;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fghjvb64: Tfghjvb64;

implementation

{$R *.DFM}

procedure Tfghjvb64.BitBtn2Click(Sender: TObject);
begin
  Tablota.Close;
  Close;
end;

procedure Tfghjvb64.FormShow(Sender: TObject);
begin
  Tablota.TableName:='Videos.db';
  Tablota.Open;
end;

procedure Tfghjvb64.Button1Click(Sender: TObject);
begin
  Tablota.IndexName:='';
  Tablota.SetKey;
  Tablota.Fieldbyname('Codigo_Video').AsString:=Edit1.Text;
  If Tablota.Gotokey = False Then
    Showmessage('NO');
end;

procedure Tfghjvb64.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Tablota.IndexName:='';
      Tablota.SetKey;
      Tablota.Fieldbyname('Codigo_Video').AsString:=Edit1.Text;
      If Tablota.Gotokey = False Then
      Showmessage('NO');
    end;
end;

end.
