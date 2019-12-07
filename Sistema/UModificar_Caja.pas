unit UModificar_Caja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,chartfx3, marquee;

type
  TModificar_Caja = class(TForm)
    Antiguo: TLabel;
    Modificacion: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Marquee1: TMarquee;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Modificar_Caja: TModificar_Caja;
  Primero:Boolean;
  Enter:Boolean;


implementation

uses uconfirmar, UCaja, MODULO_DE_DATOS, Uprincipal;

{$R *.DFM}

procedure TModificar_Caja.FormKeyPress(Sender: TObject; var Key: Char);
begin
{  IF Key = #27 then
    Begin
      Enter:=False;
      Primero:=True;
      Antiguo.Caption:='0';
      Modificacion.Caption:='0';
      Close;
    end
  else
    Begin
      IF Key = #13 then
        Begin
          If Enter = False then
            Begin
              Enter:=True;
            end
          else
            Begin
              Confirmar.Label1.caption:='   Está Seguro ?';
              Confirmar.Caption:='C o n f i r m a r .';
              Confirmar.showmodal;
              If Confirmar.modalresult = mrok then
                Begin
                  If Modificar_Caja.Caption = 'Modificar valor de:  ALQUILER' then
                    Begin
                      Datos.Alquileres.Indexname:='';
                      Datos.Alquileres.Setkey;
                      Datos.Alquileres.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                      If Datos.Alquileres.Gotokey = True then
                         Begin
                           Datos.Alquileres.Edit;
                           Datos.Alquileres.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                           Datos.Alquileres.Post;
                           Datos.Alquileres.FlushBuffers;                           
                         end
                      else
                         Begin
                           Datos.Alquileres.Refresh;
                           Datos.Alquileres.Last;
                           Datos.Alquileres.Insert;
                           Datos.Alquileres.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                           Datos.Alquileres.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                           Datos.Alquileres.Post;
                           Datos.Alquileres.FlushBuffers;                           
                         End;
                      Caja.Alq.Caption:=Modificacion.Caption;
                      Close;
                    end;
                  If Modificar_Caja.Caption = 'Modificar valor de:  MULTAS' then
                    Begin
                      Datos.Multas.Indexname:='';
                      Datos.Multas.Setkey;
                      Datos.Multas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                      If Datos.Multas.Gotokey = True then
                        Begin
                          Datos.Multas.Edit;
                          Datos.Multas.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                          Datos.Multas.Post;
                          Datos.Multas.FlushBuffers;                          
                        end
                      else
                        Begin
                          Datos.Multas.Refresh;
                          Datos.Multas.Last;
                          Datos.Multas.Insert;
                          Datos.Multas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                          Datos.Multas.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                          Datos.Multas.Post;
                          Datos.Multas.FlushBuffers;                          
                        end;
                      Caja.MUL.Caption:=Modificacion.Caption;
                      Close;
                    end;

                  If Modificar_Caja.Caption = 'Modificar valor de:  INSCRIPCIONES' then
                    Begin
                      Datos.Inscripciones.Indexname:='';
                      Datos.Inscripciones.Setkey;
                      Datos.Inscripciones.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                      If Datos.Inscripciones.Gotokey = True then
                        Begin
                          Datos.Inscripciones.Edit;
                          Datos.Inscripciones.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                          Datos.Inscripciones.Post;
                          Datos.Inscripciones.FlushBuffers;                          
                        end
                      else
                        Begin
                          Datos.Inscripciones.Refresh;
                          Datos.Inscripciones.Last;
                          Datos.Inscripciones.Insert;
                          Datos.Inscripciones.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                          Datos.Inscripciones.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                          Datos.Inscripciones.Post;
                          Datos.Inscripciones.FlushBuffers;
                        end;
                      Caja.INS.Caption:=Modificacion.Caption;
                      Close;
                    end;

                  If Modificar_Caja.Caption = 'Modificar valor de:  DEUDAS' then
                    Begin
                      Datos.Deudas.Indexname:='';
                      Datos.Deudas.Setkey;
                      Datos.Deudas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                      If Datos.Deudas.Gotokey = True then
                        Begin
                          Datos.Deudas.Edit;
                          Datos.Deudas.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                          Datos.Deudas.Post;
                          Datos.Deudas.FlushBuffers;                          
                        end
                      else
                        Begin
                          Datos.Deudas.Refresh;
                          Datos.Deudas.Last;
                          Datos.Deudas.Insert;
                          Datos.Deudas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                          Datos.Deudas.FieldByName('Cantidad').Asstring:=Modificacion.Caption;
                          Datos.Deudas.Post;
                          Datos.Deudas.FlushBuffers;                          
                        end;
                      Caja.DEU.Caption:=Modificacion.Caption;
                      Close;
                    end;

                  Caja.ChartFx1.OpenDataEx(COD_VALUES,1,4);
                    Caja.ChartFx1.ThisSerie:=  0;
                    Caja.ChartFx1.Value[0] := StrToInt(Caja.Alq.Caption);
                    Caja.ChartFx1.Value[1] := StrToInt(Caja.Mul.Caption);
                    Caja.ChartFx1.Value[2] := StrToInt(Caja.Ins.Caption);
                    Caja.ChartFx1.Value[3] := StrToInt(Caja.Deu.Caption);
                  Caja.ChartFx1.CloseData(COD_VALUES);

//                  Caja.TOT.Caption:=Caja.Alq.Value+Caja.Mul.Value+Caja.Ins.Value+Caja.Deu.Value;

                  Primero:=True;
                  Enter:=False;
                  Showmessage('El Monto Ha Sido Modificado.');
                end
              else
                Begin
                  Modificacion.Caption:='0';
                  Primero:=True;
                  Enter:=False;
                end;
            end;
        end
      else
        Begin
          If Primero = False then
            Begin
              Enter:=False;
              If Key = #48 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'0';
                end;
              If Key = #49 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'1';
                end;
              If Key = #50 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'2';
                end;
              If Key = #51 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'3';
                end;
              If Key = #52 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'4';
                end;
              If Key = #53 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'5';
                end;
              If Key = #54 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'6';
                end;
              If Key = #55 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'7';
                end;
              If Key = #56 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'8';
                end;
              If Key = #57 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+'9';
                end;
            end
          else
            Begin
              If Key = #48 then
                Begin
                  Modificacion.Caption:='0';
                  Primero:= False;
                end;
              If Key = #49 then
                Begin
                  Modificacion.Caption:='1';
                  Primero:= False;
                end;
              If Key = #50 then
                Begin
                  Modificacion.Caption:='2';
                  Primero:= False;
                end;
              If Key = #51 then
                Begin
                  Modificacion.Caption:='3';
                  Primero:= False;
                end;
              If Key = #52 then
                Begin
                  Modificacion.Caption:='4';
                  Primero:= False;
                end;
              If Key = #53 then
                Begin
                  Modificacion.Caption:='5';
                  Primero:= False;
                end;
              If Key = #54 then
                Begin
                  Modificacion.Caption:='6';
                  Primero:= False;
                end;
              If Key = #55 then
                Begin
                  Modificacion.Caption:='7';
                  Primero:= False;
                end;
              If Key = #56 then
                Begin
                  Modificacion.Caption:='8';
                  Primero:= False;
                end;
              If Key = #57 then
                Begin
                  Modificacion.Caption:='9';
                  Primero:= False;
                end;
            end;
        end;
    end;
} end;

procedure TModificar_Caja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Caja.Enabled:=True;
end;

procedure TModificar_Caja.FormShow(Sender: TObject);
begin
//  Primero:=True;
//  Modificacion.Caption:='0'
end;

end.
