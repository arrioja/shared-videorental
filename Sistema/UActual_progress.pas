unit UActual_progress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Gauges, Buttons;

type
  TActual_Progress = class(TForm)
    Gauge1: TGauge;
    Bevel1: TBevel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Actual_Progress: TActual_Progress;

implementation

uses uconfiguracion, Uprincipal, MODULO_DE_DATOS;

{$R *.DFM}

procedure TActual_Progress.BitBtn1Click(Sender: TObject);
begin
  Principal.Enabled:=True;
  Close;
end;

procedure TActual_Progress.BitBtn2Click(Sender: TObject);
begin
{  BitBtn2.Enabled:=False;
  BitBtn1.Enabled:=False;
  Gauge1.Progress:=0;
  Gauge1.Maxvalue:=Datos.Videos.Recordcount;
}


//Se Actualizan los ingresos por alquileres.
{     Reset(Alqui_Arch);
     Readln(Alqui_Arch,Antigua_cantidad_Alqui);
     Closefile(Alqui_Arch);
     Principal.Ingresos_Por_Alquileres.Refresh;
     Principal.Ingresos_Por_Alquileres.First;
     Principal.Ingresos_Por_Alquileres.indexname:='';
     Principal.Ingresos_Por_Alquileres.Setkey;
     Principal.Ingresos_Por_Alquileres.Fieldbyname('Fecha').asstring:=datetostr(date);
     If Principal.Ingresos_Por_Alquileres.Gotokey = True then
       Begin
         Principal.Ingresos_Por_Alquileres.Edit;
         Principal.Ingresos_Por_Alquileres.Fieldbyname('Cantidad').asinteger:=
                 Principal.Ingresos_Por_Alquileres.Fieldbyname('Cantidad').asinteger+Antigua_cantidad_Alqui;
         Principal.Ingresos_Por_Alquileres.Post;
       end
     else
       Begin
         Principal.Ingresos_Por_Alquileres.Insert;
         Principal.Ingresos_Por_Alquileres.Fieldbyname('Fecha').asstring:=datetostr(date);
         Principal.Ingresos_Por_Alquileres.Fieldbyname('Cantidad').asinteger:=Antigua_cantidad_Alqui;
         Principal.Ingresos_Por_Alquileres.Post;
       end;
     Antigua_Cantidad_Alqui:=0;
     Rewrite(Alqui_Arch);
     Writeln(Alqui_Arch,Antigua_cantidad_Alqui);
     Closefile(Alqui_Arch);


//Se Actualizan los ingresos por Multas.
     Reset(Multa_Arch);
     Readln(Multa_Arch,Antigua_cantidad_Multa);
     Closefile(Multa_Arch);
     Principal.Ingresos_Por_Multas.Refresh;
     Principal.Ingresos_Por_Multas.First;
     Principal.Ingresos_Por_Multas.indexname:='';
     Principal.Ingresos_Por_Multas.Setkey;
     Principal.Ingresos_Por_Multas.Fieldbyname('Fecha').asstring:=datetostr(date);
     If Principal.Ingresos_Por_Multas.Gotokey = True then
       Begin
         Principal.Ingresos_Por_Multas.Edit;
         Principal.Ingresos_Por_Multas.Fieldbyname('Cantidad').asinteger:=
                 Principal.Ingresos_Por_Multas.Fieldbyname('Cantidad').asinteger+Antigua_cantidad_Multa;
         Principal.Ingresos_Por_Multas.Post;
       end
     else
       Begin
         Principal.Ingresos_Por_Multas.Insert;
         Principal.Ingresos_Por_Multas.Fieldbyname('Fecha').asstring:=datetostr(date);
         Principal.Ingresos_Por_Multas.Fieldbyname('Cantidad').asinteger:=Antigua_cantidad_Multa;
         Principal.Ingresos_Por_Multas.Post;
       end;
     Antigua_Cantidad_Multa:=0;
     Rewrite(Multa_Arch);
     Writeln(Multa_Arch,Antigua_cantidad_Multa);
     Closefile(Multa_Arch);




//Se Actualizan los ingresos por Inscripciones.
     Reset(Inscrip_Arch);
     Readln(Inscrip_Arch,Antigua_cantidad_Inscrip);
     Closefile(Inscrip_Arch);
     Principal.Ingresos_Por_Inscripciones.Refresh;
     Principal.Ingresos_Por_Inscripciones.First;
     Principal.Ingresos_Por_Inscripciones.indexname:='';
     Principal.Ingresos_Por_Inscripciones.Setkey;
     Principal.Ingresos_Por_Inscripciones.Fieldbyname('Fecha').asstring:=datetostr(date);
     If Principal.Ingresos_Por_Inscripciones.Gotokey = True then
       Begin
         Principal.Ingresos_Por_Inscripciones.Edit;
         Principal.Ingresos_Por_Inscripciones.Fieldbyname('Cantidad').asinteger:=
                 Principal.Ingresos_Por_Inscripciones.Fieldbyname('Cantidad').asinteger+Antigua_cantidad_Inscrip;
         Principal.Ingresos_Por_Inscripciones.Post;
       end
     else
       Begin
         Principal.Ingresos_Por_Inscripciones.Insert;
         Principal.Ingresos_Por_Inscripciones.Fieldbyname('Fecha').asstring:=datetostr(date);
         Principal.Ingresos_Por_Inscripciones.Fieldbyname('Cantidad').asinteger:=Antigua_cantidad_Inscrip;
         Principal.Ingresos_Por_Inscripciones.Post;
       end;
     Antigua_Cantidad_Inscrip:=0;
     Rewrite(Inscrip_Arch);
     Writeln(Inscrip_Arch,Antigua_cantidad_Inscrip);
     Closefile(Inscrip_Arch);


  Principal.Videos.Refresh;
  Principal.Clientes.Refresh;
  Principal.Videos.First;
  Principal.Clientes.First;

      While ( Not Principal.Videos.EOF) do
           Begin
             If Principal.Videos.Fieldbyname('Video_Alquilado').Asboolean = True then
               Begin
                 If strtodate(Principal.Videos.Fieldbyname('Fecha_Alquiler').Asstring) < Date then
                   Begin
                     IF ((Date)-strtodate(Principal.Videos.Fieldbyname('Fecha_Alquiler').Asstring))
                         >(Principal.Videos.Fieldbyname('Dias_Alquiler').Asinteger) then
                       Begin
                         Principal.Videos.Edit;
                         Principal.Videos.Fieldbyname('Multado').Asboolean:=True;
                         Principal.Videos.Fieldbyname('Dias_de_Multa').Asstring:=
                         floattostr(((Date)-strtodate(Principal.Videos.Fieldbyname('Fecha_Alquiler').Asstring))
                         -(strtofloat(Principal.Videos.Fieldbyname('Dias_Alquiler').Asstring)));
                         Principal.Videos.Post;
                         Principal.Clientes.indexname:='';
                         Principal.Clientes.setkey;
                         Principal.Clientes.fieldbyname('Codigo_Cliente').asstring:=
                         Principal.Videos.Fieldbyname('Codigo_Cliente').Asstring;
                         Principal.Clientes.gotokey;
                         Principal.Clientes.Edit;
                         Principal.Clientes.Fieldbyname('Cliente_Multado').asBoolean:=True;
                         Principal.Clientes.Fieldbyname('Tiene_Pelicula').asBoolean:=True;
                         Principal.Clientes.Post
                       end
                     Else
                       Begin
                         Principal.Videos.Edit;
                         Principal.Videos.Fieldbyname('Multado').Asboolean:=False;
                         Principal.Videos.Fieldbyname('Dias_de_Multa').Asinteger:=0;
                         Principal.Videos.Post;
                         Principal.Clientes.indexname:='';
                         Principal.Clientes.setkey;
                         Principal.Clientes.fieldbyname('Codigo_Cliente').asstring:=
                         Principal.Videos.Fieldbyname('Codigo_Cliente').Asstring;
                         Principal.Clientes.gotokey;
                         Principal.Clientes.Edit;
                         Principal.Clientes.Fieldbyname('Cliente_Multado').asBoolean:=False;
                         Principal.Clientes.Fieldbyname('Tiene_Pelicula').asBoolean:=True;
                         Principal.Clientes.Post;
                       end;
                   end
                 else
                   Begin
                     Principal.Videos.Edit;
                     Principal.Videos.Fieldbyname('Multado').Asboolean:=False;
                     Principal.Videos.Fieldbyname('Dias_de_Multa').Asinteger:=0;
                     Principal.Videos.Post;
                     Principal.Clientes.indexname:='';
                     Principal.Clientes.setkey;
                     Principal.Clientes.fieldbyname('Codigo_Cliente').asstring:=
                     Principal.Videos.Fieldbyname('Codigo_Cliente').Asstring;
                     Principal.Clientes.gotokey;
                     Principal.Clientes.Edit;
                     Principal.Clientes.Fieldbyname('Cliente_Multado').asBoolean:=False;
                     Principal.Clientes.Fieldbyname('Tiene_Pelicula').asBoolean:=True;
                     Principal.Clientes.Post;
                   end;
               end
             else
               Begin
                 Principal.Videos.Edit;
                 Principal.Videos.Fieldbyname('Multado').Asboolean:=False;
                 Principal.Videos.Fieldbyname('Video_Alquilado').Asboolean:=False;
                 Principal.Videos.fieldbyname('Codigo_Cliente').asstring:='';
                 Principal.Videos.fieldbyname('Fecha_Alquiler').asstring:='';
                 Principal.Videos.fieldbyname('Fecha_Entrega').asstring:='';
                 Principal.Videos.fieldbyname('Dias_Alquiler').asinteger:=0;
                 Principal.Videos.fieldbyname('Multado').asboolean:=False;
                 Principal.Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
                 Principal.Videos.fieldbyname('Cliente_Autorizado').asstring:='';
                 Principal.Videos.Post;
               end;
             Principal.Videos.MoveBy(1);
             Gauge1.Progress:=Gauge1.Progress + 1;
           end;
  BitBtn1.Enabled:=True;
}
end;
procedure TActual_Progress.FormShow(Sender: TObject);
begin
{  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
  Gauge1.Progress:=0;
}end;

end.
