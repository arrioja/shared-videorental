unit uEstadisticas_de_Cliente;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, OleCtrls, ExtCtrls, DB, DBTables, chartfx3;

type
  TEstadisticas_de_Cliente = class(TForm)
    ChartFX1: TChartFX;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Bevel2: TBevel;
    GroupBox2: TGroupBox;
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
    Bevel3: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Estadisticas_de_Cliente: TEstadisticas_de_Cliente;
  

implementation

uses Uprincipal, MODULO_DE_DATOS;

{$R *.DFM}

procedure TEstadisticas_de_Cliente.BitBtn1Click(Sender: TObject);
begin
  Principal.Enabled:=True;
  Close;
end;

procedure TEstadisticas_de_Cliente.FormShow(Sender: TObject);
var
  No_Multados,Sin_Alquiler,Con_alquiler,Multados,Total:integer;
begin

  ChartFx1.Charttype:=Bar;
  Combobox1.Itemindex:=1;
  Radiogroup1.Itemindex:=1;

  Sin_Alquiler:=0;
  Con_Alquiler:=0;
  Multados:=0;
  No_Multados:=0;
  Total:=0;

  Datos.Clientes.Refresh;
  Datos.Clientes.First;
  While not(Datos.Clientes.Eof) do
    Begin
      If Datos.Clientes.Fieldbyname('Tiene_Pelicula').asboolean = True then
        Begin
          Con_Alquiler:=Con_Alquiler+1;
          Total:=Total+1;
        end;
      If (Datos.Clientes.Fieldbyname('Cliente_Multado').asboolean = True)      and
         (Datos.Clientes.Fieldbyname('Tiene_Pelicula').asboolean = True) then
        Begin
          Multados:=Multados+1;
        end;
      If (Datos.Clientes.Fieldbyname('Cliente_Multado').asboolean = False)      and
         (Datos.Clientes.Fieldbyname('Tiene_Pelicula').asboolean = True) then
        Begin
          No_Multados:=No_Multados+1;
        end;
      If Datos.Clientes.Fieldbyname('Tiene_Pelicula').asboolean = False then
        Begin
          Sin_Alquiler:=Sin_Alquiler+1;
          Total:=Total+1;
        end;
      Datos.Clientes.Moveby(1);
    end;
  ChartFx1.OpenDataEx(COD_VALUES,1,4);
     ChartFx1.ThisSerie:=  0;
     ChartFx1.Value[0] := Sin_Alquiler;
     ChartFx1.Value[1] := Con_Alquiler;
     ChartFx1.Value[2] := Multados;
     ChartFx1.Value[3] := No_Multados;
  ChartFx1.CloseData(COD_VALUES);

  Label6.Caption:=inttostr((Con_Alquiler*100)div Total);
  Label8.Caption:=inttostr((Sin_Alquiler*100)div Total);
  Label10.Caption:=inttostr((Multados*100)div Total);
  Label13.Caption:=inttostr(((No_Multados)*100)div Total);

  Label1.Caption:=inttostr(Total);
end;

procedure TEstadisticas_de_Cliente.ComboBox1Change(Sender: TObject);
begin
  With Combobox1 do
   Begin
     If Itemindex = 0 then
       Begin
         ChartFx1.Charttype:=Area;
       end;
     If Itemindex = 1 then
       Begin
         ChartFx1.Charttype:=Bar;
       end;
     If Itemindex = 2 then
       Begin
         ChartFx1.Charttype:=Lines;
       end;
     If Itemindex = 3 then
       Begin
         ChartFx1.Charttype:=Spline;
       end;
     If Itemindex = 4 then
       Begin
         ChartFx1.Charttype:=Pie;
       end;
     If Itemindex = 5 then
       Begin
         ChartFx1.Charttype:=Mark;
       end;
   end;
end;

procedure TEstadisticas_de_Cliente.RadioGroup1Click(Sender: TObject);
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

end.
