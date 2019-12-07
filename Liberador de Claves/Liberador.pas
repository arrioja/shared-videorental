unit Liberador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Gauges, StdCtrls, Buttons, DBTables, Db, Refresh;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Gauge1: TGauge;
    Bevel1: TBevel;
    Base: TDatabase;
    SESION: TSession;
    TablaUsuarios: TSelfRefreshTable;
    TablaUsuarios_DS: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  Function Encripta(X:String): String; Far; External 'Control.dll';


{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Gauge1.MaxValue:=TablaUsuarios.RecordCount;
  Gauge1.Progress:=0;
  TablaUsuarios.First;
  While Not TablaUsuarios.EOF do
    Begin
      TablaUsuarios.Edit;
      TablaUsuarios.Fieldbyname('Conectada').AsBoolean:=False;
      TablaUsuarios.Post;
      TablaUsuarios.Flushbuffers;
      Gauge1.Progress:=Gauge1.Progress+1;
      TablaUsuarios.Next;
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Sesion.AddPassword(Encripta('ÃÚßÚ'));
  Base.Connected:=True;
  TablaUsuarios.Open;
  BitBtn2.Setfocus;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Sesion.Active:=False;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
