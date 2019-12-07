unit UConfigurar_Empresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ExtCtrls;

type
  TConfigurar_Empresa = class(TForm)
    IncluirBtn: TSpeedButton;
    CerrarBtn: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    MaskEdit1: TMaskEdit;
    Edit7: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel2: TBevel;
    procedure CerrarBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure IncluirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Configurar_Empresa: TConfigurar_Empresa;

implementation

uses MODULO_DE_DATOS, Uprincipal;

{$R *.DFM}

procedure TConfigurar_Empresa.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TConfigurar_Empresa.FormShow(Sender: TObject);
begin
  Datos.TablaUsuarios.IndexName:='Cedula_Index';
  Datos.TablaUsuarios.Setkey;
  Datos.TablaUsuarios.Fieldbyname('Cedula').AsString:=Datos.Empresa.Fieldbyname('Operador').AsString;
  If Datos.TablaUsuarios.GotoKey = True Then
    Label12.Caption:=Datos.TablaUsuarios.Fieldbyname('Nombres').AsString+' '+Datos.TablaUsuarios.Fieldbyname('Apellidos').AsString
  else
    Label12.Caption:='';
  Label13.Caption:=Datos.Empresa.Fieldbyname('Fecha').AsString;
  Label14.Caption:=Datos.Empresa.Fieldbyname('Hora').AsString;
  Edit1.Text:=Datos.Empresa.Fieldbyname('Nombre_Empresa').AsString;
  Edit2.Text:=Datos.Empresa.Fieldbyname('RIF').AsString;
  Edit3.Text:=Datos.Empresa.Fieldbyname('NIT').AsString;
  Edit4.Text:=Datos.Empresa.Fieldbyname('Sucursal').AsString;
  Edit5.Text:=Datos.Empresa.Fieldbyname('Direccion').AsString;
  Edit6.Text:=Datos.Empresa.Fieldbyname('Pie_1').AsString;
  Edit7.Text:=Datos.Empresa.Fieldbyname('Pie_2').AsString;
  MaskEdit1.Text:=Datos.Empresa.Fieldbyname('Telefono').AsString;
  Edit1.Setfocus;
end;

procedure TConfigurar_Empresa.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TConfigurar_Empresa.IncluirBtnClick(Sender: TObject);
Var
  KK,PP,XX:Integer;
  ST,ST2:String;
begin
  St:='';St2:='';
  KK:=Length(Edit6.Text);
  PP:=(40-KK) div 2;
  For XX:=1 to PP do
    St:=St+' ';
  St:=St+Edit6.Text;

  KK:=Length(Edit7.Text);
  PP:=(40-KK) div 2;
  For XX:=1 to PP do
    St2:=St2+' ';
  St2:=St2+Edit7.Text;

  Datos.Empresa.Edit;
  Datos.Empresa.Fieldbyname('Operador').AsString:=Usuario.Cedula;
  Datos.Empresa.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
  Datos.Empresa.Fieldbyname('Hora').AsDateTime:=Time;
  Datos.Empresa.Fieldbyname('Nombre_Empresa').AsString:=Edit1.Text;
  Datos.Empresa.Fieldbyname('RIF').AsString:=Edit2.Text;
  Datos.Empresa.Fieldbyname('NIT').AsString:=Edit3.Text;
  Datos.Empresa.Fieldbyname('Sucursal').AsString:=Edit4.Text;
  Datos.Empresa.Fieldbyname('Direccion').AsString:=Edit5.Text;
  Datos.Empresa.Fieldbyname('Pie_1').AsString:=ST;
  Datos.Empresa.Fieldbyname('Pie_2').AsString:=ST2;
  Datos.Empresa.Fieldbyname('Telefono').AsString:=MaskEdit1.Text;
  Datos.Empresa.Post;
  Close;
end;

end.
