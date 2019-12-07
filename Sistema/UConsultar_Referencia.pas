unit UConsultar_Referencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Numedit;

type
  TConsulta_Transaccion = class(TForm)
    GroupBox1: TGroupBox;
    CerrarBtn: TSpeedButton;
    IncluirBtn: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel1: TBevel;
    Label23: TLabel;
    Label34: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel2: TBevel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    NumEdit1: TNumEdit;
    Label36: TLabel;
    Label41: TLabel;
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
  Consulta_Transaccion: TConsulta_Transaccion;

implementation

uses MODULO_DE_DATOS;

{$R *.DFM}

procedure TConsulta_Transaccion.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

Procedure TConsulta_Transaccion.Consultar;
Begin
  Try
    Begin
      Datos.Transacciones.IndexName:='';
      Datos.Transacciones.Setkey;
      Datos.Transacciones.Fieldbyname('Referencia').AsInteger:=StrToInt(NumEdit1.Text);
      If Datos.Transacciones.GotoKey = True Then
        Begin
          Datos.TablaUsuarios.IndexName:='Cedula_Index';
          Datos.TablaUsuarios.Setkey;
          Datos.TablaUsuarios.Fieldbyname('Cedula').AsString:=Datos.Transacciones.Fieldbyname('Operador').AsString;
          If Datos.TablaUsuarios.GotoKey = True Then
            Label24.Caption:=Datos.TablaUsuarios.Fieldbyname('Nombres').AsString+' '+Datos.TablaUsuarios.Fieldbyname('Apellidos').AsString
          else
            Label24.Caption:='NO ENCONTRADO.- C.I.-: '+Datos.Transacciones.Fieldbyname('Operador').AsString;
          Label25.Caption:=Datos.Transacciones.Fieldbyname('Fecha').AsString+'  -  '+Datos.Transacciones.Fieldbyname('Hora').AsString;
          Label26.Caption:=Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString;
          Datos.Clientes.IndexName:='';
          Datos.Clientes.Setkey;
          Datos.Clientes.Fieldbyname('Codigo_Cliente').AsString:=Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString;
          If Datos.Clientes.GotoKey = True Then
            Label27.Caption:=Datos.Clientes.Fieldbyname('Nombres_Cliente').AsString+' '+Datos.Clientes.Fieldbyname('Apellidos_Cliente').AsString
          else
            Label27.Caption:='DATOS DEL CLIENTE NO ENCONTRADOS.-';
          Label28.Caption:=Datos.Transacciones.Fieldbyname('Estacion').AsString;
          Label43.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Inscripcion').AsCurrency);
          Label1.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Rebaja_Inscripcion').AsCurrency);
          Label4.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Alquiler').AsCurrency);
          Datos.TablaUsuarios.IndexName:='Cedula_Index';
          Datos.TablaUsuarios.Setkey;
          Datos.TablaUsuarios.Fieldbyname('Cedula').ASString:=Datos.Transacciones.Fieldbyname('Autoriza_Inscripcion').AsString;
          If Datos.TablaUsuarios.GotoKey = True Then
            Label35.Caption:=Datos.TablaUsuarios.Fieldbyname('Nombres').ASString+' '+Datos.TablaUsuarios.Fieldbyname('Apellidos').ASString
          else
            Label35.Caption:='';
          Label8.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Deuda_Alquiler').AsCurrency);
          Label10.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Excento_Alquiler').AsCurrency);
          Label12.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Rebaja_Alquiler').AsCurrency);
          Datos.TablaUsuarios.IndexName:='Cedula_Index';
          Datos.TablaUsuarios.Setkey;
          Datos.TablaUsuarios.Fieldbyname('Cedula').ASString:=Datos.Transacciones.Fieldbyname('Autoriza_Alquiler').AsString;
          If Datos.TablaUsuarios.GotoKey = True Then
            Label37.Caption:=Datos.TablaUsuarios.Fieldbyname('Nombres').ASString+' '+Datos.TablaUsuarios.Fieldbyname('Apellidos').ASString
          else
            Label37.Caption:='';
          Label14.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Multa').AsCurrency);
          Label16.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Deuda_Multa').AsCurrency);
          Label41.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Excento_Multa').AsCurrency);
          Label18.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Rebaja_Multa').AsCurrency);
          Datos.TablaUsuarios.IndexName:='Cedula_Index';
          Datos.TablaUsuarios.Setkey;
          Datos.TablaUsuarios.Fieldbyname('Cedula').ASString:=Datos.Transacciones.Fieldbyname('Autoriza_Multa').AsString;
          If Datos.TablaUsuarios.GotoKey = True Then
            Label38.Caption:=Datos.TablaUsuarios.Fieldbyname('Nombres').ASString+' '+Datos.TablaUsuarios.Fieldbyname('Apellidos').ASString
          else
            Label38.Caption:='';
          Label20.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Deposito').AsCurrency);
          Label22.Caption:=FormatFloat('#,##0.00',Datos.Transacciones.Fieldbyname('Rebaja_Deposito').AsCurrency);
          Datos.TablaUsuarios.IndexName:='Cedula_Index';
          Datos.TablaUsuarios.Setkey;
          Datos.TablaUsuarios.Fieldbyname('Cedula').ASString:=Datos.Transacciones.Fieldbyname('Autoriza_Deposito').AsString;
          If Datos.TablaUsuarios.GotoKey Then
            Label40.Caption:=Datos.TablaUsuarios.Fieldbyname('Nombres').ASString+' '+Datos.TablaUsuarios.Fieldbyname('Apellidos').ASString
          else
            Label40.Caption:='';
        end
      else
        Begin
          Label24.Caption:='';Label25.Caption:='';Label26.Caption:='';
          Label27.Caption:='';Label28.Caption:='';Label43.Caption:='0,00';
          Label1.Caption:='0,00';Label4.Caption:='0,00';Label35.Caption:='';
          Label8.Caption:='0,00';Label10.Caption:='0,00';Label12.Caption:='0,00';
          Label37.Caption:='';Label14.Caption:='0,00';Label16.Caption:='0,00';
          Label41.Caption:='0,00';Label18.Caption:='0,00';Label38.Caption:='';
          Label20.Caption:='0,00';Label22.Caption:='0,00';Label40.Caption:='';

          messagedlg('El número de la transacción que ha introducido, '+
                     'no se encuentra en nuestros registros, compruebe '+
                     'el número e inténtelo de nuevo.',mterror,[mbok],0);
          SpeedButton2.Enabled:=False;
        end;
    end
  Except
    On EConvertError do
      Begin
          messagedlg('El número de la transacción que ha introducido, '+
                     'no parece ser un número válido, por favor '+
                     'borrelo e introduzcalo de nuevo.',mterror,[mbok],0);
          SpeedButton2.Enabled:=False;
      end;
  end;
end;

procedure TConsulta_Transaccion.IncluirBtnClick(Sender: TObject);
begin
  Consultar;
end;

procedure TConsulta_Transaccion.NumEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key = #13 Then
    Consultar;
end;

end.
