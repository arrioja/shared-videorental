unit uAlquilar_y_devolver;

interface
//                   Colocar a esta ventana unos botones que le permitan
//                   al cliente ver su historial de alquiler,
//                   las películas que posee actualmente la justificación
//                   de las deudas ya sea de alquiler o de adicionales
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DB, DBTables, Grids, DBGrids, Menus, ExtCtrls,
  Calendar, Numedit, Hemibtn, RXDBCtrl, MPlayer, Refresh, RXClock, RxGIF,
  Animate, GIFCtrl, ComCtrls, ALabel, Torrybtn, Counter, GradBtn, marquee,
  jpeg;

type
  Mal_Dia               = class (Exception);
  Mucho_Descuento       = Class(Exception);
  No_Seleccion          = Class(Exception);

  TAlquilar_y_devolver  = class(TForm)
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Bevel6: TBevel;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    LabelTotal: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel11: TBevel;
    MenuVacio: TPopupMenu;
    Todos_Los_Videos: TSelfRefreshTable;
    RxClock1: TRxClock;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Vence_TC: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    Image2: TImage;
    Label8: TLabel;
    Label10: TLabel;
    Panel6: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    ALabel1: TALabel;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Counter2: TCounter;
    Label9: TLabel;
    TorryButton1: TTorryButton;
    Bevel10: TBevel;
    Label4: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    CUMP: TRxGIFAnimator;
    RxGIFAnimator2: TRxGIFAnimator;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Label12: TLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    BitBtn1: TBitBtn;
    GradBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure Verificar_Limites;
    procedure TorryButton1Click(Sender: TObject);
    procedure GradBtn1Click(Sender: TObject);
    procedure GradBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    Accion_Ejecutada:Boolean;
    { Public declarations }
  end;

var
  Alquilar_y_devolver: TAlquilar_y_devolver;
  Total_de_Multa:Integer;
  Devolver:Boolean;
  Cuenta_Promo:Short;
  Codigo_a_Buscar:string;
  Domingos:integer;  //Cuenta el número de domingos que hay de una fecha a otra
  Visto:Boolean;     //Indica si el video ha sido visto con anterioridad o no
  Codigo_Video_a_Buscar:string[4];
  Desglozar:string[8];
  Debe_Por_Multa_Pasada,
  Debe_Por_Alquiler_Pasado:integer;
  Total_Ingreso_Video:integer;
  Total_Multa_Video:integer;
  Autoriza_Mas_Peliculas,Autoriza_Alquiler:String; // Identificación de los
                                                   // supervisores que han
                                                   // autorizado algun exceso
                                                   // en alquiler y/o alguna
                                                   // excepción en los mismos.


implementation

uses Uprincipal, uconfirmar,
//     URebajar_deuda_Alquiler_Atrasado,
//     URebajar_deuda_Multa_Atrasada,
//     UPedir_Clave,
     MODULO_DE_DATOS, UMostrar_Seleccion, UPrimera_Entrada;
//     UHistorial_Videos,
//     UConsultar_Video,
//     ULista_Videos,
//     Ulista_clientes,
//     UControl_Observaciones,
//     UAutorizacion,
 //    UPagar_Multa_Atrasada,
//     UPagar_Alquiler_Atrasado,
//     UEsperar;

{$R *.DFM}
Function Nombre_Computador : String; Far; External 'Control.dll';


Procedure TAlquilar_y_devolver.Verificar_Limites;
Begin
  If ((StrToInt(Label6.Caption)+StrToInt(Label24.Caption)) >= (Datos.Clientes.fieldbyname('Maximo_Deuda').AsCurrency)) Then
    Begin
      RxGifAnimator2.Animate:=True;
      RxGifAnimator2.Visible:=True;
//      GradBtn1.BeginColor:=ClGray;
//      GradBtn1.EndColor:=ClSilver;
//      GradBtn1.Cursor:=CrNo;
//      GradBtn1.Enabled:=False;
      TorryButton1.Enabled:=False;
      TorryButton1.Cursor:=CrNo;
      TorryButton1.Hint:='NO DISPONIBLE MIENTRAS TENGA MUCHA DEUDA O MUCHAS PELICULAS SIN DEVOLVER';
      Memo1.Lines.Add('UD. ha excedido el límite permitido para las deudas.');
    end
  else
    Begin
      RxGifAnimator2.Animate:=False;
      RxGifAnimator2.Visible:=False;
//      GradBtn1.BeginColor:=ClNavy;
//      GradBtn1.EndColor:=ClAqua;
//      GradBtn1.Cursor:=CrHandPoint;
//      GradBtn1.Enabled:=True;
      TorryButton1.Enabled:=True;
      TorryButton1.Cursor:=crDefault;
      TorryButton1.Hint:='';
    end;
  Try
    Begin
      If (Vence_TC.Caption <> '') Then
        Begin
          If ((StrToDate(Vence_TC.Caption) < Date)) Then
            Begin
              Alabel1.Visible:=True;
              RxGifAnimator2.Animate:=True;
              RxGifAnimator2.Visible:=True;
//              GradBtn1.BeginColor:=ClGray;
//              GradBtn1.EndColor:=ClSilver;
//              GradBtn1.Cursor:=CrNo;
//              GradBtn1.Enabled:=False;
              TorryButton1.Enabled:=False;
              TorryButton1.Cursor:=CrNo;
              TorryButton1.Hint:='NO DISPONIBLE MIENTRAS SU TARJETA DE CREDITO ESTE VENCIDA';
              Memo1.Lines.Add('Su Tarjeta de Crédito está vencida, Actualice sus datos.');
            end
          end;
        end;

  Except
    On EConvertError do
      Begin
        Alabel1.Visible:=False;
        RxGifAnimator2.Animate:=True;
        RxGifAnimator2.Visible:=True;
        TorryButton1.Enabled:=False;
//        GradBtn1.BeginColor:=ClNavy;
//        GradBtn1.EndColor:=ClAqua;
//        GradBtn1.Cursor:=CrHandPoint;
//        GradBtn1.Enabled:=True;
        TorryButton1.Cursor:=CrNo;
        TorryButton1.Hint:='NO DISPONIBLE MIENTRAS SU TARJETA DE CREDITO ESTE VENCIDA';
        Memo1.Lines.Add('No es posible calcular el Vencimiento de su Tarjeta de Crédito, Actualice sus datos.');
      end;
    end;
end;

procedure TAlquilar_y_devolver.FormShow(Sender: TObject);
var
//  Conta:Integer;
  Nacimiento,Comparacion1,Comparacion2,Comparacion3,Comparacion4:String;
  edad :TDate;
begin
  Label7.caption:=DateToStr(Date);
  Label24.Caption:='0';
  Label6.Caption:='0';
  Cuenta_Promo:=0;
  Accion_Ejecutada:=False;

  Autoriza_Alquiler:='';
  LabelTotal.Caption:='0';
  Debe_Por_Multa_Pasada:=0;
  Debe_Por_Alquiler_Pasado:=0;
  LabelTotal.Caption:='0';
  Datos.Videos.Active:=False;
  Memo1.Lines.Clear;
  Devolver:=False;
  Todos_los_Videos.Open;
  Datos.Query_General.DisableControls;
  Datos.Query_General.Sql.Clear;
  Datos.Query_General.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                              'Videos.Foto_Miniatura, Videos.Foto_Grande, Selecciones.Codigo_Cliente, '+
                              'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                              'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                              '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
  Datos.Query_General.ParamByName('Cod_Cliente').AsString:=Principal.MaskEdit1.Text;
  Datos.Query_General.Open;
  Datos.Query_General.EnableControls;
  Counter2.Value:=IntToStr(Datos.Query_General.RecordCount);

  Datos.Clientes.Refresh;
  Datos.Clientes.indexname:='';
  Datos.Clientes.setkey;
  Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Principal.Maskedit1.Text;
  If (Datos.Clientes.gotokey = true) then
     Begin
       Datos.Debe.Refresh;
       Datos.Debe.First;
// Se Recorre la base del debe y se selecciona los montos por alquiler y por multa.
         While ( Not Datos.Debe.EOF) do
           Begin
             If (Datos.Debe.Fieldbyname('Codigo_Cliente').Asstring = Principal.MaskEdit1.Text) then
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
             Label24.Caption:=inttostr(Debe_Por_Multa_Pasada);
           end;
         If Debe_Por_Alquiler_Pasado > 0 Then
           Begin
             Label6.Caption:=inttostr(Debe_Por_Alquiler_Pasado);
           end;
         LabelTotal.Caption:=IntToStr(StrToInt(Label6.Caption)+StrToInt(Label24.Caption));
     end;

// Se Verifica el cumpleaños del cliente
  Try
    Begin
      Nacimiento:=Datos.Clientes.fieldbyname('Fecha_Nacimiento_Cliente').asString;
      If Nacimiento <> '' Then
        Begin
          StrToDate(Nacimiento);
          Comparacion1:=Nacimiento[1]+Nacimiento[2]+Nacimiento[3]+Nacimiento[4]+Nacimiento[5];
          Comparacion2:=DateToStr(Date)[1]+DateToStr(Date)[2]+DateToStr(Date)[3]+
                        DateToStr(Date)[4]+DateToStr(Date)[5];
          Nacimiento:=DateToStr(Date+1);
          Comparacion3:=Nacimiento[1]+Nacimiento[2]+Nacimiento[3]+Nacimiento[4]+Nacimiento[5];
          Nacimiento:=DateToStr(Date-1);
          Comparacion4:=Nacimiento[1]+Nacimiento[2]+Nacimiento[3]+Nacimiento[4]+Nacimiento[5];
          If ((Comparacion1 = Comparacion2) OR (Comparacion1 = Comparacion3) OR (Comparacion1 = Comparacion4))
             Then
               Begin
                 Cump.Animate:=True;
                 Cump.Visible:=True;
                 Memo1.Lines.Add('Felicidades se Encuentra de Cumpleaños, que pase un muy buen día... !!!');
               end
             else
               Begin
                 Cump.Animate:=False;
                 Cump.Visible:=False;
               end;
        end;
    end;
  Except
    On EConvertError do
      Begin
        Cump.Visible:=False;
        Cump.Animate:=False;
      end;
  end; // Fin de Verificación de Cumpleaños

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
              Datos.Tarjetas.fieldbyname('Codigo_Cliente').asstring:=Principal.maskedit1.text;
              Datos.Tarjetas.fieldbyname('Tipo').asstring:='D';
              Datos.Tarjetas.GotoKey;
              Image1.Visible:=True;
              Image2.Visible:=False;
              Vence_TC.Caption:=Datos.Tarjetas.fieldbyname('Fecha_Vencimiento').asstring;
              Vence_TC.Visible:=True;
              Try
                Begin
                  If ((Vence_TC.Caption <> '') AND ((StrToDate(Vence_TC.Caption) < Date))) Then
                    Begin
                      Alabel1.Visible:=True;
                    end
                  end;
                Except
                  On EConvertError do
                    Begin
                      Alabel1.Visible:=False;
                    end;
                end;
              Datos.Tarjetas.Close;
            end;
        end;
    end; // Fin de Verificación de Pago de Depósito
  Verificar_Limites;
         // Se comprueba la ultima visita y se pone en el label
  If Datos.Clientes.fieldbyname('Ultima_Visita').AsString = DateToStr(Date) Then
    Begin
      Label3.Caption:='Última Visita : '+DateToStr(Date)+
                      '           ( H O Y )';
    end;
  If StrToDate(Datos.Clientes.fieldbyname('Ultima_Visita').AsString) < Date Then
    Begin
      edad := Date - StrToDate(Datos.Clientes.fieldbyname('Ultima_Visita').AsString);
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
          Label3.Caption:='Última Visita : '+Datos.Clientes.fieldbyname('Ultima_Visita').AsString+
           ' ('+IntToStr(StrToInt(Label8.Caption))+' años, '+ IntToStr(StrToInt(Label10.Caption)-1)+' meses y '+IntToStr(StrToInt(Label12.Caption)+1)+' dias.)';
        end
      else
        Begin
          Label3.Caption:='Última Visita : '+Datos.Clientes.fieldbyname('Ultima_Visita').AsString+
                      '           ( A Y E R )';
        end;
    end;
  If StrToDate(Datos.Clientes.fieldbyname('Ultima_Visita').AsString) > Date Then
    Begin
      Label3.Caption:='     A D V E R T E N C I A:   Error al Calcular fecha de Última Visita: '+Datos.Clientes.fieldbyname('Ultima_Visita').AsString;
    end; // Fin de el cálculo de la última visita
  Datos.Promo3x2.Open;
  If Datos.Promo3x2.Fieldbyname(IntToStr(DayofWeek(Date))).AsBoolean = True Then
    Begin
      Label35.Visible:=True;
      Label34.Visible:=True;
    end;
  Datos.Promo3x2.Close;
end;


procedure TAlquilar_y_devolver.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Todos_los_Videos.Close;
end;

procedure TAlquilar_y_devolver.TorryButton1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Query_General.DisableControls;
      Datos.Query_General.Sql.Clear;
      Datos.Query_General.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                                  'Videos.Foto_Miniatura, Videos.Foto_Grande, Selecciones.Codigo_Cliente, '+
                                  'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                                  'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                                  '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
      Datos.Query_General.ParamByName('Cod_Cliente').AsString:=Principal.MaskEdit1.Text;
      Datos.Query_General.Open;
      Datos.Query_General.EnableControls;
      If Datos.Query_General.RecordCount > 0 Then
        Begin
          Mostrar_Seleccion:=TMostrar_Seleccion.Create(Self);
          Mostrar_Seleccion.Edit1.Caption:=Label1.Caption;
          Mostrar_Seleccion.ShowModal;
        end
      else
        Begin
          MessageDlg('Usted no ha añadido ninguna película a su selección '+
                     'para hacerlo, señale alguna película de las imágenes de abajo '+
                     'y luego presione "AÑADIR A MI LISTA" en la parte superior de la ventana de "ALQUILER".', mtError, [mbOk], 0);
        end;
    end
  Finally
    Counter2.Value:=IntToStr(Datos.Query_General.RecordCount);
    Mostrar_Seleccion.Free;
    Mostrar_Seleccion:=Nil;
  end;
end;

procedure TAlquilar_y_devolver.GradBtn1Click(Sender: TObject);
begin
  Try
    Begin
      GradBtn1.Enabled:=False;
      Primera_Entrada:=TPrimera_Entrada.Create(Self);
      Primera_Entrada.Edit1.Caption:=Label1.Caption;
      Primera_Entrada.Label7.Caption:=DateToStr(Date);
      Datos.Query_Peliculas.DisableControls;
      Datos.Query_Peliculas.Sql.Clear;
      Datos.Query_Peliculas.Sql.Add('Select Codigo_Video, Anaquel, Linea, Posicion, Titulo_Video, Foto_Miniatura, Foto_Grande, Estreno, '+
                                           'Video_Alquilado, Categoria_Video from Videos '+
                                           'Where ((Anaquel <> :A1) AND (Linea <> :A1) AND (Posicion <> :A1) AND (Foto_Miniatura <> :A1) AND (Foto_Grande <> :A1)) '+
                                           'ORDER BY Titulo_Video');
      Datos.Query_Peliculas.ParamByName('A1').AsString:='';
      Datos.Query_Peliculas.Open;
      Datos.Query_Peliculas.EnableControls;
      Primera_Entrada.ShowModal;
    end
  Finally
    Primera_Entrada.Free;
    Primera_Entrada:=Nil;
    GradBtn1.Enabled:=True;
  end;
end;

procedure TAlquilar_y_devolver.GradBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TAlquilar_y_devolver.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

