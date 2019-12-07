unit UPagar_Alquiler_Atrasado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Numedit, StdCtrls, Menus, Grids, DBGrids, Db, DBTables, ExtCtrls,
  Buttons, Mask, marquee, RefreshQ, ToolEdit, CurrEdit;

type
  Mal_Descuento               = Class(Exception);
  Descontar_Parte_de_la_Deuda = Class(Exception);
  Mal_DEseo                   = Class(Exception);
  Poca_Deuda                  = Class(Exception);
  Monto_Igual                 = Class(Exception);
  No_Seleccion                = Class(Exception);
  Pagar_Parte_de_la_Deuda     = Class(Exception);

  TPagar_Alquiler_Atrasado = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    DataSource1: TDataSource;
    Actual: TLabel;
    Nuevo: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Modificacion: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RadioGroup1: TRadioGroup;
    Marquee1: TMarquee;
    Edit1: TEdit;
    Query1: TSelfRefreshQuery;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DescuentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pagar_Alquiler_Atrasado: TPagar_Alquiler_Atrasado;
  Clic,Enter:Boolean;
  Primero:boolean;
  Codigo_Video,Monto,Codigo_Cliente,Fecha,
  Persona_que_lo_alquilo:String;


implementation

uses ualquilar_y_devolver, uconfirmar, UCaja, MODULO_DE_DATOS, Uprincipal;

{$R *.DFM}

Function Nombre_Computador : String; Far; External 'Control.dll';

procedure TPagar_Alquiler_Atrasado.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TPagar_Alquiler_Atrasado.FormShow(Sender: TObject);
begin
  Codigo_Video:='';
  Clic:=False;
  Monto:='';
  Codigo_Cliente:='';
  Fecha:='';
  Persona_que_lo_alquilo:='';

  Query1.Sql.Clear;
  Query1.Sql.add('Select * from Debe '+
                 'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                 'and (Debe.Tipo = "A")) Order BY Titulo_Video');
  Query1.Open;
  Actual.Caption:='0';
  Modificacion.Caption:='0';
  Nuevo.Caption:='0';
  Primero:=True;
end;

procedure TPagar_Alquiler_Atrasado.DBGrid1CellClick(Column: TColumn);
begin
  Codigo_Video:=Query1.Fieldbyname('Codigo_Video').Asstring;
  Monto:=Query1.Fieldbyname('Monto').Asstring;
  Codigo_Cliente:=Query1.Fieldbyname('Codigo_Cliente').Asstring;
  Fecha:=Query1.Fieldbyname('Fecha').Asstring;
  Persona_que_lo_alquilo:=Query1.Fieldbyname('Persona_que_lo_alquilo').Asstring;
  Actual.Caption:=Query1.Fieldbyname('Monto').Asstring;
  Clic:=True;
end;

procedure TPagar_Alquiler_Atrasado.DescuentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
end;


procedure TPagar_Alquiler_Atrasado.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
Try
 Begin
  IF Key = #27 then
    Begin
      Enter:=False;
      Actual.Caption:='0';
      Modificacion.Caption:='0';
      Primero:=True;
      Nuevo.Caption:='0';
      Clic:=False;
    end
  else
    Begin
      IF Key = #13 then
        Begin
          If Clic = False then
            Begin
              Raise No_Seleccion.Create(' ');
            end;
          If Enter = False then
            Begin
              If Radiogroup1.Itemindex = 0 then
                Begin
                  If (strtoint(Modificacion.Caption) > strtoint(Actual.Caption)) then
                    Begin
                      Raise Poca_Deuda.Create(' ');
                    end;
                  If (strtoint(Modificacion.Caption) < strtoint(Actual.Caption)) then
                    Begin
                      Nuevo.Caption:= inttostr(strtoint(Actual.Caption)-strtoint(Modificacion.Caption));
                    end;
                end;

              If (Radiogroup1.Itemindex <> 0) then
                Begin
                  Raise Mal_Deseo.Create(' ');
                end;
              Enter:=True;
            end
          else
            Begin
              If (Radiogroup1.Itemindex = 0) then
                Begin
                  If (strtoint(Modificacion.Caption) = strtoint(Actual.Caption)) then
                    Begin
                        Try
                          Begin
                            Confirmar:=TConfirmar.Create(Self);
                            Confirmar.Label1.caption:='Cancelar Deuda ?';
                            Confirmar.Caption:='C o n f i r m a r .';
                            Confirmar.BitBtn1.Hint:='Cancelar la actual deuda';
                            Confirmar.BitBtn2.Hint:='"NO" Cancelar la deuda';
                            Confirmar.showmodal;
                            If Confirmar.modalresult = mrok then
                              Begin
                                Raise Monto_Igual.Create(' ');
                              end
                            else
                              Begin
                                Enter:=False;
                                Actual.Caption:='0';
                                Modificacion.Caption:='0';
                                Primero:=True;
                                Nuevo.Caption:='0';
                                Clic:=False;
                              end;
                          end
                        Finally
                          Begin
                            Confirmar.Free;
                            Confirmar:=Nil;
                          end;
                        end;
                      end;
                  If (strtoint(Modificacion.Caption) < strtoint(Actual.Caption)) then
                    Begin
                      Try
                        Begin
                          Confirmar:=TConfirmar.Create(Self);
                          Confirmar.Label1.caption:='   Está Seguro ?';
                          Confirmar.Caption:='C o n f i r m a r .';
                          Confirmar.BitBtn1.Hint:='Pagar parte de la actual deuda';
                          Confirmar.BitBtn2.Hint:='"NO" Pagar la deuda';
                          Confirmar.showmodal;
                          If Confirmar.modalresult = mrok then
                            Begin
                              Raise Pagar_Parte_de_la_Deuda.Create(' ');
                            end
                          else
                            Begin
                              Enter:=False;
                              Actual.Caption:='0';
                              Modificacion.Caption:='0';
                              Primero:=True;
                              Nuevo.Caption:='0';
                              Clic:=False;
                            end;
                        end
                      Finally
                        Begin
                          Confirmar.Free;
                          Confirmar:=Nil;
                        end;
                      end;
                    end;
                end
              else
                Begin
                  Modificacion.Caption:='0';
                  Nuevo.Caption:='0';
                  Primero:=True;
                  Enter:=False;
                end;
            end;
        end
      else
        Begin
          If Clic = False then
            Begin
              Raise No_Seleccion.Create(' ');
            end;

          If Primero = False then
            Begin
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
 end
 Except
    On Mal_Deseo do
      Begin
        Showmessage('Debe indicar si desea hacer un descuento, pago o un recargo en '+
                    'la deuda para el video seleccionado.');
      end;
    On Poca_Deuda do
      Begin
        Showmessage('El monto de la deuda que actualmente tiene el video seleccionado, '+
                    'no debe ser menor que la cantidad de dinero descontado/pagado.');
        Modificacion.Caption:='0';
        Primero:=True;
        Actual.Caption:='0';
        Nuevo.Caption:='0';
        clic:=False;
      end;
    On No_Seleccion do
      Begin
        Showmessage('Primero debe hacer Click con su mouse en la Lista y Seleccionar '+
                    'la pelicula a la cual desea modificar la deuda.');
        Modificacion.Caption:='0';
        Actual.Caption:='0';
        Nuevo.Caption:='0';
        Primero:=True;
        Enter:=False;
        Clic:=FaLSE;
      end;

    On Pagar_Parte_de_la_Deuda do
      Begin
        Query1.Sql.Clear;
        Query1.Sql.add('Update Debe set Debe.Monto = "'+Nuevo.Caption+'" '
                      +'Where ((Debe.Codigo_Video = "'+Codigo_Video+'") and '+
                       '(Debe.Codigo_Cliente = "'+Codigo_Cliente+'") and '+
                       '(Debe.Fecha = "'+Fecha+'") and '+
                       '(Debe.Persona_que_lo_alquilo = "'+Persona_que_lo_alquilo+'") and '+
                       '(Debe.Tipo = "A"))');
        Query1.ExecSql;
        Query1.Sql.Clear;
        Query1.Sql.add('Select * from Debe '+
                       'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                       'and (Debe.Tipo = "A")) Order BY Titulo_Video');
        Query1.Open;

              Alquilar_y_Devolver.Accion_Ejecutada:=True;
              Datos.Transacciones.Edit;
              Datos.Transacciones.Append;
              Datos.Transacciones.Fieldbyname('Operador').AsString:=Label4.Caption;
              Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
              Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
              Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
              Datos.Transacciones.Fieldbyname('Deuda_Alquiler').AsCurrency:=StrToInt(Modificacion.Caption);
              Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
              Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=Codigo_Cliente;
              Datos.Transacciones.Post;

        Datos.Deudas.Indexname:='';
        Datos.Deudas.Setkey;
        Datos.Deudas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
        If Datos.Deudas.Gotokey = True then
           Begin
             Datos.Deudas.Edit;
             Datos.Deudas.FieldByName('Cantidad').Asinteger:=Datos.Deudas.FieldByName('Cantidad').Asinteger + strtoint(Modificacion.Caption);
             Datos.Deudas.Post;
             Datos.Deudas.FlushBuffers;
           end
        else
           Begin
             Datos.Deudas.Refresh;
             Datos.Deudas.Last;
             Datos.Deudas.Insert;
             Datos.Deudas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
             Datos.Deudas.FieldByName('Cantidad').Asinteger:=strtoint(Modificacion.Caption);
             Datos.Deudas.Post;
             Datos.Deudas.FlushBuffers;
           end;


        Datos.Clientes.indexname:='';
        Datos.Clientes.setkey;
        Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Codigo_Cliente;
        If (Datos.Clientes.gotokey = true) then
          Begin
            Datos.Clientes.Edit;
            Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').Asinteger:=
                     Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').Asinteger + strtoint(Modificacion.Caption);
            Datos.Clientes.Fieldbyname('Debe_Alquileres').Asinteger:=
                     Datos.Clientes.Fieldbyname('Debe_Alquileres').Asinteger - strtoint(Modificacion.Caption);
            Datos.Clientes.Post;
            Datos.Clientes.FlushBuffers;
          end;

        //Actualización de los video para ponerle el ingreso por Alquileres
        Datos.Videos.indexname:='';
        Datos.Videos.setkey;
        Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codigo_Video;
        If (Datos.Videos.gotokey = true) then
          Begin
            Datos.Videos.Edit;
            Datos.Videos.Fieldbyname('Ingresos_Por_Alquiler').Asinteger:=
                   Datos.Videos.Fieldbyname('Ingresos_Por_Alquiler').Asinteger + strtoint(Modificacion.Caption);
            Datos.Videos.Fieldbyname('Debe_Alquileres').Asinteger:=
                   Datos.Videos.Fieldbyname('Debe_Alquileres').Asinteger - strtoint(Modificacion.Caption);
            Datos.Videos.Post;
            Datos.Videos.FlushBuffers;
          end;
        Desglozar:=Codigo_Video;
        Codigo_Video_a_Buscar:='';
        Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                               Desglozar[3]+Desglozar[4];
        Datos.Total.indexname:='';
        Datos.Total.Setkey;
        Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
        IF Datos.Total.GotoKey = True then
          Begin
            Datos.Total.Edit;
            Datos.Total.FieldByName('Debe_Alquileres').Asinteger:= Datos.Total.FieldByName('Debe_Alquileres').Asinteger -
                                                         strtoint(Modificacion.Caption);
            Datos.Total.FieldByName('Ingreso_Total').Asinteger:= Datos.Total.FieldByName('Ingreso_Total').Asinteger +
                                                         strtoint(Modificacion.Caption);
            Datos.Total.Post;
            Datos.Total.FlushBuffers;
          end;
        Alquilar_y_Devolver.Label6.Caption:=IntTostr(strtoint(Alquilar_y_Devolver.Label6.Caption) - strtoint(Modificacion.Caption));
        Alquilar_y_Devolver.Label30.Caption:=IntTostr(strtoint(Alquilar_y_Devolver.Label30.Caption) + strtoint(Modificacion.Caption));
        Alquilar_y_Devolver.LabelTotal.Caption:=inttostr(strtoint(Alquilar_y_Devolver.Label28.Caption) + strtoint(Alquilar_y_Devolver.Label18.Caption)+
                            strtoint(Alquilar_y_Devolver.Label27.Caption) + strtoint(Alquilar_y_Devolver.Label30.Caption));
        Actual.Caption:='0';
        Enter:=False;
        Modificacion.Caption:='0';
        Primero:=True;
        Nuevo.Caption:='0';
        Clic:=False;
      end;

    On Monto_Igual do
      Begin
        Query1.Sql.Clear;
        Query1.Sql.add('Delete from Debe '
                      +'Where ((Debe.Codigo_Video = "'+Codigo_Video+'") and '+
                       '(Debe.Codigo_Cliente = "'+Codigo_Cliente+'") and '+
                       '(Debe.Fecha = "'+Fecha+'") and '+
                       '(Debe.Persona_que_lo_alquilo = "'+Persona_que_lo_alquilo+'") and '+
                       '(Debe.Tipo = "A"))');
        Query1.ExecSql;
        Query1.Sql.Clear;
        Query1.Sql.add('Select * from Debe '+
                       'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                       'and (Debe.Tipo = "A")) Order BY Titulo_Video');
        Query1.Open;

        //Actualización de los clientes para ponerle el gasto por Alquileres
        IF Radiogroup1.Itemindex = 0 then
          Begin
            Datos.Clientes.indexname:='';
            Datos.Clientes.setkey;
            Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Codigo_Cliente;
            If (Datos.Clientes.gotokey = true) then
              Begin
                Datos.Clientes.Edit;
                Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').Asinteger:=
                                     Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').Asinteger + strtoint(Modificacion.Caption);
                Datos.Clientes.Fieldbyname('Debe_Alquileres').Asinteger:=
                                     Datos.Clientes.Fieldbyname('Debe_Alquileres').Asinteger - strtoint(Modificacion.Caption);
                Datos.Clientes.Post;
                Datos.Clientes.FlushBuffers;
              end;

              Alquilar_y_Devolver.Accion_Ejecutada:=True;
              Datos.Transacciones.Edit;
              Datos.Transacciones.Append;
              Datos.Transacciones.Fieldbyname('Operador').AsString:=Label4.Caption;
              Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
              Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
              Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
              Datos.Transacciones.Fieldbyname('Deuda_Alquiler').AsCurrency:=StrToInt(Modificacion.Caption);
              Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
              Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=Codigo_Cliente;
              Datos.Transacciones.Post;

            Datos.Deudas.Indexname:='';
            Datos.Deudas.Setkey;
            Datos.Deudas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
            If Datos.Deudas.Gotokey = True then
               Begin
                 Datos.Deudas.Edit;
                 Datos.Deudas.FieldByName('Cantidad').Asinteger:=Datos.Deudas.FieldByName('Cantidad').Asinteger + strtoint(Modificacion.Caption);
                 Datos.Deudas.Post;
                 Datos.Deudas.FlushBuffers;
               end
            else
               Begin
                 Datos.Deudas.Refresh;
                 Datos.Deudas.Last;
                 Datos.Deudas.Insert;
                 Datos.Deudas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                 Datos.Deudas.FieldByName('Cantidad').Asinteger:=strtoint(Modificacion.Caption);
                 Datos.Deudas.Post;
                 Datos.Deudas.FlushBuffers;
               end;

            //Actualización de los video para ponerle el ingreso por Alquileres
            Datos.Videos.indexname:='';
            Datos.Videos.setkey;
            Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codigo_Video;
            If (Datos.Videos.gotokey = true) then
              Begin
                Datos.Videos.Edit;
                Datos.Videos.Fieldbyname('Ingresos_Por_Alquiler').Asinteger:=
                                     Datos.Videos.Fieldbyname('Ingresos_Por_Alquiler').Asinteger + strtoint(Modificacion.Caption);
                Datos.Videos.Fieldbyname('Debe_Alquileres').Asinteger:=
                                     Datos.Videos.Fieldbyname('Debe_Alquileres').Asinteger - strtoint(Modificacion.Caption);
                Datos.Videos.Post;
                Datos.Videos.FlushBuffers;
              end;


            Desglozar:=Codigo_Video;
            Codigo_Video_a_Buscar:='';
            Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                                   Desglozar[3]+Desglozar[4];

            Datos.Total.indexname:='';
            Datos.Total.Setkey;
            Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
            IF Datos.Total.GotoKey = True then
              Begin
                Datos.Total.Edit;
                Datos.Total.FieldByName('Debe_Alquileres').Asinteger:= Datos.Total.FieldByName('Debe_Alquileres').Asinteger -
                                                             strtoint(Modificacion.Caption);
                Datos.Total.FieldByName('Ingreso_Total').Asinteger:= Datos.Total.FieldByName('Ingreso_Total').Asinteger +
                                                             strtoint(Modificacion.Caption);
                Datos.Total.Post;
                Datos.Total.FlushBuffers;
              end;
              Alquilar_y_Devolver.Label6.Caption:=IntTostr(strtoint(Alquilar_y_Devolver.Label6.Caption) - strtoint(Modificacion.Caption));
              Alquilar_y_Devolver.Label30.Caption:=IntTostr(strtoint(Alquilar_y_Devolver.Label30.Caption) + strtoint(Modificacion.Caption));
              Alquilar_y_Devolver.LabelTotal.Caption:=inttostr(strtoint(Alquilar_y_Devolver.Label28.Caption) + strtoint(Alquilar_y_Devolver.Label18.Caption)+
                            strtoint(Alquilar_y_Devolver.Label27.Caption) + strtoint(Alquilar_y_Devolver.Label30.Caption));
          end;
        Actual.Caption:='0';
        Enter:=False;
        Modificacion.Caption:='0';
        Primero:=True;
        Nuevo.Caption:='0';
        Clic:=False;
      end;
 end;
end;
end.
