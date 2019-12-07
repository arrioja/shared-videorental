unit UHistorial_Videos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, HeadLbl, ExtCtrls, Buttons, Menus, Db, DBTables,
  marquee, Gradpan, Counter;

type
  THistorial_Videos = class(TForm)
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    HeadLabel2: THeadLabel;
    HeadLabel4: THeadLabel;
    HeadLabel5: THeadLabel;
    HeadLabel6: THeadLabel;
    Label7: THeadLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Edit3: TEdit;
    Label6: TLabel;
    DetallesBtn: TBitBtn;
    CerrarBtn: TBitBtn;
    HeadLabel1: THeadLabel;
    HeadLabel3: THeadLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Marquee1: TMarquee;
    Bevel6: TBevel;
    Veces_Alquilada: TCounter;
    Veces_Multada: TCounter;
    Precio: TCounter;
    Ganado_en_Alquiler: TCounter;
    Ganado_en_Multa: TCounter;
    Total: TCounter;
    Falta_o_Gana: TCounter;
    procedure CerrarBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetallesBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Historial_Videos: THistorial_Videos;

implementation

uses Uprincipal, UDetalles_de_Videos, UHistorial_Cliente, ULista_Videos,
  UConsultar_Cliente, UModificar_Cliente, MODULO_DE_DATOS,
  ualquilar_y_devolver;

{$R *.DFM}









procedure THistorial_Videos.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure THistorial_Videos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IF Desde_Principal = True then
    Begin
      Principal.Enabled:=True;
    end
  else
    Begin
      If Ultima_Video = 'Lista_Videos' then
        Begin
          Lista_Videos.Enabled:=True;
        end;

      If Ultima_Video = 'Alquilar y Devolver' then
        Begin
          Datos.Videos.Refresh;
          Datos.Videos.Cancelrange;
          Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
          Datos.Videos.setrange([Alquilar_y_Devolver.Maskedit1.text]
                               ,[Alquilar_y_Devolver.Maskedit1.text]);
          Datos.Videos.Refresh;
          Datos.Videos.First;
          Alquilar_y_Devolver.Enabled:=True;
        end;
    end;
end;




procedure THistorial_Videos.DetallesBtnClick(Sender: TObject);
Var
  X:Boolean;
begin
  X:=True;
  Try
    Begin
      If Datos.Total.Active = False Then
        Begin
          X:=False;
          Datos.Total.Active:=True;
        end;
      Detalles_Videos:=TDetalles_Videos.Create(Self);
      Detalles_Videos.Edit1.Text:=Historial_Videos.Edit1.Text;
      Detalles_Videos.Showmodal;
    end
  Finally
    Begin
      Datos.Total.Active:=X;
      Detalles_Videos.Free;
      Detalles_Videos:=Nil;
    end;
  end;
end;

procedure THistorial_Videos.FormShow(Sender: TObject);
begin
  If Desde_Principal = True then
    Begin
      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='';
      MaskEdit2.Text:='';
      DetallesBtn.Enabled:=False;
      Label4.Caption:='';
      Veces_Alquilada.Value:='0';
      Veces_Multada.Value:='0';
      Precio.Value:='0';
      Ganado_en_Alquiler.Value:='0';
      Ganado_en_Multa.Value:='0';
      Total.Value:='0';
      Falta_o_Gana.Value:='0';
      MaskEdit2.Setfocus;
    end
  else
    Begin
      Datos.Videos.First;
      Datos.Videos.indexname:='';
      Datos.Videos.Setkey;
      Datos.Videos.FieldByName('Codigo_Video').Asstring:=MaskEdit2.Text;
      IF Datos.Videos.GotoKey = True then
        Begin
          Edit1.Text:=Datos.Videos.FieldByName('Titulo_Video').AsString;
          If Datos.Videos.FieldByName('Video_Alquilado').Asboolean = True then
            Begin
              Label4.Caption:='SI';
              Datos.Clientes.Refresh;
              Datos.Clientes.First;
              Datos.Clientes.indexname:='';
              Datos.Clientes.Setkey;
              Datos.Clientes.FieldByName('Codigo_Cliente').Asstring:=
                       Datos.Videos.FieldByName('Codigo_Cliente').Asstring;
              IF Datos.Clientes.GotoKey = True then
                Begin
                  Edit2.Text:=Datos.Clientes.Fieldbyname('Codigo_Cliente').Asstring;
                  Edit3.Text:=Datos.Clientes.Fieldbyname('Nombres_Cliente').Asstring+' '+
                              Datos.Clientes.Fieldbyname('Apellidos_Cliente').Asstring;
                end;
            end
          else
            Begin
              Label4.Caption:='NO';
              Edit2.Text:='';
              Edit3.Text:='';
            end;
          Veces_Alquilada.Value:=Datos.Videos.FieldByName('Veces_de_Alquiler').AsString;
          Veces_Multada.Value:=Datos.Videos.FieldByName('Veces_de_Multa').AsString;
          Precio.Value:=Datos.Videos.FieldByName('Precio_Video').AsString;
          Ganado_en_Alquiler.Value:=Datos.Videos.FieldByName('Ingresos_Por_Alquiler').AsString;
          Ganado_en_Multa.Value:=Datos.Videos.FieldByName('Ingresos_Por_Multa').AsString;
          Total.Value:=Datos.Videos.FieldByName('Ingresos_del_Video').AsString;
          If Total.Value > Precio.Value then
            Begin
              Label7.Caption:='El Video ha GANADO:';
              Falta_o_Gana.Value:= IntToStr(StrToInt(Total.Value) - StrToInt(Precio.Value));
            end;
          If Total.Value < Precio.Value then
            Begin
              Label7.Caption:='Le FALTAN para ganar:';
              Falta_o_Gana.Value:= IntToStr(StrToInt(Precio.Value) - StrToInt(Total.Value));
            end;
          If Total.Value = Precio.Value then
            Begin
              Label7.Caption:='Ni Gana ni Pierde:';
              Falta_o_Gana.Value:='0';
            end;
          DetallesBtn.Enabled:=True;
        end;
    end;

end;

procedure THistorial_Videos.MaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
Var
Result:Real;
begin                       //    hay un error en esta ventana con las conversiones y las restas
  IF Key = #13 then
    Begin
      Datos.Videos.First;
      Datos.Videos.indexname:='';
      Datos.Videos.Setkey;
      Datos.Videos.FieldByName('Codigo_Video').Asstring:=MaskEdit2.Text;
      IF Datos.Videos.GotoKey = True then
        Begin
          Edit1.Text:=Datos.Videos.FieldByName('Titulo_Video').AsString;
          If Datos.Videos.FieldByName('Video_Alquilado').Asboolean = True then
            Begin
              Label4.Caption:='SI';
              Datos.Clientes.Refresh;
              Datos.Clientes.First;
              Datos.Clientes.indexname:='';
              Datos.Clientes.Setkey;
              Datos.Clientes.FieldByName('Codigo_Cliente').Asstring:=
                       Datos.Videos.FieldByName('Codigo_Cliente').Asstring;
              IF Datos.Clientes.GotoKey = True then
                Begin
                  Edit2.Text:=Datos.Clientes.Fieldbyname('Codigo_Cliente').Asstring;
                  Edit3.Text:=Datos.Clientes.Fieldbyname('Nombres_Cliente').Asstring+' '+
                              Datos.Clientes.Fieldbyname('Apellidos_Cliente').Asstring;
                end;
            end
          else
            Begin
              Label4.Caption:='NO';
              Edit2.Text:='';
              Edit3.Text:='';
            end;
          Veces_Alquilada.Value:=Datos.Videos.FieldByName('Veces_de_Alquiler').AsString;
          Veces_Multada.Value:=Datos.Videos.FieldByName('Veces_de_Multa').AsString;
          Precio.Value:=Datos.Videos.FieldByName('Precio_Video').AsString;
          Ganado_en_Alquiler.Value:=Datos.Videos.FieldByName('Ingresos_Por_Alquiler').AsString;
          Ganado_en_Multa.Value:=Datos.Videos.FieldByName('Ingresos_Por_Multa').AsString;
          Total.Value:=Datos.Videos.FieldByName('Ingresos_del_Video').AsString;
          If Total.Value > Precio.Value then
            Begin
              Label7.Caption:='El Video ha GANADO:';
              Result:=StrToInt(Total.Value) - StrToInt(Precio.Value);
              Falta_o_Gana.Value:= FloatToStr(Result);
            end;
          If Total.Value < Precio.Value then
            Begin
              Label7.Caption:='Le FALTAN para ganar:';
              Result:=StrToInt(Precio.Value) - StrToInt(Total.Value);
              Falta_o_Gana.Value:= FloatToStr(Result);
            end;
          If Total.Value = Precio.Value then
            Begin
              Label7.Caption:='Ni Gana ni Pierde:';
              Falta_o_Gana.Value:='0';
            end;
          DetallesBtn.Enabled:=True;
        end
      else
        Begin
          Edit1.Text:='';
          Edit2.Text:='';
          Edit3.Text:='';
          MaskEdit2.Text:='';
          DetallesBtn.Enabled:=False;
          Label4.Caption:='';
          Veces_Alquilada.Value:='0';
          Veces_Multada.Value:='0';
          Precio.Value:='0';
          Ganado_en_Alquiler.Value:='0';
          Ganado_en_Multa.Value:='0';
          Total.Value:='0';
          Falta_o_Gana.Value:='0';
          Showmessage('El Código del Video que ha Introducido, no se encuentra '+
                      'registrado, verifique el código e intentelo de nuevo.');
          Datos.Videos.First;
          MaskEdit2.SetFocus;
        end;
      Key:=#3;
    end;

  If Key = #27 then
     Begin
       Close;
       Key:=#3;
     end;
end;




end.
