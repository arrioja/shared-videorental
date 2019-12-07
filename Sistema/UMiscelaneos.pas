unit UMiscelaneos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Modulo_de_Datos, ExtCtrls, Buttons, Mask, Spin;

type
  TMiscelaneos = class(TForm)
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    IncluirBtn: TSpeedButton;
    CerrarBtn: TSpeedButton;
    Bevel2: TBevel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    CheckBox1: TCheckBox;
    MaskEdit1: TMaskEdit;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    Label4: TLabel;
    procedure IncluirBtnClick(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure CerrarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Miscelaneos: TMiscelaneos;

implementation

uses Uprincipal;

{$R *.DFM}

procedure TMiscelaneos.IncluirBtnClick(Sender: TObject);
begin
  Datos.TablaMiscelaneos.Edit;
  Datos.TablaMiscelaneos.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
  Datos.TablaMiscelaneos.Fieldbyname('Hora').AsDateTime:=Time;
  Datos.TablaMiscelaneos.Fieldbyname('Operador').AsString:=Usuario.Nombres+' '+Usuario.Apellidos;
  If CheckBox1.Checked = False Then
    Datos.TablaMiscelaneos.Fieldbyname('Hora_Buzon').AsString:=''
  else
    Datos.TablaMiscelaneos.Fieldbyname('Hora_Buzon').AsString:=MaskEdit1.Text;
  Datos.TablaMiscelaneos.Fieldbyname('Dias_Estreno').AsInteger:=SpinEdit1.Value;
  Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger:=SpinEdit2.Value;
  Datos.TablaMiscelaneos.Post;
  IncluirBtn.Enabled:=False;
end;

procedure TMiscelaneos.DBCheckBox1Click(Sender: TObject);
begin
  IncluirBtn.Enabled:=True;
end;

procedure TMiscelaneos.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMiscelaneos.FormShow(Sender: TObject);
begin
  IncluirBtn.Enabled:=False;
  SpinEdit1.Value:=Datos.TablaMiscelaneos.Fieldbyname('Dias_Estreno').AsInteger;
  Spinedit2.Value:=Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger;
  If Datos.TablaMiscelaneos.Fieldbyname('Hora_Buzon').AsString = '' Then
    Begin
      CheckBox1.Checked:=False;
      MaskEdit1.Text:='';
      MaskEdit1.Enabled:=False;
    end
  else
    Begin
      CheckBox1.Checked:=True;
      MaskEdit1.Text:=Datos.TablaMiscelaneos.Fieldbyname('Hora_Buzon').AsString;
      MaskEdit1.Enabled:=True
    end
end;

procedure TMiscelaneos.CheckBox1Click(Sender: TObject);
begin
  If CheckBox1.Checked = True Then
    Begin
      MaskEdit1.Enabled:=True;
    end
  else
    Begin
      MaskEdit1.Enabled:=False;
      MaskEdit1.Text:='';
    end;
  IncluirBtn.Enabled:=True;
end;

procedure TMiscelaneos.SpinEdit1Change(Sender: TObject);
begin
  IncluirBtn.Enabled:=True;
end;

end.
