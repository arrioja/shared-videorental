unit uAlquilar_y_devolver;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DB, DBTables, Grids, DBGrids, Menus, ExtCtrls,
  Calendar, Numedit, Hemibtn, RXDBCtrl, MPlayer, Refresh, RXClock, RxGIF,
  Animate, GIFCtrl, ComCtrls, ALabel;

type
  Mal_Dia               = class (Exception);
  Mucho_Descuento       = Class(Exception);
  No_Seleccion          = Class(Exception);

  TAlquilar_y_devolver  = class(TForm)
    BitBtn2: TBitBtn;
    Menu_Videos: TPopupMenu;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Bevel5: TBevel;
    MaskEdit1: TMaskEdit;
    Edit2: TNumEdit;
    Bevel6: TBevel;
    Label2: TLabel;
    Bevel7: TBevel;
    Edit3: TEdit;
    Label14: TLabel;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    LabelTotal: TLabel;
    Bevel4: TBevel;
    GroupBox4: TGroupBox;
    Lista: TListBox;
    Label21: TLabel;
    NumPersona: TNumEdit;
    Label22: TLabel;
    Menu_Clientes: TPopupMenu;
    OpcionesparalosClientes1: TMenuItem;
    N1: TMenuItem;
    VerHistorial1: TMenuItem;
    ConsultarDatos1: TMenuItem;
    Edit1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    RebAlqBtn: TBitBtn;
    RebDeuMulBtn: TBitBtn;
    RebDeuAlqBtn: TBitBtn;
    Bevel8: TBevel;
    Label25: TLabel;
    Label26: TLabel;
    Label18: TLabel;
    Label28: TLabel;
    Bevel9: TBevel;
    Label17: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Bevel10: TBevel;
    DescuentoEdit: TNumEdit;
    Label20: TLabel;
    Bevel11: TBevel;
    ActualEdit: TNumEdit;
    SubEdit: TNumEdit;
    Label31: TLabel;
    Label32: TLabel;
    OpcionesparalosVideos1: TMenuItem;
    N2: TMenuItem;
    ListadodeVideos1: TMenuItem;
    Historial1: TMenuItem;
    Datos1: TMenuItem;
    ListadodeClientes1: TMenuItem;
    Observaciones: TMemo;
    MenuVacio: TPopupMenu;
    Label33: TLabel;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    DBGrid1: TRxDBGrid;
    Todos_Los_Videos: TSelfRefreshTable;
    RxClock1: TRxClock;
    Panel1: TPanel;
    Cumpleanios: TImage;
    Panel2: TPanel;
    Image1: TImage;
    Vence_TC: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    RxGIFAnimator1: TRxGIFAnimator;
    RxGIFAnimator2: TRxGIFAnimator;
    Image2: TImage;
    Panel5: TPanel;
    RxGIFAnimator3: TRxGIFAnimator;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    AutorizaAlquilerBtn: TBitBtn;
    Factura: TRichEdit;
    Panel6: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    ALabel1: TALabel;
    BitBtn1: TBitBtn;
    CILabel: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    Procedure Ejecutar;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure NumPersonaKeyPress(Sender: TObject; var Key: Char);
    procedure NumPersonaExit(Sender: TObject);
    procedure ListaClick(Sender: TObject);
    Procedure Imprimir_Factura;  
    Procedure Guardar_Factura;
    procedure ListaDblClick(Sender: TObject);
    procedure VerHistorial1Click(Sender: TObject);
    procedure ConsultarDatos1Click(Sender: TObject);
    procedure RebDeuAlqBtnClick(Sender: TObject);
    procedure RebDeuMulBtnClick(Sender: TObject);
    procedure RebAlqBtnClick(Sender: TObject);
    procedure DescuentoEditKeyPress(Sender: TObject; var Key: Char);
    procedure SubEditKeyPress(Sender: TObject; var Key: Char);
    procedure DescuentoEditExit(Sender: TObject);
    procedure Historial1Click(Sender: TObject);
    procedure Datos1Click(Sender: TObject);
    procedure ListadodeVideos1Click(Sender: TObject);
    procedure ListadodeClientes1Click(Sender: TObject);
    procedure DevolverClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure AutorizaAlquilerBtnClick(Sender: TObject);
    Procedure Verificar_Limites;
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    Accion_Ejecutada:Boolean;
    { Public declarations }
  end;

var
  Alquilar_y_devolver: TAlquilar_y_devolver;
  Total_de_Multa:real;
  Cuenta_Promo:Short;
  Codigo_a_Buscar:string;
  Domingos:integer;
  Visto:Boolean;
  Codigo_Video_a_Buscar:string[4];
  Desglozar:string[8];
  Debe_Por_Multa_Pasada,
  Debe_Por_Alquiler_Pasado:real;
  Total_Ingreso_Video:real;
  Total_Multa_Video:real;
  Autoriza_Mas_Peliculas,Autoriza_Alquiler:String;


implementation

uses ubuscar, Uprincipal, uconfirmar, uDetalles, UHistorial_Cliente,
  UConsultar_Cliente, UModificar_Cliente, URebajar_deuda_Alquiler_Atrasado,
  URebajar_deuda_Multa_Atrasada, UPedir_Clave, MODULO_DE_DATOS,
  UHistorial_Videos, UConsultar_Video, ULista_Videos, Ulista_clientes,
  UControl_Observaciones, UAutorizacion, UPagar_Multa_Atrasada,
  UPagar_Alquiler_Atrasado, UEsperar, UMostrar_Seleccion;

{$R *.DFM}
Function Nombre_Computador : String; Far; External 'Control.dll';


procedure TAlquilar_y_devolver.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

Procedure TAlquilar_y_devolver.Verificar_Limites;
Begin
  If (((StrToFloat(Label6.Caption)+StrToFloat(Label24.Caption)) >= Datos.Clientes.fieldbyname('Maximo_Deuda').AsCurrency)
  OR (Datos.Videos.RecordCount >= Datos.Clientes.fieldbyname('Maximo_Peliculas').AsInteger)) Then
    Begin
      If StrToFloat(Label6.Caption) > 0 Then
        RebDeuAlqBtn.Enabled:=True
      else
        RebDeuAlqBtn.Enabled:=False;
      If StrToFloat(Label24.Caption) > 0 Then
        RebDeuMulBtn.Enabled:=True
      else
        RebDeuMulBtn.Enabled:=False;
      MaskEdit2.ReadOnly:=True;
      MaskEdit2.PopupMenu:=MenuVacio;
      RxGifAnimator2.Animate:=True;
      RxGifAnimator2.Visible:=True;
      AutorizaAlquilerBtn.Enabled:=True;
    end
  else
    Begin
      If StrToFloat(Label6.Caption) <= 0 Then
        RebDeuAlqBtn.Enabled:=False
      else
        RebDeuAlqBtn.Enabled:=True;
      If StrToFloat(Label24.Caption) <= 0 Then
        RebDeuMulBtn.Enabled:=False
      else
        RebDeuMulBtn.Enabled:=True;
      MaskEdit2.ReadOnly:=False;
      MaskEdit2.PopupMenu:=Menu_Videos;
      RxGifAnimator2.Animate:=False;
      RxGifAnimator2.Visible:=False;
      AutorizaAlquilerBtn.Enabled:=False;
    end;
  Try
    Begin
      If ((Vence_TC.Caption <> '') AND ((StrToDate(Vence_TC.Caption) < StrToDate(Principal.Fecha_Total)))) Then
        Begin
          Alabel1.Visible:=True;
          MaskEdit2.Readonly:=True;
          MaskEdit2.PopupMenu:=MenuVacio;
        end
      end;
    Except
      On EConvertError do
        Begin
          Alabel1.Visible:=False;
        end;
    end;
end;

procedure TAlquilar_y_devolver.FormShow(Sender: TObject);
begin
  Label7.caption:=Principal.Fecha_Total;
  Observaciones.Clear;
  Label24.Caption:='0,00';
  Label6.Caption:='0,00';
  Cuenta_Promo:=0;
  Accion_Ejecutada:=False;
  Label28.Caption:='0,00';
  DescuentoEdit.Text:='0';
  ActualEdit.Text:='0';
  SubEdit.Text:='0';
  CILabel.Caption:='';

  Autoriza_Alquiler:='';
  Label16.Caption:='0,00';
  Label18.Caption:='0,00';
  LabelTotal.Caption:='0,00';
  Label27.Caption:='0,00';
  Label30.Caption:='0,00';
  Label13.Caption:='';
  Label9.Caption:='0';
  MaskEdit1.Text:='';
  MaskEdit2.Text:='';
  Edit1.Caption:='';
  Edit2.Text:=Inttostr(Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger);
  Edit3.Text:='';
  Datos.Videos.Active:=False;
  Maskedit1.Enabled:=True;
  Lista.Items.Clear;
  Maskedit1.Setfocus;
  Maskedit2.Enabled:=False;
  NumPersona.Enabled:=False;
  Todos_los_Videos.Open;
  Esperar.Free;
  Esperar:=Nil;
end;


procedure TAlquilar_y_devolver.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
var
  Conta:Integer;
  Nacimiento,Comparacion1,Comparacion2,Comparacion3,Comparacion4:String;
  edad :TDate;

begin
 If (Key = #13) then
  begin
    Debe_Por_Multa_Pasada:=0;
    Debe_Por_Alquiler_Pasado:=0;
    RebDeuAlqBtn.Enabled:=False;
    RebDeuMulBtn.Enabled:=False;
    Label16.Caption:='0,00';
    CILabel.Caption:='';
    Label18.Caption:='0,00';
    LabelTotal.Caption:='0,00';
    Label27.Caption:='0,00';
    Label30.Caption:='0,00';
    Label9.Caption:='0';
    Label13.Caption:='';
    Datos.Clientes.Refresh;
    Datos.Clientes.indexname:='';
    Datos.Clientes.setkey;
    Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit1.Text;
    If (Datos.Clientes.gotokey = true) then
       Begin
         Datos.Debe.Refresh;
         Datos.Debe.First;

// Se Recorre la base del debe y se selecciona los montos por alquiler y por multa.
         While ( Not Datos.Debe.EOF) do
           Begin
             If (Datos.Debe.Fieldbyname('Codigo_Cliente').Asstring = MaskEdit1.Text) then
               Begin
                 If (Datos.Debe.Fieldbyname('Tipo').Asstring = 'A') then
                   Begin
                     Debe_por_Alquiler_pasado:=Debe_Por_Alquiler_Pasado+
                                               Datos.Debe.Fieldbyname('Monto').Asinteger;
                   end
                 else
                   Begin
                     Debe_por_Multa_pasada:=Debe_Por_Multa_Pasada+
                                            Datos.Debe.Fieldbyname('Monto').Asinteger;
                   end;
               end;
             Datos.Debe.Next;
           end;

         If Debe_Por_Multa_Pasada > 0 Then
           Begin
             Label24.Caption:=FormatFloat('###0.00',Debe_Por_Multa_Pasada);
             RebDeuMulBtn.Enabled:=True;
           end;
         If Debe_Por_Alquiler_Pasado > 0 Then
           Begin
             Label6.Caption:=FormatFloat('###0.00',Debe_Por_Alquiler_Pasado);
             RebDeuAlqBtn.Enabled:=True;
           end;

         Datos.Mayores.Refresh;
         Datos.Mayores.IndexName:='';
         Datos.Mayores.Setkey;
         Datos.Mayores.Fieldbyname('Codigo_Cliente').asstring:=MaskEdit1.Text;
         If Datos.Mayores.GotoKey = True then
            Begin
              Lista.Items.Clear;
              Lista.Items.Add('1.- '+Datos.Clientes.Fieldbyname('Nombres_Cliente').asstring+' '+
                              Datos.Clientes.Fieldbyname('Apellidos_Cliente').asstring+' (Dueño/Carnet).');
              If Datos.Mayores.Fieldbyname('Nombre1').asstring <> '' then
                 Begin
                   Lista.Items.Add('2.- '+Datos.Mayores.Fieldbyname('Nombre1').asstring+' '+
                                   Datos.Mayores.Fieldbyname('Apellido1').asstring);
                 end;
              If Datos.Mayores.Fieldbyname('Nombre2').asstring <> '' then
                 Begin
                   Lista.Items.Add('3.- '+Datos.Mayores.Fieldbyname('Nombre2').asstring+' '+
                                   Datos.Mayores.Fieldbyname('Apellido2').asstring);
                 end;
              If Datos.Mayores.Fieldbyname('Nombre3').asstring <> '' then
                 Begin
                   Lista.Items.Add('4.- '+Datos.Mayores.Fieldbyname('Nombre3').asstring+' '+
                                   Datos.Mayores.Fieldbyname('Apellido3').asstring);
                 end;
              If Datos.Mayores.Fieldbyname('Nombre4').asstring <> '' then
                 Begin
                   Lista.Items.Add('5.- '+Datos.Mayores.Fieldbyname('Nombre4').asstring+' '+
                                   Datos.Mayores.Fieldbyname('Apellido4').asstring);
                 end;
              NumPersona.Text:='1';
            end
         else
            Begin
              Lista.Items.Clear;
              Lista.Items.Add(Datos.Clientes.Fieldbyname('Nombres_Cliente').asstring+' '+
                              Datos.Clientes.Fieldbyname('Apellidos_Cliente').asstring+' (Dueño del Carnet).');
              NumPersona.Text:='1';
            end;
       //se limpian los componentes por si acaso otra busqueda sin
       //cerrar la ventana
         Edit1.Caption:='';
         Observaciones.Clear;
         Edit1.Caption:=Datos.Clientes.fieldbyname('Apellidos_Cliente').asstring+' '+
                             Datos.Clientes.fieldbyname('Nombres_Cliente').asstring;
         CILabel.Caption:=Datos.Clientes.fieldbyname('Cedula_cliente').asstring;
         Observaciones.Lines.Add(Datos.Clientes.Fieldbyname('Observaciones').Asstring);

      // Se comprueba la fecha de nacimiento del cliente para saber si cumple año o no
         Try
           Begin
             Nacimiento:=Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asString;
             If Nacimiento <> '' Then
               Begin
                 StrToDate(Nacimiento);
                 Comparacion1:=Nacimiento[1]+Nacimiento[2]+Nacimiento[3]+Nacimiento[4]+Nacimiento[5];
                 Comparacion2:=Principal.Fecha_Total[1]+Principal.Fecha_Total[2]+Principal.Fecha_Total[3]+
                               Principal.Fecha_Total[4]+Principal.Fecha_Total[5];
                 Nacimiento:=DateToStr(StrToDate(Principal.Fecha_Total)+1);
                 Comparacion3:=Nacimiento[1]+Nacimiento[2]+Nacimiento[3]+Nacimiento[4]+Nacimiento[5];
                 Nacimiento:=DateToStr(StrToDate(Principal.Fecha_Total)-1);
                 Comparacion4:=Nacimiento[1]+Nacimiento[2]+Nacimiento[3]+Nacimiento[4]+Nacimiento[5];
                 If ((Comparacion1 = Comparacion2) OR (Comparacion1 = Comparacion3) OR (Comparacion1 = Comparacion4))
                   Then Cumpleanios.Visible:=True else Cumpleanios.Visible:=False;
               end;
           end;
         Except
           On EConvertError do
             Begin
               Cumpleanios.Visible:=False;
             end;
         end;

          // Se comprueba ahora la forma de pago del depósito...
         If Datos.Clientes.fieldbyname('Forma_de_Deposito').asString = 'EF' Then
           Begin
             Image2.Visible:=True;
             Image1.Visible:=False;
             Vence_TC.Visible:=False;
           end
         else
           Begin
             If Datos.Clientes.fieldbyname('Forma_de_Deposito').asString = 'CH' Then
               Begin
                 Image2.Visible:=True;
                 Image1.Visible:=False;
                 Vence_TC.Visible:=False;
               end
             else
               Begin
                 If Datos.Clientes.fieldbyname('Forma_de_Deposito').asString = 'TC' Then
                   Begin
                     Datos.Tarjetas.Open;
                     Datos.Tarjetas.First;
                     Datos.Tarjetas.IndexName:='Codigo_Tipo_Index';
                     Datos.Tarjetas.Setkey;
                     Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=maskedit1.text;
                     Datos.Tarjetas.fieldbyname('Tipo').asstring:='D';
                     Datos.Tarjetas.GotoKey;
                     Image1.Visible:=True;
                     Image2.Visible:=False;
                     Vence_TC.Caption:=Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring;
                     Vence_TC.Visible:=True;
                     Datos.Tarjetas.Close;
                   end;
               end;
           end;
       // Se Comprueba si el Cliente es Free o no.
         If Datos.Clientes.fieldbyname('Alquiler_Free').AsBoolean = True Then
           Begin
             RxGifAnimator1.Animate:=True;
             RxGifAnimator1.Visible:=True;
             RebAlqBtn.Enabled:=False;
           end
         else
           RebAlqBtn.Enabled:=True;


       // Se Comprueba si el Cliente es Free o no.
         If Datos.Clientes.fieldbyname('Multa_Free').AsBoolean = True Then
           Begin
             RxGifAnimator3.Animate:=True;
             RxGifAnimator3.Visible:=True;
           end;

       // Se comprueba la ultima visita y se pone en el label
         If Datos.Clientes.fieldbyname('Ultima_Visita').AsString = Principal.Fecha_Total Then
           Begin
             Label3.Caption:='Últ. Vis.: '+Principal.Fecha_Total+
                             '           ( H O Y )';
           end;
         If StrToDate(Datos.Clientes.fieldbyname('Ultima_Visita').AsString) < StrToDate(Principal.Fecha_Total) Then
           Begin
             edad := StrToDate(Principal.Fecha_Total) - StrToDate(Datos.Clientes.fieldbyname('Ultima_Visita').AsString);
             If Edad > 1 Then
               Begin
                 Label8.Caption:=formatdatetime('yy',edad);
                 Label10.Caption:=formatdatetime('mm',edad);
                 Label12.Caption:=formatdatetime('dd',edad);
                 If StrToInt(Label12.Caption) > 30 Then
                   Begin
                     IF StrToInt(Label10.Caption)>10 Then
                       Begin
                         Label8.Caption:=IntToStr(StrToInt(Label8.Caption)+1);
                         Label10.Caption:='01';
                         Label12.Caption:='00';
                       end
                     else
                       Begin
                         Label10.Caption:=IntToStr(StrToInt(Label10.Caption)+1);
                         Label12.Caption:='00';
                       end;
                   end;
                 Label3.Caption:='Últ. Vis.: '+Datos.Clientes.fieldbyname('Ultima_Visita').AsString+
                  ' ('+IntToStr(StrToInt(Label8.Caption))+' años, '+ IntToStr(StrToInt(Label10.Caption)-1)+' meses y '+IntToStr(StrToInt(Label12.Caption)+1)+' dias.)';
               end
             else
               Begin
                 Label3.Caption:='Últ. Vis.: '+Datos.Clientes.fieldbyname('Ultima_Visita').AsString+
                             '           ( A Y E R )';
               end;
           end;
         If StrToDate(Datos.Clientes.fieldbyname('Ultima_Visita').AsString) > StrToDate(Principal.Fecha_Total) Then
           Begin
             Label3.Caption:='     A D V E R T E N C I A:   Última Visita: '+Datos.Clientes.fieldbyname('Ultima_Visita').AsString;
           end;

         Label33.Caption:='Cliente desde: '+Datos.Clientes.fieldbyname('Fecha_Inscripcion').AsString;

       //Se buscan todos los videos que tenga alquilado ese usuario
         Datos.Videos.Active:=True;
         Datos.Videos.Refresh;
         Datos.Videos.Cancelrange;
         Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
         Datos.Videos.setrange([Maskedit1.text]
                        ,[Maskedit1.text]);
         Datos.Videos.Refresh;
         Datos.Videos.First;
         Label9.caption:=inttostr(Datos.Videos.Recordcount);
         Verificar_Limites;

         Total_de_multa:=0;
         For Conta:=1 to Datos.Videos.recordcount do
           Begin
             If Datos.Videos.Fieldbyname('Multado').asboolean = True then
               Begin // Si el video está multado
                 If Datos.Videos.Fieldbyname('Video_Doble').asboolean = True then
                    Begin // Si el video es doble
                      If Datos.Videos.Fieldbyname('Estreno').asboolean = True then
                        Begin // Si es Doble y además es Estreno
                          Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                            1:Total_de_Multa:=Total_de_Multa+Precio_Multa_Estreno_Doble_1_Dia;
                            2:Total_de_Multa:=Total_de_Multa+Precio_Multa_Estreno_Doble_2_Dia;
                            3:Total_de_Multa:=Total_de_Multa+Precio_Multa_Estreno_Doble_3_Dia;
                            4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                              Precio_Multa_Estreno_Doble_mas_Dia);
                          end;
                        end
                      else // Si es Doble pero no es Estreno
                        Begin
                          Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                            1:Total_de_Multa:=Total_de_Multa+Precio_Multa_Doble_1_Dia;
                            2:Total_de_Multa:=Total_de_Multa+Precio_Multa_Doble_2_Dia;
                            3:Total_de_Multa:=Total_de_Multa+Precio_Multa_Doble_3_Dia;
                            4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                              Precio_Multa_Doble_mas_Dia);
                          end;
                        end;
                    end
                 else
                    Begin // Si el video no es doble
                      If Datos.Videos.Fieldbyname('Estreno').asboolean = True then
                        Begin // Si NO es Doble y además es Estreno
                          If Datos.Videos.fieldbyname('DVD').asBoolean = True then
                            Begin // Si es un DVD EN ESTRENO
                              Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                1:Total_de_Multa:=Total_de_Multa+(Precio_Multa_DVD_ESTRENO_1_Dia);
                                2:Total_de_Multa:=Total_de_Multa+(Precio_Multa_DVD_ESTRENO_2_Dia);
                                3:Total_de_Multa:=Total_de_Multa+(Precio_Multa_DVD_ESTRENO_3_Dia);
                                4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                                    Precio_Multa_DVD_ESTRENO_mas_Dia);
                              end;
                            end
                          else // Si NO es un DVD
                            Begin
                              Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                1:Total_de_Multa:=Total_de_Multa+Precio_Multa_Estreno_1_Dia;
                                2:Total_de_Multa:=Total_de_Multa+Precio_Multa_Estreno_2_Dia;
                                3:Total_de_Multa:=Total_de_Multa+Precio_Multa_Estreno_3_Dia;
                                4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                                  Precio_Multa_Estreno_mas_Dia);
                              end;
                            end;
                        end
                      else // Si NO es Doble Y no es Estreno
                        Begin
                          If Datos.Videos.fieldbyname('DVD').asBoolean = True then
                            Begin // Si es un DVD SIMPLE
                              Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                1:Total_de_Multa:=Total_de_Multa+(Precio_Multa_DVD_1_Dia);
                                2:Total_de_Multa:=Total_de_Multa+(Precio_Multa_DVD_2_Dia);
                                3:Total_de_Multa:=Total_de_Multa+(Precio_Multa_DVD_3_Dia);
                                4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                                    Precio_Multa_DVD_mas_Dia);
                              end;
                            end
                          else
                            Begin
                              If Datos.Videos.fieldbyname('Clase_Video').asstring = 'XXX' then
                                Begin //  Si es una Porno
                                  Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger of
                                    1:Total_de_Multa:=Total_de_Multa+(Precio_Multa_Sexo_1_Dia);
                                    2:Total_de_Multa:=Total_de_Multa+(Precio_Multa_Sexo_2_Dia);
                                    3:Total_de_Multa:=Total_de_Multa+(Precio_Multa_Sexo_3_Dia);
                                    4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                                                      Precio_Multa_Sexo_Mas_Dia);
                                  end;
                                end
                              else // Si no es Porno
                                Begin
                                  If Datos.Videos.fieldbyname('Clase_Video').asstring = 'MUS' then
                                    Begin // Si es un Musical
                                      Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger of
                                        1:Total_de_Multa:=Total_de_Multa+(Precio_Multa_Musical_1_Dia);
                                        2:Total_de_Multa:=Total_de_Multa+(Precio_Multa_Musical_2_Dia);
                                        3:Total_de_Multa:=Total_de_Multa+(Precio_Multa_Musical_3_Dia);
                                        4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                                                      Precio_Multa_Musical_mas_Dia);
                                      end;
                                    end
                                  else // Si No es Ni Porno Ni Musical
                                   Begin
                                      Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger of
                                        1:Total_de_Multa:=Total_de_Multa+(Precio_Multa_1_Dia);
                                        2:Total_de_Multa:=Total_de_Multa+(Precio_Multa_2_Dia);
                                        3:Total_de_Multa:=Total_de_Multa+(Precio_Multa_3_Dia);
                                        4..99999:Total_de_Multa:=Total_de_Multa+(Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger *
                                                                      Precio_Multa_mas_Dia);
                                      end;
                                   end;
                                end;
                            end;
                        end;
                    end;
               end;
             Datos.Videos.Moveby(1);
           End;
         Datos.Videos.Refresh;
         Label16.Caption:=FormatFloat('###0.00',Total_de_Multa);
         LabelTotal.Caption:='0,00';
         Label27.Caption:='0,00';
         Label30.Caption:='0,00';
         Datos.Videos.First;
         NumPersona.Enabled:=True;
         MaskEdit1.Enabled:=False;
         NumPersona.Setfocus;
         key:=#3;
       end
    else
       Begin
         Edit1.Caption:='';
         Datos.Videos.Active:=False;
         Label16.Caption:='0,00';
         Label18.Caption:='0,00';
         LabelTotal.Caption:='0,00';
         Label27.Caption:='0,00';
         RebAlqBtn.Enabled:=False;
         RebDeuAlqBtn.Enabled:=False;
         RebDeuMulBtn.Enabled:=False;
         Label30.Caption:='0,00';
         Label9.Caption:='0';
         Showmessage('El código que ha ingresado no se encuentra, por '+
                     'favor, corrija el problema y continúe la búsqueda.');
         Maskedit1.Setfocus;
         key:=#3;
       end;

   If Datos.Videos.Active = True then
     BEgin
      If Datos.Videos.Recordcount <= 0 then
         Begin
           Datos.Clientes.Refresh;
           Datos.Clientes.indexname:='';
           Datos.Clientes.setkey;
           Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit1.Text;
           If (Datos.Clientes.gotokey = true) then
             Begin
               Datos.Clientes.Edit;
               Datos.Clientes.FieldByName('Tiene_Pelicula').asboolean:=False;
               Datos.Clientes.FieldByName('Cliente_Multado').asboolean:=False;
               Datos.Clientes.Post;
               Datos.Clientes.FlushBuffers;
               Datos.Clientes.Refresh;
             end;
         end
      else
         Begin
           Datos.Clientes.Refresh;
           Datos.Clientes.indexname:='';
           Datos.Clientes.setkey;
           Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit1.Text;
           If (Datos.Clientes.gotokey = true) then
             Begin
               Datos.Clientes.Edit;
               Datos.Clientes.FieldByName('Tiene_Pelicula').asboolean:=True;
               Datos.Clientes.Post;
               Datos.Clientes.FlushBuffers;
               Datos.Clientes.Refresh;
             end;
         end;
     end;
  end;
 If Key = #27 then
  Begin
    Close;
  end;
end;

Procedure TAlquilar_y_devolver.Ejecutar;
var
Find,Encontrado:Boolean;
Autorizado:integer;
Dias:integer;
Titulo,Fecha:string;
Begin
  Encontrado:=False;
  Datos.Videos.Refresh;
  Datos.Videos.First;
  While ((Encontrado = False) and ( Not Datos.Videos.EOF)) do
    Begin
      If Datos.Videos.Fieldbyname('Codigo_Video').Asstring = MaskEdit2.Text then
        Begin
          Encontrado:=True;
          If MessageDlg('Por favor, confirme que el video titulado: "'+ Datos.Videos.fieldbyname('Titulo_Video').asstring+
                        '" está siendo devuelto en estos momentos.', mtcustom,
                        [mbOk,mbNo], 1) = mrok then
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
                  Datos.Historia.Fieldbyname('Fecha_de_Devolucion').Asstring:=Principal.Fecha_Total;
                  Datos.Historia.Post;
                  Datos.Historia.FlushBuffers;
                end;
              Titulo:=Datos.Videos.fieldbyname('Titulo_Video').asstring;
              Dias:=Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger;
              Autorizado:=strtoint(Datos.Videos.fieldbyname('Cliente_Autorizado').asstring);
              Fecha:=Datos.Videos.fieldbyname('Fecha_Alquiler').asstring;
              If Datos.Videos.Fieldbyname('Multado').Asboolean = False then
                Begin // Si el Video se esta devolviendo y no esta multado
                  Datos.Videos.Edit;
                  Datos.Videos.fieldbyname('Codigo_Cliente').asstring:='';
                  Datos.Videos.fieldbyname('Fecha_Alquiler').asstring:='';
                  Datos.Videos.fieldbyname('Fecha_Entrega').asstring:='';
                  Datos.Videos.fieldbyname('Dias_Alquiler').asinteger:=0;
                  Datos.Videos.fieldbyname('Multado').asboolean:=False;
                  Datos.Videos.fieldbyname('Video_Alquilado').asboolean:=False;
                  Datos.Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
                  Datos.Videos.fieldbyname('Cliente_Autorizado').asstring:='';
                  Datos.Videos.Post;
                  Datos.Videos.FlushBuffers;
                  Datos.Videos.Refresh;
                end
              else
                Begin
                  Datos.Videos.Edit;
                  If Datos.Videos.Fieldbyname('Video_Doble').asboolean = True then
                    Begin // Si el video es doble
                      If Datos.Videos.Fieldbyname('Estreno').asboolean = True then
                        Begin // Si es Doble y además es Estreno
                          Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                            1:Begin
                                Total_Ingreso_Video:=Precio_Multa_Estreno_Doble_1_Dia;
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                        Precio_Multa_Estreno_Doble_1_Dia;
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                        Precio_Multa_Estreno_Doble_1_Dia;
                              end;
                            2:Begin
                                Total_Ingreso_Video:=Precio_Multa_Estreno_Doble_2_Dia;
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                         Precio_Multa_Estreno_Doble_2_Dia;
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                         Precio_Multa_Estreno_Doble_2_Dia;
                              end;
                            3:Begin
                                Total_Ingreso_Video:=Precio_Multa_Estreno_Doble_3_Dia;
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                        Precio_Multa_Estreno_Doble_3_Dia;
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                        Precio_Multa_Estreno_Doble_3_Dia;
                              end;
                            4..99999:
                              Begin
                                Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger *
                                            Precio_Multa_Estreno_Doble_mas_Dia);
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                        (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Estreno_Doble_mas_Dia);
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                        (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Estreno_Doble_mas_Dia);
                              end;
                          end;
                        end
                      else // Si es Doble pero no es Estreno
                        Begin
                          Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                            1:Begin
                                Total_Ingreso_Video:=Precio_Multa_Doble_1_Dia;
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                         Precio_Multa_Doble_1_Dia;
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                         Precio_Multa_Doble_1_Dia;
                              end;
                            2:Begin
                                Total_Ingreso_Video:=Precio_Multa_Doble_2_Dia;
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                         Precio_Multa_Doble_2_Dia;
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                         Precio_Multa_Doble_2_Dia;
                              end;
                            3:Begin
                                Total_Ingreso_Video:=Precio_Multa_Doble_3_Dia;
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                         Precio_Multa_Doble_3_Dia;
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                         Precio_Multa_Doble_3_Dia;
                              end;
                            4..99999:
                              Begin
                                Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger *
                                             Precio_Multa_Doble_mas_Dia);
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                       (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Doble_mas_Dia);
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                        (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Doble_mas_Dia);
                              end;
                          end; // del case
                        end; // del Si es Doble pero no es Estreno
                    end // del Si el video es doble
                  else
                    Begin // Si el video no es doble
                      If Datos.Videos.Fieldbyname('Estreno').asboolean = True then
                        Begin // Si NO es Doble y además es Estreno
                          If Datos.Videos.fieldbyname('DVD').asBoolean = True then
                            Begin // Si es un DVD EN ESTRENO
                              Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                1:Begin
                                    Total_Ingreso_Video:=Precio_Multa_DVD_Estreno_1_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_DVD_Estreno_1_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_DVD_Estreno_1_Dia;
                                  end;
                                2:Begin
                                    Total_Ingreso_Video:=Precio_Multa_DVD_Estreno_2_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                  Precio_Multa_DVD_Estreno_2_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                  Precio_Multa_DVD_Estreno_2_Dia;
                                  end;
                                3:Begin
                                    Total_Ingreso_Video:=Precio_Multa_DVD_Estreno_3_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_DVD_Estreno_3_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_DVD_Estreno_3_Dia;
                                  end;
                                4..99999:
                                  Begin
                                    Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger *
                                                    Precio_Multa_DVD_Estreno_mas_Dia);
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                              (Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger * Precio_Multa_DVD_Estreno_mas_Dia);
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                             (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_DVD_Estreno_mas_Dia);
                                  end;
                              end; // del case
                            end // del Si es un DVD en estreno
                          else // Si NO es un DVD pero es Estreno
                            Begin
                              Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                1:Begin
                                    Total_Ingreso_Video:=Precio_Multa_Estreno_1_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_Estreno_1_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_Estreno_1_Dia;
                                  end;
                                2:Begin
                                    Total_Ingreso_Video:=Precio_Multa_Estreno_2_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_Estreno_2_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_Estreno_2_Dia;
                                    end;
                                3:Begin
                                    Total_Ingreso_Video:=Precio_Multa_Estreno_3_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_Estreno_3_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_Estreno_3_Dia;
                                  end;
                                4..99999:
                                  Begin
                                    Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger *
                                                Precio_Multa_Estreno_mas_Dia);
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                           (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Estreno_mas_Dia);
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                            (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Estreno_mas_Dia);
                                  end;
                              end; // del case
                            end;  // del Si no es un DVD pero es estreno
                        end
                      else // Si NO es Doble Y no es Estreno
                        Begin
                          If Datos.Videos.fieldbyname('DVD').asBoolean = True then
                            Begin // Si es un DVD SIMPLE
                              Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                1:Begin
                                    Total_Ingreso_Video:=Precio_Multa_DVD_1_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_DVD_1_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_DVD_1_Dia;
                                  end;
                                2:Begin
                                    Total_Ingreso_Video:=Precio_Multa_DVD_2_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_DVD_2_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_DVD_2_Dia;
                                  end;
                                3:Begin
                                    Total_Ingreso_Video:=Precio_Multa_DVD_3_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                             Precio_Multa_DVD_3_Dia;
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                             Precio_Multa_DVD_3_Dia;
                                  end;
                                4..99999:
                                  Begin
                                    Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency *
                                                   Precio_Multa_DVD_mas_Dia);
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                    Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                             (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_DVD_mas_Dia);
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                    Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                           (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_DVD_mas_Dia);
                                  end;
                              end;// Del Case
                            end // del Si es un DVD simple
                          else  // si no es DVD
                            Begin
                              If Datos.Videos.fieldbyname('Clase_Video').asstring = 'XXX' then
                                Begin //  Si es una Porno
                                  Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                    1:Begin
                                        Total_Ingreso_Video:=Precio_Multa_Sexo_1_Dia;
                                        Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                 Precio_Multa_Sexo_1_Dia;
                                        Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                 Precio_Multa_Sexo_1_Dia;
                                      end;
                                    2:Begin
                                        Total_Ingreso_Video:=Precio_Multa_Sexo_2_Dia;
                                        Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                 Precio_Multa_Sexo_2_Dia;
                                        Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                 Precio_Multa_Sexo_2_Dia;
                                      end;
                                    3:Begin
                                        Total_Ingreso_Video:=Precio_Multa_Sexo_3_Dia;
                                        Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                 Precio_Multa_Sexo_3_Dia;
                                        Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                 Precio_Multa_Sexo_3_Dia;
                                      end;
                                    4..99999:
                                      Begin
                                        Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger *
                                                  Precio_Multa_Sexo_mas_Dia);
                                        Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                        Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                               (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Sexo_mas_Dia);
                                        Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                        Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                               (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Sexo_mas_Dia);
                                      end;
                                  end; // Del Case
                                end // DEl Si es una Porno
                              else // Si no es Porno
                                Begin
                                  If Datos.Videos.fieldbyname('Clase_Video').asstring = 'MUS' then
                                    Begin // Si es un Musical
                                      Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                        1:Begin
                                            Total_Ingreso_Video:=Precio_Multa_Musical_1_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                     Precio_Multa_Musical_1_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                     Precio_Multa_Musical_1_Dia;
                                          end;
                                        2:Begin
                                            Total_Ingreso_Video:=Precio_Multa_Musical_2_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                     Precio_Multa_Musical_2_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                     Precio_Multa_Musical_2_Dia;
                                          end;
                                        3:Begin
                                            Total_Ingreso_Video:=Precio_Multa_Musical_3_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                     Precio_Multa_Musical_3_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                     Precio_Multa_Musical_3_Dia;
                                          end;
                                        4..99999:
                                          Begin
                                            Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').asInteger *
                                                                  Precio_Multa_Musical_mas_Dia);
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                         (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Musical_mas_Dia);
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                         (Datos.Videos.Fieldbyname('Dias_de_Multa').asCurrency * Precio_Multa_Musical_mas_Dia);
                                          end;
                                      end; // Del Case
                                    end // del si es un musical
                                  else // Si No es Ni Porno Ni Musical
                                    Begin
                                      Case Datos.Videos.Fieldbyname('Dias_de_Multa').asinteger OF
                                        1:Begin
                                            Total_Ingreso_Video:=Precio_Multa_1_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                     Precio_Multa_1_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                     Precio_Multa_1_Dia;
                                          end;
                                        2:Begin
                                            Total_Ingreso_Video:=Precio_Multa_2_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                     Precio_Multa_2_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                     Precio_Multa_2_Dia;
                                          end;
                                        3:Begin
                                            Total_Ingreso_Video:=Precio_Multa_Musical_3_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                                     Precio_Multa_3_Dia;
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                                     Precio_Multa_3_Dia;
                                          end;
                                        4..99999:
                                          Begin
                                            Total_Ingreso_Video:=(Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger *
                                                                 Precio_Multa_mas_Dia);
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency:=
                                            Datos.Videos.fieldbyname('Ingresos_Por_Multa').asCurrency+
                                                     (Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger * Precio_Multa_mas_Dia);
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
                                            Datos.Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                                    (Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger * Precio_Multa_mas_Dia);
                                          end; // del 4.99999
                                      end; // del case
                                    end; // del Ni porno ni musical
                                end; // del porno
                            end; // del si no es dvd
                        end; // del Si no es doble ni estreno
                    end; // del si no es doble
                  Try
                    If ((RxGifAnimator3.Animate = True) AND (RxGifAnimator3.Visible = True)) Then
                      Begin // Si el Cliente Tiene Multas Free.
                        Label16.Caption:=FormatFloat('###0.00',strtoFloat(Label16.Caption) - Total_Ingreso_Video);
                        Datos.Transacciones.Edit;
                        Datos.Transacciones.Append;
                        Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
                        Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
                        Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
                        Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
                        Datos.Transacciones.Fieldbyname('Excento_Multa').AsCurrency:=Total_Ingreso_Video;
                        Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
                        Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit1.Text;
                        Datos.Transacciones.Post;
                      end
                    else //Si el Cliente no tienes Multas Free
                      Begin
                        If ((Datos.TablaMiscelaneos.Fieldbyname('Hora_Buzon').AsString <> '') AND
                            (StrToTime(Datos.TablaMiscelaneos.Fieldbyname('Hora_Buzon').AsString) >= Time) AND
                            (Datos.Videos.fieldbyname('Dias_de_Multa').asinteger = 1)) Then
                          Begin
                            Datos.Videos.Edit;
                            Datos.Videos.fieldbyname('Codigo_Cliente').asstring:='';
                            Datos.Videos.fieldbyname('Fecha_Alquiler').asstring:='';
                            Datos.Videos.fieldbyname('Fecha_Entrega').asstring:='';
                            Datos.Videos.fieldbyname('Dias_Alquiler').asinteger:=0;
                            Datos.Videos.fieldbyname('Multado').asboolean:=False;
                            Datos.Videos.fieldbyname('Video_Alquilado').asboolean:=False;
                            Datos.Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
                            Datos.Videos.fieldbyname('Cliente_Autorizado').asstring:='';
//                            Datos.Videos.Post;
//                            Datos.Videos.FlushBuffers;
//                            Datos.Videos.Refresh;
                            Label16.Caption:=FormatFloat('###0.00',StrtoFloat(Label16.Caption) - Total_Ingreso_Video);
                          end
                        else
                          Begin
                            Confirmar:=TConfirmar.Create(Self);
                            Confirmar.Label1.caption:='Se Paga Ahora ?.';
                            Confirmar.Caption:='C o n f i r m a r .';
                            Confirmar.showmodal;
                            If Confirmar.modalresult = mrok then
                              begin        //Si se Paga Ahora
                                //Actualización de la Base de Usuarios, para ponerle cuánto ha gastado
                                //en Alquileres y Multas.
                                Accion_Ejecutada:=True;
                                Datos.Clientes.Refresh;
                                Datos.Clientes.indexname:='';
                                Datos.Clientes.Setkey;
                                Datos.Clientes.FieldByName('Codigo_Cliente').Asstring:=MaskEdit1.Text;
                                IF Datos.Clientes.GotoKey = True then
                                  Begin
                                    Datos.Clientes.Edit;
                                    Datos.Clientes.Fieldbyname('Gastado_en_Multa').asCurrency:=
                                    Datos.Clientes.Fieldbyname('Gastado_en_Multa').asCurrency+
                                    Total_Ingreso_Video;
                                    Datos.Clientes.Post;
                                    Datos.Clientes.FlushBuffers;
                                    Datos.Clientes.Refresh;
                                  end;
                                // Se actualiza las transacciones para ejecutar el pago de la multa
                                Datos.Transacciones.Edit;
                                Datos.Transacciones.Append;
                                Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
                                Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
                                Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
                                Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
                                Datos.Transacciones.Fieldbyname('Multa').AsCurrency:=Total_Ingreso_Video;
                                Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
                                Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit1.Text;
                                Datos.Transacciones.Post;
                                 //Actualización de la Base Totales
                                Desglozar:=MaskEdit2.Text;
                                Codigo_Video_a_Buscar:='';
                                Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                                           Desglozar[3]+Desglozar[4];
                                Datos.Total.indexname:='';
                                Datos.Total.Setkey;
                                Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
                                IF Datos.Total.GotoKey = True then
                                  Begin
                                    Datos.Total.Edit;
                                    Datos.Total.Fieldbyname('Multa_Total').asCurrency:=
                                    Datos.Total.Fieldbyname('Multa_Total').asCurrency +
                                    Total_Ingreso_Video;
                                    Datos.Total.Fieldbyname('Ingreso_Total').asCurrency:=
                                    Datos.Total.Fieldbyname('Alquiler_Total').asCurrency +
                                    Datos.Total.Fieldbyname('Multa_Total').asCurrency;
                                    Datos.Total.Fieldbyname('Veces_de_Multa_Total').asCurrency:=
                                    Datos.Total.Fieldbyname('Veces_de_Multa_Total').asCurrency + 1;
                                    Datos.Total.Post;
                                    Datos.Total.FlushBuffers;
                                  end;
                                 //Actualización de los Ingresos para la Caja
                                Datos.Multas.indexname:='';
                                Datos.Multas.Setkey;
                                Datos.Multas.Fieldbyname('Fecha').asstring:=Principal.Fecha_Total;
                                If Datos.Multas.Gotokey = True then
                                  Begin
                                    Datos.Multas.Edit;
                                    Datos.Multas.Fieldbyname('Cantidad').asCurrency:=
                                    Datos.Multas.Fieldbyname('Cantidad').asCurrency+Total_Ingreso_Video;
                                    Datos.Multas.Post;
                                    Datos.Multas.FlushBuffers;
                                  end
                                else
                                  Begin
                                    Datos.Multas.Refresh;
                                    Datos.Multas.Last;
                                    Datos.Multas.Insert;
                                    Datos.Multas.Fieldbyname('Fecha').asstring:=Principal.Fecha_Total;
                                    Datos.Multas.Fieldbyname('Cantidad').asCurrency:=Total_Ingreso_Video;
                                    Datos.Multas.Post;
                                    Datos.Multas.FlushBuffers;
                                  end;
                                Label16.Caption:=FormatFloat('###0.00',StrToFloat(Label16.Caption) - Total_Ingreso_Video);
                                Label28.Caption:=FormatFloat('###0.00',StrToFloat(Label28.Caption) + Total_Ingreso_Video);
                                LabelTotal.Caption:=FormatFloat('###0.00',StrToFloat(Label28.Caption) + StrToFloat(Label18.Caption)+
                                                         StrToFloat(Label27.Caption) + StrToFloat(Label30.Caption));
                              end
                            else   //Si no se Paga Ahora
                              Begin
                                //Actualización de la base Debe
                                Datos.Clientes.indexname:='';
                                Datos.Clientes.Setkey;
                                Datos.Clientes.FieldByName('Codigo_Cliente').Asstring:=MaskEdit1.Text;
                                IF Datos.Clientes.GotoKey = True then
                                  Begin
                                    Datos.Clientes.Edit;
                                    Datos.Clientes.Fieldbyname('Debe_Multas').asCurrency:=
                                    Datos.Clientes.Fieldbyname('Debe_Multas').asCurrency+
                                    Total_Ingreso_Video;
                                    Datos.Clientes.Post;
                                    Datos.Clientes.FlushBuffers;
                                  end;
                                Datos.Debe.Refresh;
                                Datos.Debe.last;
                                Datos.Debe.insert;
                                Datos.Debe.fieldbyname('Codigo_Cliente').asstring:=MaskEdit1.Text;
                                Datos.Debe.fieldbyname('Codigo_Video').asstring:=MaskEdit2.Text;
                                Datos.Debe.fieldbyname('Titulo_Video').asstring:=Titulo;
                                Datos.Debe.fieldbyname('Tipo').asstring:='M';
                                Datos.Debe.fieldbyname('Persona_que_lo_alquilo').asstring:=
                                                  Lista.Items[Autorizado-1];
                                Datos.Debe.fieldbyname('Dias').asinteger:=Dias;
                                Datos.Debe.fieldbyname('Monto').asCurrency:=Total_Ingreso_Video;
                                Datos.Debe.fieldbyname('Fecha').asstring:=Fecha;
                                Datos.Debe.fieldbyname('Fecha_Devolucion').asstring:=Principal.Fecha_Total;
                                Datos.Debe.Post;
                                Datos.Debe.FlushBuffers;
                                  //Actualización de la Base Totales
                                Desglozar:=MaskEdit2.Text;
                                Codigo_Video_a_Buscar:='';
                                Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                                           Desglozar[3]+Desglozar[4];
                                Datos.Total.indexname:='';
                                Datos.Total.Setkey;
                                Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
                                IF Datos.Total.GotoKey = True then
                                  Begin
                                    Datos.Total.Edit;
                                    Datos.Total.Fieldbyname('Debe_Multas').asCurrency:=
                                    Datos.Total.Fieldbyname('Debe_Multas').asCurrency +
                                    Total_Ingreso_Video;
                                    Datos.Total.Fieldbyname('Veces_de_Multa_Total').Asinteger:=
                                    Datos.Total.Fieldbyname('Veces_de_Multa_Total').Asinteger + 1;
                                    Datos.Total.Post;
                                    Datos.Total.FlushBuffers;
                                  end;
                                Label16.Caption:=FormatFloat('###0.00',StrToFloat(Label16.Caption) - Total_Ingreso_Video);
                                Label24.Caption:=FormatFloat('###0.00',StrToFloat(Label24.Caption) + Total_Ingreso_Video);
                              end;
                          end;
                      end;
                  Datos.Videos.fieldbyname('Veces_de_Multa').asinteger:=
                  Datos.Videos.fieldbyname('Veces_de_Multa').asinteger+1;
                  Datos.Videos.fieldbyname('Codigo_Cliente').asstring:='';
                  Datos.Videos.fieldbyname('Fecha_Alquiler').asstring:='';
                  Datos.Videos.fieldbyname('Fecha_Entrega').asstring:='';
                  Datos.Videos.fieldbyname('Dias_Alquiler').asinteger:=0;
                  Datos.Videos.fieldbyname('Multado').asboolean:=False;
                  Datos.Videos.fieldbyname('Video_Alquilado').asboolean:=False;
                  Datos.Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
                  Datos.Videos.fieldbyname('Cliente_Autorizado').asstring:='';
                  Finally
                    Confirmar.Free;
                    Confirmar:=Nil;
                  end;
                  Datos.Videos.Post;
                  Datos.Videos.FlushBuffers;
                  Datos.Videos.Refresh;
                end;
//                end;
              Datos.Videos.Refresh;
              Datos.Videos.Cancelrange;
              Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
              Datos.Videos.setrange([Maskedit1.text]
                                   ,[Maskedit1.text]);
              Datos.Videos.Refresh;
              Datos.Videos.First;
              Verificar_Limites;
              Label9.caption:=inttostr(Datos.Videos.Recordcount);
              Edit3.Text:='';
              Edit2.Text:=Inttostr(Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger);
              Edit2.Enabled:=False;
              MaskEdit2.Text:='';
              MaskEdit2.Setfocus;
            end;
        end;
      Datos.Videos.MoveBy(1);
    end;

  If Encontrado = False then
    Begin
      Todos_Los_Videos.Open;
      Todos_Los_Videos.CancelRange;
      Todos_Los_Videos.First;
      Todos_Los_Videos.indexname:='';
      Todos_Los_Videos.Setkey;
      Todos_Los_Videos.FieldByName('Codigo_Video').Asstring:=Maskedit2.Text;
      IF Todos_Los_Videos.GotoKey = True then
        Begin
          Encontrado:=True;
          If Todos_Los_Videos.FieldByName('Video_Alquilado').Asboolean = True then
            Begin
              Showmessage('El Video que trata de alquilar aparece que ya ha sido '+
                          'alquilado a otra persona, por favor corrija el problema.');
            end
          else
             Begin
               Visto:=False;
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
               While ((Visto = False) and ( Not Datos.Historia.EOF)) do
                 Begin
                   If Datos.Historia.Fieldbyname('Codigo_Video').Asstring = Codigo_Video_a_Buscar then
                     Begin
                       Visto:=True;
                       Label13.Caption:='SI';
                     end;
                   Datos.Historia.Next;
                 end;
               IF Visto = False then
                 Begin
                   Label13.Caption:='NO';
                 end;
               Codigo_a_Buscar:=Todos_Los_Videos.Fieldbyname('Codigo_Video').Asstring;
               Edit3.Text:=Todos_Los_Videos.Fieldbyname('Titulo_Video').Asstring;
               Edit2.Enabled:=True;
               Edit2.Setfocus;
             end;
        end;
    end;
  If Encontrado = False then
    Begin
      Showmessage('El Código del Video que ha Introducido, no se encuentra '+
                  'registrado, verifique el código e intentelo de nuevo.');
      Edit3.Text:='';
      MaskEdit2.Text:='';
      MaskEdit2.SetFocus;
      Datos.Videos.First;
    end;
  If Datos.Videos.Recordcount <= 0 then
     Begin
       Datos.Clientes.Edit;
       Datos.Clientes.FieldByName('Tiene_Pelicula').asboolean:=False;
       Datos.Clientes.FieldByName('Ultima_Visita').asString:=Principal.Fecha_Total;
       Datos.Clientes.Post;
       Datos.Clientes.FlushBuffers;
     end
  else
     Begin
       Datos.Clientes.Edit;
       Datos.Clientes.FieldByName('Tiene_Pelicula').asboolean:=True;
       Datos.Clientes.FieldByName('Ultima_Visita').asString:=Principal.Fecha_Total;
       Datos.Clientes.Post;
       Datos.Clientes.FlushBuffers;
     end;
  Datos.Videos.First;
end;

procedure TAlquilar_y_devolver.MaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key = #13 then
    Begin
      Ejecutar;
    end;
  If Key = #27 then
     Begin
       MaskEdit2.Enabled:=False;
       Maskedit2.Text:='';
       NumPersona.Enabled:=True;
       NumPersona.Setfocus;
       Key:=#3;
     end;
end;

procedure TAlquilar_y_devolver.Edit2KeyPress(Sender: TObject;
  var Key: Char);
Var
  Cont:Integer;
  Find:Boolean;
begin
Try
  If Key = #13 then
    Begin
      Try
        Begin
          If StrToInt(Edit2.Text) < 1 then Edit2.Text:=Inttostr(Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger);
        end
      except
        On EConvertError do
          Begin
            Raise Mal_Dia.Create(' ');
          end;
      end;

      Todos_Los_Videos.DisableControls;
      Todos_Los_Videos.indexname:='';
      Todos_Los_Videos.setkey;
      Todos_Los_Videos.fieldbyname('Codigo_Video').asstring:=Codigo_a_Buscar;
      If Todos_Los_Videos.gotokey = True Then
        Begin
          Total_Ingreso_Video:=0;
          If Todos_Los_Videos.Fieldbyname('Video_Doble').asboolean = True then
             Begin // Si el video es doble
               If Todos_Los_Videos.Fieldbyname('Estreno').asboolean = True then
                 Begin // Si es Doble y además es Estreno
                   Case strtoint(Edit2.Text) OF
                     1:Total_Ingreso_Video:=Precio_Alquiler_Estreno_Doble_1_Dia;
                     2:Total_Ingreso_Video:=Precio_Alquiler_Estreno_Doble_2_Dia;
                     3:Total_Ingreso_Video:=Precio_Alquiler_Estreno_Doble_3_Dia;
                     4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_Alquiler_Estreno_Doble_mas_Dia;
                   end;
                 end
               else // Si es Doble pero no es Estreno
                 Begin
                   Case strtoint(Edit2.Text) OF
                     1:Total_Ingreso_Video:=Precio_Alquiler_Doble_1_Dia;
                     2:Total_Ingreso_Video:=Precio_Alquiler_Doble_2_Dia;
                     3:Total_Ingreso_Video:=Precio_Alquiler_Doble_3_Dia;
                     4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_Alquiler_Doble_mas_Dia;
                   end;
                 end;
             end
          else
             Begin // Si el video no es doble
               If Todos_Los_Videos.Fieldbyname('Estreno').asboolean = True then
                 Begin // Si NO es Doble y además es Estreno
                   If Todos_Los_Videos.fieldbyname('DVD').asBoolean = True then
                     Begin // Si es un DVD EN ESTRENO
                       Case strtoint(Edit2.Text) OF
                         1:Total_Ingreso_Video:=Precio_Alquiler_DVD_ESTRENO_1_Dia;
                         2:Total_Ingreso_Video:=Precio_Alquiler_DVD_ESTRENO_2_Dia;
                         3:Total_Ingreso_Video:=Precio_Alquiler_DVD_ESTRENO_3_Dia;
                         4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_Alquiler_DVD_ESTRENO_mas_Dia;
                       end;
                     end
                   else // Si NO es un DVD
                     Begin
                       Case strtoint(Edit2.Text) OF
                         1:Total_Ingreso_Video:=Precio_alquiler_Estreno_1_Dia;
                         2:Total_Ingreso_Video:=Precio_alquiler_Estreno_2_Dia;
                         3:Total_Ingreso_Video:=Precio_alquiler_Estreno_3_Dia;
                         4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_alquiler_Estreno_mas_Dia;
                       end;
                     end;
                 end
               else // Si NO es Doble Y no es Estreno
                 Begin
                   If Todos_Los_Videos.fieldbyname('DVD').asBoolean = True then
                     Begin // Si es un DVD SIMPLE
                       Case strtoint(Edit2.Text) OF
                         1:Total_Ingreso_Video:=Precio_alquiler_DVD_1_Dia;
                         2:Total_Ingreso_Video:=Precio_alquiler_DVD_2_Dia;
                         3:Total_Ingreso_Video:=Precio_alquiler_DVD_3_Dia;
                         4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_alquiler_DVD_mas_Dia;
                       end;
                     end
                   else
                     Begin
                       If Todos_Los_Videos.fieldbyname('Clase_Video').asstring = 'XXX' then
                         Begin //  Si es una Porno
                           Case strtoint(Edit2.Text) of
                             1:Total_Ingreso_Video:=Precio_Alquiler_Sexo_1_Dia;
                             2:Total_Ingreso_Video:=Precio_Alquiler_Sexo_2_Dia;
                             3:Total_Ingreso_Video:=Precio_Alquiler_Sexo_3_Dia;
                             4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_Alquiler_Sexo_mas_Dia;
                           end;
                         end
                       else // Si no es Porno
                         Begin
                           If Todos_Los_Videos.fieldbyname('Clase_Video').asstring = 'MUS' then
                             Begin // Si es un Musical
                               Case strtoint(Edit2.Text) of
                                 1:Total_Ingreso_Video:=Precio_alquiler_Musical_1_Dia;
                                 2:Total_Ingreso_Video:=Precio_alquiler_Musical_2_Dia;
                                 3:Total_Ingreso_Video:=Precio_alquiler_Musical_3_Dia;
                                 4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_alquiler_Musical_mas_Dia;
                               end;
                             end
                           else // Si No es Ni Porno Ni Musical
                             Begin
                               Case strtoint(Edit2.Text) of
                                 1:Total_Ingreso_Video:=Precio_alquiler_1_Dia;
                                 2:Total_Ingreso_Video:=Precio_alquiler_2_Dia;
                                 3:Total_Ingreso_Video:=Precio_alquiler_3_Dia;
                                 4..99999:Total_Ingreso_Video:=StrToInt(Edit2.Text)*Precio_alquiler_mas_Dia;
                               end;
                            end;
                         end;
                     end;
                 end;
             end;
        end;

          // Cálculo de Días domingos para sumarlos a la fecha de entrega;
          Domingos:=0;
          If Datos.TablaMiscelaneos.Fieldbyname('Contar_Domingos').AsBoolean = True Then
            Begin
              For cont:=1 to strtoint(Edit2.Text) do
                Begin
                  If DayofWeek(StrToDate(Principal.Fecha_Total)+cont) = 1 then
                    Begin
                      Domingos:=Domingos+1;
                    end;
                end;
            end;


      If ((RxGifAnimator1.Visible = True) AND (RxGifAnimator1.Animate = True)) Then
        Begin // Si el Cliente Tiene Alquiler Free

          Todos_Los_Videos.indexname:='';
          Todos_Los_Videos.setkey;
          Todos_Los_Videos.fieldbyname('Codigo_Video').asstring:=Codigo_a_Buscar;
          Todos_Los_Videos.gotokey;
          Todos_Los_Videos.Edit;
          Todos_Los_Videos.fieldbyname('Codigo_Cliente').asstring:=MaskEdit1.Text;
          Todos_Los_Videos.fieldbyname('Fecha_Alquiler').asstring:=Principal.Fecha_Total;
          Todos_Los_Videos.fieldbyname('Dias_Alquiler').asstring:=Edit2.Text;
          Todos_Los_Videos.fieldbyname('Multado').asboolean:=False;
          Todos_Los_Videos.fieldbyname('Video_Alquilado').asboolean:=True;
          Todos_Los_Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
          Todos_Los_Videos.fieldbyname('Cliente_Autorizado').asstring:=NumPersona.Text;
          Todos_Los_Videos.fieldbyname('Fecha_Entrega').asstring:=
                 Datetostr(strtodate(Todos_Los_Videos.fieldbyname('Fecha_Alquiler').asstring)+
                 (strtoint(Edit2.Text)+Domingos));
          Todos_Los_Videos.fieldbyname('Veces_de_Alquiler').asinteger:=
          Todos_Los_Videos.fieldbyname('Veces_de_Alquiler').asinteger+1;
          Todos_Los_Videos.Post;
          Todos_Los_Videos.FlushBuffers;

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
          Verificar_Limites;

          //Suma un dia a una fecha:  Edit2.Text:=Datetostr(strtodate(Edit1.Text)+1);

          Datos.Registro.Last;
          Datos.Registro.Insert;
          Datos.Registro.FieldByName('Codigo_Cliente').Asstring:=MaskEdit1.Text;
          Datos.Registro.FieldByName('Codigo_Video').Asstring:=MaskEdit2.Text;
          Datos.Registro.FieldByName('Fecha_Salida').Asstring:=Principal.Fecha_Total;
          Datos.Registro.FieldByName('Fecha_Entrada').Asstring:=Datetostr(strtodate(Todos_Los_Videos.fieldbyname('Fecha_Alquiler').asstring)+
                                                                (strtoint(Edit2.Text)+Domingos));
          Datos.Registro.FieldByName('Costo').AsInteger:=0;
          Datos.Registro.FieldByName('Excento').asCurrency:=Total_Ingreso_Video;
          Datos.Registro.Post;
          Datos.Registro.FlushBuffers;

          Datos.Transacciones.Edit;
          Datos.Transacciones.Append;
          Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
          Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
          Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
          Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
          Datos.Transacciones.Fieldbyname('Excento_Alquiler').AsCurrency:=Total_Ingreso_Video;
          Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
          Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit1.Text;
          Datos.Transacciones.Post;

          Datos.Videos.Refresh;
          Datos.Videos.First;
          Label9.caption:=inttostr(Datos.Videos.Recordcount);
          Edit3.Text:='';
          Edit2.Text:=Inttostr(Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger);
          Label13.Caption:='';
          Edit2.Enabled:=False;
          ActualEdit.Text:='0';
          DescuentoEdit.Readonly:=True;
          DescuentoEdit.Text:='0';
          SubEdit.Text:='0';
          MaskEdit2.Text:='';
          MaskEdit2.Setfocus;
          Datos.Clientes.Edit;
          Datos.Clientes.FieldByName('Tiene_Pelicula').asboolean:=True;
          Datos.Clientes.Post;
          Datos.Clientes.FlushBuffers;

        end
      else // Si el Cliente no es Free, se le calcula el precio...
        Begin
          If ((Label34.Visible = True) AND (Label35.Visible =True)) Then
            Begin
              If Cuenta_promo >= 2 Then
                Begin
                  ActualEdit.Text:='0';
                  Edit2.Enabled:=False;
                  DescuentoEdit.Setfocus;
//                  Cuenta_Promo:=0;
                end
              else
                Begin
                  ActualEdit.Text:=Floattostr(Total_Ingreso_Video);
                  Edit2.Enabled:=False;
                  DescuentoEdit.Setfocus;
//                  Cuenta_Promo:=Cuenta_Promo+1;
                end;
            end
          else
            Begin
              ActualEdit.Text:=Floattostr(Total_Ingreso_Video);
              Edit2.Enabled:=False;
              DescuentoEdit.Setfocus;
            end;
        end;
    end;

  If Key = #27 then
    Begin
       Edit3.Text:='';
       Edit2.Text:=Inttostr(Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger);
       Edit2.Enabled:=False;
       MaskEdit2.Text:='';
       MaskEdit2.Setfocus;
       Label13.Caption:='';
       Key:=#3;
    end;
except
   On Mal_Dia do
     BEgin
       Showmessage('El Número de Días de alquiler no es un número válido, '+
                   'por favor corrija para poder continuar');
       Edit2.Setfocus;
     end;
end;
end;

Procedure TAlquilar_y_devolver.Guardar_Factura;
Begin
  Datos.Facturas.Edit;
  Datos.Facturas.Append;
  Datos.Facturas.Fieldbyname('Operador').AsString:=Usuario.Cedula;
  Datos.Facturas.Fieldbyname('Hora').AsDateTime:=Time;
  Datos.Facturas.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
  Datos.Facturas.Fieldbyname('Cliente').AsString:=MaskEdit1.Text;
  Datos.Facturas.Fieldbyname('Deuda_Alquiler').AsCurrency:=StrToFloat(Label30.Caption);
  Datos.Facturas.Fieldbyname('Deuda_Multa').AsCurrency:=StrToFloat(Label27.Caption);
  Datos.Facturas.Fieldbyname('Alquiler').AsCurrency:=StrToFloat(Label18.Caption);
  Datos.Facturas.Fieldbyname('Multa').AsCurrency:=StrToFloat(Label28.Caption);
  Datos.Facturas.Post;
end;

Procedure TAlquilar_y_devolver.Imprimir_Factura;
var
//  Puerto:TextFile;
  ZZZ,Alinear:Byte;
  Blanco:String[10];
Begin
  try
//    AssignFile(Puerto,'LPT1');
    Factura.Clear;
//    Rewrite(Puerto);
    Alinear:=0;
    Factura.Lines.Add(#13);
    Factura.Lines.Add(Datos.Empresa.Fieldbyname('Nombre_Empresa').AsString);
    Factura.Lines.Add('R.I.F.- '+Datos.Empresa.Fieldbyname('RIF').AsString);
    Factura.Lines.Add('Sucursal: '+Datos.Empresa.Fieldbyname('Sucursal').AsString);
    Factura.Lines.Add('Dir.: '+Datos.Empresa.Fieldbyname('Direccion').AsString);
    Factura.Lines.Add('Tlf.: '+Datos.Empresa.Fieldbyname('Telefono').AsString);
    Datos.Facturas.Last;
    Factura.Lines.Add('Factura Nº: '+FormatFloat('0000000000',Datos.Facturas.Fieldbyname('Num_Reg').AsFloat+1));
    Factura.Lines.Add('Fecha: '+Principal.Fecha_Total+'   Hora: '+TimeToStr(Time));
    Factura.Lines.Add('----------------------------------------');
    Factura.Lines.Add('C.I.- Cliente : '+CILabel.Caption);
    Factura.Lines.Add('Código del Cliente : '+MaskEdit1.Text);    
    Factura.Lines.Add('Cliente : '+Edit1.Caption);
    Factura.Lines.Add('Operador: '+Usuario.Nombres+' '+Usuario.Apellidos);
    Factura.Lines.Add('----------------------------------------');
    If Alinear < Length(Label30.Caption)
      Then Alinear:=Length(Label30.Caption);
    If Alinear < Length(Label27.Caption)
      Then Alinear:=Length(Label27.Caption);
    If Alinear < Length(Label18.Caption)
      Then Alinear:=Length(Label18.Caption);
    If Alinear < Length(Label28.Caption)
      Then Alinear:=Length(Label28.Caption);
    If Alinear < Length(LabelTotal.Caption)
      Then Alinear:=Length(LabelTotal.Caption);

    Blanco:='';
    For ZZZ:=Length(Label30.Caption) to Alinear do
      Blanco:=Blanco+' ';
    Factura.Lines.Add('Deuda en Alquiler.....:     '+FormatFloat(Blanco+'0.00',StrToFloat(Label30.Caption)));

    Blanco:='';
    For ZZZ:=Length(Label27.Caption) to Alinear do
      Blanco:=Blanco+' ';
    Factura.Lines.Add('Deuda en Adicionales..:     '+FormatFloat(Blanco+'0.00',StrToFloat(Label27.Caption)));

    Blanco:='';
    For ZZZ:=Length(Label18.Caption) to Alinear do
      Blanco:=Blanco+' ';
    Factura.Lines.Add('Alquiler Actual.......:     '+FormatFloat(Blanco+'0.00',StrToFloat(Label18.Caption)));

    Blanco:='';
    For ZZZ:=Length(Label28.Caption) to Alinear do
      Blanco:=Blanco+' ';
    Factura.Lines.Add('Adicional Actual......:     '+FormatFloat(Blanco+'0.00',StrToFloat(Label28.Caption)));

    Blanco:='';
    For ZZZ:=Length(LabelTotal.Caption) to Alinear do
      Blanco:=Blanco+' ';
    Factura.Lines.Add('TOTAL A PAGAR.........:     '+FormatFloat(Blanco+'0.00',StrToFloat(LabelTotal.Caption)));

    Factura.Lines.Add('----------------------------------------');
    Factura.Lines.Add(Datos.Empresa.Fieldbyname('PIE_1').AsString);
    Factura.Lines.Add(Datos.Empresa.Fieldbyname('Pie_2').AsString);
    Factura.Lines.Add(#13);
    Factura.Lines.Add(#13);
    Factura.Lines.Add(#13);

//    CloseFile(puerto);
    Factura.Lines.SaveToFile('Factura.txt');
    Factura.Print('Factura de VídeoRental 2000');
    Accion_Ejecutada:=False;

  Except
    MessageDlg('Imposible hacer la impresión de la factura, '+
               'asegúrese de que el puerto elegido sea el '+
               'correcto, que la impresora esté encendida '+
               'y que haya papel en la misma.', mtError, [mbOk], 0);
  end;
end;

procedure TAlquilar_y_devolver.NumPersonaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then
    Begin
      MaskEdit2.Enabled:=True;
      MaskEdit2.Setfocus;
      NumPersona.Enabled:=False;
      Key:=#3;
    end;
  If Key = #27 then
     Begin
       If (Accion_Ejecutada = True) Then
         Begin
           If (Usuario.Imprime_Factura = True) Then
             Begin
               Imprimir_Factura;
             end;
           // Inclusive si no se imprime la factura, el registro debe quedar
           Guardar_Factura;
         end;

       MaskEdit2.ReadOnly:=False;
       MaskEdit2.PopupMenu:=Menu_Videos;
       AutorizaAlquilerBtn.Enabled:=False;
       Cumpleanios.Visible:=False;
       Image1.Visible:=False;
       Image2.Visible:=False;
       ALabel1.Visible:=False;
       Label3.Caption:='';
       Label33.Caption:='';
       Cuenta_Promo:=0;
       CILabel.Caption:='';
       RxGifAnimator1.Animate:=False;
       RxGifAnimator2.Animate:=False;
       RxGifAnimator1.Visible:=False;
       RxGifAnimator2.Visible:=False;
       RxGifAnimator3.Animate:=False;
       RxGifAnimator3.Visible:=False;
       RxGifAnimator3.Animate:=False;
       RxGifAnimator3.Visible:=False;

       Vence_TC.Caption:='';
       Vence_TC.Visible:=False;

       Observaciones.Clear;
       DescuentoEdit.Text:='0';
       ActualEdit.Text:='0';
       SubEdit.Text:='0';
       Label13.Caption:='';
       Label16.Caption:='0,00';
       Label18.Caption:='0,00';
       LabelTotal.Caption:='0,00';
       RebAlqBtn.Enabled:=False;
       RebDeuAlqBtn.Enabled:=False;
       RebDeuMulBtn.Enabled:=False;
       Label27.Caption:='0,00';
       Label30.Caption:='0,00';
       Label24.Caption:='0,00';
       Label6.Caption:='0,00';
       Label18.Caption:='0,00';
       Label28.Caption:='0,00';
       Label9.Caption:='0';
       Datos.Videos.Active:=False;
       Label9.caption:='0';
       MaskEdit1.Text:='';
       Edit1.Caption:='';
       Edit2.Text:=Inttostr(Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger);
       Edit3.Text:='';
       NumPersona.Text:='';
       NumPersona.Enabled:=False;
       MaskEdit2.Enabled:=False;
       Lista.Items.Clear;
       MaskEdit1.Enabled:=True;
       MaskEdit1.Setfocus;
     end;
end;

procedure TAlquilar_y_devolver.NumPersonaExit(Sender: TObject);
begin
  Try
    Begin
      If Strtoint(NumPersona.Text) > Lista.Items.Count then
        Begin
          NumPersona.Text:='1';
        End;
      If Strtoint(NumPersona.Text) <= 1 Then
        Begin
          NumPersona.Text:='1';
          Lista.Itemindex:=strtoint(NumPersona.Text)-1;
        end
      else
        Begin
          Lista.Itemindex:=strtoint(NumPersona.Text)-1;
        end;
    end
  except
    On EConvertError do
       Begin
         NumPersona.Text:='1';
       end;
  end;
end;


procedure TAlquilar_y_devolver.ListaClick(Sender: TObject);
begin
  Lista.Itemindex:=strtoint(NumPersona.Text)-1;
end;

procedure TAlquilar_y_devolver.ListaDblClick(Sender: TObject);
begin
  Lista.Itemindex:=strtoint(NumPersona.Text)-1;
end;


procedure TAlquilar_y_devolver.VerHistorial1Click(Sender: TObject);
var
  X:Array[1..2] of Boolean;
begin
  If Edit1.Caption <> '' then
    Begin
      Try
        Begin
          X[1]:=Datos.Clientes.Active;
          X[2]:=Datos.Videos.Active;
          Ultima_Cliente:='Alquilar y Devolver';
          Desde_Principal:=False;
          Datos.Videos.Open;
          Historial_Cliente:=THistorial_Cliente.Create(Self);
          Historial_Cliente.MaskEdit1.Text:=MaskEdit1.Text;
          Historial_Cliente.Showmodal;
        end
      Finally
        Begin
          Historial_Cliente.Free;
          Historial_Cliente:=Nil;
          Datos.Clientes.Active:=X[1];
          Datos.Videos.Active:=X[2];
        end;
      end;
    end;
end;

procedure TAlquilar_y_devolver.ConsultarDatos1Click(Sender: TObject);
var
  X:Array[1..6] of Boolean;
begin
  If Edit1.Caption <> '' then
    Begin
      Try
        Begin
          X[1]:=Datos.Clientes.Active;
          X[2]:=Datos.Videos.Active;
          X[3]:=Datos.Cheques.Active;
          X[4]:=Datos.Tarjetas.Active;
          X[5]:=Datos.Mayores.Active;
          X[6]:=Datos.Menores.Active;
          Ultima_Cliente:='Alquilar y Devolver';
          Desde_Principal:=False;
  //        Datos.Base.Connected:=True;
          Datos.Clientes.Open;
          Datos.Videos.Open;
          Datos.Cheques.Open;
          Datos.Tarjetas.Open;
          Datos.Mayores.Open;
          Datos.Menores.Open;
          Consultar_Cliente:=TConsultar_Cliente.Create(Self);
          Consultar_Cliente.MaskEdit3.Text:=MaskEdit1.Text;
          Consultar_Cliente.ShowModal;
        End;
      Finally
        Begin
//          Datos.Base.Connected:=False;
          Datos.Clientes.Active:=X[1];
          Datos.Videos.Active:=X[2];
          Datos.Cheques.Active:=X[3];
          Datos.Tarjetas.Active:=X[4];
          Datos.Mayores.Active:=X[5];
          Datos.Menores.Active:=X[6];
          Consultar_Cliente.Free;
          Consultar_Cliente:=Nil;
        end;
      end;
    end;
end;

procedure TAlquilar_y_devolver.RebDeuAlqBtnClick(Sender: TObject);
begin
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Autorizacion:=TAutorizacion.Create(Self);
      Autorizacion.Showmodal;
      If Autorizacion.Modalresult = MrOK then
         Begin
           If Datos.TablaAccesos.Fieldbyname('63').AsBoolean = True Then
             Begin
               Try
                 Begin
                   Datos.Videos.Disablecontrols;
                   Datos.Transacciones.Open;
                   Rebajar_Alquiler_Atrasado:=TRebajar_Alquiler_Atrasado.Create(Self);
                   Rebajar_Alquiler_Atrasado.Label4.Caption:=Usuario.Cedula;
                   Rebajar_Alquiler_Atrasado.Label5.Caption:=Autorizacion.Label3.Caption;                   
                   Rebajar_Alquiler_Atrasado.Edit1.Text:=MaskEdit1.Text;
                   Rebajar_Alquiler_Atrasado.Showmodal;
                 end
               Finally
                 Begin
                   Datos.Videos.Refresh;
//                   Datos.Transacciones.Close;
                   Datos.Videos.Cancelrange;
                   Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
                   Datos.Videos.setrange([Maskedit1.text]
                                        ,[Maskedit1.text]);
                   Datos.Videos.Refresh;
                   Datos.Videos.First;
                   Label9.caption:=inttostr(Datos.Videos.Recordcount);
                   Datos.Videos.EnableControls;
                   Rebajar_Alquiler_Atrasado.Free;
                   Rebajar_Alquiler_Atrasado:=NIL;
                 end;
               end;
             end
           else
             Begin
               Try
                 Begin
                   Datos.Videos.Disablecontrols;
                   Datos.Transacciones.Open;
                   Pagar_Alquiler_Atrasado:=TPagar_Alquiler_Atrasado.Create(Self);
                   Pagar_Alquiler_Atrasado.Label4.Caption:=Usuario.Cedula;
                   Pagar_Alquiler_Atrasado.Edit1.Text:=MaskEdit1.Text;
                   Pagar_Alquiler_Atrasado.Showmodal;
                 end
               Finally
                 Begin
                   Datos.Videos.Refresh;
                   Datos.Videos.Cancelrange;
                   Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
                   Datos.Videos.setrange([Maskedit1.text]
                                        ,[Maskedit1.text]);
                   Datos.Videos.Refresh;
                   Datos.Videos.First;
                   Label9.caption:=inttostr(Datos.Videos.Recordcount);
                   Datos.Videos.EnableControls;
                   Pagar_Alquiler_Atrasado.Free;
                   Pagar_Alquiler_Atrasado:=NIL;
                 end;
               end;
             end;
           Verificar_Limites;  
         end;
    end
  Finally
    Begin
      Autorizacion.Free;
      Autorizacion:=Nil;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TAlquilar_y_devolver.RebDeuMulBtnClick(Sender: TObject);
begin   // 64
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Autorizacion:=TAutorizacion.Create(Self);
      Autorizacion.Showmodal;
      If Autorizacion.Modalresult = MrOK then
         Begin
           If Datos.TablaAccesos.Fieldbyname('64').AsBoolean = True Then
             Begin
               Try                   //  Acomodar Esta Ventana
                 Begin
                   Datos.Videos.Disablecontrols;
                   Datos.Transacciones.Open;
                   Rebajar_Multa_Atrasada:=TRebajar_Multa_Atrasada.Create(Self);
                   Rebajar_Multa_Atrasada.Label4.Caption:=Usuario.Cedula;
                   Rebajar_Multa_Atrasada.Label5.Caption:=Autorizacion.Label3.Caption;
                   Rebajar_Multa_Atrasada.Edit1.Text:=MaskEdit1.Text;
                   Rebajar_Multa_Atrasada.Showmodal;
                 end
               Finally
                 Begin
                   Datos.Videos.Refresh;
//                   Datos.Transacciones.Close;
                   Datos.Videos.Cancelrange;
                   Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
                   Datos.Videos.setrange([Maskedit1.text]
                                        ,[Maskedit1.text]);
                   Datos.Videos.Refresh;
                   Datos.Videos.First;
                   Label9.caption:=inttostr(Datos.Videos.Recordcount);
                   Datos.Videos.EnableControls;
                   Rebajar_Multa_Atrasada.Free;
                   Rebajar_Multa_Atrasada:=NIL;
                 end;
               end;
             end
           else
             Begin
               Try
                 Begin
                   Datos.Videos.Disablecontrols;
                   Datos.Transacciones.Open;
                   Pagar_Multa_Atrasada:=TPagar_Multa_Atrasada.Create(Self);
                   Pagar_Multa_Atrasada.Label4.Caption:=Usuario.Cedula;
                   Pagar_Multa_Atrasada.Edit1.Text:=MaskEdit1.Text;
                   Pagar_Multa_Atrasada.Showmodal;
                 end
               Finally
                 Begin
                   Datos.Videos.Refresh;
                   Datos.Videos.Cancelrange;
//                   Datos.Transacciones.Close;
                   Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
                   Datos.Videos.setrange([Maskedit1.text]
                                        ,[Maskedit1.text]);
                   Datos.Videos.Refresh;
                   Datos.Videos.First;
                   Label9.caption:=inttostr(Datos.Videos.Recordcount);
                   Datos.Videos.EnableControls;
                   Pagar_Multa_Atrasada.Free;
                   Pagar_Multa_Atrasada:=NIL;
                 end;
               end;
             end;
           Verificar_Limites;
         end;
    end
  Finally
    Begin
      Autorizacion.Free;
      Autorizacion:=Nil;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TAlquilar_y_devolver.RebAlqBtnClick(Sender: TObject);
begin
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Autorizacion:=TAutorizacion.Create(Self);
      Autorizacion.Showmodal;
      If Autorizacion.Modalresult = MrOK then
         Begin
           If Datos.TablaAccesos.Fieldbyname('62').AsBoolean = True Then
             Begin
               Autoriza_Alquiler:=Datos.TablaUsuarios.Fieldbyname('Cedula').AsString;
               DescuentoEdit.Readonly:=False;
               DescuentoEdit.Setfocus;
             end
           else
             Begin
               messagedlg('Usted no está autorizado para hacer Rebajas '
               +'en los Alquileres; contacte con algún supervisor o chequee '
               +'sus privilegios de acceso en el sistema....',mterror,[mbok],0);
               DescuentoEdit.Readonly:=True;
               SubEdit.Setfocus;
             end;
         end;
    end
  Finally
    Begin
      Autorizacion.Free;
      Autorizacion:=Nil;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TAlquilar_y_devolver.DescuentoEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  Try
    Begin
      IF Key = #13 then
        Begin
          IF StrToFloat(DescuentoEdit.Text) > StrToFloat(ActualEdit.Text) then
            Begin
              Raise Mucho_Descuento.Create(' ');
            end
          else
            Begin
              DescuentoEdit.Readonly:=True;
              SubEdit.Text:=Floattostr(strtoFloat(ActualEdit.Text) - strtofloat(DescuentoEdit.Text));
              SubEdit.SetFocus;
            end;
        end;
      If Key = #27 then
        Begin
          DescuentoEdit.Text:='0';
          DescuentoEdit.Readonly:=True;
          ActualEdit.text:='0';
          Todos_Los_Videos.Cancel;
          Edit2.Enabled:=True;
          SubEdit.Text:='0';
          Edit2.SetFocus;
        end;
    end
  except
    On Mucho_Descuento do
      Begin
        Showmessage('El Valor Del Descuento no puede ser mayor que el valor del Alquiler.');
        DescuentoEdit.Text:='0';
        DescuentoEdit.SetFocus;
      end;
    On EConvertError do
      Begin
        Showmessage('Existe un Error en el Monto del descuento de alquiler, (no es un número entero válido).');
        DescuentoEdit.Text:='0';
        DescuentoEdit.SetFocus;
      end;
  end;
end;

procedure TAlquilar_y_devolver.SubEditKeyPress(Sender: TObject;
  var Key: Char);
var
  cont:integer;
  Find:Boolean;
begin
  Try
    Begin
      IF ((MaskEdit2.Text = '') or (Edit3.Text='')) then
        Begin
          Raise No_Seleccion.Create(' ');
        end;
      IF Key = #13 then
        Begin
          Total_Ingreso_Video:=strtoFloat(SubEdit.Text);
          Domingos:=0;
          If Datos.TablaMiscelaneos.Fieldbyname('Contar_Domingos').AsBoolean = True Then
            Begin
              For cont:=1 to strtoint(Edit2.Text) do
                Begin
                  If DayofWeek(StrToDate(Principal.Fecha_Total)+cont) = 1 then
                    Begin
                      Domingos:=Domingos+1;
                    end;
                end;
            end;

          Todos_Los_Videos.indexname:='';
          Todos_Los_Videos.setkey;
          Todos_Los_Videos.fieldbyname('Codigo_Video').asstring:=Codigo_a_Buscar;
          Todos_Los_Videos.gotokey;
          Todos_Los_Videos.Edit;
          Todos_Los_Videos.fieldbyname('Codigo_Cliente').asstring:=MaskEdit1.Text;
          Todos_Los_Videos.fieldbyname('Fecha_Alquiler').asstring:=Principal.Fecha_Total;
          Todos_Los_Videos.fieldbyname('Dias_Alquiler').asstring:=Edit2.Text;
          Todos_Los_Videos.fieldbyname('Multado').asboolean:=False;
          Todos_Los_Videos.fieldbyname('Video_Alquilado').asboolean:=True;
          Todos_Los_Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
          Todos_Los_Videos.fieldbyname('Cliente_Autorizado').asstring:=NumPersona.Text;
          Todos_Los_Videos.fieldbyname('Fecha_Entrega').asstring:=
               Datetostr(strtodate(Todos_Los_Videos.fieldbyname('Fecha_Alquiler').asstring)+
               (strtoint(Edit2.Text)+Domingos));
          Confirmar:=TConfirmar.Create(Self);
          Confirmar.BitBtn1.Hint:='El Cliente paga el alquiler.';
          Confirmar.BitBtn2.Hint:='El Cliente pagará después.';
          Confirmar.Label1.caption:='Se Paga Ahora ?.';
          Confirmar.Caption:='C o n f i r m a r .';
          Confirmar.showmodal;
          If Confirmar.modalresult = mrok then
            begin        //Si se Paga Ahora
              Accion_Ejecutada:=True;
              If ((Label34.Visible = True) AND (Label35.Visible =True)) Then
                Begin
                  If Cuenta_promo >= 2 Then
                      Cuenta_Promo:=0
                  else
                      Cuenta_Promo:=Cuenta_Promo+1;
                end;

              Todos_Los_Videos.fieldbyname('Ingresos_Por_Alquiler').asCurrency:=
              Todos_Los_Videos.fieldbyname('Ingresos_Por_Alquiler').asCurrency+
                                       Total_Ingreso_Video;
              Todos_Los_Videos.fieldbyname('Ingresos_del_Video').asCurrency:=
              Todos_Los_Videos.fieldbyname('Ingresos_del_Video').asCurrency+
                                       Total_Ingreso_Video;
              Todos_Los_Videos.fieldbyname('Veces_de_Alquiler').asCurrency:=
              Todos_Los_Videos.fieldbyname('Veces_de_Alquiler').asCurrency+1;
              Todos_Los_Videos.Post;
              Todos_Los_Videos.FlushBuffers;

              Datos.Transacciones.Edit;
              Datos.Transacciones.Append;
              Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
              Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
              Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
              Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
              Datos.Transacciones.Fieldbyname('Alquiler').AsCurrency:=Total_Ingreso_Video;
              Datos.Transacciones.Fieldbyname('Rebaja_Alquiler').AsCurrency:=StrToFloat(DescuentoEdit.Text);
              Datos.Transacciones.Fieldbyname('Autoriza_Alquiler').AsString:=Autoriza_Alquiler;
              Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
              Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit1.Text;
              Datos.Transacciones.Post;
              
              //Actualización del Nuevo Ingreso por Alquileres
              Datos.Alquileres.Indexname:='';
              Datos.Alquileres.Setkey;
              Datos.Alquileres.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
              If (Datos.Alquileres.Gotokey = True) then
                Begin
                  Datos.Alquileres.Edit;
                  Datos.Alquileres.Fieldbyname('Cantidad').asCurrency:=
                    Datos.Alquileres.Fieldbyname('Cantidad').asCurrency
                    + Total_Ingreso_Video;
                  Datos.Alquileres.Post;
                  Datos.Alquileres.FlushBuffers;
                end
              else
                Begin
                  Datos.Alquileres.Last;
                  Datos.Alquileres.Insert;
                  Datos.Alquileres.Fieldbyname('Fecha').Asstring:=Principal.Fecha_Total;
                  Datos.Alquileres.Fieldbyname('Cantidad').asCurrency:= Total_Ingreso_Video;
                  Datos.Alquileres.Post;
                  Datos.Alquileres.FlushBuffers;
                end;

              //Actualización de la Base de Ingresos, Multas y Valores TOTALES por
              //título (Sin importar el ejemplar).
              Datos.Total.indexname:='';
              Datos.Total.Setkey;
              Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
              IF Datos.Total.GotoKey = True then
                Begin
                  Datos.Total.Edit;
                  Datos.Total.Fieldbyname('Alquiler_Total').asCurrency:=
                         Datos.Total.Fieldbyname('Alquiler_Total').asCurrency +
                         Total_Ingreso_Video;
                  Datos.Total.Fieldbyname('Ingreso_Total').asCurrency:=
                  Datos.Total.Fieldbyname('Alquiler_Total').asCurrency +
                  Datos.Total.Fieldbyname('Multa_Total').asCurrency;
                  Datos.Total.Fieldbyname('Veces_de_Alquiler_Total').Asinteger:=
                  Datos.Total.Fieldbyname('Veces_de_Alquiler_Total').Asinteger + 1;
                  Datos.Total.Post;
                  Datos.Total.FlushBuffers;

                  //Actualización de la Base de Usuarios, para ponerle cuánto ha gastado
                  //en Alquileres y Multas.
                  Datos.Clientes.indexname:='';
                  Datos.Clientes.Setkey;
                  Datos.Clientes.FieldByName('Codigo_Cliente').Asstring:=MaskEdit1.Text;
                  IF Datos.Clientes.GotoKey = True then
                    Begin
                      Datos.Clientes.Edit;
                      Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').asCurrency:=
                      Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').asCurrency+
                      Total_Ingreso_Video;
                      Datos.Clientes.Post;
                      Datos.Clientes.FlushBuffers;
                    end;
                  Label18.Caption:=FormatFloat('###0.00',StrToFloat(Label18.Caption) + Total_Ingreso_Video)
                end;
            end
          else           //Si no se esta pagando
            Begin
              If ((Label34.Visible = True) AND (Label35.Visible =True)) Then
                Begin
                  If Cuenta_promo >= 2 Then
                      Cuenta_Promo:=0
                  else
                      Cuenta_Promo:=Cuenta_Promo+1;
                end;
              Todos_Los_Videos.fieldbyname('Veces_de_Alquiler').asinteger:=
              Todos_Los_Videos.fieldbyname('Veces_de_Alquiler').asinteger+1;
              Todos_Los_Videos.fieldbyname('Debe_Alquileres').asCurrency:=
                                           Todos_Los_Videos.fieldbyname('Debe_Alquileres').asCurrency +
                                           Total_Ingreso_Video;
              Todos_Los_Videos.Post;
              Todos_Los_Videos.FlushBuffers;
              //Actualización de la base de Datos.Clientes
              Datos.Clientes.indexname:='';
              Datos.Clientes.Setkey;
              Datos.Clientes.FieldByName('Codigo_Cliente').Asstring:=MaskEdit1.Text;
              IF Datos.Clientes.GotoKey = True then
                Begin
                  Datos.Clientes.Edit;
                  Datos.Clientes.Fieldbyname('Debe_Alquileres').asCurrency:=
                  Datos.Clientes.Fieldbyname('Debe_Alquileres').asCurrency+
                  Total_Ingreso_Video;
                  Datos.Clientes.Post;
                  Datos.Clientes.FlushBuffers;
                end;

              // Se actualizan las transacciones
              Datos.Transacciones.Edit;
              Datos.Transacciones.Append;
              Datos.Transacciones.Fieldbyname('Rebaja_Alquiler').AsCurrency:=StrToFloat(DescuentoEdit.Text);
              Datos.Transacciones.Fieldbyname('Autoriza_Alquiler').AsString:=Autoriza_Alquiler;
              Datos.Transacciones.Fieldbyname('Operador').AsString:=Usuario.Cedula;
              Datos.Transacciones.Fieldbyname('Fecha').AsString:=Principal.Fecha_Total;
              Datos.Transacciones.Fieldbyname('Hora').AsDateTime:=Time;
              Datos.Transacciones.Fieldbyname('Estacion').AsString:=Nombre_Computador;
              Datos.Transacciones.Fieldbyname('Marca').AsString:='A';
              Datos.Transacciones.Fieldbyname('Codigo_Cliente').AsString:=MaskEdit1.Text;
              Datos.Transacciones.Post;

              //Actualización de la base de Debe
              Datos.Debe.Refresh;
              Datos.Debe.last;
              Datos.Debe.insert;
              Datos.Debe.fieldbyname('Codigo_Cliente').asstring:=MaskEdit1.Text;
              Datos.Debe.fieldbyname('Codigo_Video').asstring:=MaskEdit2.Text;
              Datos.Debe.fieldbyname('Titulo_Video').asstring:=Edit3.Text;
              Datos.Debe.fieldbyname('Tipo').asstring:='A';
              Datos.Debe.fieldbyname('Persona_que_lo_alquilo').asstring:=
                               Lista.Items[strtoint(NumPersona.Text)-1];
              Datos.Debe.fieldbyname('Dias').asinteger:=strtoint(Edit2.Text);
              Datos.Debe.fieldbyname('Monto').asCurrency:=Total_Ingreso_Video;
              Datos.Debe.fieldbyname('Fecha').asstring:=Principal.Fecha_Total;
              Datos.Debe.fieldbyname('Fecha_Devolucion').asstring:=
              Datetostr(strtodate(Todos_Los_Videos.fieldbyname('Fecha_Alquiler').asstring)+
               (strtoint(Edit2.Text)+Domingos));
              Datos.Debe.Post;
              Datos.Debe.FlushBuffers;

              //Actualización de la Base Totales
              Desglozar:=MaskEdit2.Text;
              Codigo_Video_a_Buscar:='';
              Codigo_Video_a_Buscar:=Desglozar[1]+Desglozar[2]+
                                     Desglozar[3]+Desglozar[4];
              Datos.Total.indexname:='';
              Datos.Total.Setkey;
              Datos.Total.FieldByName('Codigo_Video').Asstring:=Codigo_Video_a_Buscar;
                IF Datos.Total.GotoKey = True then
                  Begin
                    Datos.Total.Edit;
                    Datos.Total.Fieldbyname('Debe_Alquileres').asCurrency:=
                    Datos.Total.Fieldbyname('Debe_Alquileres').asCurrency +
                    Total_Ingreso_Video;
                    Datos.Total.Fieldbyname('Veces_de_Alquiler_Total').Asinteger:=
                    Datos.Total.Fieldbyname('Veces_de_Alquiler_Total').Asinteger + 1;
                    Datos.Total.Post;
                    Datos.Total.FlushBuffers;
                  end;
              Label6.Caption:=FormatFloat('###0.00',StrToFloat(Label6.Caption) + Total_Ingreso_Video);
            end;

//Actualización de la Base Datos.Historia (La que dice cual película vió y
//                                    cual no).
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
          LabelTotal.Caption:=FormatFloat('###0.00',StrToFloat(Label28.Caption) + StrToFloat(Label18.Caption)+
                                    StrToFloat(Label27.Caption) + StrToFloat(Label30.Caption));
          Datos.Videos.Refresh;
          Datos.Videos.Cancelrange;
          Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
          Datos.Videos.setrange([Maskedit1.text]
                      ,[Maskedit1.text]);

          Verificar_Limites;
//Suma un dia a una fecha:  Edit2.Text:=Datetostr(strtodate(Edit1.Text)+1);

          Datos.Registro.Last;
          Datos.Registro.Insert;
          Datos.Registro.FieldByName('Codigo_Cliente').Asstring:=MaskEdit1.Text;
          Datos.Registro.FieldByName('Codigo_Video').Asstring:=MaskEdit2.Text;
          Datos.Registro.FieldByName('Fecha_Salida').Asstring:=Principal.Fecha_Total;
          Datos.Registro.FieldByName('Fecha_Entrada').Asstring:=Datetostr(strtodate(Todos_Los_Videos.fieldbyname('Fecha_Alquiler').asstring)+
                                                                (strtoint(Edit2.Text)+Domingos));
          Datos.Registro.FieldByName('Costo').asCurrency:=Total_Ingreso_Video;
          Datos.Registro.Post;
          Datos.Registro.FlushBuffers;

          Datos.Videos.Refresh;
          Datos.Videos.First;
          Label9.caption:=inttostr(Datos.Videos.Recordcount);
          Edit3.Text:='';
          Edit2.Text:=Inttostr(Datos.TablaMiscelaneos.Fieldbyname('Dias_Alquiler').AsInteger);
          Label13.Caption:='';
          Edit2.Enabled:=False;
          ActualEdit.Text:='0';
          Autoriza_Alquiler:='';
          DescuentoEdit.Readonly:=True;
          DescuentoEdit.Text:='0';
          SubEdit.Text:='0';
          MaskEdit2.Text:='';
          MaskEdit2.Setfocus;
          Datos.Clientes.Edit;
          Datos.Clientes.FieldByName('Tiene_Pelicula').asboolean:=True;
          Datos.Clientes.Post;
          Datos.Clientes.FlushBuffers;
          Confirmar.Free;
          Confirmar:=Nil;
          Key:=#3;
         end;
        end;
      If Key = #27 then
        Begin
          DescuentoEdit.Text:='0';
          DescuentoEdit.Readonly:=True;
          ActualEdit.text:='0';
          Todos_Los_Videos.Cancel;
          Edit2.Enabled:=True;
          SubEdit.Text:='0';
          Autoriza_Alquiler:='';
          Edit2.SetFocus;
    end
  except
    On EConvertError do
      Begin
        Showmessage('Existe un Error en el Monto del descuento de alquiler, (no es un número entero válido).');
        DescuentoEdit.Text:='0';
        DescuentoEdit.SetFocus;
      end;
    On No_Seleccion do
      Begin
        Showmessage('No se ha ingresado el código de Ningún Video');
        MaskEdit2.Enabled:=True;
        Autoriza_alquiler:='';
        MaskEdit2.Setfocus;
      end;
  end;
end;
procedure TAlquilar_y_devolver.DescuentoEditExit(Sender: TObject);
begin
  Try
    Begin
      IF strtoFloat(DescuentoEdit.Text) > strtoFloat(ActualEdit.Text) then
        Begin
          Raise Mucho_Descuento.Create(' ');
        end
      else
        Begin
          SubEdit.Text:=Floattostr(strtoFloat(ActualEdit.Text) - strtoFloat(DescuentoEdit.Text));
          DescuentoEdit.Readonly:=True;
        end;
    end
  except
    On Mucho_Descuento do
      Begin
        Showmessage('El Valor Del Descuento no puede ser mayor que el valor del Alquiler.');
        DescuentoEdit.Readonly:=False;
        DescuentoEdit.Text:='0';
        DescuentoEdit.SetFocus;
      end;
    On EConvertError do
      Begin
        Showmessage('Existe un Error en el Monto del descuento de alquiler, (no es un número entero válido).');
        DescuentoEdit.Text:='0';
        DescuentoEdit.Readonly:=False;
        DescuentoEdit.SetFocus;
      end;
  end;
end;



procedure TAlquilar_y_devolver.Historial1Click(Sender: TObject);
begin
  If MaskEdit2.Text <> '    -   ' then
    Begin
      Try
        Begin
          Ultima_Video:='Alquilar y Devolver';
          Desde_Principal:=False;
          Datos.Videos.DisableControls;
          Datos.Clientes.DisableControls;
          Historial_Videos:=THistorial_Videos.Create(Self);
          Historial_Videos.MaskEdit2.Text:=MaskEdit2.Text;
          Historial_Videos.Showmodal;
        end
      Finally
        Begin
          Historial_Videos.Free;
          Historial_Videos:=Nil;
          Datos.Videos.EnableControls;
          Datos.Clientes.EnableControls;
        end;
      end;
    end;
end;

procedure TAlquilar_y_devolver.Datos1Click(Sender: TObject);
begin
  If MaskEdit2.Text <> '    -   ' then
    Begin
      Try
        Begin
          Datos.Videos.DisableControls;
          Desde_Principal:=False;
          Ultima_Video:='Alquilar y Devolver';
          Consultar_Video:=TConsultar_Video.Create(Self);
          Consultar_video.MaskEdit1.Text:=MaskEdit2.Text;
          Consultar_Video.Showmodal;
        end
      Finally
        Begin
          Datos.Videos.EnableControls;
          Consultar_Video.Free;
          Consultar_Video:=Nil;
        end;
      end;
    end;
end;

procedure TAlquilar_y_devolver.ListadodeVideos1Click(Sender: TObject);
begin
  If MaskEdit2.Text = '    -   ' then
    Begin
      Try
        Begin
          Ultima_Video:='Alquilar y Devolver';
          Desde_Principal:=False;
          Lista_Videos:=TLista_Videos.Create(Self);
          Lista_Videos.showmodal;
        end
      Finally
        Begin
          Lista_Videos.Free;
          Lista_Videos:=Nil;
        end;
      end;
    end;
end;

procedure TAlquilar_y_devolver.ListadodeClientes1Click(Sender: TObject);
begin
  If Edit1.Caption = '' then
    Begin
      Try
        Begin
//          Datos.Videos.DisableControls;
          Ultima_Cliente:='Alquilar y Devolver';
          Desde_Principal:=False;
          Lista_Clientes:=TLista_Clientes.Create(Self);
          Lista_Clientes.Query1.Open;
          Lista_Clientes.showmodal;
        end
      Finally
        Lista_Clientes.Query1.Close;
        Lista_Clientes.Free;
        Lista_Clientes:=Nil;
//        Datos.Videos.EnableControls;
      end;
    end;
end;

procedure TAlquilar_y_devolver.DevolverClick(Sender: TObject);
begin
{
  Datos.Videos.Active:=True;
  Datos.Videos.Refresh;
  Datos.Videos.First;
  While ((Not Datos.Videos.EOF) OR (Dbgrid1.SelectedRows.Count > 0)) do
    Begin
      If Dbgrid1.SelectedRows.CurrentRowSelected = True Then
        Begin
          Dbgrid1.SelectedRows.CurrentRowSelected := False;
          Maskedit2.Text:=Datos.Videos.Fieldbyname('COdigo_Video').Asstring;
          Ejecutar;
        end;
      If ((Datos.Videos.EOF = True) AND (Dbgrid1.SelectedRows.Count > 0)) Then
        Begin
          Datos.Videos.First;
        end
      else
        Datos.Videos.Next;
    end;
}end;

procedure TAlquilar_y_devolver.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_F4) then
   Begin
     If Edit1.Caption <> '' Then
       Begin
         Try
           Begin
             Control_Observaciones:=TControl_Observaciones.Create(Self);
             Control_Observaciones.ABuscar.Caption:=MaskEdit1.Text;
             Control_Observaciones.Showmodal;
             Observaciones.Clear;
             Observaciones.Lines.Add(Datos.Clientes.Fieldbyname('Observaciones').Asstring);
           end
         Finally
           Begin
             Control_Observaciones.Free;
             Control_Observaciones:=Nil;
           end;
         end;
       end
     else
       Showmessage('Debe seleccionar primero a algún Cliente');
   end;
 if ((Shift = [ssctrl]) and (Key = VK_RETURN)) then
    Begin
      Datos.Videos.Active:=True;
      Datos.Videos.Refresh;
      Datos.Videos.First;
      While ((Not Datos.Videos.EOF) OR (Dbgrid1.SelectedRows.Count > 0)) do
        Begin
          If Dbgrid1.SelectedRows.CurrentRowSelected = True Then
            Begin
              Dbgrid1.SelectedRows.CurrentRowSelected := False;
              Maskedit2.Text:=Datos.Videos.Fieldbyname('COdigo_Video').Asstring;
              Ejecutar;
            end;
          If ((Datos.Videos.EOF = True) AND (Dbgrid1.SelectedRows.Count > 0)) Then
            Begin
              Datos.Videos.First;
            end
          else
            Datos.Videos.Next;
    end;
{      If Devolver = True Then
        BEgin
          Datos.Videos.Active:=True;
          Datos.Videos.Refresh;
          Datos.Videos.First;
           While ((Not Datos.Videos.EOF) AND (Dbgrid1.SelectedRows.Count > 0)) do
             Begin
               If Dbgrid1.SelectedRows.CurrentRowSelected = True Then
                 Begin
                   Maskedit2.Text:=Datos.Videos.Fieldbyname('Codigo_Video').Asstring;
                   Ejecutar;
                   If ((Datos.Videos.EOF = True) AND (Dbgrid1.SelectedRows.Count > 0)) Then
                     Begin
                       Datos.Videos.First;
                     end;
                   Dbgrid1.SelectedRows.CurrentRowSelected := False;
                 end
               else
                 Datos.Videos.Next;
             end;
        end;
}    end;
end;

procedure TAlquilar_y_devolver.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #32 Then
      Dbgrid1.SelectedRows.CurrentRowSelected:= NOT Dbgrid1.SelectedRows.CurrentRowSelected;
end;

procedure TAlquilar_y_devolver.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If (Accion_Ejecutada = True) Then
    Begin
      If (Usuario.Imprime_Factura = True) Then
        Begin
          Imprimir_Factura;
        end;
      // Inclusive si no se imprime la factura, el registro debe quedar
      Guardar_Factura;
    end;
  Todos_los_Videos.Close;
end;

procedure TAlquilar_y_devolver.DBGrid1DblClick(Sender: TObject);
begin
  Dbgrid1.SelectedRows.CurrentRowSelected:= NOT Dbgrid1.SelectedRows.CurrentRowSelected;
end;

procedure TAlquilar_y_devolver.AutorizaAlquilerBtnClick(Sender: TObject);
begin
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Autorizacion:=TAutorizacion.Create(Self);
      Autorizacion.Showmodal;
      If Autorizacion.Modalresult = MrOK then
         Begin
           If Datos.TablaAccesos.Fieldbyname('67').AsBoolean = True Then
             Begin
               Autoriza_Mas_Peliculas:=Datos.TablaUsuarios.Fieldbyname('Cedula').AsString;
               MaskEdit2.Readonly:=False;
               MaskEdit2.Setfocus;
             end
           else
             Begin
               messagedlg('Ud. no tiene permiso para autorizar a los clientes '
                         +'a realizar alquileres cuando el mismo posee demasiada '
                         +'deuda o cuando el límites de películas establecido ha '
                         +'sido excedido',mterror,[mbok],0);
               MaskEdit2.Readonly:=True;
               MaskEdit2.Setfocus;
             end;
         end;
    end
  Finally
    Begin
      Autorizacion.Free;
      Autorizacion:=Nil;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TAlquilar_y_devolver.BitBtn1Click(Sender: TObject);
begin
  Try
    Begin
      Mostrar_Seleccion:=TMostrar_Seleccion.Create(Self);
      Mostrar_Seleccion.ShowModal;
    end
  Finally
    Mostrar_Seleccion:=Nil;
    Mostrar_Seleccion.Free;
  end;
end;

end.

