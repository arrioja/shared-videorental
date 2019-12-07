unit ubuscar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables, Buttons, Mask, Menus;

type
  TBuscar = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Edit1: TEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Bevel2: TBevel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    PopupMenu1: TPopupMenu;
    GroupBox2: TGroupBox;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    MaskEdit1: TMaskEdit;
    Query1: TQuery;
    Query2: TQuery;
    DBGrid2: TDBGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup5Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Buscar: TBuscar;
  codigo_a_buscar:integer;

implementation

uses uprincipal, ualquilar_y_devolver, Unumero_de_dias, uModificar_cliente,
  uModificar_video, uEliminar_cliente, uEliminar_video;

{$R *.DFM}

procedure TBuscar.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TBuscar.RadioGroup2Click(Sender: TObject);
begin
if radiogroup2.itemindex=0 then
   begin
     Label1.caption:='Ingrese el Código del Cliente:';
     Radiogroup1.itemindex:=0;
     edit1.visible:=true;
     edit1.text:='';
     Maskedit2.visible:=false;
     Maskedit1.visible:=false;
   end;
if radiogroup2.itemindex=1 then
   begin
     Label1.caption:='Ingrese el Nombre del Cliente:';
     Radiogroup1.itemindex:=1;
     edit1.visible:=true;
     edit1.text:='';
     Maskedit2.visible:=false;
     Maskedit1.visible:=false;
   end;
if radiogroup2.itemindex=2 then
   begin
     Label1.caption:='Ingrese el Apellido del Cliente:';
     Radiogroup1.itemindex:=2;
     edit1.visible:=true;
     edit1.text:='';
     Maskedit2.visible:=false;
     Maskedit1.visible:=false;
   end;
if radiogroup2.itemindex=3 then
   begin
     Label1.caption:='Ingrese la Cédula de Identidad:';
     Radiogroup1.itemindex:=3;
     edit1.visible:=false;
     Maskedit2.visible:=False;
     Maskedit2.text:='';
     Maskedit1.visible:=true;
     Maskedit1.text:='';
   end;
end;

procedure TBuscar.RadioGroup3Click(Sender: TObject);
begin
if radiogroup3.itemindex=0 then
   begin
     Label1.caption:='Ingrese el Código del Video:';
     Radiogroup4.itemindex:=0;
     Maskedit2.text:='';
     Maskedit2.visible:=true;
     edit1.visible:=false;
   end;
if radiogroup3.itemindex=1 then
   begin
     Radiogroup4.itemindex:=1;
     Label1.caption:='Ingrese el Título del Video:';
     edit1.visible:=true;
     edit1.text:='';
     Maskedit2.visible:=false;
   end;
end;
procedure TBuscar.Edit1Change(Sender: TObject);
begin
if dbgrid1.visible=true then
   begin
     Try
       Begin
     Query1.Disablecontrols;
     if radiogroup2.itemindex=0 then
        begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Codigo_Cliente,Cedula,Apellidos,Nombres '+
                         'from Usuarios Where (Codigo = "'+Edit1.Text+'") '+
                         'Order by Codigo');
          Query1.Open;
        end;
     if radiogroup2.itemindex=1 then
        begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Codigo,Cedula,Apellidos,Nombres '+
                         'from Usuarios Where (Nombres LIKE "'+Edit1.Text+'%") '+
                         'Order by Nombres');
          Query1.Open;
        end;
     if radiogroup2.itemindex=2 then
        begin
          Query1.Sql.Clear;
          Query1.Sql.add('Select Codigo,Cedula,Apellidos,Nombres '+
                         'from Usuarios Where (Apellidos LIKE "'+Edit1.Text+'%") '+
                         'Order by Apellidos');
          Query1.Open;
        end;
       end
       except
         on EDBEngineerror do
           Begin
             Showmessage('El Código de los clientes está conformado '
                        +'sólo por números, por favor no escriba '
                        +'caracteres alfabéticos mientras la búsqueda '
                        +'esté haciendose por código. ');
             Query1.Enablecontrols;
             Query1.Sql.Clear;
             Query1.Sql.add('Select Codigo,Cedula,Apellidos,Nombres '+
                            'from Usuarios Order by Codigo');
             Query1.Open;
           end;
       end;
     Query1.Enablecontrols;
   end;

if dbgrid2.visible=true then
   begin
     if radiogroup3.itemindex=1 then
        begin
          Query2.Disablecontrols;
          If Radiogroup5.Itemindex = 0 then
            Begin
              Query2.Sql.Clear;
              Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, '+
                          'Ejemplar from Videos Where ((Alquilada="True") and (Titulo LIKE "'+Edit1.Text+'%")) '+
                          'Order by Titulo');
              Query2.Open;
            end;
          If Radiogroup5.Itemindex = 1 then
            Begin
              Query2.Sql.Clear;
              Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, '+
                          'Ejemplar from Videos Where ((Alquilada="False") and (Titulo LIKE "'+Edit1.Text+'%")) '+
                          'Order by Titulo');
              Query2.Open;
            end;
          If Radiogroup5.Itemindex = 2 then
            Begin
              Query2.Sql.Clear;
              Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, '+
                          'Ejemplar from Videos Where (Titulo LIKE "'+Edit1.Text+'%") '+
                          'Order by Titulo');
              Query2.Open;
            end;
          Query2.Enablecontrols;
        end;
   end;

end;
procedure TBuscar.MaskEdit2Change(Sender: TObject);
begin
  Query2.Disablecontrols;
  If Radiogroup5.Itemindex = 0 then
    Begin
      Query2.Sql.Clear;
      Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, '+
                     'Ejemplar from Videos Where ((Alquilada="True") and (Codigo LIKE "'+MaskEdit2.Text+'%")) '+
                     'Order by Codigo');
      Query2.Open;
    end;
  If Radiogroup5.Itemindex = 1 then
    Begin
      Query2.Sql.Clear;
      Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, '+
                     'Ejemplar from Videos Where ((Alquilada="False") and (Codigo LIKE "'+MaskEdit2.Text+'%")) '+
                     'Order by Codigo');
      Query2.Open;
    end;
  If Radiogroup5.Itemindex = 2 then
    Begin
      Query2.Sql.Clear;
      Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, '+
                     'Ejemplar from Videos Where (Codigo LIKE "'+MaskEdit2.Text+'%") '+
                     'Order by Codigo');
      Query2.Open;
    end;
  Query2.Enablecontrols;
end;
procedure TBuscar.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.itemindex=0 then
    begin
      Query1.Sql.Clear;
      Query1.Sql.add('Select Codigo,Cedula,Apellidos ,Nombres from Usuarios Order by Codigo');
      Query1.Open;
    end;
  if radiogroup1.itemindex=1 then
    begin
      Query1.Sql.Clear;
      Query1.Sql.add('Select Codigo,Cedula,Apellidos ,Nombres from Usuarios Order by Nombres');
      Query1.Open;
    end;
  if radiogroup1.itemindex=2 then
    begin
      Query1.Sql.Clear;
      Query1.Sql.add('Select Codigo,Cedula,Apellidos ,Nombres from Usuarios Order by Apellidos');
      Query1.Open;
    end;
  if radiogroup1.itemindex=3 then
    begin
      Query1.Sql.Clear;
      Query1.Sql.add('Select Codigo,Cedula,Apellidos ,Nombres from Usuarios Order by Cedula');
      Query1.Open;
    end;
end;
procedure TBuscar.RadioGroup4Click(Sender: TObject);
begin
  Query2.Disablecontrols;
  If Radiogroup5.Itemindex = 0 then
     Begin
       if radiogroup4.itemindex=0 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = True Order by Codigo');
           Query2.Open;
         end;
       if radiogroup4.itemindex=1 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = True Order by Titulo');
           Query2.Open;
         end;
       if radiogroup4.itemindex=2 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = True Order by Categoria');
           Query2.Open;
         end;
       if radiogroup4.itemindex=3 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = True Order by Clase');
           Query2.Open;
         end;
       if radiogroup4.itemindex=4 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = True Order by Ejemplar');
           Query2.Open;
         end;
     end;

  If Radiogroup5.Itemindex = 1 then
     Begin
       if radiogroup4.itemindex=0 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = False Order by Codigo');
           Query2.Open;
         end;
       if radiogroup4.itemindex=1 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = False Order by Titulo');
           Query2.Open;
         end;
       if radiogroup4.itemindex=2 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = False Order by Categoria');
           Query2.Open;
         end;
       if radiogroup4.itemindex=3 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = False Order by Clase');
           Query2.Open;
         end;
       if radiogroup4.itemindex=4 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Where Alquilada = False Order by Ejemplar');
           Query2.Open;
         end;
     end;

  If Radiogroup5.Itemindex = 2 then
     Begin
       if radiogroup4.itemindex=0 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Order by Codigo');
           Query2.Open;
         end;
       if radiogroup4.itemindex=1 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Order by Titulo');
           Query2.Open;
         end;
       if radiogroup4.itemindex=2 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Order by Categoria');
           Query2.Open;
         end;
       if radiogroup4.itemindex=3 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Order by Clase');
           Query2.Open;
         end;
       if radiogroup4.itemindex=4 then
         begin
           Query2.Sql.Clear;
           Query2.Sql.add('Select Codigo,Titulo,Categoria ,Clase, Ejemplar from Videos Order by Ejemplar');
           Query2.Open;
         end;
     end;
  Query2.Enablecontrols;
end;

procedure TBuscar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{  if   ultima = 'Alquilar_video_buscar'then
     begin
       Alquilar_y_devolver.enabled:=true;
     end;

  if (ultima='Modificar_Cliente_principal') or
     (ultima='Modificar_video_principal') or
     (ultima='Alquilar_video_principal') or
     (ultima='Eliminar_Cliente_principal')then
     Begin
       Principal.enabled:=true;
     end;
}
end;


procedure TBuscar.BitBtn1Click(Sender: TObject);
//var
//  numero_De_dias_de_alquiler:integer;
//  x:integer;
begin
{if ultima = 'Alquilar_video_principal' then
   begin
     alquilar_y_devolver.edit1.text:='';
//     alquilar_y_devolver.edit2.text:='';
     alquilar_y_devolver.Maskedit1.text:='';
     alquilar_y_devolver.edit1.text:=Query1.fieldbyname('Nombres').asstring;
//     alquilar_y_devolver.edit2.text:=Query1.fieldbyname('Apellidos').asstring;
     alquilar_y_devolver.Maskedit1.text:=Query1.fieldbyname('Codigo').asstring;
     alquilar_y_devolver.Table1.indexname:='Codigo_de_usuario_indice';
     alquilar_y_devolver.Table1.first;
     alquilar_y_devolver.Table1.setrange([Query1.fieldbyname('Codigo').asinteger]
     ,[Query1.fieldbyname('Codigo').asinteger]);
     ultima := 'Alquilar_video';
     Alquilar_y_devolver.show;
     close;
   end;
if ultima = 'Alquilar_video_buscar' then
   begin
     Codigo_a_buscar:=Query2.Fieldbyname('Codigo').asstring;
     Numero_de_Dias.Label3.Caption:='" '+Query2.fieldbyname('Titulo').asstring+' "';
     Numero_de_Dias.Showmodal;
     If Numero_de_dias.modalresult = (Mrok) then
        Begin
          Query1.Sql.Clear;
          Query1.Sql.add('Update Usuarios set Tiene_videos = "True" '
                            +'Where Codigo = "'+Alquilar_y_devolver.Maskedit1.Text+'"');
          Query1.ExecSql;

          Numero_De_dias_De_Alquiler:=Numero_de_dias.Spinedit1.Value;
          Ingreso_por_alquiler:=(Precio_alquiler * Numero_de_dias_de_Alquiler);

          Reset(Ingresarch);
          Readln(Ingresarch,Antigua_cantidad);
          Closefile(Ingresarch);

          Ingreso_por_alquiler:=(Ingreso_por_alquiler+Antigua_cantidad);

          Rewrite(Ingresarch);
          Writeln(Ingresarch,Ingreso_por_alquiler);
          Closefile(Ingresarch);

          Alquilar_y_devolver.table1.indexname:='';
          Alquilar_y_devolver.table1.setkey;
          Alquilar_y_devolver.table1.fieldbyname('codigo').asstring:=Codigo_a_Buscar;
          Alquilar_y_devolver.table1.gotokey;
          Alquilar_y_devolver.table1.Edit;
          Alquilar_y_devolver.table1.fieldbyname('Dias_de_alquiler').asinteger:=Numero_de_Dias.Spinedit1.Value;
          Alquilar_y_devolver.table1.fieldbyname('Precio_de_Alquiler').asinteger:=Precio_Alquiler;
          Alquilar_y_devolver.table1.fieldbyname('Codigo_de_Usuario').asstring:=Alquilar_y_devolver.Maskedit1.text;
          Alquilar_y_devolver.table1.fieldbyname('Fecha_De_Alquiler').asstring:=datetostr(date);
          Alquilar_y_devolver.table1.fieldbyname('Alquilada').asboolean:=True;
          Alquilar_y_devolver.Table1.post;

          Alquilar_y_devolver.table1.indexname:='Codigo_de_usuario_indice';
          alquilar_y_devolver.Table1.Cancelrange;
          alquilar_y_devolver.Table1.Last;
          alquilar_y_devolver.Table1.first;
          alquilar_y_devolver.Table1.setrange([strtoint(alquilar_y_devolver.Maskedit1.text)]
          ,[strtoint(alquilar_y_devolver.Maskedit1.text)]);
          Alquilar_y_devolver.Table1.First;
          Alquilar_y_devolver.Bitbtn1.Enabled:=True;
          Alquilar_y_devolver.Label9.caption:=inttostr(Alquilar_y_devolver.Table1.Recordcount);
          close;
        end;
   end;
if  ultima = 'Eliminar_Cliente_principal' then
   begin

     Eliminar_cliente.edit1.text:='';
     Eliminar_cliente.edit2.text:='';
     Eliminar_cliente.edit3.text:='';
     Eliminar_cliente.maskedit1.text:='';
     Eliminar_cliente.maskedit2.text:='';
     Eliminar_cliente.maskedit3.text:='';
     Eliminar_cliente.maskedit4.text:='';
     Eliminar_cliente.maskedit5.text:='';
     Eliminar_cliente.memo1.lines.clear;
     Eliminar_cliente.Radiogroup1.Itemindex:=0;

     Eliminar_cliente.table1.indexname:='';
     Eliminar_cliente.table1.setkey;
     Eliminar_cliente.table1.fieldbyname('codigo').asstring:=Query1.fieldbyname('Codigo').asstring;
     Eliminar_cliente.table1.gotokey;

     Eliminar_cliente.edit1.text:=Eliminar_cliente.table1.fieldbyname('Nombres').asstring;
     Eliminar_cliente.edit3.text:=Eliminar_cliente.table1.fieldbyname('Apellidos').asstring;
     Eliminar_cliente.edit2.text:=Eliminar_cliente.table1.fieldbyname('Deposito').asstring;
     Eliminar_cliente.maskedit1.text:=Eliminar_cliente.table1.fieldbyname('Cedula').asstring;
     Eliminar_cliente.maskedit2.text:=Eliminar_cliente.table1.fieldbyname('Telefono_1').asstring;
     Eliminar_cliente.maskedit3.text:=Eliminar_cliente.table1.fieldbyname('Codigo').asstring;
     Eliminar_cliente.maskedit4.text:=Eliminar_cliente.table1.fieldbyname('Nacimiento').asstring;
     Eliminar_cliente.maskedit5.text:=Eliminar_cliente.table1.fieldbyname('Telefono_2').asstring;
     If Eliminar_cliente.table1.fieldbyname('Sexo').asboolean = True then
             Eliminar_cliente.radiogroup1.itemindex:=1;
     If Eliminar_cliente.table1.fieldbyname('Sexo').asboolean = False then
             Eliminar_cliente.radiogroup1.itemindex:=0;
     Eliminar_cliente.memo1.lines.add(Eliminar_cliente.table1.fieldbyname('Direccion').asstring);

     Eliminar_cliente.edit1.Enabled:=False;
     Eliminar_cliente.edit2.Enabled:=False;
     Eliminar_cliente.edit3.Enabled:=False;
     Eliminar_cliente.maskedit1.Enabled:=False;
     Eliminar_cliente.maskedit2.Enabled:=False;
     Eliminar_cliente.maskedit3.Enabled:=False;
     Eliminar_cliente.maskedit4.Enabled:=False;
     Eliminar_cliente.maskedit5.Enabled:=False;
     Eliminar_cliente.memo1.Enabled:=False;
     Eliminar_cliente.Radiogroup1.Enabled:=False;

     Eliminar_cliente.show;
     Close;
   end;


if ultima = 'Modificar_Cliente_principal' then
   begin
     Modificar_cliente.edit1.text:='';
     Modificar_cliente.edit2.text:='';
     Modificar_cliente.edit3.text:='';
     Modificar_cliente.maskedit1.text:='';
     Modificar_cliente.maskedit2.text:='';
     Modificar_cliente.maskedit3.text:='';
     Modificar_cliente.maskedit4.text:='';
     Modificar_cliente.maskedit5.text:='';
     Modificar_cliente.memo1.lines.clear;
     Modificar_cliente.Radiogroup1.Itemindex:=0;
     Modificar_cliente.table1.indexname:='';
     Modificar_cliente.table1.setkey;
     Modificar_cliente.table1.fieldbyname('codigo').asstring:=Query1.fieldbyname('Codigo').asstring;
     Modificar_cliente.table1.gotokey;

     Modificar_cliente.edit1.text:=Modificar_cliente.table1.fieldbyname('Nombres').asstring;
     Modificar_cliente.edit3.text:=Modificar_cliente.table1.fieldbyname('Apellidos').asstring;
     Modificar_cliente.edit2.text:=Modificar_cliente.table1.fieldbyname('Deposito').asstring;
     Modificar_cliente.maskedit1.text:=Modificar_cliente.table1.fieldbyname('Cedula').asstring;
     Modificar_cliente.maskedit2.text:=Modificar_cliente.table1.fieldbyname('Telefono_1').asstring;
     Modificar_cliente.maskedit3.text:=Modificar_cliente.table1.fieldbyname('Codigo').asstring;
     Modificar_cliente.maskedit4.text:=Modificar_cliente.table1.fieldbyname('Nacimiento').asstring;
     Modificar_cliente.maskedit5.text:=Modificar_cliente.table1.fieldbyname('Telefono_2').asstring;
     If Modificar_cliente.table1.fieldbyname('Sexo').asboolean = True then
             Modificar_cliente.radiogroup1.itemindex:=1;
     If Modificar_cliente.table1.fieldbyname('Sexo').asboolean = False then
             Modificar_cliente.radiogroup1.itemindex:=0;
     Modificar_cliente.memo1.lines.add(Modificar_cliente.table1.fieldbyname('Direccion').asstring);
     Modificar_cliente.show;
     close;
   end;


if ultima = 'Modificar_Video_Principal' then
   begin
     Modificar_video.edit1.text:='';
     Modificar_video.maskedit1.text:='';
     Modificar_video.maskedit2.text:='';
     Modificar_video.maskedit3.text:='';
     Modificar_video.Combobox1.text:='';
     Modificar_video.Combobox2.text:='';

     Modificar_video.table1.indexname:='';
     Modificar_video.table1.setkey;
     Modificar_video.table1.fieldbyname('codigo').asstring:=Query2.fieldbyname('Codigo').asstring;
     Modificar_video.table1.gotokey;

     Modificar_video.edit1.text:=Modificar_video.Table1.fieldbyname('Titulo').asstring;
     Modificar_video.maskedit1.text:=Modificar_video.Table1.fieldbyname('Codigo').asstring;
     Modificar_video.maskedit2.text:=Modificar_video.Table1.fieldbyname('Ingreso').asstring;
     Modificar_video.maskedit3.text:=Modificar_video.Table1.fieldbyname('Precio').asstring;
     Modificar_video.Combobox1.text:=Modificar_video.Table1.fieldbyname('Categoria').asstring;
     Modificar_video.Combobox2.text:=Modificar_video.Table1.fieldbyname('Clase').asstring;
     Modificar_video.show;
     close;
   end;


 if ultima='Eliminar_Video_Principal' then
   begin
     Eliminar_video.edit1.text:='';
     Eliminar_video.maskedit1.text:='';
     Eliminar_video.maskedit2.text:='';
     Eliminar_video.maskedit3.text:='';
     Eliminar_video.Combobox1.text:='';
     Eliminar_video.Combobox2.text:='';

     Eliminar_video.table1.indexname:='';
     Eliminar_video.table1.setkey;
     Eliminar_video.table1.fieldbyname('codigo').asstring:=Query2.fieldbyname('Codigo').asstring;
     Eliminar_video.table1.gotokey;

     Eliminar_video.edit1.text:=Eliminar_video.Table1.fieldbyname('Titulo').asstring;
     Eliminar_video.maskedit1.text:=Eliminar_video.Table1.fieldbyname('Codigo').asstring;
     Eliminar_video.maskedit2.text:=Eliminar_video.Table1.fieldbyname('Ingreso').asstring;
     Eliminar_video.maskedit3.text:=Eliminar_video.Table1.fieldbyname('Precio').asstring;
     Eliminar_video.Combobox1.text:=Eliminar_video.Table1.fieldbyname('Categoria').asstring;
     Eliminar_video.Combobox2.text:=Eliminar_video.Table1.fieldbyname('Clase').asstring;
     Eliminar_video.show;
     close;
   end;
}

end;

procedure TBuscar.FormShow(Sender: TObject);
begin
  If Dbgrid1.Visible = True then
     Begin
       Query1.Sql.Clear;
       Query1.Sql.add('Select Codigo,Cedula,Apellidos,Nombres from Usuarios');
       Query1.Open;
     end;
  If Dbgrid2.Visible = True then
     Begin
       if Radiogroup5.itemindex = 0 then
          begin
            Query2.Sql.Clear;
            Query2.Sql.add('Select Codigo,Titulo, Categoria, Clase, Ejemplar from Videos '
                   +'Where Alquilada = True');
            Query2.Open;
          end;
       if Radiogroup5.itemindex = 1 then
          begin
            Query2.Sql.Clear;
            Query2.Sql.add('Select Codigo,Titulo, Categoria, Clase, Ejemplar from Videos '
                   +'Where Alquilada = False');
            Query2.Open;
          end;
       if Radiogroup5.itemindex = 2 then
          begin
            Query2.Sql.Clear;
            Query2.Sql.add('Select Codigo,Titulo, Categoria, Clase, Ejemplar from Videos');
            Query2.Open;
          end;
     end;
end;

procedure TBuscar.RadioGroup5Click(Sender: TObject);
begin
if Radiogroup5.itemindex = 0 then
   begin
     Query2.Sql.Clear;
     Query2.Sql.add('Select Codigo,Titulo, Categoria, Clase, Ejemplar from Videos '
                   +'Where Alquilada = True');
     Query2.Open;
   end;
if Radiogroup5.itemindex = 1 then
   begin
     Query2.Sql.Clear;
     Query2.Sql.add('Select Codigo,Titulo, Categoria, Clase, Ejemplar from Videos '
                   +'Where Alquilada = False');
     Query2.Open;
   end;


if Radiogroup5.itemindex = 2 then
   begin
     Query2.Sql.Clear;
     Query2.Sql.add('Select Codigo,Titulo, Categoria, Clase, Ejemplar from Videos');
     Query2.Open;
   end;
end;

procedure TBuscar.MaskEdit1Change(Sender: TObject);
begin

  Query1.Sql.Clear;
  Query1.Sql.add('Select Codigo,Cedula,Apellidos,Nombres '+
                 'from Usuarios Where (Cedula = "'+MaskEdit1.Text+'") '+
                 'Order by Cedula');
  Query1.Open;
end;


end.
