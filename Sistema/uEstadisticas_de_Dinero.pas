unit uEstadisticas_de_Dinero;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, OleCtrls, ExtCtrls, DB, DBTables, chartfx3, marquee,
  Printers;

type
  TEstadisticas_de_Dinero = class(TForm)
    ChartFX1: TChartFX;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox3: TComboBox;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Bevel5: TBevel;
    Marquee1: TMarquee;
    ImprimirBtn: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Estadisticas_de_Dinero: TEstadisticas_de_Dinero;
  Anio, Mesio, Dia: Word;
  Fecha_obtenida:TDateTime;
  

implementation

uses Uprincipal, MODULO_DE_DATOS;

{$R *.DFM}

procedure TEstadisticas_de_Dinero.BitBtn1Click(Sender: TObject);
begin
  Principal.Enabled:=True;
  Close;
end;

procedure TEstadisticas_de_Dinero.BitBtn2Click(Sender: TObject);
var
  Valor_Enero1, Valor_Febrero1, Valor_Marzo1, Valor_Abril1,
  Valor_Mayo1, Valor_Junio1, Valor_Julio1, Valor_Agosto1, Valor_Septiembre1,
  Valor_Octubre1, Valor_Noviembre1, Valor_Diciembre1: integer;

  Valor_Enero2, Valor_Febrero2, Valor_Marzo2, Valor_Abril2,
  Valor_Mayo2, Valor_Junio2, Valor_Julio2, Valor_Agosto2, Valor_Septiembre2,
  Valor_Octubre2, Valor_Noviembre2, Valor_Diciembre2: integer;

  Valor_Enero3, Valor_Febrero3, Valor_Marzo3, Valor_Abril3,
  Valor_Mayo3, Valor_Junio3, Valor_Julio3, Valor_Agosto3, Valor_Septiembre3,
  Valor_Octubre3, Valor_Noviembre3, Valor_Diciembre3: integer;



begin
  Valor_Enero1      :=0;
  Valor_Febrero1    :=0;
  Valor_Marzo1      :=0;
  Valor_Abril1      :=0;
  Valor_Mayo1       :=0;
  Valor_Junio1      :=0;
  Valor_Julio1      :=0;
  Valor_Agosto1     :=0;
  Valor_Septiembre1 :=0;
  Valor_Octubre1    :=0;
  Valor_Noviembre1  :=0;
  Valor_Diciembre1  :=0;


  Valor_Enero2      :=0;
  Valor_Febrero2    :=0;
  Valor_Marzo2      :=0;
  Valor_Abril2      :=0;
  Valor_Mayo2       :=0;
  Valor_Junio2      :=0;
  Valor_Julio2      :=0;
  Valor_Agosto2     :=0;
  Valor_Septiembre2 :=0;
  Valor_Octubre2    :=0;
  Valor_Noviembre2  :=0;
  Valor_Diciembre2  :=0;



  Valor_Enero3      :=0;
  Valor_Febrero3    :=0;
  Valor_Marzo3      :=0;
  Valor_Abril3      :=0;
  Valor_Mayo3       :=0;
  Valor_Junio3      :=0;
  Valor_Julio3      :=0;
  Valor_Agosto3     :=0;
  Valor_Septiembre3 :=0;
  Valor_Octubre3    :=0;
  Valor_Noviembre3  :=0;
  Valor_Diciembre3  :=0;

  Datos.Alquileres.Refresh;
  Datos.Alquileres.First;

  Datos.Multas.Refresh;
  Datos.Multas.First;

  Datos.Inscripciones.Refresh;
  Datos.Inscripciones.First;

  Try
    Begin
      strtoint(Combobox3.Text);
      ImprimirBtn.Enabled:=True;

//Se toman los Datos para los Ingresos por Alquileres
      While not(Datos.Alquileres.Eof) do
        Begin
          Fecha_obtenida:= strtodate(Datos.Alquileres.Fieldbyname('Fecha').asstring);
          DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
          If Anio = strtoint(Combobox3.Text) then
            Begin
              If Mesio = 1 then
                 Begin
                   Valor_Enero1:=Valor_Enero1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 2 then
                 Begin
                   Valor_Febrero1:=Valor_Febrero1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 3 then
                 Begin
                   Valor_Marzo1:=Valor_Marzo1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 4 then
                 Begin
                   Valor_Abril1:=Valor_Abril1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 5 then
                 Begin
                   Valor_Mayo1:=Valor_Mayo1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 6 then
                 Begin
                   Valor_Junio1:=Valor_Junio1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 7 then
                 Begin
                   Valor_Julio1:=Valor_Julio1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 8 then
                 Begin
                   Valor_Agosto1:=Valor_Agosto1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 9 then
                 Begin
                   Valor_Septiembre1:=Valor_Septiembre1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 10 then
                 Begin
                   Valor_Octubre1:=Valor_Octubre1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 11 then
                 Begin
                   Valor_Noviembre1:=Valor_Noviembre1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 12 then
                 Begin
                   Valor_Diciembre1:=Valor_Diciembre1+Datos.Alquileres.Fieldbyname('Cantidad').Asinteger;
                 end;
            end;
          Datos.Alquileres.Next;
     end;


//Se toman los Datos para los Ingresos por Inscripciones
      While not(Datos.Inscripciones.Eof) do
        Begin
          Fecha_obtenida:= strtodate(Datos.Inscripciones.Fieldbyname('Fecha').asstring);
          DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
          If Anio = strtoint(Combobox3.Text) then
            Begin
              If Mesio = 1 then
                 Begin
                   Valor_Enero2:=Valor_Enero2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 2 then
                 Begin
                   Valor_Febrero2:=Valor_Febrero2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 3 then
                 Begin
                   Valor_Marzo2:=Valor_Marzo2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 4 then
                 Begin
                   Valor_Abril2:=Valor_Abril2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 5 then
                 Begin
                   Valor_Mayo2:=Valor_Mayo2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 6 then
                 Begin
                   Valor_Junio2:=Valor_Junio2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 7 then
                 Begin
                   Valor_Julio2:=Valor_Julio2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 8 then
                 Begin
                   Valor_Agosto2:=Valor_Agosto2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 9 then
                 Begin
                   Valor_Septiembre2:=Valor_Septiembre2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 10 then
                 Begin
                   Valor_Octubre2:=Valor_Octubre2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 11 then
                 Begin
                   Valor_Noviembre2:=Valor_Noviembre2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 12 then
                 Begin
                   Valor_Diciembre2:=Valor_Diciembre2+Datos.Inscripciones.Fieldbyname('Cantidad').Asinteger;
                 end;
            end;
          Datos.Inscripciones.Next;
     end;




//Se toman los Datos para los Ingresos por Multas
      While not(Datos.Multas.Eof) do
        Begin
          Fecha_obtenida:= strtodate(Datos.Multas.Fieldbyname('Fecha').asstring);
          DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
          If Anio = strtoint(Combobox3.Text) then
            Begin
              If Mesio = 1 then
                 Begin
                   Valor_Enero3:=Valor_Enero3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 2 then
                 Begin
                   Valor_Febrero3:=Valor_Febrero3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 3 then
                 Begin
                   Valor_Marzo3:=Valor_Marzo3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 4 then
                 Begin
                   Valor_Abril3:=Valor_Abril3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 5 then
                 Begin
                   Valor_Mayo3:=Valor_Mayo3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 6 then
                 Begin
                   Valor_Junio3:=Valor_Junio3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 7 then
                 Begin
                   Valor_Julio3:=Valor_Julio3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 8 then
                 Begin
                   Valor_Agosto3:=Valor_Agosto3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 9 then
                 Begin
                   Valor_Septiembre3:=Valor_Septiembre3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 10 then
                 Begin
                   Valor_Octubre3:=Valor_Octubre3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 11 then
                 Begin
                   Valor_Noviembre3:=Valor_Noviembre3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
              If Mesio = 12 then
                 Begin
                   Valor_Diciembre3:=Valor_Diciembre3+Datos.Multas.Fieldbyname('Cantidad').Asinteger;
                 end;
            end;
          Datos.Multas.Next;
     end;

//Se grafican los Datos de Las Series de datos obtenidas.
      ChartFx1.OpenDataEx(COD_VALUES,3,12);
	ChartFx1.ThisSerie:=  0;
	ChartFx1.Value[0] := Valor_Enero1;
	ChartFx1.Value[1] := Valor_Febrero1;
	ChartFx1.Value[2] := Valor_Marzo1;
	ChartFx1.Value[3] := Valor_Abril1;
	ChartFx1.Value[4] := Valor_Mayo1;
	ChartFx1.Value[5] := Valor_Junio1;
	ChartFx1.Value[6] := Valor_Julio1;
	ChartFx1.Value[7] := Valor_Agosto1;
	ChartFx1.Value[8] := Valor_Septiembre1;
	ChartFx1.Value[9] := Valor_Octubre1;
	ChartFx1.Value[10]:= Valor_Noviembre1;
	ChartFx1.Value[11]:= Valor_Diciembre1;

	ChartFx1.ThisSerie:=  1;
	ChartFx1.Value[0] := Valor_Enero2;
	ChartFx1.Value[1] := Valor_Febrero2;
	ChartFx1.Value[2] := Valor_Marzo2;
	ChartFx1.Value[3] := Valor_Abril2;
	ChartFx1.Value[4] := Valor_Mayo2;
	ChartFx1.Value[5] := Valor_Junio2;
	ChartFx1.Value[6] := Valor_Julio2;
	ChartFx1.Value[7] := Valor_Agosto2;
	ChartFx1.Value[8] := Valor_Septiembre2;
	ChartFx1.Value[9] := Valor_Octubre2;
	ChartFx1.Value[10]:= Valor_Noviembre2;
	ChartFx1.Value[11]:= Valor_Diciembre2;

	ChartFx1.ThisSerie:=  2;
	ChartFx1.Value[0] := Valor_Enero3;
	ChartFx1.Value[1] := Valor_Febrero3;
	ChartFx1.Value[2] := Valor_Marzo3;
	ChartFx1.Value[3] := Valor_Abril3;
	ChartFx1.Value[4] := Valor_Mayo3;
	ChartFx1.Value[5] := Valor_Junio3;
	ChartFx1.Value[6] := Valor_Julio3;
	ChartFx1.Value[7] := Valor_Agosto3;
	ChartFx1.Value[8] := Valor_Septiembre3;
	ChartFx1.Value[9] := Valor_Octubre3;
	ChartFx1.Value[10]:= Valor_Noviembre3;
	ChartFx1.Value[11]:= Valor_Diciembre3;


      ChartFx1.CloseData(COD_VALUES);

      Label1.Caption:=inttostr((
                                Valor_Enero1+Valor_Febrero1+
                                Valor_Marzo1+Valor_Abril1+
                                Valor_Mayo1+Valor_Junio1+
                                Valor_Julio1+Valor_Agosto1+
                                Valor_Septiembre1+Valor_Octubre1+
                                Valor_Noviembre1+Valor_Diciembre1+

                                Valor_Enero2+Valor_Febrero2+
                                Valor_Marzo2+Valor_Abril2+
                                Valor_Mayo2+Valor_Junio2+
                                Valor_Julio2+Valor_Agosto2+
                                Valor_Septiembre2+Valor_Octubre2+
                                Valor_Noviembre2+Valor_Diciembre2+

                                Valor_Enero3+Valor_Febrero3+
                                Valor_Marzo3+Valor_Abril3+
                                Valor_Mayo3+Valor_Junio3+
                                Valor_Julio3+Valor_Agosto3+
                                Valor_Septiembre3+Valor_Octubre3+
                                Valor_Noviembre3+Valor_Diciembre3
                                )div 12);

      Label2.Caption:=inttostr(
                                Valor_Enero1+Valor_Febrero1+
                                Valor_Marzo1+Valor_Abril1+
                                Valor_Mayo1+Valor_Junio1+
                                Valor_Julio1+Valor_Agosto1+
                                Valor_Septiembre1+Valor_Octubre1+
                                Valor_Noviembre1+Valor_Diciembre1+

                                Valor_Enero2+Valor_Febrero2+
                                Valor_Marzo2+Valor_Abril2+
                                Valor_Mayo2+Valor_Junio2+
                                Valor_Julio2+Valor_Agosto2+
                                Valor_Septiembre2+Valor_Octubre2+
                                Valor_Noviembre2+Valor_Diciembre2+

                                Valor_Enero3+Valor_Febrero3+
                                Valor_Marzo3+Valor_Abril3+
                                Valor_Mayo3+Valor_Junio3+
                                Valor_Julio3+Valor_Agosto3+
                                Valor_Septiembre3+Valor_Octubre3+
                                Valor_Noviembre3+Valor_Diciembre3
                               );
    end
    except
      On EconvertError do
        Begin
          Showmessage('Debe Seleccionar un año de la lista "AÑO A GRAFICAR" '+
                      'para poder tomar los datos del año de referencia indicado '+
                      'y proceder a Graficarlos.');
          ImprimirBtn.Enabled:=False;
        End;
    end;
end;

procedure TEstadisticas_de_Dinero.FormShow(Sender: TObject);
var
  conta,Mayor,Menor:integer;
begin
   Combobox3.Itemindex:=0;
  ImprimirBtn.Enabled:=False;
   While Combobox3.text <> '' do
     Begin
       Combobox3.Items.Delete(0);
       Combobox3.Itemindex:=0;
     end;

  With Datos.Alquileres do
     Begin
       Indexname:='';
       Refresh;
       First;
     end;
  With Datos.Multas do
     Begin
       Indexname:='';
       Refresh;
       First;
     end;
  With Datos.Inscripciones do
     Begin
       Indexname:='';
       Refresh;
       First;
     end;


//  Se comprueban los años límites para las gráficas
//(primero de buscan en la tabla alquileres) los mayores
  Mayor:=0;
  For Conta:=1 to Datos.Alquileres.Recordcount do
     Begin
       Fecha_obtenida:= strtodate(Datos.Alquileres.Fieldbyname('Fecha').asstring);
       DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
       If Mayor > Anio then
          Begin
          end;
       If Mayor <= Anio then
          Begin
            Mayor:=Anio;
          end;
       Datos.Alquileres.Next;
     end;

// Luego en la tabla multas.
  For Conta:=1 to Datos.Multas.Recordcount do
     Begin
       Fecha_obtenida:= strtodate(Datos.Multas.Fieldbyname('Fecha').asstring);
       DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
       If Mayor > Anio then
          Begin
          end;
       If Mayor <= Anio then
          Begin
            Mayor:=Anio;
          end;
       Datos.Multas.Next;
     end;


// Y Finalmente en la tabla de Inscripciones
  For Conta:=1 to Datos.Inscripciones.Recordcount do
     Begin
       Fecha_obtenida:= strtodate(Datos.Inscripciones.Fieldbyname('Fecha').asstring);
       DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
       If Mayor > Anio then
          Begin
          end;
       If Mayor <= Anio then
          Begin
            Mayor:=Anio;
          end;
       Datos.Inscripciones.Next;
     end;











// Se buscan los valores menores para los años
Menor:=Mayor;

  With Datos.Alquileres do
     Begin
       Indexname:='';
       Refresh;
       First;
     end;
  For Conta:=1 to Datos.Alquileres.Recordcount do
     Begin
       Fecha_obtenida:= strtodate(Datos.Alquileres.Fieldbyname('Fecha').asstring);
       DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
       If Menor < Anio then
          Begin
          end;
       If Menor >= Anio then
          Begin
            Menor:=Anio;
          end;
       Datos.Alquileres.Next;
     end;




// Ahora se buscan el menos año en las inscripciones

  With Datos.Inscripciones do
     Begin
       Indexname:='';
       Refresh;
       First;
     end;

  For Conta:=1 to Datos.Inscripciones.Recordcount do
     Begin
       Fecha_obtenida:= strtodate(Datos.Inscripciones.Fieldbyname('Fecha').asstring);
       DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
       If Menor < Anio then
          Begin
          end;
       If Menor >= Anio then
          Begin
            Menor:=Anio;
          end;
       Datos.Inscripciones.Next;
     end;


// y ahora de las multas
  With Datos.Multas do
     Begin
       Indexname:='';
       Refresh;
       First;
     end;

  For Conta:=1 to Datos.Multas.Recordcount do
     Begin
       Fecha_obtenida:= strtodate(Datos.Multas.Fieldbyname('Fecha').asstring);
       DecodeDate(Fecha_Obtenida, Anio, Mesio, Dia);
       If Menor < Anio then
          Begin
          end;
       If Menor >= Anio then
          Begin
            Menor:=Anio;
          end;
       Datos.Multas.Next;
     end;


// Luego se añaden valores al combobox de las fechas que van desde el año
// menor al mayor

  For Conta:=Menor to Mayor do
     Begin
       Combobox3.Items.Add(Inttostr(Conta));
     end;

  ChartFx1.OpenDataEx(COD_VALUES,3,12);
	ChartFx1.ThisSerie:=  0;
	ChartFx1.Value[0] := 0;
	ChartFx1.Value[1] := 0;
	ChartFx1.Value[2] := 0;
	ChartFx1.Value[3] := 0;
	ChartFx1.Value[4] := 0;
	ChartFx1.Value[5] := 0;
	ChartFx1.Value[6] := 0;
	ChartFx1.Value[7] := 0;
	ChartFx1.Value[8] := 0;
	ChartFx1.Value[9] := 0;
	ChartFx1.Value[10]:= 0;
	ChartFx1.Value[11]:= 0;

	ChartFx1.ThisSerie:=  1;
	ChartFx1.Value[0] := 0;
	ChartFx1.Value[1] := 0;
	ChartFx1.Value[2] := 0;
	ChartFx1.Value[3] := 0;
	ChartFx1.Value[4] := 0;
	ChartFx1.Value[5] := 0;
	ChartFx1.Value[6] := 0;
	ChartFx1.Value[7] := 0;
	ChartFx1.Value[8] := 0;
	ChartFx1.Value[9] := 0;
	ChartFx1.Value[10]:= 0;
	ChartFx1.Value[11]:= 0;

	ChartFx1.ThisSerie:=  2;
	ChartFx1.Value[0] := 0;
	ChartFx1.Value[1] := 0;
	ChartFx1.Value[2] := 0;
	ChartFx1.Value[3] := 0;
	ChartFx1.Value[4] := 0;
	ChartFx1.Value[5] := 0;
	ChartFx1.Value[6] := 0;
	ChartFx1.Value[7] := 0;
	ChartFx1.Value[8] := 0;
	ChartFx1.Value[9] := 0;
	ChartFx1.Value[10]:= 0;
	ChartFx1.Value[11]:= 0;
  ChartFx1.CloseData(COD_VALUES);

  DecodeDate(StrToDate(Principal.Fecha_Total), Anio, Mesio, Dia);
  ChartFx1.Charttype:=Bar;
  Label1.Caption:='0';
  Label2.Caption:='0';
end;


procedure TEstadisticas_de_Dinero.ImprimirBtnClick(Sender: TObject);
var
  Origen, Destino:Trect;
begin
  Destino.Left:=350;
  Destino.Top:=100;
  Destino.Right:=2000;
  Destino.Bottom:=1450;

  Origen.Left:=5;
  Origen.Top:=8;
  Origen.Right:=460;
  Origen.Bottom:=297;

  With Printer do
    Begin
      BeginDoc;
        Canvas.Rectangle(300,50,2050,1500);
        Canvas.CopyRect(Destino, Estadisticas_de_Dinero.Canvas, Origen);
        Canvas.font.name:='Brush Script MT';
        Canvas.font.size:=18;
        Canvas.Textout(900,1650,'Leyenda de la Gráfica.');
        Canvas.Rectangle(300,1750,2050,2350);

        Canvas.font.name:='Arial';
        Canvas.font.size:=12;
        Canvas.Textout(750,1550,'Ingresos mensuales para el año: '+Combobox3.Text);
        Canvas.Textout(1000,1800,'Eje X:');
        Canvas.Textout(400,1850,' 1.- Enero');
        Canvas.Textout(1000,1850,' 2.- Febrero');
        Canvas.Textout(1600,1850,' 3.- Marzo');

        Canvas.Textout(400,1900,' 4.- Abril');
        Canvas.Textout(1000,1900,' 5.- Mayo');
        Canvas.Textout(1600,1900,' 6.- Junio');

        Canvas.Textout(400,1950,' 7.- Julio');
        Canvas.Textout(1000,1950,' 8.- Agosto');
        Canvas.Textout(1600,1950,' 9.- Septiembre');

        Canvas.Textout(400,2000,' 10.- Octubre');
        Canvas.Textout(1000,2000,' 11.- Noviembre');
        Canvas.Textout(1600,2000,' 12.- Diciembre');

        Canvas.Textout(1000,2100,'Colores:');
        Canvas.Textout(750,2150,' Verde:   Ingresos por Alquileres.');
        Canvas.Textout(750,2210,' Azul  :   Ingresos por Inscripciones.');
        Canvas.Textout(750,2270,' Rojo  :   Ingresos por Multas.');

        Canvas.font.size:=10;
        Canvas.Textout(350,2400,'Fuente: Vídeo Rental 2000 (c) para Microsoft(c) Windows 98(c). Derechos Reservados.');
      EndDoc;
    end;
end;


end.
