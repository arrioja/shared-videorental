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
    Video_Destino: TSelfRefreshTable;
    TablaUsuarios_DS: TDataSource;
    Video_Origen: TSelfRefreshTable;
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
  Gauge1.MaxValue:=Video_Origen.RecordCount;
  Gauge1.Progress:=0;
  Video_Origen.First;
  While Not Video_Origen.EOF do
    Begin
      Video_Destino.IndexName:='';
      Video_Destino.Setkey;
      Video_Destino.Fieldbyname('Codigo_Video').AsString:=Video_Origen.Fieldbyname('Codigo_Video').AsString;
      If Video_Destino.GotoKey = True Then
        Begin
          If ((Video_Destino.Fieldbyname('Foto_Miniatura').AsString = '') OR
              (Video_Destino.Fieldbyname('Foto_Grande').AsString = '')) Then
            Begin
              Video_Destino.Edit;
              Video_Destino.Fieldbyname('Foto_Miniatura').AsString :=Video_Origen.Fieldbyname('Foto_Miniatura').AsString;
              Video_Destino.Fieldbyname('Foto_Grande').AsString :=Video_Origen.Fieldbyname('Foto_Grande').AsString;
              Video_Destino.Post;
              Video_Destino.FlushBuffers;
            end;
        end;
      Gauge1.Progress:=Gauge1.Progress+1;
      Video_Origen.Next;
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Sesion.AddPassword(Encripta('ÃÚßÚ'));
  Base.Connected:=True;
  Video_Origen.Open;
  Video_Destino.Open;
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
