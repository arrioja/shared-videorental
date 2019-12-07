unit URespaldar_A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, FileCtrl;

type
  TRespaldar_A = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    GroupBox2: TGroupBox;
    DriveComboBox1: TDriveComboBox;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel4: TBevel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Respaldar_A: TRespaldar_A;

implementation

{$R *.DFM}

procedure TRespaldar_A.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TRespaldar_A.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Datos.Clientes.Active:=True;
  Datos.Mayores.Active:=True;
  Datos.Menores.Active:=True;
  Datos.Cheques.Active:=True;
  Datos.Tarjetas.Active:=True;
  Datos.Videos.Active:=True;
  Datos.Historia.Active:=True;
  Datos.Total.Active:=True;
  Datos.Debe.Active:=True;
  Datos.Registro.Active:=True;
  Datos.Multas.Active:=True;
  Datos.Inscripciones.Active:=True;
  Datos.Alquileres.Active:=True;
  Datos.Deudas.Active:=True;
  Principal.Enabled:=True;
end;

procedure TRespaldar_A.FormShow(Sender: TObject);
begin
  Datos.Clientes.Active:=False;
  Datos.Mayores.Active:=False;
  Datos.Menores.Active:=False;
  Datos.Cheques.Active:=False;
  Datos.Tarjetas.Active:=False;
  Datos.Videos.Active:=False;
  Datos.Historia.Active:=False;
  Datos.Total.Active:=False;
  Datos.Debe.Active:=False;
  Datos.Registro.Active:=False;
  Datos.Multas.Active:=False;
  Datos.Inscripciones.Active:=False;
  Datos.Alquileres.Active:=False;
  Datos.Deudas.Active:=False;
end;

end.
