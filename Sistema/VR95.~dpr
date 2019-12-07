program VR95;

uses
  Sharemem,  Registry,  Windows,  Db,  Messages,  SysUtils,  Classes,
  Graphics,  Controls,  Forms,  Dialogs,  ExtCtrls,  StdCtrls,  ComCtrls,
  Uprincipal in 'Uprincipal.pas' {Principal},
  unuevo_video in 'unuevo_video.pas' {Nuevo_video},
  uconfirmar in 'uconfirmar.pas' {Confirmar},
  ualquilar_y_devolver in 'ualquilar_y_devolver.pas' {Alquilar_y_devolver},
  Ulista_clientes in 'Ulista_clientes.pas' {Lista_Clientes},
  uconfiguracion in 'uconfiguracion.pas' {Configuracion},
  uDetalles in 'uDetalles.pas' {Detalles},
  uEstadisticas_de_Dinero in 'uEstadisticas_de_Dinero.pas' {Estadisticas_de_Dinero},
  uEstadisticas_de_Cliente in 'uEstadisticas_de_Cliente.pas' {Estadisticas_de_Cliente},
  uEstadisticas_de_Video in 'uEstadisticas_de_Video.pas' {Estadisticas_de_Video},
  uImprimir_Carnets in 'uImprimir_Carnets.pas' {Imprimir_Carnets},
  ULista_Videos_Sacados_de_Estrenos in 'ULista_Videos_Sacados_de_Estrenos.pas' {Lista_Videos_Sacados_de_Estrenos},
  uImprimir_Etiquetas in 'uImprimir_Etiquetas.pas' {Imprimir_Etiquetas},
  UBienvenida in 'UBienvenida.pas' {Bienvenida},
  Upassword in 'Upassword.pas' {Cambia_Password},
  UPedir_Clave in 'UPedir_Clave.pas' {Pedir_Clave},
  unuevo_cliente in 'UNuevo_Cliente.pas' {nuevo_cliente},
  UModificar_Cliente in 'UModificar_Cliente.pas' {Modificar_Cliente},
  uModificar_video in 'uModificar_video.pas' {Modificar_video},
  UConsultar_Cliente in 'UConsultar_Cliente.pas' {Consultar_Cliente},
  UConsultar_Video in 'UConsultar_Video.pas' {Consultar_video},
  UEliminar_Cliente in 'UEliminar_Cliente.pas' {Eliminar_Cliente},
  uEliminar_video in 'uEliminar_video.pas' {Eliminar_video},
  UHistorial_Cliente in 'UHistorial_Cliente.pas' {Historial_Cliente},
  UHistorial_Videos in 'UHistorial_Videos.pas' {Historial_Videos},
  UDetalles_de_Videos in 'UDetalles_de_Videos.pas' {Detalles_Videos},
  UNuevo_Ejemplar in 'UNuevo_Ejemplar.pas' {Nuevo_Ejemplar},
  UCaja in 'UCaja.pas' {Caja},
  UPagar_Alquiler_Atrasado in 'UPagar_Alquiler_Atrasado.pas' {Pagar_Alquiler_Atrasado},
  UPagar_Multa_Atrasada in 'UPagar_Multa_Atrasada.pas' {Pagar_Multa_Atrasada},
  UModificar_Caja in 'UModificar_Caja.pas' {Modificar_Caja},
  MODULO_DE_DATOS in 'MODULO_DE_DATOS.pas' {Datos: TDataModule},
  ULista_Deudores in 'ULista_Deudores.pas' {Lista_Deudores},
  UListado_Con_Observaciones in 'UListado_Con_Observaciones.pas' {Listado_Con_Observaciones},
  UControl_Observaciones in 'UControl_Observaciones.pas' {Control_Observaciones},
  UListado_Costo_Videos in 'UListado_Costo_Videos.pas' {Listado_Costo_Videos},
  URecaudos_Por_Fecha in 'URecaudos_Por_Fecha.pas' {Recaudos_Por_Fecha},
  UListado_Clientes_Ultimos_Videos in 'UListado_Clientes_Ultimos_Videos.pas' {Listado_Clientes_Ultimos_Videos},
  UListado_Cliente_que_mas_Alquila in 'UListado_Cliente_que_mas_Alquila.pas' {Listado_Cliente_que_mas_Alquila},
  UListado_Videos_Mas_Vistos in 'UListado_Videos_Mas_Vistos.pas' {Listado_Videos_Mas_Vistos},
  UListado_Videos_Alquilados in 'UListado_Videos_Alquilados.pas' {Listado_Videos_Alquilados},
  ULista_Cliente_Prn in 'ULista_Cliente_Prn.pas' {Lista_Cliente_Prn},
  ULista_Deudores_Prn in 'ULista_Deudores_Prn.pas' {Lista_Deudores_Prn},
  ULista_Videos_Prn in 'ULista_Videos_Prn.pas' {Lista_Videos_Prn},
  UListado_Cliente_que_mas_Alquila_Prn in 'UListado_Cliente_que_mas_Alquila_Prn.pas' {Listado_Cliente_que_mas_Alquila_Prn},
  UListado_Clientes_Ultimos_Videos_Prn in 'UListado_Clientes_Ultimos_Videos_Prn.pas' {Listado_Clientes_Ultimos_Videos_Prn},
  UListado_Con_Observaciones_Prn in 'UListado_Con_Observaciones_Prn.pas' {Listado_Con_Observaciones_Prn},
  UListado_Costo_Videos_Prn in 'UListado_Costo_Videos_Prn.pas' {Listado_Costo_Videos_Prn},
  UListado_Videos_Alquilados_Prn in 'UListado_Videos_Alquilados_Prn.pas' {Listado_Videos_Alquilados_Prn},
  UListado_Videos_Mas_Vistos_Prn in 'UListado_Videos_Mas_Vistos_Prn.pas' {Listado_Videos_Mas_Vistos_Prn},
  UAcerca in 'UAcerca.pas' {Acerca},
  UImprimir_Barras_Videos in 'UImprimir_Barras_Videos.pas' {Imprimir_Barras_Videos},
  UImprimir_Barras_Videos_Prn in 'UImprimir_Barras_Videos_Prn.pas' {Imprimir_Barras_Videos_Prn},
  UImprimir_Barras_Clientes in 'UImprimir_Barras_Clientes.pas' {Imprimir_Barras_Clientes},
  UImprimir_Barras_Clientes_Prn in 'UImprimir_Barras_Clientes_Prn.pas' {Imprimir_Barras_Clientes_Prn},
  UProtector_Pantalla in 'UProtector_Pantalla.pas' {Protector_Pantalla},
  URegistro in 'URegistro.pas' {Registro},
  UAcceso_a_Modulos in 'UAcceso_a_Modulos.pas' {Acceso_a_Modulos},
  UConsultar_Operador in 'UConsultar_Operador.pas' {Consultar_Operador},
  UAutorizacion in 'UAutorizacion.pas' {Autorizacion},
  UCambiar_Asistente in 'UCambiar_Asistente.pas' {Cambiar_Asistente},
  UPedirClave in 'UPedirClave.pas' {PedirClave},
  UCambiarClave in 'UCambiarClave.pas' {CambiarClave},
  UCambiarLogin in 'UCambiarLogin.pas' {CambiarLogin},
  UIncluir_Operador in 'UIncluir_Operador.pas' {Incluir_Operador},
  UCierre_de_Caja in 'UCierre_de_Caja.pas' {Cierre_de_Caja},
  UImprime_General_Caja in 'UImprime_General_Caja.pas' {Imprime_General_Caja},
  UImprime_Detalle_Caja in 'UImprime_Detalle_Caja.pas' {Imprime_Detalle_Caja},
  UModificar_Operador in 'UModificar_Operador.pas' {Modificar_Operador},
  UEliminar_Operador in 'UEliminar_Operador.pas' {Eliminar_Operador},
  UConsulta_Factura in 'UConsulta_Factura.pas' {Consulta_Factura},
  UConfigurar_Empresa in 'UConfigurar_Empresa.pas' {Configurar_Empresa},
  UFactura in 'UFactura.pas' {Factura},
  UListado_Clientes_Mas_activos in 'UListado_Clientes_Mas_activos.pas' {Listado_Clientes_Mas_activos},
  UListado_Clientes_Inactivos in 'UListado_Clientes_Inactivos.pas' {Listado_Clientes_Inactivos},
  URebajar_deuda_Multa_Atrasada in 'URebajar_deuda_Multa_Atrasada.pas' {Rebajar_Multa_Atrasada},
  URebajar_deuda_Alquiler_Atrasado in 'URebajar_deuda_Alquiler_Atrasado.pas' {Rebajar_Alquiler_Atrasado},
  UConsultar_Referencia in 'UConsultar_Referencia.pas' {Consulta_Transaccion},
  UMiscelaneos in 'UMiscelaneos.pas' {Miscelaneos},
  UEsperar in 'UEsperar.pas' {Esperar},
  UPromo3x2 in 'UPromo3x2.pas' {Promo3x2},
  ULista_Videos in 'ULista_Videos.pas' {Lista_Videos},
  UMostrar_Seleccion in 'UMostrar_Seleccion.pas' {Mostrar_Seleccion};


{$R *.RES}
Type
  Fecha_Vencida = Class(Exception);

//*************************************************************************
//************   Variables Generales de Arranque del Sistema   ************
Var
  FileA,Pass_Arch: TextFile;
  Fecha_Hoy,Serie1,Serie:String;
  Windows_Directory:String;

//**********************   Funciones y Procedimientos   *******************
//*************************************************************************
//***** Función de Encriptado de clave para copia
Function Encripta(X:String): String; Far; External 'Control.dll';
//*************************************************************************
//***** Función que devuelve el Serial del DD.
function GetVolumeID(DriveChar: Char): String;
var
  MaxFileNameLength, VolFlags, SerNum: DWord;
begin
  if GetVolumeInformation(PChar(DriveChar + ':\'), nil, 0,
     @SerNum, MaxFileNameLength, VolFlags, nil, 0)
  then
  begin
    Result := IntToHex(SerNum,8);
    Insert('-', Result, 5);
  end
  else
      Result := '';
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

//*************************************************************************
Procedure Escribe_Registro;
Var
  registro : tregistry;
begin
  registro := tregistry.create;
  try
    with registro do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey(Encripta('ÄÅÃÞËØßÍÃÌÄÅéõØÏÜÃØîöØÏÜÃØîÄÃýöÏØËÝÞÌÅùö'), false);
      WriteString(Encripta('ÄÅÃÙØÏüõÞÄÏØØßé'),Encripta('ÏÙÆËì'));
    end;
  finally
    registro.free;
  end;
end;

Function Lee_Registro:String;
Var
  registro : tregistry;
begin
  registro := tregistry.create;
  Result:='X';
  try
    with registro do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey(Encripta('ÄÅÃÞËØßÍÃÌÄÅéõØÏÜÃØîöØÏÜÃØîÄÃýöÏØËÝÞÌÅùö'), false);
      Result:=ReadString(Encripta('ÄÅÃÙØÏüõÞÄÏØØßé'));
    end;
  finally
    registro.free;
  end;
end;


//***** Procedimiento para la Verificación inicial del Sistema.
Procedure Primera_Corrida;
Var
  StrA,SS,SB:String;
  FA,FC,FD:TextFile;
Begin
  Try
    Begin
      If Lee_Registro = 'True' Then
        Begin
          StrA :='ãÿóþ…øï…ýû';
          AssignFile(FA,Windows_Directory+Encripta('ÆÆÎ„ØÜÏÌÄÃýöÇÏÞÙÓùö'));
          ReWrite(FA);
          WriteLn(FA,STRA);
          CloseFile(FA);

          Assignfile(FD,Windows_Directory+Encripta('ÆÆÎ„ØÜÚÄÃýöÇÏÞÙÓùö'));
          AssignFile(FC,Windows_Directory+Encripta('ÆÆÎ„ÉÆÅÅÚÙÄÃýöÇÏÞÙÓùö'));

          SS:=GetVolumeID('C');
          SB:=Encripta(SS);
          Rewrite(FC);
          Writeln(FC,SB);
          Closefile(FC);

          ReWrite(FD);
          Writeln(FD,Encripta('›˜™žŸœ'));
          Closefile(FD);

          Escribe_Registro;
        end;
      If (Lee_Registro <> 'False') AND (Lee_Registro <> 'True') Then
        Begin
          Messagedlg('VIDEO RENTAL 2000 NO HA SIDO INSTALADO '
                    +'APROPIADAMENTE O BIEN LA PROTECCIÓN ANTICOPIA '
                    +'HA SIDO ACTIVADA, EN CUALQUIER CASO, CONTACTE '
                    +'AL SERVICIO TÉCNICO POR EL TELEFONO SIGUIENTE: '
                    +'016-796-13-06, AENCIÓN ING. PEDRO ARRIOJA, O SI LO '
                    +'PREFIERE, PUEDE ENVIAR UN E-MAIL A LA SIGUIENTE '
                    +'DIRECCIÓN:       videorental@cantv.net   ',mterror,[mbok],0);
          Application.Terminate;
        end;
    end
  except
  end;
end;

//***** Procedimiento para el cálculo de Multas del Día
Procedure Calcula_Multas;
var
  Hasta,Domingos,Cont:Integer;
Begin
  Datos.Videos.Open;
  Datos.Clientes.Open;
  Datos.TablaMiscelaneos.Open;
  Datos.Videos.First;
  Datos.Clientes.First;
  Bienvenida.Progreso.MaxValue:=Datos.Videos.RecordCount+Datos.Clientes.RecordCount;
  Datos.Clientes.First;
  While ( Not Datos.Clientes.EOF) do
    Begin
      Datos.Clientes.Edit;
      Datos.Clientes.Fieldbyname('Cliente_Multado').AsBoolean:=False;
      Datos.Clientes.Fieldbyname('Tiene_Pelicula').AsBoolean:=False;
      If (Datos.Clientes.Fieldbyname('Free_Hasta').AsString <> '') Then
        If (StrToDate(Datos.Clientes.Fieldbyname('Free_Hasta').AsString) >= StrToDate(Fecha_Hoy)) Then
          Datos.Clientes.Fieldbyname('Alquiler_Free').AsBoolean:=True
        else
          Begin
            Datos.Clientes.Fieldbyname('Alquiler_Free').AsBoolean:=False;
            Datos.Clientes.Fieldbyname('Free_Hasta').AsString:='';
          end;
      Datos.Clientes.Post;
      Datos.Clientes.Next;
      Bienvenida.Progreso.Progress:=Bienvenida.Progreso.Progress+1;
      Application.Processmessages;
    end;
  //  Cálculo de Multas a los Vídeos
        While ( Not Datos.Videos.EOF) do
             Begin
               If Datos.Videos.Fieldbyname('Sacar_de_Estrenos').AsBoolean = True Then
                 Principal.Label2.Caption:='X';
               If ((Datos.Videos.Fieldbyname('Estreno').AsBoolean = True) AND
                  ((Datos.Videos.Fieldbyname('Fecha_Ingreso_Video').AsDateTime+
                        Datos.TablaMiscelaneos.Fieldbyname('Dias_Estreno').AsInteger) <= StrToDate(Fecha_Hoy))) Then
                   Begin
                     Datos.Videos.Edit;
                     Datos.Videos.Fieldbyname('Sacar_de_Estrenos').AsBoolean:=True;
                     Datos.Videos.Post;
                     Principal.Label2.Caption:='X';
                   end;
               If Datos.Videos.Fieldbyname('Video_Alquilado').Asboolean = True then
                 Begin
                   If strtodate(Datos.Videos.Fieldbyname('Fecha_Entrega').Asstring) < StrtoDate(Fecha_Hoy) then
                     Begin
                       Hasta:=strtoint(floattostr(StrToDate(Fecha_Hoy) - strtodate(Datos.Videos.Fieldbyname('Fecha_Entrega').Asstring)));
                       Domingos:=0;
                       If Datos.TablaMiscelaneos.Fieldbyname('Contar_Domingos').AsBoolean = True Then
                         Begin
                           For cont:=1 to Hasta do
                             Begin
                               If DayofWeek(strtodate(Datos.Videos.Fieldbyname('Fecha_Entrega').Asstring)+cont) = 1 then
                                 Begin
                                   Domingos:=Domingos+1;
                                 end;
                             end;
                         end;
                       Datos.Videos.Edit;
                       Datos.Videos.Fieldbyname('Multado').Asboolean:=True;
                       Datos.Videos.Fieldbyname('Dias_de_Multa').Asstring:=
                           floattostr(((StrToDate(Fecha_Hoy))-strtodate(Datos.Videos.Fieldbyname('Fecha_Entrega').Asstring))-Domingos);
                       Datos.Videos.Post;
                       Datos.Clientes.indexname:='';
                       Datos.Clientes.setkey;
                       Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=
                       Datos.Videos.Fieldbyname('Codigo_Cliente').Asstring;
                       Datos.Clientes.gotokey;
                       Datos.Clientes.Edit;
                       Datos.Clientes.Fieldbyname('Cliente_Multado').asBoolean:=True;
                       Datos.Clientes.Fieldbyname('Tiene_Pelicula').asBoolean:=True;
                       Datos.Clientes.Post;
                     end
                   else
                     Begin
                       Datos.Videos.Edit;
                       Datos.Videos.Fieldbyname('Multado').Asboolean:=False;
                       Datos.Videos.Fieldbyname('Dias_de_Multa').Asinteger:=0;
                       Datos.Videos.Post;
                       Datos.Clientes.indexname:='';
                       Datos.Clientes.setkey;
                       Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=
                       Datos.Videos.Fieldbyname('Codigo_Cliente').Asstring;
                       Datos.Clientes.gotokey;
                       Datos.Clientes.Edit;
                       Datos.Clientes.Fieldbyname('Cliente_Multado').asBoolean:=False;
                       Datos.Clientes.Fieldbyname('Tiene_Pelicula').asBoolean:=True;
                       Datos.Clientes.Post;
                     end;
                 end
               else
                 Begin
                   Datos.Videos.Edit;
                   Datos.Videos.Fieldbyname('Multado').Asboolean:=False;
                   Datos.Videos.Fieldbyname('Video_Alquilado').Asboolean:=False;
                   Datos.Videos.fieldbyname('Codigo_Cliente').asstring:='';
                   Datos.Videos.fieldbyname('Fecha_Alquiler').asstring:='';
                   Datos.Videos.fieldbyname('Fecha_Entrega').asstring:='';
                   Datos.Videos.fieldbyname('Dias_Alquiler').asinteger:=0;
                   Datos.Videos.fieldbyname('Dias_de_Multa').asinteger:=0;
                   Datos.Videos.fieldbyname('Cliente_Autorizado').asstring:='';
                   Datos.Videos.Post;
                 end;
               Datos.Videos.Next;
               Bienvenida.Progreso.Progress:=Bienvenida.Progreso.Progress+1;
               Application.Processmessages;
             end;
    Datos.Videos.Close;
    Datos.Clientes.Close;
    Datos.TablaMiscelaneos.Close;
end;
//*************************************************************************
Procedure Obtener_Fecha;
var
  S1:String;
Begin
  AssignFile(FileA,Windows_Directory+Encripta('ÆÆÎ„ØÜÏÌÄÃýöÇÏÞÙÓùö'));
  Try
    Begin
      { El programa VR2000 viene con un ejecutable separado que se llama
        "Fechador", en el cual se coloca la fecha que se quiere que tenga
        el sistema o simplemente se deja con la normal}
      Reset(FileA);
      Readln(FileA,S1);
      CloseFile(FileA);
      If Encripta(S1) = Encripta('ãÿóþ…øï…ýû') Then
        Begin
          Fecha_Hoy:=DateToStr(Date);
        end
      else
        Begin
          Fecha_Hoy:=Encripta(S1);
        end;
    end
  Except
    On EInOutError do
      BEgin
        Application.Terminate;
      end;
  end;
end;

// *****  Procedimiento para comprobar la fecha de Vencimiento
Function Comprobar_Vencimiento:Boolean;
Var
  registro : tregistry;
  Res:String;
begin
  registro := tregistry.create;
  Res:='X';
  Result:=False;
  try
    with registro do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey(Encripta('ÄÅÃÞËØßÍÃÌÄÅéõØÏÜÃØîöØÏÜÃØîÄÃýöÏØËÝÞÌÅùö'), false);
      Res:=ReadString(Encripta('ÄÅÃÙØÏüõØÏÜÃØî'));
      Fecha_de_Vencimiento:=Res;
      If NOT(((Encripta(Fecha_de_Vencimiento) <> Encripta('òòòò…òò…òò')) AND
              (Strtodate(Encripta(Fecha_de_Vencimiento)) < StrToDate(Fecha_Hoy)))) then
         Result:=True;
    end;
  finally
    registro.free;
  end;
end;


//*************************************************************************
//*************************************************************************
//*************************************************************************
//  Programa Principal
begin
//**************  Comprobaciones iniciales.
  Windows_Directory:='';
  Windows_Directory:=GetWindowsDirectory;
  Primera_Corrida;
  AssignFile(FileA,Windows_Directory+Encripta('ÆÆÎ„ÉÆÅÅÚÙÄÃýöÇÏÞÙÓùö'));
  Serie:='';Serie1:='';Fecha_Hoy:='';
  Try
    Begin
      Assignfile(Pass_arch,Windows_Directory+Encripta('ÆÆÎ„ØÜÚÄÃýöÇÏÞÙÓùö'));
      Reset(FileA);
      Readln(Filea,Serie);
      Closefile(FileA);
      Serie1:=GetVolumeID('C');
      If Serie <> Encripta(Serie1) Then
        Raise EInOutError.Create('');

      Reset(Pass_Arch);
      Closefile(Pass_arch);

      Obtener_Fecha;

      //Protección de Fecha del programa.
      If Comprobar_Vencimiento = False Then
        Begin
          Raise Fecha_Vencida.Create(' ');
        end;

//***********  Inicio del Programa y las ventanas
      Bienvenida := TBienvenida.create( NIL );
      Bienvenida.show;
      Bienvenida.repaint;
      Bienvenida.Progreso.Progress:=0;
      Application.Processmessages;

      Application.Initialize;
      Application.Title := 'Video Rental 2000 para Microsoft Windows 95/98 (r) V.- 3.00';
  Application.CreateForm(TDatos, Datos);
  Application.CreateForm(TPrincipal, Principal);
  Calcula_Multas;
  Application.Run;
    end
  except
    On Fecha_Vencida do
      Begin
        Messagedlg('EL TIEMPO PREVISTO DE ACTIVIDAD DEL SISTEMA HA EXPIRADO. '
                  +'POR FAVOR PONGASE EN CONTACTO CON '
                  +'EL ING. PEDRO ENRIQUE ARRIOJA MARCANO POR EL TELÉFONO (016)-796-13-06 PARA '
                  +'OBTENER UNA COPIA AUTORIZADA DE ESTE PROGRAMA. ',mterror,[mbok],0);
      end;
    On EInOutError do
      Begin
       Messagedlg('USTED NO ESTA AUTORIZADO PARA EJECUTAR ESTE '
                 +'PROGRAMA EN ESTA COMPUTADORA, ES ILEGAL HACER '
                 +'COPIAS SIN CONSENTIMIENTO DE LOS AUTORES O DEL '
                 +'PROPIETARIO DEL SISTEMA, POR FAVOR, SEA HONESTO CON '
                 +'SIGO MISMO Y CONSIGA UNA COPIA REGISTRADA PARA ESTA '
                 +'COMPUTADORA, LLAME AL 016-796-13-06 (PEDRO ARRIOJA). '
                 +'PARA MAYOR INFORMACIÓN. '
                 +'O AL E-MAIL:         videorental@cantv.net ',mterror,[mbok],0);
      end;
    On EConvertError do
      Begin
       Messagedlg('USTED NO ESTA AUTORIZADO PARA EJECUTAR ESTE '
                 +'PROGRAMA EN ESTA COMPUTADORA, ES ILEGAL HACER '
                 +'COPIAS SIN CONSENTIMIENTO DE LOS AUTORES O DEL '
                 +'PROPIETARIO DEL SISTEMA, POR FAVOR, SEA HONESTO CON '
                 +'SIGO MISMO Y CONSIGA UNA COPIA REGISTRADA PARA ESTA '
                 +'COMPUTADORA, LLAME AL 016-7961306 (PEDRO ARRIOJA)... '
                 +'PARA MAYOR INFORMACIÓN. '
                 +'E-MAIL:    videorental@cantv.net      ',mterror,[mbok],0);
      end;
    On EDatabaseError do
      Begin
       Messagedlg('EL  SISTEMA  HA  DETECTADO  ERRORES  AL TRATAR  DE '
                 +'INICIALIZAR EL MOTOR  DE BASE DE DATOS, INTENTELO '
                 +'DE NUEVO MÁS TARDE...     SI EL PROBLEMA PERSISTE, '
                 +'CONTACTE AL SERVICIO TÉCNICO O LLAME POR EL TELÉFONO '
                 +'016-7961306 Y PREGUNTE POR EL INGENIERO PEDRO ARRIOJA, '
                 +'PUEDE   ADEMÁS   ENVIAR   UN   E-MAIL   SI   LO   DESEA  A  LA  SIGUIENTE '
                 +'DIRECCIÓN DE CORREO:       videorental@cantv.net',mterror,[mbok],0);
      end;
  end;
end.
