unit Unumero_de_dias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls, Buttons;

type
  TNumero_de_Dias = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpinEdit1: TSpinEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Numero_de_Dias: TNumero_de_Dias;

implementation

uses ualquilar_y_devolver;

{$R *.DFM}

procedure TNumero_de_Dias.FormShow(Sender: TObject);
begin
  Spinedit1.Value:=1;
end;

end.
