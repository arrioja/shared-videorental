unit Migrar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gauges, StdCtrls, Buttons, Db, DBTables, Refresh, Grids, DBGrids,
  DBCtrls, ExtCtrls;

type
  Tfghjvb64 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Gauge1: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Destino: TSelfRefreshTable;
    Origen: TSelfRefreshTable;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Gauge5: TGauge;
    Gauge6: TGauge;
    Label5: TLabel;
    Label6: TLabel;
    Table3: TSelfRefreshTable;
    Table6: TSelfRefreshTable;
    Table4: TSelfRefreshTable;
    Table5: TSelfRefreshTable;
    Table8: TSelfRefreshTable;
    Table7: TSelfRefreshTable;
    Memo1: TMemo;
    Table10: TSelfRefreshTable;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Tablota: TSelfRefreshTable;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    BitBtn5: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label10: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DestinoAfterPost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fghjvb64: Tfghjvb64;

implementation

{$R *.DFM}

procedure Tfghjvb64.BitBtn1Click(Sender: TObject);
begin
  Origen.TableName:='Videos.Db';
  Origen.Open;
  Label3.Caption:='V I D E O S';
  Origen.First;
  Gauge1.Progress:=0;
  Gauge1.MaxValue:=Origen.RecordCount;
  While Not Origen.EOF do
    Begin
      Origen.Edit;
      Origen.Fieldbyname('Nuevo_Codigo').AsString:=FormatFloat('0000',Origen.Fieldbyname('Num_Reg').AsFloat)+'-001';
      Case Origen.Fieldbyname('Genero').AsInteger of
        144:Origen.Fieldbyname('Nuevo_Genero').AsString:='DRAMA';
        145:Origen.Fieldbyname('Nuevo_Genero').AsString:='ACCION';
        146:Origen.Fieldbyname('Nuevo_Genero').AsString:='CENSURA';
        147:Origen.Fieldbyname('Nuevo_Genero').AsString:='INFANTILES';
        148:Origen.Fieldbyname('Nuevo_Genero').AsString:='TERROR';
        149:Origen.Fieldbyname('Nuevo_Genero').AsString:='CIENCIA FICCION';
        150:Origen.Fieldbyname('Nuevo_Genero').AsString:='SUSPENSO';
        151:Origen.Fieldbyname('Nuevo_Genero').AsString:='COMEDIA';
        152:Origen.Fieldbyname('Nuevo_Genero').AsString:='AVENTURA';
        153:Origen.Fieldbyname('Nuevo_Genero').AsString:='CINEMATICA';
        154:Origen.Fieldbyname('Nuevo_Genero').AsString:='DOCUMENTALES';
        155:Origen.Fieldbyname('Nuevo_Genero').AsString:='LATINOAMERICANAS';
        156:Origen.Fieldbyname('Nuevo_Genero').AsString:='CLASICOS';
        157:Origen.Fieldbyname('Nuevo_Genero').AsString:='MUSICALES';
      end;
      Origen.Post;
      Origen.Flushbuffers;
      Origen.Next;
      Gauge1.Progress:=Gauge1.Progress+1;
      Application.Processmessages;
    end;
end;

procedure Tfghjvb64.DestinoAfterPost(DataSet: TDataSet);
begin
  Destino.FlushBuffers;
end;

procedure Tfghjvb64.BitBtn2Click(Sender: TObject);
begin
  Origen.Close;
  Destino.Close;
  Table3.Close;
  Table4.Close;
  Table5.Close;
  Table6.Close;
  Table7.Close;
  Table8.Close;
  Tablota.Close;
  Close;
end;

procedure Tfghjvb64.BitBtn3Click(Sender: TObject);
var
  Desglozar:String;
  Codigo_Video_a_Buscar:String;
begin
  Destino.TableName:='Videos.db';
  Table3.TableName:='Total.db';
  Table3.Open;
  Destino.Open;
  Origen.First;
  Gauge2.Progress:=0;
  Gauge2.MaxValue:=Origen.RecordCount;
  While Not Origen.EOF do
    Begin
      Destino.last;
      Destino.insert;
      Destino.fieldbyname('Codigo_video').asstring:=Origen.Fieldbyname('Nuevo_Codigo').AsString;
      Destino.fieldbyname('Titulo_video').asstring:=Origen.Fieldbyname('Titulo').AsString;
      If Origen.Fieldbyname('Nuevo_Genero').AsString = 'CENSURA' THEN
        Begin
          Destino.fieldbyname('Clase_video').asstring:='XXX';
        end;
      If Origen.Fieldbyname('Nuevo_Genero').AsString = 'MUSICALES' THEN
        Begin
          Destino.fieldbyname('Clase_video').asstring:='MUS';
        end;
      If ((Origen.Fieldbyname('Nuevo_Genero').AsString <> 'CENSURA') AND
         (Origen.Fieldbyname('Nuevo_Genero').AsString <> 'MUSICALES')) THEN
        Begin
          Destino.fieldbyname('Clase_video').asstring:=Origen.Fieldbyname('Censura').AsString;
        end;

      Destino.fieldbyname('Categoria_video').asstring:=Origen.Fieldbyname('Nuevo_Genero').AsString;
      Destino.fieldbyname('Fecha_Ingreso_video').asstring:=Origen.Fieldbyname('Fecha').AsString;
      Destino.fieldbyname('Precio_video').asinteger:=Origen.Fieldbyname('Costo').AsInteger;
      Destino.fieldbyname('Numero_Ejemplar_video').asinteger:=1;
      Destino.Fieldbyname('Video_Alquilado').asboolean:=False;
      Destino.FieldByName('Ingresos_del_Video').asinteger:=0;
      Destino.FieldByName('Ingresos_por_Alquiler').asinteger:=0;
      Destino.FieldByName('Ingresos_por_Multa').asinteger:=0;
      Destino.Fieldbyname('Video_Doble').asboolean:=False;
      Destino.Fieldbyname('Estreno').asboolean:=False;
      Destino.fieldbyname('Codigo_Cliente').asstring:='';
      Destino.fieldbyname('Fecha_Alquiler').asstring:='';
      Destino.fieldbyname('Fecha_Entrega').asstring:='';
      Destino.fieldbyname('Dias_Alquiler').asinteger:=0;
      Destino.fieldbyname('Multado').asboolean:=False;
      Destino.fieldbyname('Dias_de_Multa').asinteger:=0;
      Destino.fieldbyname('Cliente_Autorizado').asstring:='';
      Destino.fieldbyname('Veces_de_Alquiler').asinteger:=0;
      Destino.fieldbyname('Veces_de_Multa').asinteger:=0;
      Destino.Post;
      Destino.FlushBuffers;

      Desglozar:=Origen.Fieldbyname('Nuevo_Codigo').AsString;
      Codigo_Video_a_Buscar:='';
      Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                                Desglozar[3]+Desglozar[4];
      Table3.Refresh;
      Table3.indexname:='';
      Table3.Last;
      Table3.Insert;
      Table3.Fieldbyname('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
      Table3.Fieldbyname('Nombre_Video').Asstring:=Origen.Fieldbyname('Titulo').AsString;
      Table3.Fieldbyname('Alquiler_Total').Asinteger:=0;
      Table3.Fieldbyname('Multa_Total').Asinteger:=0;
      Table3.Fieldbyname('Ingreso_Total').Asinteger:=0;
      Table3.Fieldbyname('Veces_de_Alquiler_Total').Asinteger:=0;
      Table3.Fieldbyname('Veces_de_Multa_Total').Asinteger:=0;
      Table3.Fieldbyname('Valor_Total').Asinteger:=Origen.Fieldbyname('Costo').AsInteger;
      Table3.Fieldbyname('Cantidad_de_Ejemplares').Asinteger:=1;
      Table3.Post;

      Origen.Next;
      Gauge2.Progress:=Gauge2.Progress+1;
      Application.Processmessages;
    end;
end;

procedure Tfghjvb64.BitBtn4Click(Sender: TObject);
begin
  Origen.Close;
  Destino.Close;
  Table3.Close;
  Table4.Close;
  Table5.Close;
  Table6.Close;

  Origen.TableName:='Autorizados.db';
  Table6.TableName:='Socios.db';

  Destino.TableName:='Usuarios.db';
  Table3.TableName:='Autorizados.db';
  Table4.TableName:='Pago_por_Cheque.db';
  Table5.TableName:='Pago_por_Tarjeta.db';
  Table10.TableName:='Menores.db';

  Origen.Open;
  Destino.Open;
  Table3.Open;
  Table4.Open;
  Table5.Open;
  Table6.Open;
//Table8.Open;
  Table10.Open;

  Origen.First;
  Gauge3.Progress:=0;
  Gauge3.MaxValue:=Origen.RecordCount;
  While Not Origen.EOF do
    Begin
      Table6.indexname:='';
      Table6.setkey;
      Table6.fieldbyname('Codigo').asString:=Origen.Fieldbyname('Codigo').AsString;
      If Table6.gotokey = True Then
        Begin
          Destino.Refresh;
          Destino.indexname:='';
          Destino.setkey;
          Destino.fieldbyname('Codigo_Cliente').asstring:=Origen.Fieldbyname('Codigo').AsString;
          if (Destino.gotokey = False) then
            Begin
              Destino.last;
              Destino.insert;
              Destino.fieldbyname('Codigo_Cliente').asstring:=Origen.Fieldbyname('Codigo').AsString;
              Destino.fieldbyname('Cedula_Cliente').asstring:=Origen.Fieldbyname('Cedula').AsString;
              Destino.fieldbyname('Nombres_Cliente').asstring:=Origen.Fieldbyname('Nombre').AsString;
              Destino.fieldbyname('Apellidos_Cliente').asstring:='';
              Destino.fieldbyname('Sexo_Cliente').asboolean:=True;
              Destino.fieldbyname('Fecha_Nacimiento_Cliente').asstring:='';
              Destino.fieldbyname('Telefono_1_Cliente').asstring:=Origen.Fieldbyname('Telefono').AsString;
              Destino.fieldbyname('Telefono_2_Cliente').asstring:='';
              Destino.fieldbyname('Ciudad_Cliente').asstring:='';
              Destino.fieldbyname('Fecha_Inscripcion').asstring:=Table6.Fieldbyname('Fecha').AsString;
              Destino.fieldbyname('Estado_Cliente').asstring:='';
              Destino.fieldbyname('Postal_Cliente').asstring:='';
              Destino.fieldbyname('Profesion_Cliente').asstring:='';
              Memo1.Lines.Clear;
              MEmo1.Lines.Add(Table6.Fieldbyname('Direccion').AsString);
              Destino.fieldbyname('Direccion_Cliente').Assign(Memo1.Lines);
              Destino.fieldbyname('Cliente_Multado').asboolean:=False;
              Destino.fieldbyname('Tiene_Pelicula').asboolean:=False;
              Case Table6.Fieldbyname('FormaInscripcion').AsInteger Of
                1:Destino.fieldbyname('Forma_de_Pago').asstring:='TC';
                2:Destino.fieldbyname('Forma_de_Pago').asstring:='CH';
                3:Destino.fieldbyname('Forma_de_Pago').asstring:='EF';
              end;
              Case Table6.Fieldbyname('FormaDeposito').AsInteger Of
                1:Destino.fieldbyname('Forma_de_Deposito').asstring:='TC';
                2:Destino.fieldbyname('Forma_de_Deposito').asstring:='CH';
                3:Destino.fieldbyname('Forma_de_Deposito').asstring:='EF';
              end;

              Destino.fieldbyname('Nombre_Empresa').asstring:=Table6.Fieldbyname('Empresa').AsString;
              Destino.fieldbyname('Telefono_Empresa').asstring:=Table6.Fieldbyname('Telefono').AsString;
              Destino.fieldbyname('Fax_Empresa').asstring:='';
              Destino.fieldbyname('Direccion_Empresa').assign(Memo1.lines);
              Destino.fieldbyname('Gastado_en_Alquiler').asinteger:=0;
              Destino.fieldbyname('Gastado_en_Multa').asinteger:=0;
              Destino.Fieldbyname('Debe_Multas').Asinteger:=0;
              Destino.Fieldbyname('Debe_Alquileres').Asinteger:=0;
              If Table6.Fieldbyname('TIPO').AsInteger = 2 Then Destino.Fieldbyname('Alquiler_Free').AsBoolean:=True
              else Destino.Fieldbyname('Alquiler_Free').AsBoolean:=False;
              Destino.Fieldbyname('Multa_Free').AsBoolean:=False;
              Destino.Fieldbyname('Sobregiro').AsBoolean:=False;
              Destino.Fieldbyname('Monto_Inscripcion').AsInteger:=0;
              Destino.Fieldbyname('Monto_Deposito').AsInteger:=Table6.Fieldbyname('Deposito').AsInteger;
              Destino.Fieldbyname('Maximo_Deuda').AsCurrency:=5000;
              Destino.Fieldbyname('Maximo_Peliculas').Asinteger:=5;
              Destino.Fieldbyname('Ultima_Visita').AsString:=Table6.Fieldbyname('UltimaVisita').AsString;
              Destino.Post;
              Destino.FlushBuffers;
              Destino.Refresh;



               //Actualización de la Base Pago_Por_Cheque
               If Destino.fieldbyname('Forma_de_Pago').asstring = 'CH' then
                  BEgin
                    Table4.Refresh;
                    Table4.last;
                    Table4.insert;
                    Table4.fieldbyname('Codigo_Cliente').asstring:=Table6.Fieldbyname('Codigo').AsString;
                    Table4.fieldbyname('Tipo').asstring:='I';
                    Table4.fieldbyname('Numero_Cheque').asstring:=Table6.Fieldbyname('InfoCheque').AsString;
                    Table4.fieldbyname('Nombre_Banco').asstring:='';
                    Table4.fieldbyname('Cantidad_Cheque').asInteger:=0;
                    Table4.fieldbyname('Fecha_Emision').asstring:=Table6.Fieldbyname('Fecha').AsString;
                    Table4.Post;
                    Table4.FlushBuffers;
                    Table4.Refresh;
                  end;

               If Destino.fieldbyname('Forma_de_Deposito').asstring = 'CH' then
                  BEgin
                    Table4.Refresh;
                    Table4.last;
                    Table4.insert;
                    Table4.fieldbyname('Codigo_Cliente').asstring:=Table6.Fieldbyname('Codigo').AsString;
                    Table4.fieldbyname('Tipo').asstring:='D';
                    Table4.fieldbyname('Numero_Cheque').asstring:=Table6.Fieldbyname('InfoCheque').AsString;
                    Table4.fieldbyname('Nombre_Banco').asstring:='';
                    Table4.fieldbyname('Cantidad_Cheque').asInteger:=Table6.Fieldbyname('Deposito').AsInteger;
                    Table4.fieldbyname('Fecha_Emision').asstring:=Table6.Fieldbyname('Fecha').AsString;
                    Table4.Post;
                    Table4.FlushBuffers;
                    Table4.Refresh;
                  end;

               //Actualización de la Base Pago_Por_Tarjeta
               If Destino.fieldbyname('Forma_de_Pago').asstring = 'TC' then
                  BEgin
                    Table5.Refresh;
                    Table5.last;
                    Table5.insert;
                    Table5.fieldbyname('Codigo_Cliente').asstring:=Table6.Fieldbyname('Codigo').AsString;
                    Table5.fieldbyname('Tipo').asstring:='I';
                    Table5.fieldbyname('Visa').asboolean:=True;
                    Table5.fieldbyname('Master').asboolean:=False;
                    Table5.fieldbyname('American').asboolean:=False;
                    Table5.fieldbyname('Diners').asboolean:=False;
                    Table5.fieldbyname('Otras').asboolean:=False;
                    Table5.fieldbyname('Nombre_Otra').asstring:='';
                    Table5.fieldbyname('Numero_Tarjeta').asstring:=Table6.Fieldbyname('InfoTarjeta').AsString;
                    Table5.fieldbyname('Fecha_Vencimiento').asstring:=Table6.Fieldbyname('TarjetaVence').AsString;
                    Table5.Post;
                    Table5.FlushBuffers;
                    Table5.Refresh;
                  end;

               If Destino.fieldbyname('Forma_de_Deposito').asstring = 'TC' then
                  BEgin
                    Table5.Refresh;
                    Table5.last;
                    Table5.insert;
                    Table5.fieldbyname('Codigo_Cliente').asstring:=Table6.Fieldbyname('Codigo').AsString;
                    Table5.fieldbyname('Tipo').asstring:='D';
                    Table5.fieldbyname('Visa').asboolean:=True;
                    Table5.fieldbyname('Master').asboolean:=False;
                    Table5.fieldbyname('American').asboolean:=False;
                    Table5.fieldbyname('Diners').asboolean:=False;
                    Table5.fieldbyname('Otras').asboolean:=False;
                    Table5.fieldbyname('Nombre_Otra').asstring:='';
                    Table5.fieldbyname('Numero_Tarjeta').asstring:=Table6.Fieldbyname('InfoTarjeta').AsString;
                    Table5.fieldbyname('Fecha_Vencimiento').asstring:=Table6.Fieldbyname('TarjetaVence').AsString;
                    Table5.Post;
                    Table5.FlushBuffers;
                    Table5.Refresh;
                  end;

              Table3.Refresh;
              Table3.Last;
              Table3.Insert;
              Table3.fieldbyname('Codigo_Cliente').asstring:=Table6.Fieldbyname('Codigo').AsString;
              Table3.fieldbyname('Nombre1').asstring:='';
              Table3.fieldbyname('Apellido1').asstring:='';
              Table3.fieldbyname('Fecha_Nacimiento1').asstring:='';
              Table3.fieldbyname('Parentesco1').asstring:='';
              Table3.fieldbyname('Nombre2').asstring:='';
              Table3.fieldbyname('Apellido2').asstring:='';
              Table3.fieldbyname('Fecha_Nacimiento2').asstring:='';
              Table3.fieldbyname('Parentesco2').asstring:='';
              Table3.fieldbyname('Nombre3').asstring:='';
              Table3.fieldbyname('Apellido3').asstring:='';
              Table3.fieldbyname('Fecha_Nacimiento3').asstring:='';
              Table3.fieldbyname('Parentesco3').asstring:='';
              Table3.fieldbyname('Nombre4').asstring:='';
              Table3.fieldbyname('Apellido4').asstring:='';
              Table3.fieldbyname('Fecha_Nacimiento4').asstring:='';
              Table3.fieldbyname('Parentesco4').asstring:='';
              Table3.Post;
              Table3.FlushBuffers;
              Table3.Refresh;

              Table10.Refresh;
              Table10.Last;
              Table10.Insert;
              Table10.fieldbyname('Codigo_Cliente').asstring:=Table6.Fieldbyname('Codigo').AsString;
              Table10.fieldbyname('Nombre1').asstring:='';
              Table10.fieldbyname('Apellido1').asstring:='';
              Table10.fieldbyname('Fecha_Nacimiento1').asstring:='';
              Table10.fieldbyname('Nombre2').asstring:='';
              Table10.fieldbyname('Apellido2').asstring:='';
              Table10.fieldbyname('Fecha_Nacimiento2').asstring:='';
              Table10.fieldbyname('Nombre3').asstring:='';
              Table10.fieldbyname('Apellido3').asstring:='';
              Table10.fieldbyname('Fecha_Nacimiento3').asstring:='';
              Table10.fieldbyname('Nombre4').asstring:='';
              Table10.fieldbyname('Apellido4').asstring:='';
              Table10.fieldbyname('Fecha_Nacimiento4').asstring:='';
              Table10.Post;
              Table10.FlushBuffers;
            end
          else
            Begin
              Table3.Refresh;
              Table3.indexname:='';
              Table3.setkey;
              Table3.fieldbyname('Codigo_Cliente').asstring:=Origen.Fieldbyname('Codigo').AsString;
              Table3.Gotokey;
              Table3.Edit;
              If Table3.fieldbyname('Nombre1').asstring ='' Then
                Begin
                  Table3.fieldbyname('Nombre1').asstring:=Origen.Fieldbyname('Nombre').AsString;
                  Table3.fieldbyname('Apellido1').asstring:='';
                  Table3.fieldbyname('Fecha_Nacimiento1').asstring:='';
                  Table3.fieldbyname('Parentesco1').asstring:='';
                end
              else
                Begin
                  If Table3.fieldbyname('Nombre2').asstring='' Then
                    Begin
                      Table3.fieldbyname('Nombre2').asstring:=Origen.Fieldbyname('Nombre').AsString;
                      Table3.fieldbyname('Apellido2').asstring:='';
                      Table3.fieldbyname('Fecha_Nacimiento2').asstring:='';
                      Table3.fieldbyname('Parentesco2').asstring:='';
                    end
                  else
                    Begin
                      If Table3.fieldbyname('Nombre3').asstring='' Then
                        Begin
                          Table3.fieldbyname('Nombre3').asstring:=Origen.Fieldbyname('Nombre').AsString;
                          Table3.fieldbyname('Apellido3').asstring:='';
                          Table3.fieldbyname('Fecha_Nacimiento3').asstring:='';
                          Table3.fieldbyname('Parentesco3').asstring:='';
                        end
                      else
                        Begin
                          If Table3.fieldbyname('Nombre4').asstring='' Then
                            Begin
                              Table3.fieldbyname('Nombre4').asstring:=Origen.Fieldbyname('Nombre').AsString;
                              Table3.fieldbyname('Apellido4').asstring:='';
                              Table3.fieldbyname('Fecha_Nacimiento4').asstring:='';
                              Table3.fieldbyname('Parentesco4').asstring:='';
                            end;
                        end;
                    end;
                end;
              Table3.Post;
              Table3.FlushBuffers;
              Table3.Refresh;
            end;
        end;
      Origen.Next;
      Gauge3.Progress:=Gauge3.Progress+1;
      Application.Processmessages;
    end;
end;

procedure Tfghjvb64.FormShow(Sender: TObject);
begin
  Tablota.TableName:='Videos.db';
  Tablota.Open;
end;

procedure Tfghjvb64.Button1Click(Sender: TObject);
begin
  Tablota.IndexName:='';
  Tablota.SetKey;
  Tablota.Fieldbyname('Codigo').AsString:=Edit1.Text;
  If Tablota.Gotokey = False Then
    Showmessage('NO');
end;

procedure Tfghjvb64.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Tablota.IndexName:='';
      Tablota.SetKey;
      Tablota.Fieldbyname('Codigo').AsString:=Edit1.Text;
      If Tablota.Gotokey = False Then
      Showmessage('NO');
    end;
end;

procedure Tfghjvb64.BitBtn5Click(Sender: TObject);
begin
  Gauge4.Progress:=0;
  Table7.Close;
  Table7.TableName:='Alquiladas.db';
  Table7.Open;
  Table7.First;
  Gauge4.MaxValue:=Table7.RecordCount;
  While Not Table7.Eof do
    Begin
      Table7.Edit;
      If ((Table7.Fieldbyname('Opcion').AsString = 'E') OR
          (Table7.Fieldbyname('Opcion').AsString = 'B') OR
          (Table7.Fieldbyname('Opcion').AsString = 'I')) Then
        Table7.Fieldbyname('Nueva_Opcion').AsInteger:= 1;
      If (Table7.Fieldbyname('Opcion').AsString = 'A') Then
        Table7.Fieldbyname('Nueva_Opcion').AsInteger:= 2;
      If ((Table7.Fieldbyname('Opcion').AsString = 'C') OR
          (Table7.Fieldbyname('Opcion').AsString = 'D')) Then
        Table7.Fieldbyname('Nueva_Opcion').AsInteger:= 3;
    Table7.Post;
    Table7.Flushbuffers;
    Table7.Next;
    Gauge4.Progress:=Gauge4.Progress+1;
    Application.Processmessages;
    end;
end;

procedure Tfghjvb64.BitBtn6Click(Sender: TObject);
begin
  Origen.Close;
  Destino.Close;
  Table3.Close;
  Table7.Close;
  Table6.Close;

  Origen.TableName:='Autorizados.db';
  Table6.TableName:='Videos.db';
  Table7.TableName:='Alquiladas.db';

  Destino.TableName:='Usuarios.db';
  Table3.TableName:='Autorizados.db';
  Table10.TableName:='Videos.db';

  Origen.Open;
  Destino.Open;
  Table3.Open;
  Table6.Open;
  Table10.Open;
  Table7.Open;

  Gauge5.Progress:=0;
  Table7.First;
  Gauge4.MaxValue:=Table7.RecordCount;
  While Not Table7.Eof do
    Begin
      Table6.IndexName:='';
      Table6.SetKey;
      Table6.Fieldbyname('Codigo').AsString:=Table7.Fieldbyname('Video').AsString;
      If Table6.Gotokey = False Then
        Showmessage('NO')
      else
        Begin
          Table10.IndexName:='';
          Table10.SetKey;
          Table10.Fieldbyname('Codigo_Video').AsString:=Table6.Fieldbyname('Nuevo_Codigo').AsString;
          If Table10.Gotokey = True Then
            Begin
              Table10.Edit;
              Table10.fieldbyname('Codigo_Cliente').asstring:=Table7.Fieldbyname('Socio').AsString;
              Table10.fieldbyname('Fecha_Alquiler').asstring:=Table7.Fieldbyname('Fecha').AsString;
              Table10.fieldbyname('Dias_Alquiler').asstring:=Table7.Fieldbyname('Nueva_Opcion').AsString;
              Table10.fieldbyname('Multado').asboolean:=False;
              Table10.fieldbyname('Video_Alquilado').asboolean:=True;
              Table10.fieldbyname('Dias_de_Multa').asinteger:=0;
              Table10.fieldbyname('Cliente_Autorizado').asInteger:=1;
              Table10.fieldbyname('Fecha_Entrega').asDateTime:=Table7.Fieldbyname('Fecha').AsDateTime+Table7.Fieldbyname('Nueva_Opcion').AsInteger;
              Table10.fieldbyname('Veces_de_Alquiler').asinteger:=Table10.fieldbyname('Veces_de_Alquiler').asinteger+1;
              Table10.Post;
              Table10.FlushBuffers;
            end;
        end;
      Table7.Next;
      Gauge5.Progress:=Gauge5.Progress+1;
      Application.PRocessmessages;
    end;
{
          //Actualización de la Base de Ingresos, Multas y Valores TOTALES por
          //título (Sin importar el ejemplar).
          Datos.Total.indexname:='';
          Datos.Total.Setkey;
          Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
          IF Datos.Total.GotoKey = True then
            Begin
              Datos.Total.Edit;
              Datos.Total.Fieldbyname('Veces_de_Alquiler_Total').Asinteger:=
              Datos.Total.Fieldbyname('Veces_de_Alquiler_Total').Asinteger + 1;
              Datos.Total.Post;
              Datos.Total.FlushBuffers;
            end;

          //Actualización de la Base Datos.Historia (La que dice cual película vió y
          //cual no).
          Datos.Historia.Refresh;
          Datos.Historia.Cancelrange;
          Datos.Historia.indexname:='';
          IF Visto = False then
            Begin
              Datos.Historia.Last;
              Datos.Historia.Insert;
              Datos.Historia.FieldByName('Codigo_Cliente').Asstring:=MaskEdit1.Text;
              Datos.Historia.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
              Datos.Historia.Fieldbyname('Nombre_Video').Asstring:=Edit3.Text;
              Datos.Historia.Fieldbyname('Fecha_de_Alquiler').Asstring:=Principal.Fecha_Total;
              Datos.Historia.Post;
              Datos.Historia.FlushBuffers;
            end
          else
            Begin
              Datos.Historia.Refresh;
              Datos.Historia.Cancelrange;
              Datos.Historia.indexname:='Cliente_Index';
              Datos.Historia.setrange([Maskedit1.text]
                                     ,[Maskedit1.text]);
              Datos.Historia.Refresh;
              Datos.Historia.First;
              Desglozar:=MaskEdit2.Text;
              Codigo_Video_a_Buscar:='';
              Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                                     Desglozar[3]+Desglozar[4];
              Find:=False;
              While ((Find = False) and ( Not Datos.Historia.EOF)) do
                Begin
                  If Datos.Historia.Fieldbyname('Codigo_Video').Asstring = Codigo_Video_a_Buscar then
                    Begin
                      Find:=True;
                    end
                  else
                    Datos.Historia.Next;
                end;
              If Find = True Then
                Begin
                  Datos.Historia.Edit;
                  Datos.Historia.Fieldbyname('Fecha_de_Alquiler').Asstring:=Principal.Fecha_Total;
                  Datos.Historia.Post;
                  Datos.Historia.FlushBuffers;
                end;
            end;

          Datos.Videos.Refresh;
          Datos.Videos.Cancelrange;
          Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
          Datos.Videos.setrange([Maskedit1.text]
                               ,[Maskedit1.text]);
          //98798798798798798798798798789798798798798798798798798781979879879879879879879879879798798798798798798798798798798798798798798798798798798

          Datos.Videos.Refresh;
          Datos.Videos.First;
}






end;

procedure Tfghjvb64.BitBtn7Click(Sender: TObject);
Var
  Espacio:Boolean;
  St1:String;
  St2:String;
  St3:String;
  x:Integer;
begin
  Espacio:=False;
  Destino.Close;
  Destino.TableName:='Usuarios.db';
  Destino.Open;
  Gauge6.Progress:=0;
  Gauge6.MaxValue:=Destino.RecordCount;
  While Not Destino.EOF do
    Begin
      St1:='';St2:='';St3:='';
      St1:=Destino.Fieldbyname('Cedula_Cliente').AsString;
      For x:=1 to Length(St1) do
        Begin
          If St1[x] in ['0','1','2','3','4','5','6','7','8','9'] Then
            Begin
              St2:=St2+St1[x];
            end
        end;
      Case Length(St2) Of
      0:Begin
          St3:='00.000.000';
        end;
      1:Begin
          St3:='00.000.00'+St2;
        end;
      2:Begin
          St3:='00.000.0'+St2;
        end;
      3:Begin
          St3:='00.000.'+St2;
        end;
      4:Begin
          St3:='00.00'+St2[1]+'.'+St2[2]+St2[3]+St2[4];
        end;
      5:Begin
          St3:='00.0'+St2[1]+St2[2]+'.'+St2[3]+St2[4]+St2[5];
        end;
      6:Begin
          St3:='00.'+St2[1]+St2[2]+St2[3]+'.'+St2[4]+St2[5]+St2[6];
        end;
      7:Begin
          St3:='0'+St2[1]+'.'+St2[2]+St2[3]+St2[4]+'.'+St2[5]+St2[6]+St2[7];
        end;
      8:Begin
          St3:=St2[1]+St2[2]+'.'+St2[3]+St2[4]+St2[5]+'.'+St2[6]+St2[7]+St2[8];
        end;
      end;
      Destino.Edit;
      Destino.Fieldbyname('Cedula_Cliente').AsString:=St3;
      Destino.Post;

      St1:='';St2:='';St3:='';
      St1:=Destino.Fieldbyname('Telefono_1_Cliente').AsString;
      For x:=1 to Length(St1) do
        Begin
          If St1[x] in ['0','1','2','3','4','5','6','7','8','9'] Then
            Begin
              St2:=St2+St1[x];
            end
        end;
      Case Length(St2) Of
      0:Begin
          St3:='(0000) 000-00-00';
        end;
      1:Begin
          St3:='(0000) 000-00-0'+St2;
        end;
      2:Begin
          St3:='(0000) 000-00-'+St2;
        end;
      3:Begin
          St3:='(0000) 000-0'+St2[1]+'-'+St2[2]+St2[3];
        end;
      4:Begin
          St3:='(0000) 000-'+St2[1]+St2[2]+'-'+St2[3]+St2[4];
        end;
      5:Begin
          St3:='(0000) 00'+St2[1]+'-'+St2[2]+St2[3]+'-'+St2[4]+St2[5];
        end;
      6:Begin
          St3:='(0000) 0'+St2[1]+St2[2]+'-'+St2[3]+St2[4]+'-'+St2[5]+St2[6];
        end;
      7:Begin
          St3:='(0000) '+St2[1]+St2[2]+St2[3]+'-'+St2[4]+St2[5]+'-'+St2[6]+St2[7];
        end;
      8:Begin
          St3:='(000'+St2[1]+') '+St2[2]+St2[3]+St2[4]+'-'+St2[5]+St2[6]+'-'+St2[7]+St2[8];
        end;
      9:Begin
          St3:='(00'+St2[1]+St2[2]+') '+St2[3]+St2[4]+St2[5]+'-'+St2[6]+St2[7]+'-'+St2[8]+St2[9];
        end;
     10:Begin
          St3:='(0'+St2[1]+St2[2]+St2[3]+') '+St2[4]+St2[5]+St2[6]+'-'+St2[7]+St2[8]+'-'+St2[9]+St2[10];
        end;
     11:Begin
          St3:='('+St2[1]+St2[2]+St2[3]+St2[4]+') '+St2[5]+St2[6]+St2[7]+'-'+St2[8]+St2[9]+'-'+St2[10]+St2[11];
        end;
      end;
      Destino.Edit;
      Destino.Fieldbyname('Telefono_1_Cliente').AsString:=St3;
      Destino.Post;

      St1:='';St2:='';St3:='';
      St1:=Destino.Fieldbyname('Telefono_Empresa').AsString;
      For x:=1 to Length(St1) do
        Begin
          If St1[x] in ['0','1','2','3','4','5','6','7','8','9'] Then
            Begin
              St2:=St2+St1[x];
            end
        end;
      Case Length(St2) Of
      0:Begin
          St3:='(0000) 000-00-00';
        end;
      1:Begin
          St3:='(0000) 000-00-0'+St2;
        end;
      2:Begin
          St3:='(0000) 000-00-'+St2;
        end;
      3:Begin
          St3:='(0000) 000-0'+St2[1]+'-'+St2[2]+St2[3];
        end;
      4:Begin
          St3:='(0000) 000-'+St2[1]+St2[2]+'-'+St2[3]+St2[4];
        end;
      5:Begin
          St3:='(0000) 00'+St2[1]+'-'+St2[2]+St2[3]+'-'+St2[4]+St2[5];
        end;
      6:Begin
          St3:='(0000) 0'+St2[1]+St2[2]+'-'+St2[3]+St2[4]+'-'+St2[5]+St2[6];
        end;
      7:Begin
          St3:='(0000) '+St2[1]+St2[2]+St2[3]+'-'+St2[4]+St2[5]+'-'+St2[6]+St2[7];
        end;
      8:Begin
          St3:='(000'+St2[1]+') '+St2[2]+St2[3]+St2[4]+'-'+St2[5]+St2[6]+'-'+St2[7]+St2[8];
        end;
      9:Begin
          St3:='(00'+St2[1]+St2[2]+') '+St2[3]+St2[4]+St2[5]+'-'+St2[6]+St2[7]+'-'+St2[8]+St2[9];
        end;
     10:Begin
          St3:='(0'+St2[1]+St2[2]+St2[3]+') '+St2[4]+St2[5]+St2[6]+'-'+St2[7]+St2[8]+'-'+St2[9]+St2[10];
        end;
     11:Begin
          St3:='('+St2[1]+St2[2]+St2[3]+St2[4]+') '+St2[5]+St2[6]+St2[7]+'-'+St2[8]+St2[9]+'-'+St2[10]+St2[11];
        end;
      end;
      Destino.Edit;
      Destino.Fieldbyname('Telefono_Empresa').AsString:=St3;
      Destino.Post;

      St1:='';St2:='';St3:='';
      St1:=Destino.Fieldbyname('Nombres_Cliente').AsString;
      For x:=1 to Length(St1) do
        Begin
          If Espacio = False Then
            Begin
              If St1[x]=' ' Then
                Begin
                  Espacio:=True;
                end
              else
                Begin
                  St2:=St2+St1[x];
                end;
            end
          else
            Begin
              St3:=St3+St1[x];
            end;
        end;
      Destino.Edit;
      Destino.Fieldbyname('Nombres_Cliente').AsString:=St2;
      Destino.Fieldbyname('Apellidos_Cliente').AsString:=St3;
      Destino.Post;
      Espacio:=False;

      Destino.Next;
      Gauge6.Progress:=Gauge6.Progress+1;
      Application.Processmessages;
    end;
end;

end.
