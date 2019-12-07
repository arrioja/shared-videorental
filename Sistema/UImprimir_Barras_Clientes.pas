unit UImprimir_Barras_Clientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, Barcd4, Grids;

type
  TImprimir_Barras_Clientes = class(TForm)
    SpeedButton2: TSpeedButton;
    PrnBtn: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Bevel5: TBevel;
    Bevel1: TBevel;
    Label11: TLabel;
    Barras: TPrintBarcode;
    Label1: TLabel;
    Bevel3: TBevel;
    Listado: TStringGrid;
    Bevel2: TBevel;
    SpeedButton4: TSpeedButton;
    Codigo: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure PrnBtnClick(Sender: TObject);
    Procedure Procesar;
    procedure SpeedButton2Click(Sender: TObject);
    procedure CodigoChange(Sender: TObject);
    procedure CodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Cuenta_Personas:Byte;
    { Public declarations }
  end;

var
  Imprimir_Barras_Clientes: TImprimir_Barras_Clientes;

implementation

uses Modulo_de_Datos, UImprimir_Barras_Clientes_Prn;

{$R *.DFM}

procedure TImprimir_Barras_Clientes.FormShow(Sender: TObject);
begin
  Listado.Cells[0,0]:='Código';
  Listado.Cells[1,0]:='          Apellidos y Nombres';
  Cuenta_Personas:=0;
  CODIGO.SetFocus;
end;

procedure TImprimir_Barras_Clientes.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TImprimir_Barras_Clientes.SpeedButton4Click(Sender: TObject);
var
  Y:Byte;
begin
  For Y:=1 to 11 do
    Begin
      Listado.Cells[0,Y]:='';
      Listado.Cells[1,Y]:='';
    end;
  PrnBtn.Enabled:=False;
  Cuenta_Personas:=0;
end;

Procedure TImprimir_Barras_Clientes.Procesar;
var
  Hay_Cupo,Encontrada:Boolean;
  Y:Byte;
begin
      Encontrada:=False;
      Hay_Cupo:=False;
      Y:=1;
      While ((Y <= 10) And (Encontrada = False)) do
        Begin
          If Listado.Cells[0,Y]=Codigo.Text Then
            Begin
              Encontrada:=True;
            end;
          Y:=y+1;
        end;
      If Encontrada = True Then
        Begin
          For Y:=Y-1 to 10 do
            Begin
              If Y = 10 Then
                Begin
                  Listado.Cells[0,Y]:='';
                  Listado.Cells[1,Y]:='';
                  Label1.Caption:='';
                  Cuenta_Personas:=Cuenta_Personas-1;
                  If Cuenta_Personas <= 0 Then PrnBtn.Enabled:=False;
                  Codigo.Text:='';
                end
              else
                Begin
                  Listado.Cells[0,Y]:=Listado.Cells[0,Y+1];
                  Listado.Cells[1,Y]:=Listado.Cells[1,Y+1];
                end;
            end;
        end
      else
        Begin
          //Parte para la inclusión de los datos
          Datos.Clientes.indexname:='';
          Datos.Clientes.setkey;
          Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Codigo.text;
          if (Datos.Clientes.gotokey = False) then
            begin
              Label1.Caption:='';
              messagedlg('El Código que ha introducido '
                        +'no se encuentra en nuestros registros, debe introducir '
                        +'un número que se encuentre registrado.',mterror,[mbok],0);
              Codigo.Text:='';
              Codigo.Setfocus;
            end
          Else
            Begin
              Label1.Caption:=Datos.Clientes.fieldbyname('Nombres_Cliente').Asstring+' '+
                              Datos.Clientes.fieldbyname('Apellidos_Cliente').Asstring;
              Y:=1;
              While ((Y <= 10) And (Hay_cupo = False)) do
                Begin
                  If Listado.Cells[0,Y]='' Then
                    Begin
                      Hay_Cupo:=True;
                      Listado.Cells[0,Y]:=Datos.Clientes.fieldbyname('Codigo_Cliente').Asstring;
                      Listado.Cells[1,Y]:=Label1.Caption;
                      Cuenta_Personas:=Cuenta_Personas+1;
                      Codigo.Text:='';
                      Label1.Caption:='';
                      Codigo.Setfocus;
                      PrnBtn.Enabled:=True;
                    end;
                  Y:=y+1;
                end;
              If Hay_cupo = False Then
                Begin
                  Showmessage('Esta lista sólo permite 10 personas y ya no hay cupo para más, '+
                              'deberá eliminar una persona para poder incluir a otra...');
                end;
            end;
        end;
end;


procedure TImprimir_Barras_Clientes.PrnBtnClick(Sender: TObject);
begin
  Try
    Begin
      Imprimir_Barras_Clientes_Prn:=TImprimir_Barras_Clientes_Prn.Create(Self);
      Case Imprimir_Barras_Clientes.Cuenta_Personas of
        1:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_2.Free;Imprimir_Barras_Clientes_Prn.Nombre_3.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_4.Free;Imprimir_Barras_Clientes_Prn.Nombre_5.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_6.Free;Imprimir_Barras_Clientes_Prn.Nombre_7.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_8.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;
            Imprimir_Barras_Clientes_Prn.Barra_2.Free;Imprimir_Barras_Clientes_Prn.Barra_3.Free;
            Imprimir_Barras_Clientes_Prn.Barra_4.Free;Imprimir_Barras_Clientes_Prn.Barra_5.Free;
            Imprimir_Barras_Clientes_Prn.Barra_6.Free;Imprimir_Barras_Clientes_Prn.Barra_7.Free;
            Imprimir_Barras_Clientes_Prn.Barra_8.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;
          end;
        2:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_3.Free;Imprimir_Barras_Clientes_Prn.Nombre_10.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_4.Free;Imprimir_Barras_Clientes_Prn.Nombre_5.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_6.Free;Imprimir_Barras_Clientes_Prn.Nombre_7.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_8.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_3.Free;Imprimir_Barras_Clientes_Prn.Barra_10.Free;
            Imprimir_Barras_Clientes_Prn.Barra_4.Free;Imprimir_Barras_Clientes_Prn.Barra_5.Free;
            Imprimir_Barras_Clientes_Prn.Barra_6.Free;Imprimir_Barras_Clientes_Prn.Barra_7.Free;
            Imprimir_Barras_Clientes_Prn.Barra_8.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
          end;
        3:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;Imprimir_Barras_Clientes_Prn.Nombre_4.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_6.Free;Imprimir_Barras_Clientes_Prn.Nombre_7.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_8.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_5.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_4.Free;Imprimir_Barras_Clientes_Prn.Barra_5.Free;
            Imprimir_Barras_Clientes_Prn.Barra_6.Free;Imprimir_Barras_Clientes_Prn.Barra_7.Free;
            Imprimir_Barras_Clientes_Prn.Barra_8.Free;
          end;
        4:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;Imprimir_Barras_Clientes_Prn.Nombre_5.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_6.Free;Imprimir_Barras_Clientes_Prn.Nombre_7.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_8.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_5.Free;Imprimir_Barras_Clientes_Prn.Barra_8.Free;
            Imprimir_Barras_Clientes_Prn.Barra_6.Free;Imprimir_Barras_Clientes_Prn.Barra_7.Free;
          end;
        5:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_6.Free;Imprimir_Barras_Clientes_Prn.Nombre_7.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_8.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_6.Free;Imprimir_Barras_Clientes_Prn.Barra_7.Free;
            Imprimir_Barras_Clientes_Prn.Barra_8.Free;
          end;
        6:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_7.Free;Imprimir_Barras_Clientes_Prn.Nombre_8.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_7.Free;Imprimir_Barras_Clientes_Prn.Barra_8.Free;
          end;
        7:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Nombre_8.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_8.Free;
          end;
        8:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;Imprimir_Barras_Clientes_Prn.Nombre_9.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;Imprimir_Barras_Clientes_Prn.Barra_9.Free;
          end;
        9:Begin
            Imprimir_Barras_Clientes_Prn.Nombre_10.Free;
            Imprimir_Barras_Clientes_Prn.Barra_10.Free;
          end;
      end;
      Imprimir_Barras_Clientes_Prn.Reporte.Preview;
    end
  finally
    Begin
      Imprimir_Barras_Clientes_Prn.Free;
      Imprimir_Barras_Clientes_Prn:=Nil;
    end;
  end;
end;

procedure TImprimir_Barras_Clientes.SpeedButton2Click(Sender: TObject);
begin
  Procesar;
end;

procedure TImprimir_Barras_Clientes.CodigoChange(Sender: TObject);
begin
  Barras.Text:=Codigo.Text;
end;

procedure TImprimir_Barras_Clientes.CodigoKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then Procesar;
end;

end.
