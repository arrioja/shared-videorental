unit UConsulta_Factura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Numedit;

type
  TConsulta_Factura = class(TForm)
    GroupBox1: TGroupBox;
    CerrarBtn: TSpeedButton;
    IncluirBtn: TSpeedButton;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel1: TBevel;
    Label23: TLabel;
    Bevel3: TBevel;
    Bevel6: TBevel;
    Bevel2: TBevel;
    NumEdit1: TNumEdit;
    procedure CerrarBtnClick(Sender: TObject);
    procedure IncluirBtnClick(Sender: TObject);
    Procedure Consultar;
    procedure NumEdit1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Consulta_Factura: TConsulta_Factura;

implementation

uses MODULO_DE_DATOS;

{$R *.DFM}

procedure TConsulta_Factura.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

Procedure TConsulta_Factura.Consultar;
Begin
  Try
    Begin
      Datos.Facturas.IndexName:='';
      Datos.Facturas.Setkey;
      Datos.Facturas.Fieldbyname('Num_Reg').AsInteger:=StrToInt(NumEdit1.Text);
      If Datos.Facturas.GotoKey = True Then
        Begin
          Datos.TablaUsuarios.IndexName:='Cedula_Index';
          Datos.TablaUsuarios.Setkey;
          Datos.TablaUsuarios.Fieldbyname('Cedula').AsString:=Datos.Facturas.Fieldbyname('Operador').AsString;
          If Datos.TablaUsuarios.GotoKey = True Then
            Label24.Caption:=Datos.TablaUsuarios.Fieldbyname('Nombres').AsString+' '+Datos.TablaUsuarios.Fieldbyname('Apellidos').AsString
          else
            Label24.Caption:='NO ENCONTRADO.- C.I.-: '+Datos.Facturas.Fieldbyname('Operador').AsString;
          Label25.Caption:=Datos.Facturas.Fieldbyname('Fecha').AsString+'  -  '+Datos.Facturas.Fieldbyname('Hora').AsString;
          Label26.Caption:=Datos.Facturas.Fieldbyname('Cliente').AsString;
          Datos.Clientes.IndexName:='';
          Datos.Clientes.Setkey;
          Datos.Clientes.Fieldbyname('Codigo_Cliente').AsString:=Datos.Facturas.Fieldbyname('Cliente').AsString;
          If Datos.Clientes.GotoKey = True Then
            Label27.Caption:=Datos.Clientes.Fieldbyname('Nombres_Cliente').AsString+' '+Datos.Clientes.Fieldbyname('Apellidos_Cliente').AsString
          else
            Label27.Caption:='DATOS DEL CLIENTE NO ENCONTRADOS.-';
          Label4.Caption:=FormatFloat('#,##0.00',Datos.Facturas.Fieldbyname('Alquiler').AsCurrency);
          Label8.Caption:=FormatFloat('#,##0.00',Datos.Facturas.Fieldbyname('Deuda_Alquiler').AsCurrency);
          Label14.Caption:=FormatFloat('#,##0.00',Datos.Facturas.Fieldbyname('Multa').AsCurrency);
          Label16.Caption:=FormatFloat('#,##0.00',Datos.Facturas.Fieldbyname('Deuda_Multa').AsCurrency);
        end
      else
        Begin
          Label24.Caption:='';Label25.Caption:='';Label26.Caption:='';
          Label27.Caption:='';Label4.Caption:='0,00';
          Label8.Caption:='0,00';
          Label14.Caption:='0,00';Label16.Caption:='0,00';

          messagedlg('El número de la factura que ha introducido, '+
                     'no se encuentra en nuestros registros, compruebe '+
                     'el número e inténtelo de nuevo.',mterror,[mbok],0);
        end;
    end
  Except
    On EConvertError do
      Begin
          messagedlg('El número de la factura que ha introducido, '+
                     'no parece ser un número válido, por favor '+
                     'borrelo e introduzcalo de nuevo.',mterror,[mbok],0);
      end;
  end;
end;

procedure TConsulta_Factura.IncluirBtnClick(Sender: TObject);
begin
  Consultar;
end;

procedure TConsulta_Factura.NumEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key = #13 Then
    Consultar;
end;

end.
