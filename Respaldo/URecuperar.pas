unit URecuperar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZipMstr, ComCtrls, StdCtrls, Buttons, Mask, ToolEdit, Gauges, ExtCtrls,DbTables;

type
  Ficha = Record
      Fecha     : String[10];
      Hora      : String[20];
  end;
  
  TRecuperar = class(TForm)
    Bevel6: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
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
    GroupBox1: TGroupBox;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label34444: TLabel;
    Label3: TLabel;
    Progressbar1: TGauge;
    Progressbar2: TGauge;
    GroupBox2: TGroupBox;
    Ruta: TDirectoryEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Zipear: TAnimate;
    Bueno: TAnimate;
    Malo: TAnimate;
    ZipMaster1: TZipMaster;
    Base: TDatabase;
    SESION: TSession;
    procedure BitBtn4Click(Sender: TObject);
    Function  Encripta(X:String): String;
    procedure RutaChange(Sender: TObject);
    Function  Ruta_Datos(Alias:String;SESION:TSESSION):String;
    procedure BitBtn1Click(Sender: TObject);
    procedure ZipMaster1Message(Sender: TObject; ErrCode: Integer;
      Message: String);
    procedure ZipMaster1Progress(Sender: TObject; ProgrType: ProgressType;
      Filename: String; FileSize: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Recuperar: TRecuperar;
  InfoArch:TextFile;
  Data_Resp:Ficha;
  Error:Integer;
implementation

uses UConfirmar_Recuperacion;

{$R *.DFM}

Function TRecuperar.Encripta(X:String): String;
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

//   Esta Función devuelve la Ruta del alias que se le indique
Function TRecuperar.Ruta_Datos(Alias:String;SESION:TSESSION):String;
var
  AParams: TStringList;
begin
  AParams := TStringList.Create;
  SESION.GetAliasParams(Alias,AParams);
  Result := Copy(AParams.Strings[0],6,255);
end;

procedure TRecuperar.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TRecuperar.RutaChange(Sender: TObject);
begin
  Try
    If Ruta.Text[Length(Ruta.Text)] = '\' Then
       AssignFile(InfoArch,Ruta.Text+'INFO.CTR')
    else
      AssignFile(InfoArch,Ruta.Text+'\INFO.CTR');
    Reset(InfoArch);
    Readln(InfoArch,Data_Resp.Fecha);
    Data_Resp.Fecha:=Encripta(Data_Resp.Fecha);
    Readln(InfoArch,Data_Resp.Hora);
    Data_Resp.Hora:=Encripta(Data_Resp.Hora);
    CloseFile(InfoArch);
    BitBtn1.Enabled:=True;
  Except
    On EInOutError do
      Begin
          BitBtn1.Enabled:=False;
          Messagedlg('El Directorio Seleccionado no contiene ninguna información '
                    +'de un respaldo previamente realizado en el mismo, por favor, '
                    +'seleccione otro directorio del que recuperar los datos.',mtError,[mbok],0);
      end;
  end;
end;

procedure TRecuperar.BitBtn1Click(Sender: TObject);
begin
  Zipear.Visible:=FALSE;
  Zipear.Active:=FALSE;
  Malo.Visible:=FALSE;
  Malo.Active:=FALSE;
  Bueno.Visible:=FALSE;
  Bueno.Active:=FALSE;
  Confirmar_Recuperacion:=TConfirmar_Recuperacion.Create(Self);
  Confirmar_Recuperacion.Label5.Caption:=Data_Resp.Fecha;
  Confirmar_Recuperacion.Label7.Caption:=Data_Resp.Hora;
  Confirmar_Recuperacion.ShowModal;
  IF Confirmar_Recuperacion.ModalResult = MrYes Then
    Begin
      BitBtn1.Enabled:=False;
      BitBtn4.Enabled:=False;
      Confirmar_Recuperacion.Free;
      Confirmar_Recuperacion:=Nil;
      If Ruta.Text[Length(Ruta.Text)] = '\' Then
        ZipMaster1.ZipFileName:=Ruta.Text+'RESPALDO.ZIP'
      else
        ZipMaster1.ZipFileName:=Ruta.Text+'\RESPALDO.ZIP';
      ProgressBar2.MaxValue:=Zipmaster1.ZipContents.Count;
      Progressbar2.MinValue:=0;
      Progressbar2.Progress:=Progressbar2.MinValue;
      BitBtn1.Enabled:=False;
      Zipmaster1.FSpecArgs.Clear;
      with ZipMaster1 do
        begin
          Zipear.Visible:=True;
          Zipear.Active:=True;
          ExtrBaseDir:=Ruta_Datos('VRData',Sesion);
          Verbose:=True;
          Trace:=False;
          ExtrOptions:=[];
          ExtrOptions:=ExtrOptions+[ExtrOverwrite];
          FSpecArgs.Clear;
          try
            Extract;
            If Error = 0 Then
              Begin
                Progressbar2.Progress:=Progressbar2.MinValue;
                Zipear.Visible:=FALSE;
                Zipear.Active:=FALSE;
                Bueno.Visible:=True;
                Bueno.Active:=True;
                Messagedlg('La Recuperación de los Datos del Sistema se ha efectuado '
                          +'exitosamente del directorio que ha seleccionado...',mtInformation,[mbok],0);
                BitBtn1.Enabled:=True;
                BitBtn4.Enabled:=True;
                Ruta.Enabled:=True;
              end
          except
            ShowMessage('Error Fatal');
          end;
        end;
      Progressbar2.Progress:=Progressbar2.MinValue;
      BitBtn1.Enabled:=True;
    end;
end;

procedure TRecuperar.ZipMaster1Message(Sender: TObject; ErrCode: Integer;
  Message: String);
begin
   If ErrCode > 0 Then
      Error:=ErrCode;
end;

procedure TRecuperar.ZipMaster1Progress(Sender: TObject;
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

procedure TRecuperar.FormShow(Sender: TObject);
var
  Ruta_Programa:String;
begin
  Ruta_Programa:=ExtractFilePath(Application.ExeName);
  Zipear.FileName:=Ruta_Programa+'Imagenes\Unzip.avi';
  Malo.FileName:=Ruta_Programa+'Imagenes\Malo.avi';
  Bueno.FileName:=Ruta_Programa+'Imagenes\Bueno.avi';
  Label3.Caption:='';
  Progressbar1.Progress:=0;
  Progressbar2.Progress:=0;
  BitBtn1.Enabled:=True;
  BitBtn4.Enabled:=True;
  Error:=0;
end;
end.
