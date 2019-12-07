unit ULista_Videos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus,
  RefreshQ,Modulo_de_Datos;

type
  TLista_Videos = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Menu_Videos: TPopupMenu;
    OpcionesparalosVdeos1: TMenuItem;
    N1: TMenuItem;
    VerHistorial1: TMenuItem;
    ModificarDatos1: TMenuItem;
    ConsultarDatos1: TMenuItem;
    ImprimirBtn: TBitBtn;
    RadioGroup2: TRadioGroup;
    Query1: TSelfRefreshQuery;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Listar;
    procedure FormShow(Sender: TObject);
    procedure VerHistorial1Click(Sender: TObject);
    procedure ModificarDatos1Click(Sender: TObject);
    procedure ConsultarDatos1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ImprimirBtnClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lista_Videos: TLista_Videos;

implementation

uses Uprincipal, UHistorial_Videos, uModificar_video, UConsultar_Video,
  ualquilar_y_devolver, ULista_Videos_Prn;

{$R *.DFM}

procedure TLista_Videos.RadioGroup1Click(Sender: TObject);
begin
  Listar;
end;

procedure TLista_Videos.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TLista_Videos.FormShow(Sender: TObject);
begin
  Radiogroup1.Itemindex:=0;
  RadioGroup2.Itemindex:=1;
  Listar;
end;

procedure TLista_Videos.VerHistorial1Click(Sender: TObject);
begin
  Try
    Begin
      Ultima_Video:='Lista_Videos';
      Desde_Principal:=False;
      Datos.Videos.Open;
      Datos.Clientes.Open;
      Historial_Videos:=THistorial_Videos.Create(Self);
      Historial_Videos.MaskEdit2.Text:=Query1.fieldbyname('Codigo_Video').asString;
      Historial_Videos.Showmodal;
    end;
  Finally
    Begin
      Historial_Videos.Free;
      Historial_Videos:=Nil;
    end;
  end;
end;

procedure TLista_Videos.ModificarDatos1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Datos.Historia.Open;
      Datos.Total.Open;
      Ultima_Video:='Lista_Videos';
      Desde_Principal:=False;
      Modificar_Video:=TModificar_Video.Create(Self);
      Modificar_Video.MaskEdit1.Text:=Query1.fieldbyname('Codigo_Video').asString;
      Modificar_Video.Showmodal;
      Listar;
    end
  Finally
    Begin
      Datos.Videos.Close;
      Datos.Historia.Close;
      Datos.Total.Close;
      Modificar_Video.Free;
      Modificar_Video:=Nil;
    end;
  end;
end;

procedure TLista_Videos.ConsultarDatos1Click(Sender: TObject);
begin
  Try
    Begin
      Ultima_Video:='Lista_Videos';
      Desde_Principal:=False;
      Datos.Videos.Open;
      Consultar_Video:=TConsultar_Video.Create(Self);
      Consultar_Video.MaskEdit1.Text:=Query1.fieldbyname('Codigo_Video').asString;
      Consultar_Video.Showmodal;
    end
  Finally
    Begin
      Datos.Videos.Close;    
      Consultar_Video.Free;
      Consultar_Video:=Nil;
    end;
  end;
end;

Procedure TLista_Videos.Listar;
Begin
  Query1.DisableControls;
  If RadioGroup2.Itemindex = 0 Then
    Begin
      With Radiogroup1 do
         Begin
           if itemindex=0 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno,Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos ORDER BY Codigo_Video');
              Query1.Open;
            end;
           if itemindex=1 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Video_Alquilado = True ORDER BY Codigo_Video');
              Query1.Open;
            end;
           if itemindex=2 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Video_Alquilado = False ORDER BY Codigo_Video');
              Query1.Open;
            end;
          if itemindex=3 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Multado = True ORDER BY Codigo_Video');
              Query1.Open;
            end;
         if itemindex=4 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Multado = False ORDER BY Codigo_Video');
              Query1.Open;
            end;
         end;
    end
  else
    Begin
      With Radiogroup1 do
         Begin
           if itemindex=0 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos ORDER BY Titulo_Video');
              Query1.Open;
            end;
           if itemindex=1 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Video_Alquilado = True ORDER BY Titulo_Video');
              Query1.Open;
            end;
           if itemindex=2 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Video_Alquilado = False ORDER BY Titulo_Video');
              Query1.Open;
            end;
          if itemindex=3 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Multado = True ORDER BY Titulo_Video');
              Query1.Open;
            end;
         if itemindex=4 then
            Begin
              Query1.Sql.Clear;
              Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos'
              +' where Multado = False ORDER BY Titulo_Video');
              Query1.Open;
            end;
         end;
    end;
  Query1.EnableControls;
end;





procedure TLista_Videos.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key = #13 then
   Begin
   end;
 If Key = #27 then
   Begin
     Close;
   end;
 If ((Key <> #13) and (Key <> #27)) then
  Begin
    If RadioGroup2.Itemindex = 0 Then
      Begin
        With Radiogroup1 do
          Begin
            if itemindex=0 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where (Titulo_Video LIKE "'+UpperCase(KEY)+'%") ORDER BY Codigo_Video');
                Query1.Open;
              end;
           if itemindex=1 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Video_Alquilado = True)) ORDER BY Codigo_Video');
                Query1.Open;
              end;
           if itemindex=2 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Video_Alquilado = False)) ORDER BY Codigo_Video');
                Query1.Open;
              end;
           if itemindex=3 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Multado = True)) ORDER BY Codigo_Video');
                Query1.Open;
              end;
           if itemindex=4 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Multado = False)) ORDER BY Codigo_Video');
                Query1.Open;
              end;
          end;
      end
    else
      Begin
        With Radiogroup1 do
          Begin
            if itemindex=0 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where (Titulo_Video LIKE "'+UpperCase(KEY)+'%") ORDER BY Titulo_Video');
                Query1.Open;
              end;
           if itemindex=1 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Video_Alquilado = True)) ORDER BY Titulo_Video');
                Query1.Open;
              end;
           if itemindex=2 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Video_Alquilado = False)) ORDER BY Titulo_Video');
                Query1.Open;
              end;
           if itemindex=3 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Multado = True)) ORDER BY Titulo_Video');
                Query1.Open;
              end;
           if itemindex=4 then
              Begin
                Query1.Sql.Clear;
                Query1.Sql.add('Select Anaquel, Linea, Posicion, Estreno, Codigo_Video, Titulo_Video, Categoria_Video,Clase_Video,Anaquel,Linea,Posicion from Videos '+
                         'Where ((Titulo_Video LIKE "'+UpperCase(KEY)+'%") and (Multado = False)) ORDER BY Titulo_Video');
                Query1.Open;
              end;
          end;
      end;
  end;
end;

procedure TLista_Videos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IF Desde_Principal = False then
    Begin
      If Ultima_Video = 'Alquilar y Devolver' then
        Begin
         Alquilar_y_Devolver.Enabled:=True;
         Alquilar_y_Devolver.MaskEdit2.Setfocus;
        end;
    end;
end;

procedure TLista_Videos.DBGrid1DblClick(Sender: TObject);
begin
  IF Desde_Principal = False then
    Begin
      If Ultima_Video = 'Alquilar y Devolver' then
        Begin
          Alquilar_y_Devolver.MaskEdit2.Text:=Query1.Fieldbyname('Codigo_Video').Asstring;
          Alquilar_y_Devolver.MaskEdit2.Setfocus;
          Close;
        end;
    end;
end;

procedure TLista_Videos.ImprimirBtnClick(Sender: TObject);
begin
  Try
    Begin
      Lista_Videos_Prn:=TLista_Videos_Prn.Create(Self);
      Lista_Videos_Prn.Reporte.Preview;
    end
  Finally
    Begin
      Lista_Videos_Prn.Free;
      Lista_Videos_Prn:=Nil;
    end;
  end;
end;

procedure TLista_Videos.RadioGroup2Click(Sender: TObject);
begin
  Listar;
end;

procedure TLista_Videos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If (Column.FieldName='') then
    Begin
      If Query1.Fieldbyname('Estreno').Asboolean = True Then
        Begin
          DbGrid1.canvas.Brush.Color:=clLime;
        end
      else
        Begin
          DbGrid1.canvas.Brush.Color:=clWhite;
        end;
      Dbgrid1.DefaultDrawColumnCell(Rect,Datacol,Column,State);
    end;
end;

end.
