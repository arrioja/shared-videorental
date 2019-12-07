unit UCierre_de_Caja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons, Gauges, CurrEdit, Printers;

type
    Mala_Fecha = Class(Exception);
    Mal_Banco  = Class(Exception);
    Mala_Planilla = Class(Exception);
    Mal_Deposito = Class(Exception);

  TCierre_de_Caja = class(TForm)
    GroupBox1: TGroupBox;
    DateEdit1: TDateEdit;
    IncluirBtn: TSpeedButton;
    Bevel2: TBevel;
    CerrarBtn: TSpeedButton;
    GroupBox2: TGroupBox;
    Bevel8: TBevel;
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
    Bevel12: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label13: TLabel;
    Bevel1: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel9: TBevel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    GroupBox3: TGroupBox;
    Bevel13: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Bevel21: TBevel;
    Bevel22: TBevel;
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
    Label34: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Gauge1: TGauge;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    CurrencyEdit1: TCurrencyEdit;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    PrintDialog1: TPrintDialog;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure CerrarBtnClick(Sender: TObject);
    procedure IncluirBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CurrencyEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cierre_de_Caja: TCierre_de_Caja;
  Re_Adicional,Afiliaciones,Depositos,Alquiler,Adicionales,Creditos,Retirados,Debe,Haber,
  Exo_Alquiler,Exo_Adicional,Re_Inscripcion,RE_ALquiler,ReAdicional,Re_Deposito:Real;

implementation

uses Uprincipal, MODULO_DE_DATOS, UImprime_General_Caja,
  UImprime_Detalle_Caja;

{$R *.DFM}
Function  Comprueba(Cadena:String):Boolean; Far; External 'Control.dll';
Procedure Muestra_Error(Muestra,Verbo:String); Far; External 'Control.dll';


procedure TCierre_de_Caja.FormShow(Sender: TObject);
begin
  DateEdit1.Text:=Principal.Fecha_Total;
  DateEdit1.Setfocus;
end;

procedure TCierre_de_Caja.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCierre_de_Caja.IncluirBtnClick(Sender: TObject);
begin
  Try
    Begin
      Try
        StrToDate(DateEdit1.Text);
      Except
        On EConvertError do
          Raise Mala_Fecha.Create(' ');
      end;

       if Comprueba(Combobox1.Text) = False then
          Raise Mal_Banco.create(' ');

       if Comprueba(Edit1.Text) = False then
          Raise Mal_Banco.create(' ');

      Try
        StrToFloat(CurrencyEdit1.Text);
      Except
        On EConvertError do
          Raise Mal_Deposito.Create(' ');
      end;

      Afiliaciones:=0;Depositos:=0;Alquiler:=0;Adicionales:=0;Creditos:=0;
      Retirados:=0;Exo_Alquiler:=0;Exo_Adicional:=0;Re_Inscripcion:=0;
      RE_ALquiler:=0;ReAdicional:=0;Re_Deposito:=0;Debe:=0;Haber:=0;
      Re_Adicional:=0;
      Datos.Query_General.Sql.Clear;
      Datos.Query_General.Sql.Add('Select * from Transacciones Where (Fecha = :F1)');
      Datos.Query_General.ParamByName('F1').AsDateTime:=DateEdit1.Date;
      Datos.Query_General.Open;
      Gauge1.MaxValue:=Datos.Query_General.RecordCount;
      Gauge1.PRogress:=0;
      Datos.Query_General.First;
      While Not Datos.Query_General.EOF do
        Begin
          Afiliaciones:=Afiliaciones+Datos.Query_General.FieldByName('Inscripcion').AsCurrency;
          Depositos:=Depositos+Datos.Query_General.FieldByName('Deposito').AsCurrency;
          Alquiler:=Alquiler+Datos.Query_General.FieldByName('Alquiler').AsCurrency;
          Adicionales:=Adicionales+Datos.Query_General.FieldByName('Multa').AsCurrency;
          Creditos:=Creditos+Datos.Query_General.FieldByName('Deuda_Alquiler').AsCurrency+Datos.Query_General.FieldByName('Deuda_Multa').AsCurrency;
          Retirados:=Retirados+Datos.Query_General.FieldByName('Retiro').AsCurrency;
          Exo_Alquiler:=Exo_Alquiler+Datos.Query_General.FieldByName('Excento_Alquiler').AsCurrency;
          Exo_Adicional:=Exo_Adicional+Datos.Query_General.FieldByName('Excento_Multa').AsCurrency;
          Re_Inscripcion:=Re_Inscripcion+Datos.Query_General.FieldByName('Rebaja_Inscripcion').AsCurrency;
          RE_ALquiler:=RE_ALquiler+Datos.Query_General.FieldByName('Rebaja_Alquiler').AsCurrency;
          Re_Adicional:=ReAdicional+Datos.Query_General.FieldByName('Rebaja_Multa').AsCurrency;
          Re_Deposito:=Re_Deposito+Datos.Query_General.FieldByName('Rebaja_Deposito').AsCurrency;

          Gauge1.Progress:=Gauge1.Progress+1;
          Datos.Query_General.Next;
        end;
      Debe:=Debe+Afiliaciones+Depositos+Alquiler+Adicionales+Creditos;
      Haber:=Haber+Retirados+CurrencyEdit1.Value;
      Label1.Caption:=FormatFloat('#,##0.00',Afiliaciones);
      Label2.Caption:=FormatFloat('#,##0.00',Depositos);
      Label3.Caption:=FormatFloat('#,##0.00',Alquiler);
      Label4.Caption:=FormatFloat('#,##0.00',Adicionales);
      Label5.Caption:=FormatFloat('#,##0.00',Creditos);
      Label14.Caption:=FormatFloat('#,##0.00',Retirados);
      Label15.Caption:=FormatFloat('#,##0.00',CurrencyEdit1.Value);
      Label24.Caption:=FormatFloat('#,##0.00',Exo_Alquiler);
      Label25.Caption:=FormatFloat('#,##0.00',Exo_Adicional);
      Label26.Caption:=FormatFloat('#,##0.00',Re_Inscripcion);
      Label27.Caption:=FormatFloat('#,##0.00',Re_Alquiler);
      Label28.Caption:=FormatFloat('#,##0.00',Re_Adicional);
      Label43.Caption:=FormatFloat('#,##0.00',Re_Deposito);
      Label23.Caption:=FormatFloat('#,##0.00',Debe);
      Label22.Caption:=FormatFloat('#,##0.00',Haber);
      SpeedButton1.Enabled:=True;
      SpeedButton2.Enabled:=True;
      SpeedButton3.Enabled:=True;
      SpeedButton4.Enabled:=True;
    end
  Except
    On Mala_Fecha do
      Begin
        SpeedButton1.Enabled:=False;
        SpeedButton2.Enabled:=False;
        SpeedButton3.Enabled:=False;
        SpeedButton4.Enabled:=False;
        messagedlg('La Fecha que ha escogido para el cierre diario '+
                   'es incorrecta, la misma debe ser del tipo: '+
                   'dd/mm/aaaa; por favor corríjala para poder continuar.',mterror,[mbok],0);
        DateEdit1.Setfocus;
      end;
    On Mal_Banco do
      Begin
        SpeedButton1.Enabled:=False;
        SpeedButton2.Enabled:=False;
        SpeedButton3.Enabled:=False;
        SpeedButton4.Enabled:=False;
        messagedlg('Debe escoger por lo menos una entidad bancaria de la '+
                   'lista, si la entidad que desea no se encuentra listada, '+
                   'puede escribirla por si mismo.',mterror,[mbok],0);
        Combobox1.Setfocus;
      end;
    On Mala_Planilla do
      Begin
        SpeedButton1.Enabled:=False;
        SpeedButton2.Enabled:=False;
        SpeedButton3.Enabled:=False;
        SpeedButton4.Enabled:=False;
        messagedlg('Todo comprobante de depósito debe tener un número válido'+
                   'por favor coloque ese número para poder continuar.',mterror,[mbok],0);
        Edit1.Setfocus;
      end;
    On Mal_Deposito do
      Begin
        SpeedButton1.Enabled:=False;
        SpeedButton2.Enabled:=False;
        SpeedButton3.Enabled:=False;
        SpeedButton4.Enabled:=False;
        messagedlg('El monto del depósito es inválido, debe colocar un '+
                   'monto válido para poder continuar.',mterror,[mbok],0);
        CurrencyEdit1.Setfocus;
      end;
  end;
end;

procedure TCierre_de_Caja.SpeedButton1Click(Sender: TObject);
begin
  if (printdialog1.execute) then
    begin
      Try
        Begin
          Imprime_General_Caja:=TImprime_General_Caja.Create(Self);
          Imprime_General_Caja.QrLabel12.Caption:=formatDateTime('dddd, d,',DateEdit1.Date)+' de '+formatDateTime('mmmm',DateEdit1.Date)+' de '+formatDateTime('yyyy.',DateEdit1.Date);
          Imprime_General_Caja.QrLabel6.Caption:='Cierre de Caja .-   '+Datos.Empresa.Fieldbyname('Nombre_Empresa').AsString;
          Imprime_General_Caja.QrLabel35.Caption:='R.I.F.- '+Datos.Empresa.Fieldbyname('RIF').AsString+'     '+'N.I.T.- '+Datos.Empresa.Fieldbyname('NIT').AsString;
          Imprime_General_Caja.Q1.Caption:=FormatFloat('#,##0.00',Afiliaciones);
          Imprime_General_Caja.Q2.Caption:=FormatFloat('#,##0.00',Depositos);
          Imprime_General_Caja.Q3.Caption:=FormatFloat('#,##0.00',Alquiler);
          Imprime_General_Caja.Q4.Caption:=FormatFloat('#,##0.00',Adicionales);
          Imprime_General_Caja.QrLabel9.Caption:=FormatFloat('#,##0.00',Creditos);
          Imprime_General_Caja.Q5.Caption:=FormatFloat('#,##0.00',Retirados);
          Imprime_General_Caja.Q6.Caption:=FormatFloat('#,##0.00',CurrencyEdit1.Value);
          Imprime_General_Caja.QrLabel30.Caption:=FormatFloat('#,##0.00',Debe);
          Imprime_General_Caja.QrLabel34.Caption:=FormatFloat('#,##0.00',Haber);
          Imprime_General_Caja.QrLabel27.Caption:=FormatFloat('#,##0.00',Exo_Alquiler);
          Imprime_General_Caja.QrLabel20.Caption:=FormatFloat('#,##0.00',Exo_Adicional);
          Imprime_General_Caja.QrLabel24.Caption:=FormatFloat('#,##0.00',Re_Alquiler);
          Imprime_General_Caja.QrLabel25.Caption:=FormatFloat('#,##0.00',Re_Adicional);
          Imprime_General_Caja.QrLabel8.Caption:=FormatFloat('#,##0.00',Re_Inscripcion);
          Imprime_General_Caja.QrLabel26.Caption:=FormatFloat('#,##0.00',Re_Deposito);
          Imprime_General_Caja.QrLabel38.Caption:=Combobox1.Text;
          Imprime_General_Caja.QrLabel40.Caption:=Edit1.Text;
          Imprime_General_Caja.QrLabel10.Caption:=Usuario.Nombres+' '+Usuario.Apellidos;

          Imprime_General_Caja.Reporte.PrinterSettings.PrinterIndex:=Printer.printerindex;
          Imprime_General_Caja.Reporte.PrinterSettings.copies:=printdialog1.copies;
          Imprime_General_Caja.Reporte.print;
        end
      Finally
        Begin
          Imprime_General_Caja.Free;
          Imprime_General_Caja:=Nil;
          Printer.PrinterIndex:=-1;
        end;
      end;
    end;
end;

procedure TCierre_de_Caja.SpeedButton2Click(Sender: TObject);
begin
  if (printdialog1.execute) then
    begin
      Try
        Begin
          Imprime_Detalle_Caja:=TImprime_Detalle_Caja.Create(Self);
          Imprime_Detalle_Caja.QrLabel6.Caption:='Reporte detallado de transacciones diarias en '+Datos.Empresa.Fieldbyname('Nombre_Empresa').AsString;
          Imprime_Detalle_Caja.QrLabel10.Caption:='R.I.F.- '+Datos.Empresa.Fieldbyname('RIF').AsString+'     '+'N.I.T.- '+Datos.Empresa.Fieldbyname('NIT').AsString;;
          Imprime_Detalle_Caja.QrLabel11.Caption:='Reporte del día: '+formatDateTime('dddd, d,',DateEdit1.Date)+' de '+formatDateTime('mmmm',DateEdit1.Date)+' de '+formatDateTime('yyyy.',DateEdit1.Date);
          Imprime_Detalle_Caja.QrLabel3.Caption:=Imprime_Detalle_Caja.QrLabel3.Caption+'     Impreso por: '+Usuario.Nombres+' '+Usuario.Apellidos;
          Imprime_Detalle_Caja.Reporte.PrinterSettings.PrinterIndex:=Printer.printerindex;
          Imprime_Detalle_Caja.Reporte.PrinterSettings.copies:=printdialog1.copies;
          Imprime_Detalle_Caja.Reporte.Print;
        end
      Finally
        Begin
          Imprime_Detalle_Caja.Free;
          Imprime_Detalle_Caja:=Nil;
          Printer.PrinterIndex:=-1;
        end;
      end;
    end;
end;

procedure TCierre_de_Caja.DateEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If KEy = #13 Then
    Begin
      Combobox1.SetFocus;
      Key:=#3;
    end;
end;

procedure TCierre_de_Caja.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If KEy = #13 Then
    Begin
      CurrencyEdit1.SetFocus;
      Key:=#3;
    end;
end;

procedure TCierre_de_Caja.CurrencyEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If KEy = #13 Then
    Begin
      Edit1.SetFocus;
      Key:=#3;
    end;
end;

procedure TCierre_de_Caja.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If KEy = #13 Then
    Begin
      DateEdit1.SetFocus;
      Key:=#3;
    end;
end;

procedure TCierre_de_Caja.SpeedButton3Click(Sender: TObject);
begin
  Try
    Begin
      Imprime_General_Caja:=TImprime_General_Caja.Create(Self);
      Imprime_General_Caja.QrLabel12.Caption:=formatDateTime('dddd, d,',DateEdit1.Date)+' de '+formatDateTime('mmmm',DateEdit1.Date)+' de '+formatDateTime('yyyy.',DateEdit1.Date);
      Imprime_General_Caja.QrLabel6.Caption:='Cierre de Caja .-   '+Datos.Empresa.Fieldbyname('Nombre_Empresa').AsString;
      Imprime_General_Caja.QrLabel35.Caption:='R.I.F.- '+Datos.Empresa.Fieldbyname('RIF').AsString+'     '+'N.I.T.- '+Datos.Empresa.Fieldbyname('NIT').AsString;
      Imprime_General_Caja.Q1.Caption:=FormatFloat('#,##0.00',Afiliaciones);
      Imprime_General_Caja.Q2.Caption:=FormatFloat('#,##0.00',Depositos);
      Imprime_General_Caja.Q3.Caption:=FormatFloat('#,##0.00',Alquiler);
      Imprime_General_Caja.Q4.Caption:=FormatFloat('#,##0.00',Adicionales);
      Imprime_General_Caja.QrLabel9.Caption:=FormatFloat('#,##0.00',Creditos);
      Imprime_General_Caja.Q5.Caption:=FormatFloat('#,##0.00',Retirados);
      Imprime_General_Caja.Q6.Caption:=FormatFloat('#,##0.00',CurrencyEdit1.Value);
      Imprime_General_Caja.QrLabel30.Caption:=FormatFloat('#,##0.00',Debe);
      Imprime_General_Caja.QrLabel34.Caption:=FormatFloat('#,##0.00',Haber);
      Imprime_General_Caja.QrLabel27.Caption:=FormatFloat('#,##0.00',Exo_Alquiler);
      Imprime_General_Caja.QrLabel20.Caption:=FormatFloat('#,##0.00',Exo_Adicional);
      Imprime_General_Caja.QrLabel24.Caption:=FormatFloat('#,##0.00',Re_Alquiler);
      Imprime_General_Caja.QrLabel25.Caption:=FormatFloat('#,##0.00',Re_Adicional);
      Imprime_General_Caja.QrLabel8.Caption:=FormatFloat('#,##0.00',Re_Inscripcion);
      Imprime_General_Caja.QrLabel26.Caption:=FormatFloat('#,##0.00',Re_Deposito);
      Imprime_General_Caja.QrLabel38.Caption:=Combobox1.Text;
      Imprime_General_Caja.QrLabel40.Caption:=Edit1.Text;
      Imprime_General_Caja.QrLabel10.Caption:=Usuario.Nombres+' '+Usuario.Apellidos;
      Imprime_General_Caja.Reporte.Preview;
    end
  Finally
    Begin
      Imprime_General_Caja.Free;
      Imprime_General_Caja:=Nil;
    end;
  end;

end;

procedure TCierre_de_Caja.SpeedButton4Click(Sender: TObject);
begin
  Try
    Begin
      Imprime_Detalle_Caja:=TImprime_Detalle_Caja.Create(Self);
      Imprime_Detalle_Caja.QrLabel6.Caption:='Reporte detallado de transacciones diarias en '+Datos.Empresa.Fieldbyname('Nombre_Empresa').AsString;
      Imprime_Detalle_Caja.QrLabel10.Caption:='R.I.F.- '+Datos.Empresa.Fieldbyname('RIF').AsString+'     '+'N.I.T.- '+Datos.Empresa.Fieldbyname('NIT').AsString;;
      Imprime_Detalle_Caja.QrLabel11.Caption:='Reporte del día: '+formatDateTime('dddd, d,',DateEdit1.Date)+' de '+formatDateTime('mmmm',DateEdit1.Date)+' de '+formatDateTime('yyyy.',DateEdit1.Date);
      Imprime_Detalle_Caja.QrLabel3.Caption:=Imprime_Detalle_Caja.QrLabel3.Caption+'     Impreso por: '+Usuario.Nombres+' '+Usuario.Apellidos;
      Imprime_Detalle_Caja.Reporte.Preview;
    end
  Finally
    Begin
      Imprime_Detalle_Caja.Free;
      Imprime_Detalle_Caja:=Nil;
    end;
  end;
end;

end.
