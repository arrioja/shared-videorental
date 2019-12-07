unit UPromo3x2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Modulo_de_Datos, ExtCtrls, Buttons;

type
  TPromo3x2 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    IncluirBtn: TSpeedButton;
    CerrarBtn: TSpeedButton;
    Bevel2: TBevel;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure IncluirBtnClick(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure CerrarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Promo3x2: TPromo3x2;

implementation

uses Uprincipal;

{$R *.DFM}

procedure TPromo3x2.IncluirBtnClick(Sender: TObject);
begin
  Datos.Promo3x2.Edit;
  Datos.Promo3x2.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
  Datos.Promo3x2.Fieldbyname('Hora').AsDateTime:=Time;
  Datos.Promo3x2.Fieldbyname('Operador').AsString:=Usuario.Nombres+' '+Usuario.Apellidos;
  Datos.Promo3x2.Post;
  IncluirBtn.Enabled:=False;
end;

procedure TPromo3x2.DBCheckBox1Click(Sender: TObject);
begin
  IncluirBtn.Enabled:=True;
end;

procedure TPromo3x2.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPromo3x2.FormShow(Sender: TObject);
begin
  IncluirBtn.Enabled:=False;
end;

end.
