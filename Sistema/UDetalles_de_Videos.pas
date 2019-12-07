unit UDetalles_de_Videos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, HeadLbl, Db, DBTables, Gradpan,
  Counter;

type
  TDetalles_Videos = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    CerrarBtn: TBitBtn;
    HeadLabel2: THeadLabel;
    HeadLabel4: THeadLabel;
    HeadLabel5: THeadLabel;
    HeadLabel6: THeadLabel;
    Label7: THeadLabel;
    HeadLabel1: THeadLabel;
    HeadLabel3: THeadLabel;
    HeadLabel7: THeadLabel;
    Numero_de_Ejemplares: TCounter;
    Veces_Alquilada: TCounter;
    Veces_Multada: TCounter;
    Precio: TCounter;
    Ganado_en_Alquiler: TCounter;
    Ganado_en_Multa: TCounter;
    Totales: TCounter;
    Falta_o_Gana: TCounter;
    Bevel3: TBevel;
    procedure FormShow(Sender: TObject);
    procedure CerrarBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detalles_Videos: TDetalles_Videos;

implementation

uses UHistorial_Videos, MODULO_DE_DATOS;

{$R *.DFM}



procedure TDetalles_Videos.FormShow(Sender: TObject);
var
  Desglozar:string;
  Codigo_Video_a_Buscar:String[4];
begin
  Desglozar:=Historial_Videos.MaskEdit2.Text;
  Codigo_Video_a_Buscar:='';
  Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                         Desglozar[3]+Desglozar[4];
  Datos.Total.Refresh;
  Datos.Total.indexname:='';
  Datos.Total.Setkey;
  Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
  IF Datos.Total.GotoKey = True then
    Begin
      Numero_de_Ejemplares.Value:=Datos.Total.Fieldbyname('Cantidad_de_Ejemplares').Asstring;
      Veces_Alquilada.Value:=Datos.Total.FieldByName('Veces_de_Alquiler_Total').AsString;
      Veces_Multada.Value:=Datos.Total.FieldByName('Veces_de_Multa_Total').AsString;
      Precio.Value:=Datos.Total.FieldByName('Valor_Total').AsString;
      Ganado_en_Alquiler.Value:=Datos.Total.FieldByName('Alquiler_Total').AsString;
      Ganado_en_Multa.Value:=Datos.Total.FieldByName('Multa_Total').AsString;
      Totales.Value:=Datos.Total.FieldByName('Ingreso_Total').AsString;
      If Totales.Value > Precio.Value then
        Begin
          Label7.Caption:='Han GANADO:';
          Falta_o_Gana.Value:= IntToStr(StrToInt(Totales.Value) - StrToInt(Precio.Value));
        end;
      If Totales.Value < Precio.Value then
        Begin
          Label7.Caption:='Les FALTAN para ganar:';
          Falta_o_Gana.Value:= IntToStr(StrToInt(Precio.Value) - StrToInt(Totales.Value));
        end;
      If Totales.Value = Precio.Value then
        Begin
          Label7.Caption:='Ni Ganan ni Pierden:';
          Falta_o_Gana.Value:='0';
        end;
    end;
  CerrarBtn.SetFocus;
end;

procedure TDetalles_Videos.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TDetalles_Videos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then
    Close;
end;


end.
