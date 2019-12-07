unit Ulista_clientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus,
  RefreshQ;

type
  TLista_Clientes = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Menu_Clientes: TPopupMenu;
    VerHistorial1: TMenuItem;
    ConsultarDatos1: TMenuItem;
    ModificarDatos1: TMenuItem;
    N1: TMenuItem;
    OpcionesparalosClientes1: TMenuItem;
    Label33: TLabel;
    ImprimirBtn: TBitBtn;
    Query1: TSelfRefreshQuery;
    RadioGroup2: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VerHistorial1Click(Sender: TObject);
    Procedure Listar;
    procedure ConsultarDatos1Click(Sender: TObject);
    procedure ModificarDatos1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lista_Clientes: TLista_Clientes;
  Orden:String;

implementation

uses Uprincipal, UHistorial_Cliente, UConsultar_Cliente, UModificar_Cliente,
  ualquilar_y_devolver, UControl_Observaciones, ULista_Cliente_Prn,
  MODULO_DE_DATOS;

{$R *.DFM}

Procedure TLista_Clientes.Listar;
Begin
  Query1.DisableControls;
          With Radiogroup1 do
            Begin
              if itemindex=0 then
                Begin
                  Query1.Sql.Clear;
                  Query1.Sql.add('Select Codigo_Cliente,Cedula_Cliente,Nombres_Cliente,Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios ORDER BY '+Orden);
                  Query1.Open;
                end;
              if itemindex=1 then
                Begin
                  Query1.Sql.Clear;
                  Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios'
                                +' where Tiene_Pelicula = True ORDER BY '+Orden);
                  Query1.Open;
                end;
              if itemindex=2 then
                Begin
                  Query1.Sql.Clear;
                  Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios'
                                +' where Tiene_Pelicula = False ORDER BY '+Orden);
                  Query1.Open;
                end;
              if itemindex=3 then
                Begin
                  Query1.Sql.Clear;
                  Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios'
                                +' where Cliente_Multado = true ORDER BY '+Orden);
                  Query1.Open;
                end;
              if itemindex=4 then
                Begin
                  Query1.Sql.Clear;
                  Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios'
                                +' where Cliente_Multado = False ORDER BY '+Orden);
                  Query1.Open;
                end;
            end;
  Query1.EnableControls;
end;

procedure TLista_Clientes.RadioGroup1Click(Sender: TObject);
Begin
  Listar;
end;

procedure TLista_Clientes.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TLista_Clientes.FormShow(Sender: TObject);
begin
  Radiogroup1.Itemindex:=0;
  Orden:='Usuarios.Nombres_Cliente';
  Query1.Refresh;
  Query1.Sql.Clear;
  Query1.Sql.add('Select Codigo_Cliente,Cedula_Cliente,Nombres_Cliente,Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios ORDER BY '+Orden);
  Query1.Open;
end;

procedure TLista_Clientes.VerHistorial1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Clientes.Open;
      Datos.Videos.Open;
      Ultima_Cliente:='Lista_Clientes';
      Desde_Principal:=False;
      Historial_Cliente:=THistorial_Cliente.Create(Self);
      Historial_Cliente.MaskEdit1.Text:=Query1.fieldbyname('Codigo_Cliente').asString;
      Historial_Cliente.Showmodal;
    end
  Finally
    Begin
      Datos.Clientes.Close;
      Datos.Videos.Close;
      Historial_Cliente.Free;
      Historial_Cliente:=Nil;
    end;
  end;
end;

procedure TLista_Clientes.ConsultarDatos1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.Clientes.Open;
      Datos.Videos.Open;
      Datos.Cheques.Open;
      Datos.Tarjetas.Open;
      Datos.Mayores.Open;
      Datos.Menores.Open;
      Consultar_Cliente:=TConsultar_Cliente.Create(Self);
      Ultima_Cliente:='Lista_Clientes';
      Desde_Principal:=False;
      Consultar_Cliente.MaskEdit3.Text:=Query1.fieldbyname('Codigo_Cliente').asString;
      Consultar_Cliente.ShowModal;
    End;
  Finally
    Begin
      Datos.Base.Connected:=False;
      Datos.Clientes.Close;
      Datos.Videos.Close;
      Datos.Cheques.Close;
      Datos.Tarjetas.Close;
      Datos.Mayores.Close;
      Datos.Menores.Close;
      Consultar_Cliente.Free;
      Consultar_Cliente:=Nil;
    end;
  end;
end;

procedure TLista_Clientes.ModificarDatos1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Clientes.Open;
      Datos.Cheques.Open;
      Datos.Tarjetas.Open;
      Datos.Mayores.Open;
      Datos.Menores.Open;
      Ultima_Cliente:='Lista_Clientes';
      Desde_Principal:=False;
      Modificar_Cliente:=TModificar_Cliente.Create(Self);
      Modificar_Cliente.MaskEdit3.Text:=Query1.fieldbyname('Codigo_Cliente').asString;
      Modificar_Cliente.Showmodal;
      Listar;
    end
  Finally
    Begin
      Datos.Clientes.Close;
      Datos.Cheques.Close;
      Datos.Tarjetas.Close;
      Datos.Mayores.Close;
      Datos.Menores.Close;
      Modificar_Cliente.Free;
      Modificar_Cliente:=Nil;
    end
  end;
end;

procedure TLista_Clientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #27 then
   Begin
     Close;
   end;
 If ((Key <> #13) and (Key <> #27)) then
  Begin
  With Radiogroup1 do
     Begin
     if itemindex=0 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Codigo_Cliente,Cedula_Cliente,Nombres_Cliente,Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente  from Usuarios '+
                         'Where (Nombres_Cliente LIKE "'+UpperCase(KEY)+'%") ORDER BY '+Orden);
          Query1.Open;
        end;
     if itemindex=1 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios '+
           'Where ((Usuarios.Nombres_Cliente LIKE "'+UpperCase(KEY)+'%") and (Tiene_Pelicula = True)) ORDER BY '+Orden);
          Query1.Open;
        end;
     if itemindex=2 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios '+
           'Where ((Usuarios.Nombres_Cliente LIKE "'+UpperCase(KEY)+'%") and (Tiene_Pelicula = False)) ORDER BY '+Orden);
          Query1.Open;
        end;
     if itemindex=3 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios '+
           'Where ((Usuarios.Nombres_Cliente LIKE "'+UpperCase(KEY)+'%") and (Cliente_Multado = True)) ORDER BY '+Orden);
          Query1.Open;
        end;
     if itemindex=4 then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Distinct Codigo_Cliente, Cedula_Cliente, Nombres_Cliente, Apellidos_Cliente, Telefono_1_cliente, Telefono_2_cliente from Usuarios '+
           'Where ((Usuarios.Nombres_Cliente LIKE "'+UpperCase(KEY)+'%") and (Cliente_Multado = False)) ORDER BY '+Orden);
          Query1.Open;
        end;
     end;
  end;
end;

procedure TLista_Clientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IF Desde_Principal = True then
    Begin
      Principal.Enabled:=True;
    end
  else
    Begin
      If Ultima_Cliente = 'Alquilar y Devolver' then
        Begin
         Alquilar_y_Devolver.Enabled:=True;
         Alquilar_y_Devolver.MaskEdit1.Setfocus;
        end;
    end;
end;

procedure TLista_Clientes.DBGrid1DblClick(Sender: TObject);
begin
  IF Desde_Principal = False then
    Begin
      Alquilar_y_Devolver.MaskEdit1.Text:=Query1.Fieldbyname('Codigo_Cliente').Asstring;
      Close;
    end;
end;

procedure TLista_Clientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_F4) then
   Begin
     Try
       Begin
         Datos.Clientes.Open;
         Control_Observaciones:=TControl_Observaciones.Create(Self);
         Control_Observaciones.ABuscar.Caption:=Query1.Fieldbyname('Codigo_Cliente').Asstring;
         Control_Observaciones.Showmodal;
         Listar;
       end
     Finally
       Begin
         Control_Observaciones.Free;
         Control_Observaciones:=Nil;
         Datos.Clientes.Close;
       end;
     end;
   end;
end;

procedure TLista_Clientes.BitBtn3Click(Sender: TObject);
begin
  Try
    Begin
      Lista_Cliente_Prn:=TLista_Cliente_Prn.Create(Self);
      Lista_Cliente_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Lista_Cliente_Prn.Free;
      Lista_Cliente_Prn:=Nil;
    end;
  end;
end;

procedure TLista_Clientes.RadioGroup2Click(Sender: TObject);
begin
  Case RadioGroup2.Itemindex of
    0:Begin
        Orden:='Usuarios.Codigo_Cliente';
      end;
    1:Begin
        Orden:='Usuarios.Nombres_Cliente';
      end;
    2:Begin
        Orden:='Usuarios.Cedula_Cliente';
      end;
    3:Begin
        Orden:='Usuarios.Apellidos_Cliente';
      end;
  end;
  Listar;
end;

end.
