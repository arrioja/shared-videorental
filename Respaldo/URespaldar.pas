Unit URespaldar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, FileCtrl, ZipMstr, Mask, ToolEdit,
  Gauges,DbTables, MDIWallp, DB;

type
  TRespaldar = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    GroupBox2: TGroupBox;
    Bevel3: TBevel;
    Label34444: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Bevel4: TBevel;
    ZipMaster1: TZipMaster;
    Ruta: TDirectoryEdit;
    Progressbar1: TGauge;
    Progressbar2: TGauge;
    Zipear: TAnimate;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bueno: TAnimate;
    Malo: TAnimate;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel8: TBevel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    CheckBox1: TCheckBox;
    Base: TDatabase;
    SESION: TSession;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ZipMaster1Progress(Sender: TObject; ProgrType: ProgressType;
      Filename: String; FileSize: Integer);
    procedure Seleccionar_Todo_en(RutaArch:string );
    Function  Cuenta_Archivos_en(RutaArch:string):Integer;
    procedure FormCreate(Sender: TObject);
    procedure ZipMaster1Message(Sender: TObject; ErrCode: Integer;
      Message: String);
    procedure CheckBox1Click(Sender: TObject);
    Function  Encripta(X:String): String;
    Function  Ruta_Datos(Alias:String;SESION:TSESSION):String;
    procedure RutaAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Nuevo_Dir,Ruta_Respaldo:String;
  Respaldar: TRespaldar;
  Error,Numero_de_Archivos_a_Respaldar:Integer;
  InfoArch:TextFile;
  Nuevo_Directorio:Boolean;

implementation

{$R *.DFM}
// Funciones de Control.Dll
//   Esta Funci�n devuelve la Ruta del alias que se le indique
Function TRespaldar.Ruta_Datos(Alias:String;SESION:TSESSION):String;
var
  AParams: TStringList;
begin
  AParams := TStringList.Create;
  SESION.GetAliasParams(Alias,AParams);
  Result := Copy(AParams.Strings[0],6,255);
end;

Function TRespaldar.Encripta(X:String): String;
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

procedure TRespaldar.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TRespaldar.FormShow(Sender: TObject);
var
  Ruta_Programa:String;
begin
  Nuevo_Directorio:=False;
  Ruta_Programa:=ExtractFilePath(Application.ExeName);
  Zipear.FileName:=Ruta_Programa+'Imagenes\Zip.avi';
  Malo.FileName:=Ruta_Programa+'Imagenes\Malo.avi';
  Bueno.FileName:=Ruta_Programa+'Imagenes\Bueno.avi';
  Label3.Caption:='';
  Progressbar1.Progress:=0;
  Progressbar2.Progress:=0;
  BitBtn1.Enabled:=True;
  BitBtn4.Enabled:=True;
  Error:=0;
end;

procedure TRespaldar.BitBtn1Click(Sender: TObject);
var
  Dir:String;
begin
  Zipear.Visible:=FALSE;
  Zipear.Active:=FALSE;
  Malo.Visible:=FALSE;
  Malo.Active:=FALSE;
  Bueno.Visible:=FALSE;
  Bueno.Active:=FALSE;
  Dir:=Ruta_Datos('VRData',Sesion);
  // Para contar cuantos archivos existen...
  ProgressBar2.MaxValue:=Cuenta_Archivos_en(Dir);
  Progressbar2.MinValue:=0;
  Progressbar2.Progress:=Progressbar2.MinValue;
  BitBtn1.Enabled:=False;
  BitBtn4.Enabled:=False;
  CheckBox1.Enabled:=False;
  Ruta.Enabled:=False;
  If Nuevo_Directorio = True Then
    Begin
      If Ruta_Respaldo[Length(Ruta_Respaldo)] = '\' Then
        CreateDir(Ruta_Respaldo+Nuevo_Dir)
      else
        CreateDir(Ruta_Respaldo+'\'+Nuevo_Dir);
    end;
  If Ruta.Text[Length(Ruta.Text)] = '\' Then
    ZipMaster1.ZipFileName:=Ruta.Text+'RESPALDO.ZIP'
  else
    ZipMaster1.ZipFileName:=Ruta.Text+'\RESPALDO.ZIP';
   with ZipMaster1 do
    begin
      Verbose:=True;
      Trace:=False;
      FSpecArgs.Clear;
      Seleccionar_Todo_en(Dir);
      Zipear.Visible:=True;
      Zipear.Active:=True;
      If Ruta.Text[Length(Ruta.Text)] = '\' Then
        Deletefile(Ruta.Text+'RESPALDO.ZIP')
      else
        Deletefile(Ruta.Text+'\RESPALDO.ZIP');
      Add;
      If Error = 0 Then
        Begin
          Progressbar2.Progress:=Progressbar2.MinValue;
          Zipear.Visible:=FALSE;
          Zipear.Active:=FALSE;
          Bueno.Visible:=True;
          Bueno.Active:=True;
          If Ruta.Text[Length(Ruta.Text)] = '\' Then
            AssignFile(InfoArch,Ruta.Text+'INFO.CTR')
          else
           AssignFile(InfoArch,Ruta.Text+'\INFO.CTR');
          Rewrite(InfoArch);
          Writeln(InfoArch,Encripta(DateToStr(Date)));
          Writeln(InfoArch,Encripta(TimeToStr(Time)));
          CloseFile(InfoArch);
          Messagedlg('El Respaldo de los Datos del Sistema se ha efectuado '
                    +'exitosamente en el directorio que ha seleccionado, '
                    +'puede recuperar estos datos en cualquier momento.',mtInformation,[mbok],0);
          BitBtn1.Enabled:=True;
          BitBtn4.Enabled:=True;
          CheckBox1.Enabled:=True;
          Ruta.Enabled:=True;
        end
      else
        Begin
          Zipear.Visible:=FALSE;
          Zipear.Active:=FALSE;
          Malo.Visible:=True;
          Malo.Active:=True;
          Messagedlg('ERROR: El Respaldo NO se ha podido ejecutar Satisfactoriamente, '
                    +'compruebe que el disco en el que desea realizar el respaldo '
                    +'tenga suficiente espacio, que haya un disco en la unidad seleccionada '
                    +'que el disco no tenga errores, que el mismo no se encuentre protegido '
                    +'contra escritura, e int�ntelo de nuevo, si el problema persiste, '
                    +'por favor comun�quese con el 016-7961306 (Pedro Arrioja) '
                    +'para solventar esta situaci�n inmediatamente.',mterror,[mbok],0);
          BitBtn1.Enabled:=True;
          BitBtn4.Enabled:=True;
          Ruta.Enabled:=True;
        end;
    end;
end;

// Incluye los archivos en la lista de archivos a Respaldar en
// el componente ZipMaster...
Procedure TRespaldar.Seleccionar_Todo_en(RutaArch:string);
var
  Busqueda: TSearchRec;
  NumArch: integer;
begin
  NumArch:=FindFirst(RutaArch + '\*.*', faAnyFile, Busqueda);
  while NumArch=0 do
    begin
      if Busqueda.Attr <> faDirectory then
        Begin
          ZipMaster1.FSpecArgs.Add(RutaArch+'\'+Busqueda.Name);
          Application.Processmessages;
        end;
      NumArch:=FindNext(Busqueda);
    end;
  FindClose(Busqueda);
end;

// Cuenta los archivos en la Ruta del Respaldo para saber cual es
// el maximo para la barra de progreso...
Function TRespaldar.Cuenta_Archivos_en(RutaArch:string):Integer;
var
  Busqueda: TSearchRec;
  NumArch: integer;
begin
  Result:=0;
  NumArch:=FindFirst(RutaArch + '\*.*', faAnyFile, Busqueda);
  while NumArch=0 do
    begin
      if Busqueda.Attr <> faDirectory then
        Begin
          Result:=Result+1;
          Application.Processmessages;
        end;
      NumArch:=FindNext(Busqueda);
    end;
  FindClose(Busqueda);
end;

procedure TRespaldar.ZipMaster1Progress(Sender: TObject;
  ProgrType: ProgressType; Filename: String; FileSize: Integer);
begin
   if ProgrType = NewFile then
   begin
      Progressbar2.Progress:=Progressbar2.Progress+1;
      Label3.Caption:=FileName;
      with ProgressBar1 do
      begin
         minValue:=1;
         maxValue:=10;
         Progress:=MinValue;
         if (FileSize div 32768) > 1 then
            MaxValue := FileSize div 32768  { Numero total de pasos }
         else
            MaxValue := 1;
         if (FileSize < 32768) then
            Progress:=Maxvalue;
      end;
   end;

   if ProgrType = ProgressUpdate then
   begin
      with ProgressBar1 do
         if Progress < MaxValue then
            Progress:=Progress+1;
   end;

   if ProgrType = EndOfBatch then
   begin
      { reset a la barra de progreso y el label del archivo }
      Label3.Caption:='';
      with ProgressBar1 do
      begin
         MinValue:=1;
         MaxValue:=10;
         Progress:=MinValue;
      end;
   end;
   Application.ProcessMessages;
end;

procedure TRespaldar.FormCreate(Sender: TObject);
begin
  Numero_de_Archivos_a_Respaldar:=0;
end;

procedure TRespaldar.ZipMaster1Message(Sender: TObject; ErrCode: Integer;
  Message: String);
begin
   If ErrCode > 0 Then
      Error:=ErrCode;
end;

procedure TRespaldar.CheckBox1Click(Sender: TObject);
Var
  Fe:String;
begin
  If CheckBox1.Checked = True Then
    Begin
      Fe:=DateToStr(Date);
      Ruta_Respaldo:=Ruta.Text;
      If Ruta.Text[Length(Ruta.Text)] = '\' Then
        Ruta.Text:=Ruta.Text+Fe[1]+Fe[2]+'-'+Fe[4]+Fe[5]+'-'+Fe[7]+Fe[8]+Fe[9]+Fe[10]
      else
        Ruta.Text:=Ruta.Text+'\'+Fe[1]+Fe[2]+'-'+Fe[4]+Fe[5]+'-'+Fe[7]+Fe[8]+Fe[9]+Fe[10];
      Nuevo_Directorio:=True;
      Nuevo_Dir:=Fe[1]+Fe[2]+'-'+Fe[4]+Fe[5]+'-'+Fe[7]+Fe[8]+Fe[9]+Fe[10];
    end
  else
    Begin
      Ruta.Text:=Ruta_Respaldo;
      Nuevo_Directorio:=False;
    end;
end;

procedure TRespaldar.RutaAfterDialog(Sender: TObject; var Name: String;
  var Action: Boolean);
begin
  If Action = True Then
    Begin
      CheckBox1.Checked:=False;
      Nuevo_Directorio:=False;
      Nuevo_Dir:='';
      Ruta_Respaldo:=Ruta.Text;
    end
end;

end.