unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  LCARSButton, LCARSEdge, LCARSCheckBox, LCARSRadioButton, LCARSGauge,
  ExtCtrls, StdCtrls, Mask, Buttons;

type
  TPrincipal = class(TForm)
    LCARSEdge1: TLCARSEdge;
    LCARSEdge2: TLCARSEdge;
    LCARSEdge3: TLCARSEdge;
    LCARSEdge4: TLCARSEdge;
    C2: TLCARSRadioButton;
    C1: TLCARSRadioButton;
    Progreso: TLCARSGauge;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    B1: TBitBtn;
    B2: TBitBtn;
    C3: TLCARSRadioButton;
    Function Encripta(X:String): String;
    procedure B1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Function  Chequear_Autorizacion:Boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;
  FileA:TextFile;
  Serial,Serial1:String;
  Fecha:String;

implementation

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


Function TPrincipal.Chequear_Autorizacion:Boolean;
Begin
  Try
    Begin
      Reset(FileA);
      Readln(FileA,Serial1);
      CloseFile(FileA);
      Fecha:=Encripta(Serial1);
      If Fecha = Encripta('ãÿóþ…øï…ýû') Then
        Fecha:=' NORMAL';
      Result:=True;
    end
  Except
    On EInOutError do
      BEgin
        Result:=False;
      end;
  end;
end;



procedure TPrincipal.B1Click(Sender: TObject);
var
  X:Integer;
  Autorizado:Boolean;
begin
 Try
  Autorizado:=False;
  C1.Enabled:=False;
  C2.Enabled:=False;
  C3.Enabled:=False;
  B1.Enabled:=False;
  MaskEdit1.Enabled:=False;
  B2.Enabled:=False;
  IF C1.Checked = True Then
    Begin
      Autorizado:=Chequear_Autorizacion;
    end;
  IF C2.Checked = True Then
    Begin
      StrToDate(MaskEdit1.text);
      Serial1:=MaskEdit1.text;
      Serial:=Encripta(Serial1);
      Rewrite(FileA);
      Writeln(FileA,Serial);
      CloseFile(FileA);
      Autorizado:=True;
    end;
  IF C3.Checked = True Then
    Begin
      MaskEdit1.Text:='';
      Serial1:=Encripta('ãÿóþ…øï…ýû');
      Serial:=Encripta(Serial1);
      Rewrite(FileA);
      Writeln(FileA,Serial);
      CloseFile(FileA);
      Autorizado:=True;
    end;
  For X:=1 to 100 do
    Begin
      Progreso.Progress:=X;
      Application.Processmessages;
      Sleep(50);
    end;
  Progreso.Progress:=0;

  IF C1.Checked = True Then
    Begin
      If Autorizado = True Then
         Label3.Caption:=Fecha
      else
         Label3.Caption:='SIN FECHA';
    end;
  IF C2.Checked = True Then
    Begin
      If Autorizado = True Then
        Showmessage('La Fecha de Video Rental 2000 se ha cambiado satisfactoriamente');
    end;
  IF C3.Checked = True Then
    Begin
      If Autorizado = True Then
        Begin
          Label3.Caption:='NORMAL';
          Showmessage('De ahora en adelante Vídeo Rental 2000 utilizará la fecha '+
                      'normal del computador, es decir, la fecha del programa será '+
                      'la misma que la del computador, si desea deshabilitar '+
                      'esta función y hacer que el sistema tenga sólo la fecha que '+
                      'usted desee, deberá utilizar el "FECHADOR" y colocar la fecha '+
                      'que desee.');
        end;
    end;
  C1.Enabled:=True;
  C2.Enabled:=True;
  C3.Enabled:=True;
  B1.Enabled:=True;
  B2.Enabled:=True;
  MaskEdit1.Enabled:=True;
 except
   On EConvertError do
     Begin
       C1.Enabled:=True;
       C2.Enabled:=True;
       C3.Enabled:=True;
       B1.Enabled:=True;
       B2.Enabled:=True;
       MaskEdit1.Enabled:=True;
       Showmessage('ERROR, la Fecha es Inválida');
     end;
 end;
end;

procedure TPrincipal.C1Click(Sender: TObject);
begin
  IF C1.Checked = True Then
    Begin
      C1.Font.Color:=ClBlack;
      Maskedit1.Enabled:=False;
      Maskedit1.Text:='';
      Label3.Caption:='';
    end
  else
    C1.Font.Color:=ClWhite;
  IF C2.Checked = True Then
    Begin
      C2.Font.Color:=ClBlack;
      Maskedit1.Enabled:=True;
      Label3.Caption:='';
    end
  else
    C2.Font.Color:=ClWhite;
  IF C3.Checked = True Then
    Begin
      C3.Font.Color:=ClBlack;
      Maskedit1.Enabled:=False;
      MaskEdit1.Text:='';
      Label3.Caption:='';
    end
  else
    C3.Font.Color:=ClWhite;
end;

procedure TPrincipal.B2Click(Sender: TObject);
begin
  Application.Terminate;
end;

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

procedure TPrincipal.FormCreate(Sender: TObject);
Var
  Windows_Directory:String;
begin
  Windows_Directory:='';
  Windows_Directory:=GetWindowsDirectory;
  AssignFile(FileA,Windows_Directory+Encripta('ÆÆÎ„ØÜÏÌÄÃýöÇÏÞÙÓùö'));
  Label3.Caption:='';
end;

end.
