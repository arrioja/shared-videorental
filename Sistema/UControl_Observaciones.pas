unit UControl_Observaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, MODULO_DE_DATOS, Buttons, Db, DBTables;

type
  TControl_Observaciones = class(TForm)
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Limpiar: TSpeedButton;
    Grabar: TSpeedButton;
    Cancelar: TSpeedButton;
    ABuscar: TLabel;
    SpeedButton1: TSpeedButton;
    procedure LimpiarClick(Sender: TObject);
    procedure GrabarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Control_Observaciones: TControl_Observaciones;

implementation

uses ualquilar_y_devolver;

{$R *.DFM}

procedure TControl_Observaciones.LimpiarClick(Sender: TObject);
begin
  Datos.Clientes.Edit;
  DbMemo1.Lines.Clear;
  Cancelar.Enabled:=True;
  Datos.Clientes.FieldByName('Observaciones').Assign(Dbmemo1.Lines);
end;

procedure TControl_Observaciones.GrabarClick(Sender: TObject);
begin
  If Datos.Clientes.State = dsEdit Then
     Begin
       Datos.Clientes.Post;
       Datos.Clientes.FlushBuffers;
       Datos.Clientes.Refresh;
       DbMEmo1.LoadMemo;
       Cancelar.Enabled:=False;
     end;
end;

procedure TControl_Observaciones.CancelarClick(Sender: TObject);
begin
  If Datos.Clientes.State = dsEdit Then
     Begin
       Datos.Clientes.Cancel;
       Datos.Clientes.Refresh;
       Cancelar.Enabled:=False;
       DbMEmo1.LoadMemo;
     end
  else
     Begin
       DbMEmo1.LoadMemo;
     end;
end;

procedure TControl_Observaciones.SalirClick(Sender: TObject);
begin
  If Datos.Clientes.State = dsEdit Then
     Begin
       Datos.Clientes.Cancel;
       Datos.Clientes.Refresh;
       Cancelar.Enabled:=False;
       DbMEmo1.LoadMemo;
     end
  else
     Begin
       DbMEmo1.LoadMemo;
     end;
  Close;
end;

procedure TControl_Observaciones.DBMemo1Change(Sender: TObject);
begin
  Cancelar.Enabled:=True;
end;

procedure TControl_Observaciones.FormShow(Sender: TObject);
begin
  Datos.Clientes.IndexName:='';
  Datos.Clientes.Setkey;
  Datos.Clientes.Fieldbyname('Codigo_Cliente').Asstring:=ABuscar.Caption;
  If Datos.Clientes.Gotokey = True Then
    Begin
      Dbmemo1.Setfocus;
      Cancelar.Enabled:=False;
    end
  else
    Begin
      Showmessage('El Código del Cliente no ga sido encontrado');
    end;
end;

procedure TControl_Observaciones.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #27 Then Close;
end;

end.
