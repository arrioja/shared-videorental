program Registrar;

uses
  Sharemem,  Forms,  Registry,  Windows,  SysUtils,  Dialogs,
  uconfirmar in 'uconfirmar.pas' {Confirmar},
  URegistro in 'URegistro.pas' {Registro};

{$R *.RES}

Type
  Fecha_NO_Vencida = Class(Exception);


//*************************************************************************
//************   Variables Generales de Arranque del Sistema   ************
Var
  FileA,Pass_Arch: TextFile;
  Fecha_Hoy,Serie1,Serie:String;
  Fecha_De_Vencimiento:String;
  Windows_Directory:String;

//**********************   Funciones y Procedimientos   *******************
//*************************************************************************
//***** Función de Encriptado de clave para copia
Function Encripta(X:String): String;
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
Begin
//**************  Comprobaciones iniciales.
  Windows_Directory:='';
  Windows_Directory:=GetWindowsDirectory;
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
      If Comprobar_Vencimiento = True Then
        Begin
          Raise Fecha_NO_Vencida.Create(' ');
        end;

      Application.Initialize;
      Application.Title := 'Registro de Video Rental 2000 ® ';
      Application.CreateForm(TRegistro, Registro);
  Application.Run;
    end
  except
    On Fecha_NO_Vencida do
      Begin
        Messagedlg('ESTE PROGRAMA DE REGISTRO SÓLO CORRERÁ SI YA SE HA '
                  +'VENCIDO SU VIDEO RENTAL 2000, POR LOS MOMENTOS, '
                  +'TODAVÍA PUEDE REGISTRAR EL MISMO A TRAVÉS DE LA OPCIÓN DE '
                  +'REGISTRO DEL MENU DE AYUDA.  << SALIENDO DEL PROGRAMA >>',mterror,[mbok],0);
      end;
    On EInOutError do
      Begin
       Messagedlg('USTED NO ESTA AUTORIZADO PARA EJECUTAR ESTE '
                 +'PROGRAMA EN ESTA COMPUTADORA, ES ILEGAL HACER '
                 +'COPIAS SIN CONSENTIMIENTO DE LOS AUTORES O DEL '
                 +'PROPIETARIO DEL SISTEMA, POR FAVOR, SEA HONESTO CON '
                 +'SIGO MISMO Y CONSIGA UNA COPIA REGISTRADA PARA ESTA '
                 +'COMPUTADORA, LLAME AL 016-7961306 (PEDRO ARRIOJA)... '
                 +'PARA MAYOR INFORMACIÓN.  << SALIENDO DEL PROGRAMA >>',mterror,[mbok],0);
      end;
    On EConvertError do
      Begin
       Messagedlg('USTED NO ESTA AUTORIZADO PARA EJECUTAR ESTE '
                 +'PROGRAMA EN ESTA COMPUTADORA, ES ILEGAL HACER '
                 +'COPIAS SIN CONSENTIMIENTO DE LOS AUTORES O DEL '
                 +'PROPIETARIO DEL SISTEMA, POR FAVOR, SEA HONESTO CON '
                 +'SIGO MISMO Y CONSIGA UNA COPIA REGISTRADA PARA ESTA '
                 +'COMPUTADORA, LLAME AL 016-7961306 (PEDRO ARRIOJA)... '
                 +'PARA MAYOR INFORMACIÓN.  << SALIENDO DEL PROGRAMA >>',mterror,[mbok],0);
      end;
  end;
end.














