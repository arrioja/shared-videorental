unit URebajar_deuda_Multa_Atrasada;

interface

uses                                                                         
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Numedit, StdCtrls, Menus, Grids, DBGrids, Db, DBTables, ExtCtrls,
  Buttons, Mask, marquee, Refresh, RefreshQ;

type
  Mal_Descuento               = Class(Exception);
  Descontar_Parte_de_la_Deuda = Class(Exception);
  Mal_DEseo                   = Class(Exception);
  Poca_Deuda                  = Class(Exception);
  Monto_Igual                 = Class(Exception);
  No_Seleccion                = Class(Exception);
  Pagar_Parte_de_la_Deuda     = Class(Exception);

  TRebajar_Multa_Atrasada = class(TForm)
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
    Label5: TLabel;
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
  Rebajar_Multa_Atrasada: TRebajar_Multa_Atrasada;
  Clic,Enter:Boolean;
  Desglozar:string;
  Codigo_Video_a_Buscar:string;
  Primero:boolean;
  Codigo_Video,Monto,Codigo_Cliente,Fecha,
  Persona_que_lo_alquilo:String;
  Nuevo_Monto_debe:Real;


implementation

uses ualquilar_y_devolver, uconfirmar, Uprincipal, MODULO_DE_DATOS;

{$R *.DFM}

Function Nombre_Computador : String; Far; External 'Control.dll';

procedure TRebajar_Multa_Atrasada.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TRebajar_Multa_Atrasada.FormShow(Sender: TObject);
begin
  Codigo_Video:='';
  Clic:=False;
  Monto:='';
  Codigo_Cliente:='';
  Fecha:='';
  Persona_que_lo_alquilo:='';

  RadioGroup1.Itemindex:=-1;
  Query1.Sql.Clear;
  Query1.Sql.add('Select * from Debe '+
                 'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                 'and (Debe.Tipo = "M")) Order BY Titulo_Video');
  Query1.Open;
  Actual.Caption:='0';
  Modificacion.Caption:='0';
  Nuevo.Caption:='0';
  Primero:=True;
end;

procedure TRebajar_Multa_Atrasada.DBGrid1CellClick(Column: TColumn);
begin
  Codigo_Video:=Query1.Fieldbyname('Codigo_Video').Asstring;
  Monto:=Query1.Fieldbyname('Monto').Asstring;
  Codigo_Cliente:=Query1.Fieldbyname('Codigo_Cliente').Asstring;
  Fecha:=Query1.Fieldbyname('Fecha').Asstring;
  Persona_que_lo_alquilo:=Query1.Fieldbyname('Persona_que_lo_alquilo').Asstring;
  Actual.Caption:=Query1.Fieldbyname('Monto').Asstring;
  Clic:=True;
end;

procedure TRebajar_Multa_Atrasada.DescuentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
end;


procedure TRebajar_Multa_Atrasada.FormKeyPress(Sender: TObject;
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
      Radiogroup1.Itemindex:=-1;
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
                  If (strtofloat(Modificacion.Caption) > strtofloat(Actual.Caption)) then
                    Begin
                      Raise Poca_Deuda.Create(' ');
                    end;
                  If (strtofloat(Modificacion.Caption) < strtofloat(Actual.Caption)) then
                    Begin
                      Nuevo.Caption:= FloatTostr(strtofloat(Actual.Caption)-strtofloat(Modificacion.Caption));
                    end;
                end;


              If Radiogroup1.Itemindex = 1 then
                Begin
                  If (strtofloat(Modificacion.Caption) > strtofloat(Actual.Caption)) then
                    Begin
                      Raise Poca_Deuda.Create(' ');
                    end;
                  If (strtofloat(Modificacion.Caption) < strtofloat(Actual.Caption)) then
                    Begin
                      Nuevo.Caption:= FloattoStr(strtofloat(Actual.Caption)-strtofloat(Modificacion.Caption));
                    end;
                end;

              If Radiogroup1.Itemindex = 2 then
                Begin
                  Nuevo.Caption:= floattostr(strtofloat(Actual.Caption)+strtofloat(Modificacion.Caption));
                end;

              If ((Radiogroup1.Itemindex <> 0) and (Radiogroup1.Itemindex <> 1) and
                  (Radiogroup1.Itemindex <> 2)) then
                Begin
                  Raise Mal_Deseo.Create(' ');
                end;
              Enter:=True;
            end
          else
            Begin
              If Radiogroup1.Itemindex = 0 then
                Begin
                  If (strtofloat(Modificacion.Caption) = strtofloat(Actual.Caption)) then
                    Begin
                      Try
                        Begin
                          Confirmar:=TConfirmar.Create(Self);
                          Confirmar.Label1.caption:='Cancelar Deuda ?';
                          Confirmar.Caption:='C o n f i r m a r .';
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
                              Radiogroup1.Itemindex:=-1;
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
                  If (strtofloat(Modificacion.Caption) < strtofloat(Actual.Caption)) then
                    Begin
                      Try
                        Begin
                          Confirmar:=TConfirmar.Create(Self);
                          Confirmar.Label1.caption:='   Está Seguro ?';
                          Confirmar.Caption:='C o n f i r m a r .';
                          Confirmar.showmodal;
                          If Confirmar.modalresult = mrok then
                            Begin
                              Raise Descontar_Parte_de_la_Deuda.Create(' ');
                            end
                          else
                            Begin
                              Enter:=False;
                              Actual.Caption:='0';
                              Modificacion.Caption:='0';
                              Primero:=True;
                              Nuevo.Caption:='0';
                              Radiogroup1.Itemindex:=-1;
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
                end;
              If (Radiogroup1.Itemindex = 1) then
                Begin
                  If (strtofloat(Modificacion.Caption) = strtofloat(Actual.Caption)) then
                    Begin
                      Try
                        Begin
                          Confirmar:=TConfirmar.Create(Self);
                          Confirmar.Label1.caption:='Cancelar Deuda ?';
                          Confirmar.Caption:='C o n f i r m a r .';
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
                              Radiogroup1.Itemindex:=-1;
                              Clic:=False;
                            end;
                        end
                      Finally
                        Begin
                          Confirmar.Free;
                          Confirmar:=Nil;
                        end
                      end
                    end;
                  If (strtofloat(Modificacion.Caption) < strtofloat(Actual.Caption)) then
                    Begin
                      Try
                        Begin
                          Confirmar:=TConfirmar.Create(Self);
                          Confirmar.Label1.caption:='   Está Seguro ?';
                          Confirmar.Caption:='C o n f i r m a r .';
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
                              Radiogroup1.Itemindex:=-1;
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
                end;

              If (Radiogroup1.Itemindex = 2) then
                Begin
                  Try
                    Begin
                      Confirmar:=TConfirmar.Create(Self);
                      Confirmar.Label1.caption:='   Está Seguro ?';
                      Confirmar.Caption:='C o n f i r m a r .';
                      Confirmar.showmodal;
                      If Confirmar.modalresult = mrok then
                        Begin
                          Query1.Sql.Clear;
                          Query1.Sql.add('Update Debe set Debe.Monto = :N1'+
                                     'Where ((Debe.Codigo_Video = "'+Codigo_Video+'") and '+
                                     '(Debe.Codigo_Cliente = "'+Codigo_Cliente+'") and '+
                                     '(Debe.Fecha = "'+Fecha+'") and '+
                                     '(Debe.Persona_que_lo_alquilo = "'+Persona_que_lo_alquilo+'") and '+
                                     '(Debe.Tipo = "M"))');
                          Query1.ParamByName('N1').AsCurrency:=StrToFloat(Nuevo.Caption);
                          Query1.ExecSql;

                          RadioGroup1.Itemindex:=-1;
                          Query1.Sql.Clear;
                          Query1.Sql.add('Select * from Debe '+
                                     'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                                     'and (Debe.Tipo = "M")) Order BY Titulo_Video');
                          Query1.Open;
                          Alquilar_y_Devolver.Label24.Caption:=Floattostr(strtofloat(Alquilar_y_Devolver.Label24.Caption) + strtofloat(Modificacion.Caption));

                          Actual.Caption:='0';
                          Modificacion.Caption:='0';
                          Nuevo.Caption:='0';
                          Primero:=True;
                          Enter:=False;
                          Clic:=False;
                          Radiogroup1.Itemindex:=-1;
                        end
                      else
                        Begin
                          Enter:=False;
                          Actual.Caption:='0';
                          Modificacion.Caption:='0';
                          Primero:=True;
                          Nuevo.Caption:='0';
                          Radiogroup1.Itemindex:=-1;
                          Clic:=False;
                        end;
                    end
                  Finally
                    Begin
                      Confirmar.Free;
                      Confirmar:=Nil;
                    end
                  end;
                end
              else
                Begin
                  Modificacion.Caption:='0';
                  Nuevo.Caption:='0';
                  Primero:=True;
                  RadioGroup1.Itemindex:=-1;
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
              If Key = #44 then
                Begin
                  Modificacion.Caption:= Modificacion.Caption+',';
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
              If Key = #44 then
                Begin
                  Modificacion.Caption:=',';
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
        RadioGroup1.Itemindex:=-1;
      end;
    On Poca_Deuda do
      Begin
        Showmessage('El monto de la deuda que actualmente tiene el video seleccionado, '+
                    'no debe ser menor que la cantidad de dinero descontado/pagado.');
        Modificacion.Caption:='0';
        Primero:=True;
        Actual.Caption:='0';
        Nuevo.Caption:='0';
        RadioGroup1.Itemindex:=-1;
        clic:=False;
      end;
    On No_Seleccion do
      Begin
        Showmessage('Primero debe hacer Click con su mouse en la Lista y Seleccionar '+
                    'la pelicula a la cual desea modificar la deuda.');
        Modificacion.Caption:='0';
        Actual.Caption:='0';
        RadioGroup1.Itemindex:=-1;
        Nuevo.Caption:='0';
        Primero:=True;
        Enter:=False;
        Clic:=FaLSE;
      end;



    On Pagar_Parte_de_la_Deuda do
      Begin
        Query1.Sql.Clear;
 //       Nuevo_Monto_debe:=StrTofloat(Nuevo.Caption);
        Query1.Sql.add('Update Debe set Debe.Monto = :N1'+
                       ' Where ((Debe.Codigo_Video = "'+Codigo_Video+'") and '+
                       '(Debe.Codigo_Cliente = "'+Codigo_Cliente+'") and '+
                       '(Debe.Fecha = "'+Fecha+'") and '+
                       '(Debe.Persona_que_lo_alquilo = "'+Persona_que_lo_alquilo+'") and '+
                       '(Debe.Tipo = "M"))');
        Query1.ParamByName('N1').AsCurrency:=StrToFloat(Nuevo.Caption);
        Query1.ExecSql;
        Query1.Sql.Clear;
        Query1.Sql.add('Select * from Debe '+
                       'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                       'and (Debe.Tipo = "M")) Order BY Titulo_Video');
        Query1.Open;

        Datos.Transacciones.Edit;
        Datos.Transacciones.Append;
        Datos.Transacciones.Fieldbyname('Operador').AsString:=Label4.Caption;
        Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
        Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
        Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
        Datos.Transacciones.Fieldbyname('Deuda_Multa').AsCurrency:=strtofloat(Modificacion.Caption);
        Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
        Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=Codigo_Cliente;
        Datos.Transacciones.Post;

        Datos.Clientes.indexname:='';
        Datos.Clientes.setkey;
        Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Codigo_Cliente;
        If (Datos.Clientes.gotokey = true) then
          Begin
            Datos.Clientes.Edit;
            Datos.Clientes.Fieldbyname('Gastado_en_Multa').AsCurrency:=
                     Datos.Clientes.Fieldbyname('Gastado_en_Multa').AsCurrency + strtofloat(Modificacion.Caption);
            Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency:=
                     Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
            Datos.Clientes.Post;
            Datos.Clientes.FlushBuffers;
          end;

        //Actualización del Nuevo Ingreso por Multas
        Datos.Multas.Indexname:='';
        Datos.Multas.Setkey;
        Datos.Multas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
        If (Datos.Multas.Gotokey = True) then
          Begin
            Datos.Multas.Edit;
            Datos.Multas.Fieldbyname('Cantidad').AsCurrency:=
                    Datos.Multas.Fieldbyname('Cantidad').AsCurrency + strtofloat(Modificacion.Caption);
            Datos.Multas.Post;
            Datos.Multas.FlushBuffers;
          end
        else
          Begin
            Datos.Multas.Last;
            Datos.Multas.Insert;
            Datos.Multas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
            Datos.Multas.Fieldbyname('Cantidad').AsCurrency:=strtofloat(Modificacion.Caption);
            Datos.Multas.Post;
            Datos.Multas.FlushBuffers;
          end;

        //Actualización de los video para ponerle el ingreso por multa
        Datos.Videos.indexname:='';
        Datos.Videos.setkey;
        Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codigo_Video;
        If (Datos.Videos.gotokey = true) then
          Begin
            Datos.Videos.Edit;
            Datos.Videos.Fieldbyname('Ingresos_Por_Multa').AsCurrency:=
                   Datos.Videos.Fieldbyname('Ingresos_Por_Multa').AsCurrency + strtofloat(Modificacion.Caption);
            Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency:=
                   Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
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
            Datos.Total.FieldByName('Debe_Multas').AsCurrency:= Datos.Total.FieldByName('Debe_Multas').AsCurrency -
                                                         strtofloat(Modificacion.Caption);
            Datos.Total.FieldByName('Ingreso_Total').AsCurrency:= Datos.Total.FieldByName('Ingreso_Total').AsCurrency +
                                                         strtofloat(Modificacion.Caption);
            Datos.Total.Post;
            Datos.Total.FlushBuffers;
          end;
        Alquilar_y_Devolver.Label24.Caption:=Floattostr(strtofloat(Alquilar_y_Devolver.Label24.Caption) - strtofloat(Modificacion.Caption));
        Alquilar_y_Devolver.Label27.Caption:=Floattostr(strtofloat(Alquilar_y_Devolver.Label27.Caption) + strtofloat(Modificacion.Caption));
        Alquilar_y_Devolver.LabelTotal.Caption:=Floattostr(strtofloat(Alquilar_y_Devolver.Label28.Caption) + strtofloat(Alquilar_y_Devolver.Label18.Caption)+
                            strtofloat(Alquilar_y_Devolver.Label27.Caption) + strtofloat(Alquilar_y_Devolver.Label30.Caption));
        Actual.Caption:='0';
        Enter:=False;
        Modificacion.Caption:='0';
        Primero:=True;
        Nuevo.Caption:='0';
        Radiogroup1.Itemindex:=-1;
        Clic:=False;
      end;

    On Descontar_Parte_de_la_Deuda do
      Begin
        Query1.Sql.Clear;
        Query1.Sql.add('Update Debe set Debe.Monto = :N1'+
                       'Where ((Debe.Codigo_Video = "'+Codigo_Video+'") and '+
                       '(Debe.Codigo_Cliente = "'+Codigo_Cliente+'") and '+
                       '(Debe.Fecha = "'+Fecha+'") and '+
                       '(Debe.Persona_que_lo_alquilo = "'+Persona_que_lo_alquilo+'") and '+
                       '(Debe.Tipo = "M"))');
        Query1.ParamByName('N1').AsCurrency:=StrToFloat(Nuevo.Caption);
        Query1.ExecSql;
        Query1.Sql.Clear;
        Query1.Sql.add('Select * from Debe '+
                       'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                       'and (Debe.Tipo = "M")) Order BY Titulo_Video');
        Query1.Open;

        Datos.Transacciones.Edit;
        Datos.Transacciones.Append;
        Datos.Transacciones.Fieldbyname('Operador').AsString:=Label4.Caption;
        Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
        Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
        Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
        Datos.Transacciones.Fieldbyname('Rebaja_Multa').AsCurrency:=strtofloat(Modificacion.Caption);
        Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
        Datos.Transacciones.Fieldbyname('Autoriza_Multa').AsString:=Label5.Caption;
        Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=Codigo_Cliente;
        Datos.Transacciones.Post;


        Datos.Clientes.indexname:='';
        Datos.Clientes.setkey;
        Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Codigo_Cliente;
        If (Datos.Clientes.gotokey = true) then
          Begin
            Datos.Clientes.Edit;
            Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency:=
                     Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
            Datos.Clientes.Post;
            Datos.Clientes.FlushBuffers;
          end;

        //Actualización de los video para ponerle el ingreso por multa
        Datos.Videos.indexname:='';
        Datos.Videos.setkey;
        Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codigo_Video;
        If (Datos.Videos.gotokey = true) then
          Begin
            Datos.Videos.Edit;
            Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency:=
                   Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
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
            Datos.Total.FieldByName('Debe_Multas').AsCurrency:= Datos.Total.FieldByName('Debe_Multas').AsCurrency -
                                                         strtofloat(Modificacion.Caption);
            Datos.Total.Post;
            Datos.Total.FlushBuffers;
          end;
        Alquilar_y_Devolver.Label24.Caption:=FloatTostr(strtofloat(Alquilar_y_Devolver.Label24.Caption) - strtofloat(Modificacion.Caption));
        Alquilar_y_Devolver.LabelTotal.Caption:=FloatTostr(strtofloat(Alquilar_y_Devolver.Label28.Caption) + strtofloat(Alquilar_y_Devolver.Label18.Caption)+
                            strtofloat(Alquilar_y_Devolver.Label27.Caption) + strtofloat(Alquilar_y_Devolver.Label30.Caption));
        Actual.Caption:='0';
        Enter:=False;
        Modificacion.Caption:='0';
        Primero:=True;
        Nuevo.Caption:='0';
        Radiogroup1.Itemindex:=-1;
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
                       '(Debe.Tipo = "M"))');
        Query1.ExecSql;
        Query1.Sql.Clear;
        Query1.Sql.add('Select * from Debe '+
                       'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                       'and (Debe.Tipo = "M")) Order BY Titulo_Video');
        Query1.Open;

        //Actualización de los clientes para ponerle el gasto por multa.
        IF Radiogroup1.Itemindex = 1 then
          Begin
            Datos.Clientes.indexname:='';
            Datos.Clientes.setkey;
            Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Codigo_Cliente;
            If (Datos.Clientes.gotokey = true) then
              Begin
                Datos.Clientes.Edit;
                Datos.Clientes.Fieldbyname('Gastado_en_Multa').AsCurrency:=
                                     Datos.Clientes.Fieldbyname('Gastado_en_Multa').AsCurrency + strtofloat(Modificacion.Caption);
                Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency:=
                                     Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
                Datos.Clientes.Post;
                Datos.Clientes.FlushBuffers;
              end;

            Datos.Transacciones.Edit;
            Datos.Transacciones.Append;
            Datos.Transacciones.Fieldbyname('Operador').AsString:=Label4.Caption;
            Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
            Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
            Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
            Datos.Transacciones.Fieldbyname('Deuda_Multa').AsCurrency:=strtofloat(Modificacion.Caption);
            Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
            Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=Codigo_Cliente;
            Datos.Transacciones.Post;

          //Actualización del Nuevo Ingreso por Multas
            Datos.Multas.Indexname:='';
            Datos.Multas.Setkey;
            Datos.Multas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
            If (Datos.Multas.Gotokey = True) then
              Begin
                Datos.Multas.Edit;
                Datos.Multas.Fieldbyname('Cantidad').AsCurrency:=
                                    Datos.Multas.Fieldbyname('Cantidad').AsCurrency + strtofloat(Modificacion.Caption);
                Datos.Multas.Post;
                Datos.Multas.FlushBuffers;
              end
            else
              Begin
                Datos.Multas.Last;
                Datos.Multas.Insert;
                Datos.Multas.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                Datos.Multas.Fieldbyname('Cantidad').AsCurrency:=strtofloat(Modificacion.Caption);
                Datos.Multas.Post;
                Datos.Multas.FlushBuffers;
              end;

            //Actualización de los video para ponerle el ingreso por multa
            Datos.Videos.indexname:='';
            Datos.Videos.setkey;
            Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codigo_Video;
            If (Datos.Videos.gotokey = true) then
              Begin
                Datos.Videos.Edit;
                Datos.Videos.Fieldbyname('Ingresos_Por_Multa').AsCurrency:=
                                     Datos.Videos.Fieldbyname('Ingresos_Por_Multa').AsCurrency + strtofloat(Modificacion.Caption);
                Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency:=
                                     Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
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
                Datos.Total.FieldByName('Debe_Multas').AsCurrency:= Datos.Total.FieldByName('Debe_Multas').AsCurrency -
                                                             strtofloat(Modificacion.Caption);
                Datos.Total.FieldByName('Ingreso_Total').AsCurrency:= Datos.Total.FieldByName('Ingreso_Total').AsCurrency +
                                                             strtofloat(Modificacion.Caption);
                Datos.Total.Post;
                Datos.Total.FlushBuffers;
              end;
              Alquilar_y_Devolver.Label24.Caption:=FloatToStr(strtofloat(Alquilar_y_Devolver.Label24.Caption) - strtofloat(Modificacion.Caption));
              Alquilar_y_Devolver.Label27.Caption:=FloatTostr(strtofloat(Alquilar_y_Devolver.Label27.Caption) + strtofloat(Modificacion.Caption));
              Alquilar_y_Devolver.LabelTotal.Caption:=FloatTostr(strtofloat(Alquilar_y_Devolver.Label28.Caption) + strtofloat(Alquilar_y_Devolver.Label18.Caption)+
                            strtofloat(Alquilar_y_Devolver.Label27.Caption) + strtofloat(Alquilar_y_Devolver.Label30.Caption));
          end;
        If RadioGroup1.Itemindex = 0 then
          Begin
            Query1.Sql.Clear;
            Query1.Sql.add('Delete from Debe '
                      +'Where ((Debe.Codigo_Video = "'+Codigo_Video+'") and '+
                       '(Debe.Codigo_Cliente = "'+Codigo_Cliente+'") and '+
                       '(Debe.Fecha = "'+Fecha+'") and '+
                       '(Debe.Persona_que_lo_alquilo = "'+Persona_que_lo_alquilo+'") and '+
                       '(Debe.Tipo = "M"))');
            Query1.ExecSql;
            Query1.Sql.Clear;
            Query1.Sql.add('Select * from Debe '+
                       'Where ((Debe.Codigo_Cliente = "'+Edit1.Text+'") '+
                       'and (Debe.Tipo = "M")) Order BY Titulo_Video');
            Query1.Open;

            Datos.Transacciones.Edit;
            Datos.Transacciones.Append;
            Datos.Transacciones.Fieldbyname('Operador').AsString:=Label4.Caption;
            Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
            Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
            Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
            Datos.Transacciones.Fieldbyname('Autoriza_Multa').AsString:=Label5.Caption;
            Datos.Transacciones.Fieldbyname('Rebaja_Multa').AsCurrency:=strtofloat(Modificacion.Caption);
            Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
            Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=Codigo_Cliente;
            Datos.Transacciones.Post;

            Datos.Clientes.indexname:='';
            Datos.Clientes.setkey;
            Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Codigo_Cliente;
            If (Datos.Clientes.gotokey = true) then
              Begin
                Datos.Clientes.Edit;
                Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency:=
                     Datos.Clientes.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
                Datos.Clientes.Post;
                Datos.Clientes.FlushBuffers;
              end;

        //Actualización de los video para ponerle el ingreso por multa
            Datos.Videos.indexname:='';
            Datos.Videos.setkey;
            Datos.Videos.fieldbyname('Codigo_Video').asstring:=Codigo_Video;
            If (Datos.Videos.gotokey = true) then
              Begin
                Datos.Videos.Edit;
                Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency:=
                   Datos.Videos.Fieldbyname('Debe_Multas').AsCurrency - strtofloat(Modificacion.Caption);
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
                Datos.Total.FieldByName('Debe_Multas').AsCurrency:= Datos.Total.FieldByName('Debe_Multas').AsCurrency -
                                                         strtofloat(Modificacion.Caption);
                Datos.Total.Post;
                Datos.Total.FlushBuffers;
              end;
            Alquilar_y_Devolver.Label24.Caption:=FloatTostr(strtofloat(Alquilar_y_Devolver.Label24.Caption) - strtofloat(Modificacion.Caption));
            Alquilar_y_Devolver.LabelTotal.Caption:=FloatTostr(strtofloat(Alquilar_y_Devolver.Label28.Caption) + strtofloat(Alquilar_y_Devolver.Label18.Caption)+
                            strtofloat(Alquilar_y_Devolver.Label27.Caption) + strtofloat(Alquilar_y_Devolver.Label30.Caption));
            Actual.Caption:='0';
            Enter:=False;
            Modificacion.Caption:='0';
            Primero:=True;
            Nuevo.Caption:='0';
            Radiogroup1.Itemindex:=-1;
            Clic:=False;
          end;
        Actual.Caption:='0';
        Enter:=False;
        Modificacion.Caption:='0';
        Primero:=True;
        Nuevo.Caption:='0';
        Radiogroup1.Itemindex:=-1;
        Clic:=False;
      end;
 end;
end;
end.
