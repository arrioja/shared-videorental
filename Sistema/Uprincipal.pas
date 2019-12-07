unit Uprincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, Grids, DBGrids, DB, DBTables, StdCtrls, ComCtrls,
  Calendar, Statbaru, Registry, ImgList, oaAssist;

type
  Usuario_Actual = Record
      Nombres          :String[40];
      Apellidos        :String[40];
      Cedula           :String[10];
      Login            :String[15];
      Password         :String[10];
      Imprime_Factura  :Boolean;
      ActualReg        :Integer;
  end;

  TPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Programa1: TMenuItem;
    Alquiler1: TMenuItem;
    Incluir1: TMenuItem;
    Modificar1: TMenuItem;
    Comprobar1: TMenuItem;
    Acercade1: TMenuItem;
    Configuracin1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Colores1: TMenuItem;
    Fuentes1: TMenuItem;
    Predeterminados1: TMenuItem;
    Cambiar1: TMenuItem;
    Predeterminados2: TMenuItem;
    Cambiar2: TMenuItem;
    NuevoCliente1: TMenuItem;
    NuevoVideo1: TMenuItem;
    Usuario1: TMenuItem;
    Video2: TMenuItem;
    Bevel1: TBevel;
    ColorDialog1: TColorDialog;
    Eliminar1: TMenuItem;
    Cliente1: TMenuItem;
    Video1: TMenuItem;
    Opciones1: TMenuItem;
    Impresin1: TMenuItem;
    RegistrosdeCliente1: TMenuItem;
    DatosdeVideo1: TMenuItem;
    FontDialog1: TFontDialog;
    Image1: TImage;
    Estadsticas1: TMenuItem;
    DeClientes1: TMenuItem;
    DeAlquileres1: TMenuItem;
    DeVideos1: TMenuItem;
    CambiarPassword1: TMenuItem;
    Listar1: TMenuItem;
    Individuales1: TMenuItem;
    Datos1: TMenuItem;
    Historial1: TMenuItem;
    Datos2: TMenuItem;
    Historial2: TMenuItem;
    Etiquetas1: TMenuItem;
    NuevoEjemplardeVideo1: TMenuItem;
    Historial3: TMenuItem;
    Caja1: TMenuItem;
    Timer1: TTimer;
    CostosdeVideos1: TMenuItem;
    ClientesconDeudas1: TMenuItem;
    RecaudosporFecha1: TMenuItem;
    ClientesconObservaciones1: TMenuItem;
    UltimosclientesquevieronunVideo1: TMenuItem;
    Clientesquemshanalquiladoporfecha1: TMenuItem;
    Videosmsalquiladosporfecha1: TMenuItem;
    Videosactualmentealquilados1: TMenuItem;
    StatusBar1: TEStatusBar;
    CdigodeBarras1: TMenuItem;
    Clientes1: TMenuItem;
    Videos1: TMenuItem;
    Ayuda1: TMenuItem;
    ProtectordePantalla1: TMenuItem;
    N2: TMenuItem;
    RegistrarProducto1: TMenuItem;
    ModificarAccesosaMdulos1: TMenuItem;
    ComprobarRegistrodeAcciones1: TMenuItem;
    Caja2: TMenuItem;
    CierreDiario1: TMenuItem;
    NuevaSesin1: TMenuItem;
    ImageList1: TImageList;
    N3: TMenuItem;
    IncluirOperador1: TMenuItem;
    ModificarOperador1: TMenuItem;
    EliminarOperador1: TMenuItem;
    Label1: TLabel;
    CambiarLogin1: TMenuItem;
    Facturas1: TMenuItem;
    ConsultarOperador1: TMenuItem;
    DatosdelaEmpresa1: TMenuItem;
    Clientesmenosactivos1: TMenuItem;
    N4: TMenuItem;
    Factura1: TMenuItem;
    Promocin3X21: TMenuItem;
    Miscelneos1: TMenuItem;
    Label2: TLabel;
    ListadodeEstrenosporsacar1: TMenuItem;
    procedure ShowHint(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NuevoCliente1Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Acercade1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NuevoVideo1Click(Sender: TObject);
    procedure Cambiar1Click(Sender: TObject);
    procedure Alquiler1Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure Cambiar2Click(Sender: TObject);
    procedure Opciones1Click(Sender: TObject);
    procedure RegistrosdeCliente1Click(Sender: TObject);
    procedure DatosdeVideo1Click(Sender: TObject);
    procedure Predeterminados1Click(Sender: TObject);    
    procedure Cliente1Click(Sender: TObject);
    procedure Video1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DeAlquileres1Click(Sender: TObject);
    procedure DeClientes1Click(Sender: TObject);
    procedure DeVideos1Click(Sender: TObject);
    Procedure DesEncripta(Entrada:string);
    procedure Video2Click(Sender: TObject);
    procedure Predeterminados2Click(Sender: TObject);
    procedure CambiarPassword1Click(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
    procedure Datos1Click(Sender: TObject);
    procedure Datos2Click(Sender: TObject);
    procedure Historial1Click(Sender: TObject);
    procedure Historial2Click(Sender: TObject);
    procedure NuevoEjemplardeVideo1Click(Sender: TObject);
    procedure Caja1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CostosdeVideos1Click(Sender: TObject);
    procedure RecaudosporFecha1Click(Sender: TObject);
    procedure ClientesconObservaciones1Click(Sender: TObject);
    procedure UltimosclientesquevieronunVideo1Click(Sender: TObject);
    procedure Clientesquemshanalquiladoporfecha1Click(Sender: TObject);
    procedure Videosmsalquiladosporfecha1Click(Sender: TObject);
    procedure ClientesconDeudas1Click(Sender: TObject);
    procedure Videosactualmentealquilados1Click(Sender: TObject);
    Function  Encripta(X:String): String;
    procedure Clientes1Click(Sender: TObject);
    procedure Videos1Click(Sender: TObject);
    procedure ProtectordePantalla1Click(Sender: TObject);
    procedure RegistrarProducto1Click(Sender: TObject);
    procedure ModificarAccesosaMdulos1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NuevaSesin1Click(Sender: TObject);
    procedure IncluirOperador1Click(Sender: TObject);
    procedure CambiarLogin1Click(Sender: TObject);
    procedure ModificarOperador1Click(Sender: TObject);
    procedure CierreDiario1Click(Sender: TObject);
    procedure EliminarOperador1Click(Sender: TObject);
    procedure ConsultarOperador1Click(Sender: TObject);
    procedure ComprobarRegistrodeAcciones1Click(Sender: TObject);
    procedure DatosdelaEmpresa1Click(Sender: TObject);
    procedure Clientesmenosactivos1Click(Sender: TObject);
    procedure Facturas1Click(Sender: TObject);
    procedure Factura1Click(Sender: TObject);
    procedure Promocin3X21Click(Sender: TObject);
    procedure Miscelneos1Click(Sender: TObject);
    procedure ListadodeEstrenosporsacar1Click(Sender: TObject);

  private
    { Private declarations }
  public
    Fecha_Total:STRING;
    { Public declarations }
  end;

var
  Ultima_Video:string;
  Ultima_Cliente:string;
  Windows_Directory:String;
  Inicio,Nueva_Sesion:Boolean; //Esta variable es comprobada en el enevto OnAtivate
                             //para ver si se corre la aplicación o si simplemente
                             //se esta activando desde otra ventana.

  Usuario:Usuario_Actual;    //Para tener referencia del usario actual...
  Forzar_Salida:Boolean;     //Indica cuando se sale por la ventana de petición de claves.

  Clave_Leida:string[6];

  Nombre_de_Fuente,Estilo_de_Fuente:string;
  Tamanio_de_Fuente,Color_de_Fuente:integer;


  Boton: TMousebutton;
  Principal: TPrincipal;

  Desde_Principal:Boolean;

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
  Precio_Multa_DVD_Estreno_mas_Dia:real;
  Fecha_de_Vencimiento:string;

  Pass_Arch,Color_arch,Fuentes_arch,configarch:textfile;

  Color_de_Archivo:integer;


implementation

uses uconfirmar, unuevo_cliente, uacerca, unuevo_video, 
  ualquilar_y_devolver, Ulista_clientes, uconfiguracion,
  uEstadisticas_de_Dinero, uEstadisticas_de_Cliente, uEstadisticas_de_Video,
  uImprimir_Etiquetas, ULista_Videos, uImprimir_Carnets, uDetalles,
  uEliminar_cliente, uEliminar_video, uModificar_cliente, uModificar_video,
  UActual_progress, UBienvenida, Upassword, UPedir_Clave,
  UConsultar_Cliente, UConsultar_Video, UHistorial_Cliente,
  UHistorial_Videos, UNuevo_Ejemplar, UCaja, MODULO_DE_DATOS,
  UListado_Costo_Videos, URecaudos_Por_Fecha, UListado_Con_Observaciones,
  UListado_Clientes_Ultimos_Videos, UListado_Cliente_que_mas_Alquila,
  UListado_Videos_Mas_Vistos, ULista_Deudores, UListado_Videos_Alquilados,
  UImprimir_Barras_Clientes, UImprimir_Barras_Videos, UProtector_Pantalla,
  URegistro, UAcceso_a_Modulos, UPedirClave, UCambiar_Asistente,
  UIncluir_Operador, UCambiarClave, UCambiarLogin, UModificar_Operador,
  UCierre_de_Caja, UEliminar_Operador, UConsultar_Operador,
  UConsultar_Referencia, UConfigurar_Empresa,
  UListado_Clientes_Inactivos, UListado_Clientes_Mas_activos,
  UConsulta_Factura, UPromo3x2, UEsperar, UMiscelaneos,
  ULista_Videos_Sacados_de_Estrenos;

{$R *.DFM}

Function TPrincipal.Encripta(X:String): String;
var
  I : Integer;
  St: ^String;
begin
  New(ST);
  ST^:=X;
  X:='';
  For I:=1 to Length(ST^) do
     Begin
       X:=X+ST^[(Length(ST^)-I)+1];
     end;
  Dispose(ST);
  for i := 1 to Length(X) do
     X[i] := char(byte(X[i]) xor $AA);
  Encripta:=X;
end;

//*************************************************************************
// Función que devuelve el directorio de instalación de Windows, sin importar
// cual sea la versión del mismo.
function GetWindowsDirectory : String;
var
  pcWindowsDirectory : PChar;
  dwWDSize           : DWORD;
begin
  dwWDSize := MAX_PATH + 1;
  GetMem( pcWindowsDirectory, dwWDSize );
  try
    if Windows.GetWindowsDirectory( pcWindowsDirectory, dwWDSize ) <> 0 then
      Result := pcWindowsDirectory;
  finally
    FreeMem( pcWindowsDirectory );
  end;
end;

procedure TPrincipal.ShowHint(Sender: TObject);
begin
  StatusBar1.Caption := Application.Hint;
end;

Procedure TPrincipal.DesEncripta(Entrada:string);
var
  Contador:integer;
Begin
  Clave_Leida:='';
  For Contador:=1 to 6 do
     Begin
       Clave_Leida:=Clave_Leida+Entrada[(6-Contador)+1];
     end;
end;


procedure TPrincipal.Salir1Click(Sender: TObject);
begin
  close;
end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Try
    Confirmar:=TConfirmar.Create(Self);
    Confirmar.Label1.caption:='Salir del Programa ?.';
    Confirmar.Caption:='C o n f i r m a r .';
    Confirmar.showmodal;
    if Confirmar.modalresult = mrok then
      begin
        Datos.Base.Connected:=True;
        Datos.TablaUsuarios.Active:=True;
        Datos.TablaHistConex.Active:=True;
        // Para guardar en el historial la salida (Fin de la sesión)
        Datos.TablaHistConex.Setkey;
        Datos.TablaHistConex.FieldByname('NumReg').AsInteger:=Usuario.ActualReg;
        Datos.TablaHistConex.GotoKey;
        Datos.TablaHistConex.Edit;
        Datos.TablaHistConex.FieldByname('Fecha_DesConexion').AsString:=DateToStr(Date);
        Datos.TablaHistConex.FieldByname('Hora_DesConexion').AsString:=TimeToStr(Time);
        Datos.TablaHistConex.Post;
        Datos.TablaUsuarios.IndexName:='Cedula_Index';
        Datos.TablaUsuarios.Setkey;
        Datos.TablaUsuarios.FieldByname('Cedula').AsString:=Usuario.Cedula;
        Datos.TablaUsuarios.GotoKey;
        Datos.TablaUsuarios.Edit;
        Datos.TablaUsuarios.FieldByName('Conectada').AsBoolean:=False;
        Datos.TablaUsuarios.Post;
        Datos.Sesion.Active:=False;
        Datos.Base.Connected:=False;
        Datos.TablaUsuarios.Active:=False;
        Datos.TablaHistConex.Active:=False;
        application.terminate;
      end
    else
      begin
        Action:=caNone;
      end;
   Finally
     Confirmar.Free;
     Confirmar:=Nil;
   end;
end;

procedure TPrincipal.NuevoCliente1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Clientes.Open;
      Datos.Cheques.Open;
      Datos.Inscripciones.Open;
      Datos.Tarjetas.Open;
      Datos.Mayores.Open;
      Datos.Transacciones.Open;
      Datos.Menores.Open;
      Desde_Principal:=True;
      Nuevo_cliente:=TNuevo_cliente.Create(Self);
      Nuevo_cliente.showmodal;
    end
  Finally
    Begin
      Datos.Clientes.Close;
      Datos.Cheques.Close;
      Datos.Tarjetas.Close;
      Datos.Transacciones.Close;
      Datos.Mayores.Close;
      Datos.Inscripciones.Close;
      Datos.Menores.Close;
      Nuevo_cliente.Free;
      Nuevo_cliente:=Nil;
    end;
  end;
end;

procedure TPrincipal.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Boton:=Button;
end;
procedure TPrincipal.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Boton:=Mbleft;
end;

procedure TPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
 if ((Shift = [ssAlt,ssctrl,ssshift]) and (Key = VK_F1)) then
    Begin
      if Boton = mbright then
         begin
           showmessage(' Diseñado, Hecho y Programado por Pedro Enrique Arrioja Marcano. '+
                       'C.I. V.- 13.729.622, Derechos Reservados 2000., Cualquier Reproduccion, '+
                       'o copia ilegal de este Software sin consentimiento del Programador está '+
                       'penado por la ley y serán tomadas todas las acciones legales correspondientes.');
         end;
    end;
end;

procedure TPrincipal.Acercade1Click(Sender: TObject);
begin
  Try
    Begin
      Acerca:=TAcerca.Create(Self);
      Acerca.showmodal;
    end
  Finally
    Acerca.Free;
    Acerca:=Nil;
  end;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
var
  Ruta_Programa,S1:String;
  FileA:TextFile;
begin
  Inicio:=True;
  Windows_Directory:='';
  Windows_Directory:=GetWindowsDirectory;
  Ruta_Programa:=ExtractFilePath(Application.ExeName);
  Datos.Sesion.PrivateDir:=Ruta_Programa+'PrivData\';
  Datos.Sesion.Active:=True;
  Datos.Base.Connected:=True;

  Application.OnHint := ShowHint;
  Assignfile(Configarch,Encripta('ÍÌÉ„ÌÄÅÉÙÓù'));
  Assignfile(Pass_arch,Windows_Directory+Encripta('ÆÆÎ„ØÜÚÄÃýöÇÏÞÙÓùö'));
  Assignfile(Color_arch,'Colores.cfg');
  Assignfile(Fuentes_arch,'Fuentes.cfg');
  AssignFile(FileA,Windows_Directory+Encripta('ÆÆÎ„ØÜÏÌÄÃýöÇÏÞÙÓùö'));
  Try
    Begin
      { El programa VR2000 viene con un ejecutable separado que se llama
        "Fechador", en el cual se coloca la fecha que se quiere que tenga
        el sistema o simplemente se deja con la normal}
      Reset(FileA);
      Readln(FileA,S1);
      CloseFile(FileA);
      If S1 = 'ãÿóþ…øï…ýû' Then
        Begin
          Fecha_Total:=DateToStr(Date);
        end
      else
        Begin
          Fecha_Total:=Encripta(S1);
        end;
    end
  Except
    On EInOutError do
      BEgin
        Application.Terminate;
      end;
  end;

end;

procedure TPrincipal.NuevoVideo1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Datos.Total.Open;
      Nuevo_video:=Tnuevo_video.Create(Self);
      Nuevo_video.showmodal;
    end
  Finally
    Datos.Videos.Close;
    Datos.Total.Close;
    Nuevo_video.Free;
    Nuevo_video:=Nil;
  end;
end;

procedure TPrincipal.Cambiar1Click(Sender: TObject);
begin
{  Colordialog1.Color:=Color_de_Archivo;
  If Colordialog1.execute then
     Begin
       Color_de_Archivo:=Colordialog1.Color;
       Rewrite(Color_arch);
       Writeln(Color_arch,Color_de_Archivo);
       Closefile(Color_arch);

    {Aqui se le asigna el color a las Formas.}

{       Acerca.color:=Colordialog1.Color;
       Alquilar_y_Devolver.color:=Colordialog1.Color;
//       Buscar.color:=Colordialog1.Color;
       Configuracion.color:=Colordialog1.Color;
       Confirmar.color:=Colordialog1.Color;
       Detalles.color:=Colordialog1.Color;
       Eliminar_Cliente.color:=Colordialog1.Color;
       Eliminar_Video.color:=Colordialog1.Color;
       Estadisticas_de_Cliente.color:=Colordialog1.Color;
       Estadisticas_de_Dinero.color:=Colordialog1.Color;
       Estadisticas_de_Video.color:=Colordialog1.Color;
       Imprimir_Carnets.color:=Colordialog1.Color;
       Imprimir_Etiquetas.color:=Colordialog1.Color;
//       Lista_Clientes.color:=Colordialog1.Color;
       Lista_Videos.color:=Colordialog1.Color;
       Modificar_Cliente.color:=Colordialog1.Color;
       Modificar_Video.color:=Colordialog1.Color;
       Nuevo_Cliente.color:=Colordialog1.Color;
       Nuevo_Video.color:=Colordialog1.Color;
       Principal.color:=Colordialog1.Color;


       Acerca.Memo1.color:=Colordialog1.Color;
//       Buscar.Memo1.color:=Colordialog1.Color;
     end;
}end;

procedure TPrincipal.Alquiler1Click(Sender: TObject);
begin
  Try
    Begin
      Esperar:=TEsperar.Create(Self);
      Esperar.Show;
      Application.Processmessages;
      Datos.Tablamiscelaneos.Open;
      Esperar.Gauge1.Progress:=3;
      Application.Processmessages;
      Datos.Clientes.Open;
      Esperar.Gauge1.Progress:=7;
      Application.Processmessages;
      Datos.Alquileres.Open;
      Esperar.Gauge1.Progress:=13;
      Application.Processmessages;
      Datos.Total.Open;
      Esperar.Gauge1.Progress:=20;
      Application.Processmessages;
      Datos.Empresa.Open;
      Esperar.Gauge1.Progress:=25;
      Application.Processmessages;
      Datos.Facturas.Open;
      Esperar.Gauge1.Progress:=33;
      Application.Processmessages;
      Datos.Promo3x2.Open;
      Esperar.Gauge1.Progress:=39;
      Application.Processmessages;
      Datos.Registro.Open;
      Esperar.Gauge1.Progress:=45;
      Application.Processmessages;
      Datos.Transacciones.Open;
      Esperar.Gauge1.Progress:=53;
      Application.Processmessages;
      Datos.Historia.Open;
      Esperar.Gauge1.Progress:=59;
      Application.Processmessages;
      Datos.Debe.Open;
      Esperar.Gauge1.Progress:=67;
      Application.Processmessages;
      Datos.Multas.Open;
      Esperar.Gauge1.Progress:=74;
      Application.Processmessages;
      Datos.Deudas.Open;
      Esperar.Gauge1.Progress:=79;
      Application.Processmessages;
      Datos.Mayores.Open;
      Esperar.Gauge1.Progress:=84;
      Application.Processmessages;
      Alquilar_y_Devolver:=TAlquilar_y_Devolver.Create(Self);
      Esperar.Gauge1.Progress:=97;
      Application.Processmessages;
      If Datos.Promo3x2.Fieldbyname(IntToStr(DayofWeek(StrToDate(Principal.Fecha_Total)))).AsBoolean = True Then
        Begin
          Alquilar_y_Devolver.Label35.Visible:=True;
          Alquilar_y_Devolver.Label34.Visible:=True;
        end;
      Esperar.Gauge1.Progress:=100;
      Application.Processmessages;
      Alquilar_y_Devolver.showmodal;
    end
  Finally
    Begin
      Alquilar_y_Devolver.Free;
      Alquilar_y_Devolver:=Nil;
      Datos.Clientes.Close;
      Datos.Alquileres.Close;
      Datos.Empresa.Close;
      Datos.Deudas.Close;
      Datos.Transacciones.Close;
      Datos.Multas.Close;
      Datos.Facturas.Close;
      Datos.Promo3x2.Close;      
      Datos.Total.Close;
      Datos.Registro.Close;
      Datos.Tablamiscelaneos.Close;      
      Datos.Historia.Close;
      Datos.Debe.Close;
      Datos.Mayores.Close;
    end;
  end;
end;

procedure TPrincipal.Usuario1Click(Sender: TObject);
begin
  Try
    Begin
      Desde_Principal:=True;
      Lista_Clientes:=TLista_Clientes.Create(Self);
      Lista_Clientes.DBGrid1.PopupMenu:=Lista_Clientes.Menu_Clientes;
      Lista_Clientes.Query1.Open;
      Lista_Clientes.showmodal;
    end
  Finally
    Lista_Clientes.Query1.Close;
    Lista_Clientes.Free;
    Lista_Clientes:=Nil;
  end;
end;

procedure TPrincipal.Cambiar2Click(Sender: TObject);
begin
{  If Fontdialog1.execute then
     Begin
       Nombre_de_Fuente:=Fontdialog1.Font.Name;
       Tamanio_de_Fuente:=Fontdialog1.Font.Size;
       Color_de_Fuente:=Fontdialog1.Font.Color;

       Rewrite(Fuentes_arch);
       Writeln(Fuentes_arch,Nombre_de_Fuente);
       Writeln(Fuentes_arch,Tamanio_de_Fuente);
       Writeln(Fuentes_arch,Color_de_Fuente);
       CloseFile(Fuentes_Arch);

       Acerca.Font.name:=Nombre_de_Fuente;
       Acerca.Font.Size:=Tamanio_de_Fuente;
       Acerca.Font.Color:=Color_de_Fuente;

       Alquilar_y_Devolver.Font.name:=Nombre_de_Fuente;
       Alquilar_y_Devolver.Font.Size:=Tamanio_de_Fuente;
       Alquilar_y_Devolver.Font.Color:=Color_de_Fuente;

//       Buscar.Font.name:=Nombre_de_Fuente;
//       Buscar.Font.Size:=Tamanio_de_Fuente;
//       Buscar.Font.Color:=Color_de_Fuente;

       Configuracion.Font.name:=Nombre_de_Fuente;
       Configuracion.Font.Size:=Tamanio_de_Fuente;
       Configuracion.Font.Color:=Color_de_Fuente;

       Confirmar.Font.name:=Nombre_de_Fuente;
       Confirmar.Font.Size:=Tamanio_de_Fuente;
       Confirmar.Font.Color:=Color_de_Fuente;

       Detalles.Font.name:=Nombre_de_Fuente;
       Detalles.Font.Size:=Tamanio_de_Fuente;
       Detalles.Font.Color:=Color_de_Fuente;

       Eliminar_Cliente.Font.name:=Nombre_de_Fuente;
       Eliminar_Cliente.Font.Size:=Tamanio_de_Fuente;
       Eliminar_Cliente.Font.Color:=Color_de_Fuente;

       Eliminar_Video.Font.name:=Nombre_de_Fuente;
       Eliminar_Video.Font.Size:=Tamanio_de_Fuente;
       Eliminar_Video.Font.Color:=Color_de_Fuente;

       Estadisticas_de_Cliente.Font.name:=Nombre_de_Fuente;
       Estadisticas_de_Cliente.Font.Size:=Tamanio_de_Fuente;
       Estadisticas_de_Cliente.Font.Color:=Color_de_Fuente;

       Estadisticas_de_Dinero.Font.name:=Nombre_de_Fuente;
       Estadisticas_de_Dinero.Font.Size:=Tamanio_de_Fuente;
       Estadisticas_de_Dinero.Font.Color:=Color_de_Fuente;

       Estadisticas_de_Video.Font.name:=Nombre_de_Fuente;
       Estadisticas_de_Video.Font.Size:=Tamanio_de_Fuente;
       Estadisticas_de_Video.Font.Color:=Color_de_Fuente;

       Imprimir_Carnets.Font.name:=Nombre_de_Fuente;
       Imprimir_Carnets.Font.Size:=Tamanio_de_Fuente;
       Imprimir_Carnets.Font.Color:=Color_de_Fuente;

       Imprimir_Etiquetas.Font.name:=Nombre_de_Fuente;
       Imprimir_Etiquetas.Font.Size:=Tamanio_de_Fuente;
       Imprimir_Etiquetas.Font.Color:=Color_de_Fuente;

//       Lista_Clientes.Font.name:=Nombre_de_Fuente;
//       Lista_Clientes.Font.Size:=Tamanio_de_Fuente;
//       Lista_Clientes.Font.Color:=Color_de_Fuente;

       Lista_Videos.Font.name:=Nombre_de_Fuente;
       Lista_Videos.Font.Size:=Tamanio_de_Fuente;
       Lista_Videos.Font.Color:=Color_de_Fuente;

       Modificar_Cliente.Font.name:=Nombre_de_Fuente;
       Modificar_Cliente.Font.Size:=Tamanio_de_Fuente;
       Modificar_Cliente.Font.Color:=Color_de_Fuente;

       Modificar_Video.Font.name:=Nombre_de_Fuente;
       Modificar_Video.Font.Size:=Tamanio_de_Fuente;
       Modificar_Video.Font.Color:=Color_de_Fuente;

       Nuevo_Cliente.Font.name:=Nombre_de_Fuente;
       Nuevo_Cliente.Font.Size:=Tamanio_de_Fuente;
       Nuevo_Cliente.Font.Color:=Color_de_Fuente;

       Nuevo_Video.Font.name:=Nombre_de_Fuente;
       Nuevo_Video.Font.Size:=Tamanio_de_Fuente;
       Nuevo_Video.Font.Color:=Color_de_Fuente;

       Principal.Font.name:=Nombre_de_Fuente;
       Principal.Font.Size:=Tamanio_de_Fuente;
       Principal.Font.Color:=Color_de_Fuente;

     end;
}end;

procedure TPrincipal.Opciones1Click(Sender: TObject);
begin
  Try
    Configuracion:=TConfiguracion.Create(Self);
    Configuracion.showmodal;
  Finally
    Configuracion.Free;
    Configuracion:=Nil;
  end;
end;

procedure TPrincipal.RegistrosdeCliente1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Clientes.Open;
      Datos.Cheques.Open;
      Datos.Tarjetas.Open;
      Datos.Mayores.Open;
      Datos.Menores.Open;
      Desde_Principal:=True;
      Modificar_Cliente:=TModificar_Cliente.Create(Self);
      Modificar_Cliente.ShowModal;
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
    end;
  end;
end;

procedure TPrincipal.DatosdeVideo1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Datos.Historia.Open;
      Datos.Total.Open;
      Desde_Principal:=True;
      Modificar_Video:=TModificar_Video.Create(self);
      Modificar_Video.Showmodal;
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

procedure TPrincipal.Predeterminados1Click(Sender: TObject);
begin
  Colordialog1.Color:=ClBtnFace;
  Color_de_Archivo:=Colordialog1.Color;
  Rewrite(Color_arch);
  Writeln(Color_arch,Color_de_Archivo);
  Closefile(Color_arch);
{
  Acerca.Color:=ClBtnFace;
  Alquilar_y_Devolver.color:=ClBtnFace;
//  Buscar.color:=ClBtnFace;
  Configuracion.color:=ClBtnFace;
  Confirmar.color:=ClBtnFace;
  Detalles.color:=ClBtnFace;
  Eliminar_Cliente.color:=ClBtnFace;
  Eliminar_Video.color:=ClBtnFace;
  Estadisticas_de_Cliente.color:=ClBtnFace;
  Estadisticas_de_Dinero.color:=ClBtnFace;
  Estadisticas_de_Video.color:=ClBtnFace;
  Imprimir_Carnets.color:=ClBtnFace;
  Imprimir_Etiquetas.color:=ClBtnFace;
//  Lista_Clientes.color:=ClBtnFace;
  Lista_Videos.color:=ClBtnFace;
  Modificar_Cliente.color:=ClBtnFace;
  Modificar_Video.color:=ClBtnFace;
  Nuevo_Cliente.color:=ClBtnFace;
  Nuevo_Video.color:=ClBtnFace;
  Principal.color:=ClBtnFace;
  Acerca.Memo1.Color:=ClBtnFace;
//  Buscar.Memo1.color:=ClBtnFace;
}
end;

procedure TPrincipal.Cliente1Click(Sender: TObject);
begin
  Try
    Begin
      Desde_Principal:=True;
      Datos.Clientes.Open;
      Datos.Cheques.Open;
      Datos.Tarjetas.Open;
      Datos.Mayores.Open;
      Datos.Transacciones.Open;
      Datos.Menores.Open;
      Datos.Historia.Open;
      Datos.Debe.Open;
      Eliminar_Cliente:=TEliminar_Cliente.Create(Self);
      Eliminar_Cliente.showmodal;
    end
  Finally
    Begin
      Datos.Clientes.Open;
      Datos.Transacciones.Close;
      Datos.Cheques.Open;
      Datos.Debe.Close;
      Datos.Tarjetas.Open;
      Datos.Mayores.Open;
      Datos.Menores.Open;
      Datos.Historia.Open;
      Eliminar_Cliente.Free;
      Eliminar_Cliente:=Nil;
    end;
  end;
end;

procedure TPrincipal.Video1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Datos.Historia.Open;
      Datos.Total.Open;
      Desde_Principal:=True;
      Eliminar_Video:=TEliminar_Video.Create(Self);
      Eliminar_Video.showmodal;
    end
  Finally
    Begin
      Datos.Videos.Close;
      Datos.Historia.Close;
      Datos.Total.Close;
      Eliminar_Video.Free;
      Eliminar_Video:=Nil;
    end;
  end;
end;

procedure TPrincipal.FormShow(Sender: TObject);
var
  Ruta_Programa:String;
  readpass:string[6];
  registro : tregistry;
  Lee1,Lee2:String;
begin
  registro := tregistry.create;
  try
    with registro do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey(Encripta('ÄÅÃÞËØßÍÃÌÄÅéõØÏÜÃØîöØÏÜÃØîÄÃýöÏØËÝÞÌÅùö'), false);
      Lee1:=ReadString(Encripta('ÙÞØÅúõÈÙÿ'));
      Lee2:=ReadString(Encripta('ÄÅÃÙØÏüõØÏÜÃØî'));
      If Lee1 = 'ÏÙÆËì' Then
        Begin
          Timer1.Enabled:=False;
          If Lee2 = 'òòòò…òò…òò' Then
            Begin
              RegistrarProducto1.Visible:=False;
              N2.Visible:=False;
            end;
        end
      else
        Begin
          Timer1.Enabled:=True;
          RegistrarProducto1.Visible:=True;
          N2.Visible:=True;
        end;
    end;
  finally
    registro.free;
  end;

  Ruta_Programa:=ExtractFilePath(Application.ExeName);
  Image1.Picture.LoadFromFile(Ruta_Programa+'Imagenes\Fondo.bmp');
  Reset(Pass_Arch);
  Readln(Pass_Arch,Readpass);
  Closefile(Pass_arch);
  Desencripta(Readpass);

  Reset(configarch);
  readln(configarch,Precio_Alquiler_1_Dia);
  readln(configarch,Precio_Alquiler_2_Dia);
  readln(configarch,Precio_Alquiler_3_Dia);
  readln(configarch,Precio_Alquiler_mas_Dia);
  readln(configarch,Precio_Multa_1_Dia);
  readln(configarch,Precio_Multa_2_Dia);
  readln(configarch,Precio_Multa_3_Dia);
  readln(configarch,Precio_Multa_mas_Dia);
  readln(configarch,Precio_Alquiler_Doble_1_Dia);
  readln(configarch,Precio_Alquiler_Doble_2_Dia);
  readln(configarch,Precio_Alquiler_Doble_3_Dia);
  readln(configarch,Precio_Alquiler_Doble_mas_Dia);
  readln(configarch,Precio_Multa_Doble_1_Dia);
  readln(configarch,Precio_Multa_Doble_2_Dia);
  readln(configarch,Precio_Multa_Doble_3_Dia);
  readln(configarch,Precio_Multa_Doble_mas_Dia);
  readln(configarch,Precio_Alquiler_Sexo_1_Dia);
  readln(configarch,Precio_Alquiler_Sexo_2_Dia);
  readln(configarch,Precio_Alquiler_Sexo_3_Dia);
  readln(configarch,Precio_Alquiler_Sexo_mas_Dia);
  readln(configarch,Precio_Multa_Sexo_1_Dia);
  readln(configarch,Precio_Multa_Sexo_2_Dia);
  readln(configarch,Precio_Multa_Sexo_3_Dia);
  readln(configarch,Precio_Multa_Sexo_mas_Dia);
  readln(configarch,Precio_Alquiler_Musical_1_Dia);
  readln(configarch,Precio_Alquiler_Musical_2_Dia);
  readln(configarch,Precio_Alquiler_Musical_3_Dia);
  readln(configarch,Precio_Alquiler_Musical_mas_Dia);
  readln(configarch,Precio_Multa_Musical_1_Dia);
  readln(configarch,Precio_Multa_Musical_2_Dia);
  readln(configarch,Precio_Multa_Musical_3_Dia);
  readln(configarch,Precio_Multa_Musical_mas_Dia);
  readln(configarch,Precio_Alquiler_Estreno_1_Dia);
  readln(configarch,Precio_Alquiler_Estreno_2_Dia);
  readln(configarch,Precio_Alquiler_Estreno_3_Dia);
  readln(configarch,Precio_Alquiler_Estreno_mas_Dia);
  readln(configarch,Precio_Multa_Estreno_1_Dia);
  readln(configarch,Precio_Multa_Estreno_2_Dia);
  readln(configarch,Precio_Multa_Estreno_3_Dia);
  readln(configarch,Precio_Multa_Estreno_mas_Dia);
  readln(configarch,Precio_Alquiler_Estreno_Doble_1_Dia);
  readln(configarch,Precio_Alquiler_Estreno_Doble_2_Dia);
  readln(configarch,Precio_Alquiler_Estreno_Doble_3_Dia);
  readln(configarch,Precio_Alquiler_Estreno_Doble_mas_Dia);
  readln(configarch,Precio_Multa_Estreno_Doble_1_Dia);
  readln(configarch,Precio_Multa_Estreno_Doble_2_Dia);
  readln(configarch,Precio_Multa_Estreno_Doble_3_Dia);
  readln(configarch,Precio_Multa_Estreno_Doble_mas_Dia);
  readln(configarch,Precio_Alquiler_DVD_1_Dia);
  readln(configarch,Precio_Alquiler_DVD_2_Dia);
  readln(configarch,Precio_Alquiler_DVD_3_Dia);
  readln(configarch,Precio_Alquiler_DVD_Mas_Dia);
  readln(configarch,Precio_Multa_DVD_1_Dia);
  readln(configarch,Precio_Multa_DVD_2_Dia);
  readln(configarch,Precio_Multa_DVD_3_Dia);
  readln(configarch,Precio_Multa_DVD_mas_Dia);
  readln(configarch,Precio_Alquiler_DVD_Estreno_1_Dia);
  readln(configarch,Precio_Alquiler_DVD_Estreno_2_Dia);
  readln(configarch,Precio_Alquiler_DVD_Estreno_3_Dia);
  readln(configarch,Precio_Alquiler_DVD_Estreno_Mas_Dia);
  readln(configarch,Precio_Multa_DVD_Estreno_1_Dia);
  readln(configarch,Precio_Multa_DVD_Estreno_2_Dia);
  readln(configarch,Precio_Multa_DVD_Estreno_3_Dia);
  readln(configarch,Precio_Multa_DVD_Estreno_mas_Dia);
  readln(configarch,Precio_de_Inscripcion);
  readln(configarch,Precio_Deposito);
  Closefile(configarch);

  Reset(Color_Arch);
  readln(Color_Arch,Color_de_Archivo);
  Closefile(Color_arch);

  Reset(Fuentes_arch);
  Readln(Fuentes_arch,Nombre_de_Fuente);
  Readln(Fuentes_arch,Tamanio_de_Fuente);
  Readln(Fuentes_arch,Color_de_Fuente);
  CloseFile(Fuentes_Arch);
{
  Acerca.Font.name:=Nombre_de_Fuente;
  Acerca.Font.Size:=Tamanio_de_Fuente;
  Acerca.Font.Color:=Color_de_Fuente;

  Alquilar_y_Devolver.Font.name:=Nombre_de_Fuente;
  Alquilar_y_Devolver.Font.Size:=Tamanio_de_Fuente;
  Alquilar_y_Devolver.Font.Color:=Color_de_Fuente;

//  Buscar.Font.name:=Nombre_de_Fuente;
//  Buscar.Font.Size:=Tamanio_de_Fuente;
//  Buscar.Font.Color:=Color_de_Fuente;

  Configuracion.Font.name:=Nombre_de_Fuente;
  Configuracion.Font.Size:=Tamanio_de_Fuente;
  Configuracion.Font.Color:=Color_de_Fuente;

  Confirmar.Font.name:=Nombre_de_Fuente;
  Confirmar.Font.Size:=Tamanio_de_Fuente;
  Confirmar.Font.Color:=Color_de_Fuente;

  Detalles.Font.name:=Nombre_de_Fuente;
  Detalles.Font.Size:=Tamanio_de_Fuente;
  Detalles.Font.Color:=Color_de_Fuente;

  Eliminar_Cliente.Font.name:=Nombre_de_Fuente;
  Eliminar_Cliente.Font.Size:=Tamanio_de_Fuente;
  Eliminar_Cliente.Font.Color:=Color_de_Fuente;

  Eliminar_Video.Font.name:=Nombre_de_Fuente;
  Eliminar_Video.Font.Size:=Tamanio_de_Fuente;
  Eliminar_Video.Font.Color:=Color_de_Fuente;

  Estadisticas_de_Cliente.Font.name:=Nombre_de_Fuente;
  Estadisticas_de_Cliente.Font.Size:=Tamanio_de_Fuente;
  Estadisticas_de_Cliente.Font.Color:=Color_de_Fuente;

  Estadisticas_de_Dinero.Font.name:=Nombre_de_Fuente;
  Estadisticas_de_Dinero.Font.Size:=Tamanio_de_Fuente;
  Estadisticas_de_Dinero.Font.Color:=Color_de_Fuente;

  Estadisticas_de_Video.Font.name:=Nombre_de_Fuente;
  Estadisticas_de_Video.Font.Size:=Tamanio_de_Fuente;
  Estadisticas_de_Video.Font.Color:=Color_de_Fuente;

  Imprimir_Carnets.Font.name:=Nombre_de_Fuente;
  Imprimir_Carnets.Font.Size:=Tamanio_de_Fuente;
  Imprimir_Carnets.Font.Color:=Color_de_Fuente;

  Imprimir_Etiquetas.Font.name:=Nombre_de_Fuente;
  Imprimir_Etiquetas.Font.Size:=Tamanio_de_Fuente;
  Imprimir_Etiquetas.Font.Color:=Color_de_Fuente;

//  Lista_Clientes.Font.name:=Nombre_de_Fuente;
//  Lista_Clientes.Font.Size:=Tamanio_de_Fuente;
//  Lista_Clientes.Font.Color:=Color_de_Fuente;

  Lista_Videos.Font.name:=Nombre_de_Fuente;
  Lista_Videos.Font.Size:=Tamanio_de_Fuente;
  Lista_Videos.Font.Color:=Color_de_Fuente;

  Modificar_Cliente.Font.name:=Nombre_de_Fuente;
  Modificar_Cliente.Font.Size:=Tamanio_de_Fuente;
  Modificar_Cliente.Font.Color:=Color_de_Fuente;

  Modificar_Video.Font.name:=Nombre_de_Fuente;
  Modificar_Video.Font.Size:=Tamanio_de_Fuente;
  Modificar_Video.Font.Color:=Color_de_Fuente;

  Nuevo_Cliente.Font.name:=Nombre_de_Fuente;
  Nuevo_Cliente.Font.Size:=Tamanio_de_Fuente;
  Nuevo_Cliente.Font.Color:=Color_de_Fuente;

  Nuevo_Video.Font.name:=Nombre_de_Fuente;
  Nuevo_Video.Font.Size:=Tamanio_de_Fuente;
  Nuevo_Video.Font.Color:=Color_de_Fuente;

  Principal.Font.name:=Nombre_de_Fuente;
  Principal.Font.Size:=Tamanio_de_Fuente;
  Principal.Font.Color:=Color_de_Fuente;

  Acerca.color:=Color_de_Archivo;
  Alquilar_y_Devolver.color:=Color_de_Archivo;
//  Buscar.color:=Color_de_Archivo;
  Configuracion.color:=Color_de_Archivo;
  Confirmar.color:=Color_de_Archivo;
  Detalles.color:=Color_de_Archivo;
  Eliminar_Cliente.color:=Color_de_Archivo;
  Eliminar_Video.color:=Color_de_Archivo;
  Estadisticas_de_Cliente.color:=Color_de_Archivo;
  Estadisticas_de_Dinero.color:=Color_de_Archivo;
  Estadisticas_de_Video.color:=Color_de_Archivo;
  Imprimir_Carnets.color:=Color_de_Archivo;
  Imprimir_Etiquetas.color:=Color_de_Archivo;
//  Lista_Clientes.color:=Color_de_Archivo;
  Lista_Videos.color:=Color_de_Archivo;
  Modificar_Cliente.color:=Color_de_Archivo;
  Modificar_Video.color:=Color_de_Archivo;
  Nuevo_Cliente.color:=Color_de_Archivo;
  Nuevo_Video.color:=Color_de_Archivo;
  Principal.color:=Color_de_Archivo;

  Acerca.Memo1.color:=Color_de_Archivo;
//  Buscar.Memo1.color:=Color_de_Archivo;
}
  Bienvenida.Free;
  Bienvenida:=Nil;
end;

procedure TPrincipal.DeAlquileres1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Alquileres.Open;
      Datos.Multas.Open;
      Datos.Inscripciones.Open;
      Estadisticas_de_dinero:=TEstadisticas_de_dinero.Create(Self);
      Estadisticas_de_dinero.showmodal;
    end
  Finally
    Estadisticas_de_dinero.Free;
    Estadisticas_de_dinero:=Nil;
    Datos.Alquileres.Open;
    Datos.Multas.Open;
    Datos.Inscripciones.Open;
  end;
end;

procedure TPrincipal.DeClientes1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Clientes.Open;
      If Datos.Clientes.RecordCount > 0 Then
        Begin
          Estadisticas_de_Cliente:=TEstadisticas_de_Cliente.Create(Self);
          Estadisticas_de_Cliente.showmodal;
        end
      else
        Begin
          Messagedlg('No existen clientes inscritos en el sistema, '
                    +'por lo tanto, no se pueden mostrar las gráficas, '
                    +'deberá inscribir por lo menos un cliente antes '
                    +'se seleccionar esta opción',mtWarning,[mbok],0);
        end;
    end
  Finally
    Begin
      If Datos.Clientes.RecordCount > 0 Then
        Begin
          Estadisticas_de_Cliente.Free;
          Estadisticas_de_Cliente:=Nil;
        end;
      Datos.Clientes.Close;
    end
  end;
end;

procedure TPrincipal.DeVideos1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      If Datos.Videos.RecordCount > 0 Then
        Begin
          Estadisticas_de_Video:=TEstadisticas_de_Video.Create(Self);
          Estadisticas_de_Video.showmodal;
        end
      else
        Begin
          Messagedlg('No existen películas inscritas en el sistema, '
                    +'por lo tanto, no se pueden mostrar las gráficas, '
                    +'deberá inscribir por lo menos una película antes '
                    +'se seleccionar esta opción',mtWarning,[mbok],0);
        end;
    end
  Finally
    Begin
      If Datos.Videos.RecordCount > 0 Then
        Begin
          Estadisticas_de_Video.Free;
          Estadisticas_de_Video:=Nil;
        end;
      Datos.Videos.Close;
    end;
  end;
end;

procedure TPrincipal.Video2Click(Sender: TObject);
begin
  Try
    Begin
      Desde_Principal:=True;
      Lista_Videos:=TLista_Videos.Create(Self);
      Lista_Videos.DBGrid1.PopupMenu:=Lista_Videos.Menu_Videos;
      Lista_Videos.Query1.Open;
      Lista_Videos.showmodal;
    end
  Finally
    Lista_Videos.Query1.Close;
    Lista_Videos.Free;
    Lista_Videos:=Nil;
  end;
end;

procedure TPrincipal.Predeterminados2Click(Sender: TObject);
begin
  Rewrite(Fuentes_arch);
  Writeln(Fuentes_arch,Nombre_de_Fuente);
  Writeln(Fuentes_arch,Tamanio_de_Fuente);
  Writeln(Fuentes_arch,Color_de_Fuente);
  CloseFile(Fuentes_Arch);
end;

procedure TPrincipal.CambiarPassword1Click(Sender: TObject);
begin
  Try
    Begin
      CambiarClave := TCambiarClave.Create (self);
      CambiarClave.Showmodal;
    end
  Finally
    CambiarClave.Free;
    CambiarClave:=Nil;
  end;
end;

procedure TPrincipal.Etiquetas1Click(Sender: TObject);
begin
  Try
    Begin
      Imprimir_Etiquetas:=TImprimir_Etiquetas.Create(Self);
      Imprimir_Etiquetas.showmodal;
    end
  Finally
    Begin
      Imprimir_Etiquetas.Free;
      Imprimir_Etiquetas:=Nil;
    end;
  end;
end;

procedure TPrincipal.Datos1Click(Sender: TObject);
begin
  Try
    Begin
      Desde_Principal:=True;
      Datos.Base.Connected:=True;
      Datos.Clientes.Open;
      Datos.Videos.Open;
      Datos.Cheques.Open;
      Datos.Tarjetas.Open;
      Datos.Mayores.Open;
      Datos.Menores.Open;
      Consultar_Cliente:=TConsultar_Cliente.Create(Self);
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

procedure TPrincipal.Datos2Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Desde_Principal:=True;
      Consultar_Video:=TConsultar_Video.Create(Self);
      Consultar_Video.ShowModal;
    end
  Finally
    Begin
      Datos.Videos.Close;
      Consultar_Video.Free;
      Consultar_Video:=Nil;
    end;
  end;
end;

procedure TPrincipal.Historial1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Clientes.Open;
      Datos.Videos.Open;
      Desde_Principal:=True;
      Historial_Cliente:=THistorial_Cliente.Create(Self);
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

procedure TPrincipal.Historial2Click(Sender: TObject);
begin
  Try
    Begin
      Desde_Principal:=True;
      Datos.Videos.Open;
      Datos.Clientes.Open;
      Historial_Videos:=THistorial_Videos.Create(Self);
      Historial_Videos.Showmodal;
    end
  Finally
    Begin
      Datos.Videos.Close;
      Datos.Clientes.Close;
      Historial_Videos.Free;
      Historial_Videos:=Nil;
    end;
  end;
end;

procedure TPrincipal.NuevoEjemplardeVideo1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Datos.Total.Open;
      Nuevo_Ejemplar:=TNuevo_Ejemplar.Create(Self);
      Nuevo_Ejemplar.Showmodal;
    end
  Finally
    Begin
      Datos.Videos.Close;
      Datos.Total.Close;
      Nuevo_Ejemplar.Free;
      Nuevo_Ejemplar:=Nil;
    end;
  End;
end;

procedure TPrincipal.Caja1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.Deudas.Open;
      Datos.Inscripciones.Open;
      Datos.Multas.Open;
      Datos.Alquileres.Open;
      Caja:=TCaja.Create(Self);
      Caja.showmodal;
    end
  Finally
    Begin
      Datos.Base.Connected:=False;
      Datos.Deudas.Close;
      Datos.Inscripciones.Close;
      Datos.Multas.Close;
      Datos.Alquileres.Close;
      Caja.Free;
      Caja:=Nil;
    end;
  end;                          //      014-7862122 Amilcar
end;                            //      094-319422  Cruz Montaño

procedure TPrincipal.Timer1Timer(Sender: TObject);
begin
  MessageBeep(MB_ICONEXCLAMATION);
  Showmessage('   Esta es una versión de Evaluación de Vídeo Rental 2000 para '+
              'Microsoft Windows 95/98, por favor, póngase en contacto con el Ing. '+
              'Pedro Enrique Arrioja Marcano por el Teléfono (016) - 796 - 13 - 06 y/o'+
              'a través, del correo electrónico:   videorental@cantv.net    para obtener '+
              'una copia autorizada del mismo. (y este mensaje desaparecerá '+
              'para siempre, gracias.');
end;

procedure TPrincipal.CostosdeVideos1Click(Sender: TObject);
begin
  Try
    Begin
      Listado_Costo_Videos:=TListado_Costo_Videos.Create(Self);
      Listado_Costo_Videos.ShowModal;
    end
  Finally
    Begin
      Listado_Costo_Videos.Free;
      Listado_Costo_Videos:=Nil;
    end
  End;
end;

procedure TPrincipal.RecaudosporFecha1Click(Sender: TObject);
begin
  Try
    Begin
      Recaudos_Por_Fecha:=TRecaudos_Por_Fecha.Create(Self);
      Recaudos_Por_Fecha.showmodal;
    end
  Finally
      Recaudos_Por_Fecha.Free;
      Recaudos_Por_Fecha:=Nil;
  end;
end;

procedure TPrincipal.ClientesconObservaciones1Click(Sender: TObject);
begin
  Try
    Begin
      Listado_Con_Observaciones:=TListado_Con_Observaciones.Create(Self);
      Listado_Con_Observaciones.showmodal;
    end
  Finally
    Listado_Con_Observaciones.Free;
    Listado_Con_Observaciones:=Nil;
  end;
end;

procedure TPrincipal.UltimosclientesquevieronunVideo1Click(
  Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Listado_Clientes_Ultimos_Videos:=TListado_Clientes_Ultimos_Videos.Create(Self);
      Listado_Clientes_Ultimos_Videos.Showmodal;
    end
  Finally
    Begin
      Listado_Clientes_Ultimos_Videos.Free;
      Listado_Clientes_Ultimos_Videos:=Nil;
      Datos.Videos.Close;
    end;
  end;
end;

procedure TPrincipal.Clientesquemshanalquiladoporfecha1Click(
  Sender: TObject);
begin
  Try
    Begin
      Listado_Cliente_que_mas_Alquila:=TListado_Cliente_que_mas_Alquila.Create(Self);
      Listado_Cliente_que_mas_Alquila.Showmodal;
    end
  Finally
    Begin
      Listado_Cliente_que_mas_Alquila.Free;
      Listado_Cliente_que_mas_Alquila:=Nil;
    end;
  end;
end;

procedure TPrincipal.Videosmsalquiladosporfecha1Click(Sender: TObject);
begin
  Try
    Begin
      Listado_Videos_Mas_Vistos:=TListado_Videos_Mas_Vistos.Create(Self);
      Listado_Videos_Mas_Vistos.Showmodal;
    end
  Finally
    Begin
      Listado_Videos_Mas_Vistos.Free;
      Listado_Videos_Mas_Vistos:=Nil;
    end
  end;
end;

procedure TPrincipal.ClientesconDeudas1Click(Sender: TObject);
begin
  Try
    Begin
      Lista_Deudores:=TLista_Deudores.Create(Self);
      Lista_Deudores.showmodal;
    end
  Finally
    Begin
      Lista_Deudores.Free;
      Lista_Deudores:=Nil;
    end;
  end;
end;

procedure TPrincipal.Videosactualmentealquilados1Click(Sender: TObject);
begin
  Try
    Begin
      Listado_Videos_Alquilados:=TListado_Videos_Alquilados.Create(Self);
      Listado_Videos_Alquilados.showmodal;
    end
  Finally
    Listado_Videos_Alquilados.Free;
    Listado_Videos_Alquilados:=Nil;
  end;
end;

procedure TPrincipal.Clientes1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Clientes.Open;
      Imprimir_Barras_Clientes:=TImprimir_Barras_Clientes.Create(Self);
      Imprimir_Barras_Clientes.showmodal;
    end
  Finally
    Imprimir_Barras_Clientes.Free;
    Imprimir_Barras_Clientes:=Nil;
    Datos.Clientes.Close;
  end;
end;

procedure TPrincipal.Videos1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Videos.Open;
      Imprimir_Barras_Videos:=TImprimir_Barras_Videos.Create(Self);
      Imprimir_Barras_Videos.showmodal;
    end
  Finally
    Imprimir_Barras_Videos.Free;
    Imprimir_Barras_Videos:=Nil;
    Datos.Videos.Close;
  end;
end;

procedure TPrincipal.ProtectordePantalla1Click(Sender: TObject);
begin
  Try
    Begin
      Protector_Pantalla:=TProtector_Pantalla.Create(Self);
      Protector_Pantalla.Showmodal;
    end;
  Finally
    Begin
      Protector_Pantalla.Free;
      Protector_Pantalla:=Nil;
    end;
  end;
end;

procedure TPrincipal.RegistrarProducto1Click(Sender: TObject);
begin
  Try
    Begin
      Registro:=TRegistro.Create(Self);
      Registro.showmodal;
    end
  Finally
    Registro.Free;
    Registro:=Nil;
  end;
end;

procedure TPrincipal.ModificarAccesosaMdulos1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Acceso_a_Modulos := TAcceso_a_Modulos.Create (self);
      Acceso_a_Modulos.Showmodal;
    end
  Finally
    Begin
      Acceso_a_Modulos.Free;
      Acceso_a_Modulos:=Nil;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TPrincipal.FormActivate(Sender: TObject);
begin
  If Inicio = True Then
    Begin
      Try
        Begin
          Datos.Base.Connected:=True;
          Datos.TablaUsuarios.Active:=True;
          Datos.TablaHistConex.Active:=True;
          Datos.TablaAccesos.Active:=True;
          PedirClave:= TPedirClave.Create(self);
          PedirClave.Showmodal;
          If PedirClave.ModalResult = mrAbort Then
            Begin
              Forzar_Salida:=True;
            end
          else
            Begin
              Inicio:=False;
            end
        end
      Finally
        Begin
          Datos.Base.Connected:=False;
          Datos.TablaUsuarios.Active:=False;
          Datos.TablaHistConex.Active:=False;
          Datos.TablaAccesos.Active:=False;
          PedirClave.Free;
          PedirClave:=Nil;
          If Forzar_Salida = True Then
            Begin
              Application.Terminate;
            end;
        end;
      end;
    end
  else
    Begin
      If Forzar_Salida = True Then
        Begin
          Application.Terminate;
        end
      else
        Begin
          If Nueva_Sesion = True Then
            Begin
              Nueva_Sesion:=False;
            end;
        end;
    end;
end;

procedure TPrincipal.NuevaSesin1Click(Sender: TObject);
begin
  Try
    Begin
      Nueva_Sesion:=True;
      Datos.Base.Connected:=True;
      Datos.TablaUsuarios.Active:=True;
      Datos.TablaHistConex.Active:=True;
      Datos.TablaAccesos.Active:=True;
      // Para guardar en el historial la salida (Fin de la sesión)
      Datos.TablaHistConex.Setkey;
      Datos.TablaHistConex.FieldByname('NumReg').AsInteger:=Usuario.ActualReg;
      Datos.TablaHistConex.GotoKey;
      Datos.TablaHistConex.Edit;
      Datos.TablaHistConex.FieldByname('Fecha_DesConexion').AsString:=DateToStr(Date);
      Datos.TablaHistConex.FieldByname('Hora_DesConexion').AsString:=TimeToStr(Time);
      Datos.TablaHistConex.Post;
      Datos.TablaUsuarios.IndexName:='Cedula_Index';
      Datos.TablaUsuarios.Setkey;
      Datos.TablaUsuarios.FieldByname('Cedula').AsString:=Usuario.Cedula;
      Datos.TablaUsuarios.GotoKey;
      Datos.TablaUsuarios.Edit;
      Datos.TablaUsuarios.FieldByName('Conectada').AsBoolean:=False;
      Datos.TablaUsuarios.Post;
      // Continuación en la pantalla Principal del sistema...
      Principal.Caption:='Vídeo Rental 2000 ®     -----     Por Favor identifíquese '+
                         'para poder comenzar una sesión...';
      Usuario.Nombres:='';
      Usuario.Apellidos:='';
      Usuario.Cedula:='';
      Usuario.Login:='';
      Usuario.Password:='';
      Usuario.ActualReg:=-1;
      PedirClave:= TPedirClave.Create (self);
      PedirClave.Showmodal;
      Forzar_Salida:=False;
      If PedirClave.ModalResult = mrAbort Then
        Begin
          Forzar_Salida:=True;
        end
    end
  Finally
    Begin
      Datos.Base.Connected:=False;
      Datos.TablaAccesos.Active:=False;
      Datos.TablaUsuarios.Active:=False;
      Datos.TablaHistConex.Active:=False;
      PedirClave.Free;
      PedirClave:=Nil;
      If Forzar_Salida = True Then Application.Terminate;
    end;
  end;
end;

procedure TPrincipal.IncluirOperador1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Incluir_Operador := TIncluir_Operador.Create(self);
      Incluir_Operador.Showmodal;
    end
  Finally
    Begin
      Incluir_Operador.Free;
      Incluir_Operador:=Nil;
      Datos.Base.Connected:=False;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TPrincipal.CambiarLogin1Click(Sender: TObject);
begin
  Try
    Begin
      CambiarLogin := TCambiarLogin.Create (self);
      CambiarLogin.Showmodal;
    end
  Finally
    CambiarLogin.Free;
    CambiarLogin:=Nil;
  end;
end;

procedure TPrincipal.ModificarOperador1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Modificar_Operador := TModificar_Operador.Create(self);
      Modificar_Operador.Showmodal;
    end
  Finally
    Begin
      Modificar_Operador.Free;
      Modificar_Operador:=Nil;
      Datos.Base.Connected:=False;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TPrincipal.CierreDiario1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.Transacciones.Open;
      Datos.Empresa.Open;
      Datos.Cierres.Open;
      Cierre_de_Caja := TCierre_de_Caja.Create(self);
      Cierre_de_Caja.Showmodal;
    end
  Finally
    Begin
      Cierre_de_Caja.Free;
      Cierre_de_Caja:=Nil;
      Datos.Base.Connected:=False;
      Datos.Transacciones.Close;
      Datos.Empresa.Close;
      Datos.Cierres.Close;
    end;
  end;
end;

procedure TPrincipal.EliminarOperador1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.TablaUsuarios.Open;
      Eliminar_Operador := TEliminar_Operador.Create(self);
      Eliminar_Operador.Showmodal;
    end
  Finally
    Begin
      Eliminar_Operador.Free;
      Eliminar_Operador:=Nil;
      Datos.Base.Connected:=False;
      Datos.TablaUsuarios.Close;
    end;
  end;
end;

procedure TPrincipal.ConsultarOperador1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.TablaUsuarios.Open;
      Datos.TablaAccesos.Open;
      Consultar_Operador := TConsultar_Operador.Create(self);
      Consultar_Operador.Showmodal;
    end
  Finally
    Begin
      Consultar_Operador.Free;
      Consultar_Operador:=Nil;
      Datos.Base.Connected:=False;
      Datos.TablaUsuarios.Close;
      Datos.TablaAccesos.Close;
    end;
  end;
end;

procedure TPrincipal.ComprobarRegistrodeAcciones1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.Transacciones.Open;
      Datos.Clientes.Open;
      Datos.TablaUsuarios.Open;
      Consulta_Transaccion := TConsulta_Transaccion.Create(self);
      Consulta_Transaccion.Showmodal;
    end
  Finally
    Begin
      Consulta_Transaccion.Free;
      Consulta_Transaccion:=Nil;
      Datos.Base.Connected:=False;
      Datos.Transacciones.Close;
      Datos.TablaUsuarios.Close;
      Datos.Clientes.Close;
    end;
  end;

end;

procedure TPrincipal.DatosdelaEmpresa1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.Empresa.Open;
      Datos.TablaUsuarios.Open;
      Configurar_Empresa := TConfigurar_Empresa.Create(self);
      Configurar_Empresa.Showmodal;
    end
  Finally
    Begin
      Configurar_Empresa.Free;
      Configurar_Empresa:=Nil;
      Datos.Base.Connected:=False;
      Datos.TablaUsuarios.Close;
      Datos.Empresa.Close;
    end;
  end;
end;

procedure TPrincipal.Clientesmenosactivos1Click(Sender: TObject);
begin
  Try
    Begin
      Desde_Principal:=True;
      Listado_Clientes_Inactivos:=TListado_Clientes_Inactivos.Create(Self);
      Listado_Clientes_Inactivos.Listar_Clientes;
      Listado_Clientes_Inactivos.showmodal;
    end
  Finally
    Listado_Clientes_Inactivos.Query1.Close;
    Listado_Clientes_Inactivos.Free;
    Listado_Clientes_Inactivos:=Nil;
  end;
end;

procedure TPrincipal.Facturas1Click(Sender: TObject);
begin
  Try
    Begin
      Desde_Principal:=True;
      Listado_Clientes_Mas_Activos:=TListado_Clientes_Mas_Activos.Create(Self);
      Listado_Clientes_Mas_Activos.Listar_Clientes;
      Listado_Clientes_Mas_Activos.showmodal;
    end
  Finally
    Listado_Clientes_Mas_Activos.Query1.Close;
    Listado_Clientes_Mas_Activos.Free;
    Listado_Clientes_Mas_Activos:=Nil;
  end;
end;

procedure TPrincipal.Factura1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.Facturas.Open;
      Datos.Clientes.Open;
      Datos.TablaUsuarios.Open;
      Consulta_Factura := TConsulta_Factura.Create(self);
      Consulta_Factura.Showmodal;
    end
  Finally
    Begin
      Consulta_Factura.Free;
      Consulta_Factura:=Nil;
      Datos.Base.Connected:=False;
      Datos.Facturas.Close;
      Datos.TablaUsuarios.Close;
      Datos.Clientes.Close;
    end;
  end;
end;

procedure TPrincipal.Promocin3X21Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.Promo3x2.Open;
      Promo3x2 := TPromo3x2.Create(self);
      Promo3x2.Showmodal;
    end
  Finally
    Begin
      Promo3x2.Free;
      Promo3x2:=Nil;
      Datos.Base.Connected:=False;
      Datos.Promo3x2.Close;
    end;
  end;
end;

procedure TPrincipal.Miscelneos1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Base.Connected:=True;
      Datos.TablaMiscelaneos.Open;
      Miscelaneos := TMiscelaneos.Create(self);
      Miscelaneos.Showmodal;
    end
  Finally
    Begin
      Miscelaneos.Free;
      Miscelaneos:=Nil;
      Datos.Base.Connected:=False;
      Datos.TablaMiscelaneos.Close;
    end;
  end;
end;

procedure TPrincipal.ListadodeEstrenosporsacar1Click(Sender: TObject);
begin
  If Label2.Caption = '' Then
    Showmessage('No Existen películas para sacar de estrenos')
  else
    Begin
      Try
        Begin
          Datos.Videos.Open;
          Lista_Videos_Sacados_de_Estrenos:=TLista_Videos_Sacados_de_Estrenos.Create(Self);
          Lista_Videos_Sacados_de_Estrenos.Query1.Open;
          Lista_Videos_Sacados_de_Estrenos.showmodal;
        end
      Finally
        Lista_Videos_Sacados_de_Estrenos.Query1.Close;
        Datos.Videos.Close;
        Lista_Videos_Sacados_de_Estrenos.Free;
        Lista_Videos_Sacados_de_Estrenos:=Nil;
      end;
    end;
end;

end.
