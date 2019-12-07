unit UCaja;

interface

uses
  Windows,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Buttons, OleCtrls, chartfx3,
  HeadLbl, marquee, Gradpan;

type
  TCaja = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    ChartFX1: TChartfx;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    HeadLabel7: THeadLabel;
    HeadLabel3: THeadLabel;
    HeadLabel1: THeadLabel;
    HeadLabel2: THeadLabel;
    HeadLabel4: THeadLabel;
    Bevel3: TBevel;
    Marquee1: TMarquee;
    ALQ: TLabel;
    MUL: TLabel;
    INS: TLabel;
    DEU: TLabel;
    TOT: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ALQClick(Sender: TObject);
    procedure MULDblClick(Sender: TObject);
    procedure INSDblClick(Sender: TObject);
    procedure DEUDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Caja: TCaja;

implementation

uses Uprincipal, UPedir_Clave, UModificar_Caja, MODULO_DE_DATOS;

{$R *.DFM}

procedure TCaja.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TCaja.RadioGroup1Click(Sender: TObject);
begin
  With Radiogroup1 do
    Begin
      If Itemindex = 0 then
         Begin
           ChartFx1.Chart3d:=False;
         end;
      If Itemindex = 1 then
         Begin
           ChartFx1.Chart3d:=True;
         end;
    end;
end;

procedure TCaja.FormShow(Sender: TObject);
var
  VAlquileres, VMultas, VInscripciones, VDeudas :integer;
begin
  ChartFx1.Charttype:=Bar;
  Radiogroup1.Itemindex:=1;

  VAlquileres:=0;
  VMultas:=0;
  VInscripciones:=0;
  VDeudas:=0;

  Datos.Deudas.Refresh;
  Datos.Deudas.Setkey;
  Datos.Deudas.Fieldbyname('Fecha').asstring:=Principal.Fecha_Total;
  If Datos.Deudas.Gotokey = True then
    Begin
      VDeudas:=Datos.Deudas.Fieldbyname('Cantidad').Asinteger;
    end;

  Datos.Inscripciones.Refresh;
  Datos.Inscripciones.Setkey;
  Datos.Inscripciones.Fieldbyname('Fecha').asstring:=Principal.Fecha_Total;
  If Datos.Inscripciones.Gotokey = True then
    Begin
      VInscripciones:=Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
    end;

  Datos.Multas.Refresh;
  Datos.Multas.Setkey;
  Datos.Multas.Fieldbyname('Fecha').asstring:=Principal.Fecha_Total;
  If Datos.Multas.Gotokey = True then
    Begin
      VMultas:=Datos.Multas.Fieldbyname('Cantidad').Asinteger;
    end;

  Datos.Alquileres.Refresh;
  Datos.Alquileres.Setkey;
  Datos.Alquileres.Fieldbyname('Fecha').asstring:=Principal.Fecha_Total;
  If Datos.Alquileres.Gotokey = True then
    Begin
      VAlquileres:=Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
    end;

  INS.Caption:=FormatFloat('#.##0,00',VInscripciones);
//  ALQ.Value:=VAlquileres;
//  MUL.Value:=VMultas;
//  DEU.Value:=VDeudas;
//  TOT.Value:=VInscripciones+VAlquileres+VMultas+VDeudas;


  ChartFx1.OpenDataEx(COD_VALUES,1,4);
     ChartFx1.ThisSerie:=  0;
     ChartFx1.Value[0] := VAlquileres;
     ChartFx1.Value[1] := VMultas;
     ChartFx1.Value[2] := VInscripciones;
     ChartFx1.Value[3] := VDeudas;
  ChartFx1.CloseData(COD_VALUES);
end;

procedure TCaja.ALQClick(Sender: TObject);
begin
{  Pedir_Clave.Showmodal;
  If Pedir_Clave.Modalresult = MrOK then
     Begin
       Modificar_Caja.Antiguo.Caption:=inttostr(ALQ.Value);
       Modificar_Caja.Caption:='Modificar valor de:  ALQUILER';
       Caja.Enabled:=False;
       Modificar_Caja.Show;
     end;
}end;

procedure TCaja.MULDblClick(Sender: TObject);
Begin
{  Pedir_Clave.Showmodal;
  If Pedir_Clave.Modalresult = MrOK then
     Begin
       Modificar_Caja.Antiguo.Caption:=inttostr(MUL.Value);
       Modificar_Caja.Caption:='Modificar valor de:  MULTAS';
       Caja.Enabled:=False;
       Modificar_Caja.Show;
     end;
}end;

procedure TCaja.INSDblClick(Sender: TObject);
begin
{  Pedir_Clave.Showmodal;
  If Pedir_Clave.Modalresult = MrOK then
     Begin
       Modificar_Caja.Antiguo.Caption:=inttostr(INS.Value);
       Modificar_Caja.Caption:='Modificar valor de:  INSCRIPCIONES';
       Caja.Enabled:=False;
       Modificar_Caja.Show;
     end;
}end;

procedure TCaja.DEUDblClick(Sender: TObject);
begin
{  Pedir_Clave.Showmodal;
  If Pedir_Clave.Modalresult = MrOK then
     Begin
       Modificar_Caja.Antiguo.Caption:=inttostr(DEU.Value);
       Modificar_Caja.Caption:='Modificar valor de:  DEUDAS';
       Caja.Enabled:=False;
       Modificar_Caja.Show;
     end;
}end;

end.
