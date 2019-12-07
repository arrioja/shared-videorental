unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, marquee, Hemibtn, anifile, StdCtrls,Menus,
  OnlyOne, HarmFade, FX, ALed, RXCtrls, AMAdvLed, GradBtn, Carpeta, Noshape,
  Mask, jpeg, MDIWallp;

type
  TPrincipal = class(TForm)
    Marquee1: TMarquee;
    PopupMenu1: TPopupMenu;
    OnlyOne1: TOnlyOne;
    Image1: TImage;
    GradBtn2: TGradBtn;
    MaskEdit1: TMaskEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    MDIWallpaper1: TMDIWallpaper;
    procedure GradBtn2Click(Sender: TObject);
    procedure Buscar;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;
  x:boolean;
  Precio_de_Inscripcion,
  Precio_Deposito,
  Precio_alquiler_1_dia,
  Precio_alquiler_2_dia,
  Precio_alquiler_3_dia,
  Precio_Alquiler_mas_dia,
  Precio_multa_1_Dia,
  Precio_multa_2_Dia,
  Precio_multa_3_Dia,
  Precio_Multa_Mas_Dia,
  Precio_Alquiler_Doble_1_Dia,
  Precio_Alquiler_Doble_2_Dia,
  Precio_Alquiler_Doble_3_Dia,
  Precio_Alquiler_Doble_mas_Dia,
  Precio_Multa_Doble_1_Dia,
  Precio_Multa_Doble_2_Dia,
  Precio_Multa_Doble_3_Dia,
  Precio_Multa_Doble_Mas_Dia,
  Precio_Alquiler_Sexo_1_Dia,
  Precio_Alquiler_Sexo_2_Dia,
  Precio_Alquiler_Sexo_3_Dia,
  Precio_Alquiler_Sexo_Mas_Dia,
  Precio_Multa_Sexo_1_Dia,
  Precio_Multa_Sexo_2_Dia,
  Precio_Multa_Sexo_3_Dia,
  Precio_Multa_Sexo_mas_Dia,
  Precio_Alquiler_Musical_1_Dia,
  Precio_Alquiler_Musical_2_Dia,
  Precio_Alquiler_Musical_3_Dia,
  Precio_alquiler_Musical_mas_Dia,
  Precio_Multa_Musical_1_Dia,
  Precio_Multa_Musical_2_Dia,
  Precio_Multa_Musical_3_Dia,
  Precio_Multa_Musical_mas_Dia,
  Precio_Alquiler_Estreno_1_Dia,
  Precio_Alquiler_Estreno_2_Dia,
  Precio_Alquiler_Estreno_3_Dia,
  Precio_Alquiler_Estreno_mas_dia,
  Precio_Multa_Estreno_1_Dia,
  Precio_Multa_Estreno_2_Dia,
  Precio_Multa_Estreno_3_Dia,
  Precio_Multa_Estreno_mas_dia,
  Precio_Alquiler_Estreno_Doble_1_Dia,
  Precio_Alquiler_Estreno_Doble_2_Dia,
  Precio_Alquiler_Estreno_Doble_3_Dia,
  Precio_alquiler_estreno_doble_mas_dia,
  Precio_Multa_Estreno_Doble_1_Dia,
  Precio_Multa_Estreno_Doble_2_Dia,
  Precio_Multa_Estreno_Doble_3_Dia,
  Precio_Multa_Estreno_Doble_mas_dia,
  Precio_Alquiler_DVD_1_Dia,
  Precio_Alquiler_DVD_2_Dia,
  Precio_Alquiler_DVD_3_Dia,
  Precio_Alquiler_DVD_Mas_Dia,
  Precio_Multa_DVD_1_Dia,
  Precio_Multa_DVD_2_Dia,
  Precio_Multa_DVD_3_Dia,
  Precio_Multa_DVD_mas_Dia,
  Precio_Alquiler_DVD_Estreno_1_Dia,
  Precio_Alquiler_DVD_Estreno_2_Dia,
  Precio_Alquiler_DVD_Estreno_3_Dia,
  Precio_Alquiler_DVD_Estreno_Mas_Dia,
  Precio_Multa_DVD_Estreno_1_Dia,
  Precio_Multa_DVD_Estreno_2_Dia,
  Precio_Multa_DVD_Estreno_3_Dia,
  Precio_Multa_DVD_Estreno_mas_Dia:integer;
  Fecha_de_Vencimiento:string;

implementation

uses MODULO_DE_DATOS, UPrimera_Entrada, UAlquilar_y_Devolver;

{$R *.DFM}


procedure TPrincipal.GradBtn2Click(Sender: TObject);
Begin
  Buscar;
end;

procedure TPrincipal.Buscar;
begin
  Try
    Begin
      Datos.Clientes.Refresh;
      Datos.Clientes.indexname:='';
      Datos.Clientes.setkey;
      Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit1.Text;
      If (Datos.Clientes.gotokey = true) then
       Begin
         If ((Datos.Clientes.Fieldbyname('Cedula_Cliente').AsString <> '') AND (Datos.Clientes.Fieldbyname('Cedula_Cliente').AsString <> '  .   .   ') AND
             (Datos.Clientes.Fieldbyname('Cedula_Cliente').AsString = MaskEdit2.Text)) Then
               Begin
                 Alquilar_y_Devolver:=TAlquilar_y_Devolver.Create(Self);
                 Alquilar_y_Devolver.Label1.Caption:=Datos.Clientes.Fieldbyname('Nombres_Cliente').AsString+' '+Datos.Clientes.Fieldbyname('Apellidos_Cliente').AsString;
                 Alquilar_y_Devolver.ShowModal;
                 MaskEdit1.Text:='';
                 MaskEdit2.Text:='';
                 MaskEdit1.Setfocus;
               end
         else
           Begin
             Datos.Mayores.Refresh;
             Datos.Mayores.indexname:='';
             Datos.Mayores.setkey;
             Datos.Mayores.fieldbyname('Codigo_Cliente').asstring:=Maskedit1.Text;
             If (Datos.Mayores.gotokey = true) then
               Begin
                 If ((Datos.Mayores.Fieldbyname('Cedula1').AsString <> '') AND (Datos.Mayores.Fieldbyname('Cedula1').AsString <> '  .   .   ') AND
                     (Datos.Mayores.Fieldbyname('Cedula1').AsString = MaskEdit2.Text)) Then
                   Begin
                     Alquilar_y_Devolver:=TAlquilar_y_Devolver.Create(Self);
                     Alquilar_y_Devolver.Label1.Caption:=Datos.Mayores.Fieldbyname('Nombre1').AsString+' '+Datos.Mayores.Fieldbyname('Apellido1').AsString;
                     Alquilar_y_Devolver.ShowModal;
                     MaskEdit1.Text:='';
                     MaskEdit2.Text:='';
                     MaskEdit1.Setfocus;
                   end
                 else
                   Begin // si no es el autorizado 1
                     If ((Datos.Mayores.Fieldbyname('Cedula2').AsString <> '') AND (Datos.Mayores.Fieldbyname('Cedula2').AsString <> '  .   .   ') AND
                         (Datos.Mayores.Fieldbyname('Cedula2').AsString = MaskEdit2.Text)) Then
                       Begin
                         Alquilar_y_Devolver:=TAlquilar_y_Devolver.Create(Self);
                         Alquilar_y_Devolver.Label1.Caption:=Datos.Mayores.Fieldbyname('Nombre2').AsString+' '+Datos.Mayores.Fieldbyname('Apellido2').AsString;
                         Alquilar_y_Devolver.ShowModal;
                         MaskEdit1.Text:='';
                         MaskEdit2.Text:='';
                         MaskEdit1.Setfocus;
                       end
                     else
                       Begin // si no es el autorizado 2
                         If ((Datos.Mayores.Fieldbyname('Cedula3').AsString <> '') AND (Datos.Mayores.Fieldbyname('Cedula3').AsString <> '  .   .   ') AND
                             (Datos.Mayores.Fieldbyname('Cedula3').AsString = MaskEdit2.Text)) Then
                           Begin
                             Alquilar_y_Devolver:=TAlquilar_y_Devolver.Create(Self);
                             Alquilar_y_Devolver.Label1.Caption:=Datos.Mayores.Fieldbyname('Nombre3').AsString+' '+Datos.Mayores.Fieldbyname('Apellido3').AsString;
                             Alquilar_y_Devolver.ShowModal;
                             MaskEdit1.Text:='';
                             MaskEdit2.Text:='';
                             MaskEdit1.Setfocus;
                           end
                         else
                           Begin // Si no es el Autorizado 3
                             If ((Datos.Mayores.Fieldbyname('Cedula4').AsString <> '') AND (Datos.Mayores.Fieldbyname('Cedula4').AsString <> '  .   .   ') AND
                                 (Datos.Mayores.Fieldbyname('Cedula4').AsString = MaskEdit2.Text)) Then
                               Begin
                                 Alquilar_y_Devolver:=TAlquilar_y_Devolver.Create(Self);
                                 Alquilar_y_Devolver.Label1.Caption:=Datos.Mayores.Fieldbyname('Nombre4').AsString+' '+Datos.Mayores.Fieldbyname('Apellido4').AsString;
                                 Alquilar_y_Devolver.ShowModal;
                                 MaskEdit1.Text:='';
                                 MaskEdit2.Text:='';
                                 MaskEdit1.Setfocus;
                               end
                             else
                               Begin // Si llega aqui es porque no es ningun autorizado
                                 MaskEdit1.Text:='';
                                 MaskEdit2.Text:='';
                                 MessageDlg('El Número de Cédula Especificado no se encuentra autorizado '+
                                            'para retirar bajo el código dado, por favor asegúrese que '+
                                            'sea correcto e inténtelo de nuevo.', mtError, [mbOk], 0);
                                 MaskEdit1.Setfocus;
                               end;
                           end;
                       end;
                   end;
               end;
           end;
       end
      else
        Begin
          MaskEdit1.Text:='';
          MaskEdit2.Text:='';
          MessageDlg('El Código que ha introducido no se encuentra en '+
                     'nuestros registros, por favor asegúrese que '+
                     'sea correcto e inténtelo de nuevo.', mtError, [mbOk], 0);
          MaskEdit1.Setfocus;
        end;
    end;
  Finally
    Alquilar_y_Devolver.Free;
    Alquilar_y_Devolver:=Nil;
  end;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  Datos.Clientes.Open;
  Datos.Mayores.Open;
  Datos.Debe.Open;
  MaskEdit1.Setfocus;
  Image1.Picture.LoadFromFile('LogoClub.bmp');
end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datos.Clientes.Close;
  Datos.Mayores.Close;
  Datos.Debe.Close;
end;

procedure TPrincipal.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      MaskEdit2.SetFocus;
      Key:=#3;
    end;
end;

procedure TPrincipal.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Buscar;
      Key:=#3;
    end;
end;

end.
