unit uacerca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Menus, Registry;

type
  TAcerca = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Bevel2: TBevel;
    PopupMenu1: TPopupMenu;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Label11: TLabel;
    Bevel12: TBevel;
    Label12: TLabel;
    Memo2: TMemo;
    Label13: TLabel;
    Label14: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure Lee_Registro;
    function  ObtieneVersion(Form: TForm):string;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Acerca: TAcerca;
  Lee1:String;
  Dias:Real;

implementation

uses uprincipal;

{$R *.DFM}

//***** FunciÛn de Encriptado de clave para copia
Function Encripta(X:String): String; Far; External 'Control.dll';

procedure TAcerca.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

Procedure TAcerca.Lee_Registro;
Var
  registro : tregistry;
begin
  registro := tregistry.create;
  try
    with registro do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey(Encripta('ƒ≈√ﬁÀÿﬂÕ√Ãƒ≈Èıÿœ‹√ÿÓˆÿœ‹√ÿÓƒ√˝ˆœÿÀ›ﬁÃ≈˘ˆ'), false);
      Lee1:=ReadString(Encripta('Ÿﬁÿ≈˙ıﬁ⁄Ê'));
      Label14.Caption:=Encripta(Lee1);
      Lee1:=ReadString(Encripta('Ÿﬁÿ≈˙ı«≈È'));
      Label13.Caption:=Encripta(Lee1);
      Lee1:=ReadString(Encripta('ƒ≈√Ÿÿœ¸ıÿœ‹√ÿÓ'));
      If Lee1 <> 'ÚÚÚÚÖÚÚÖÚÚ' Then
        Begin
          If Principal.Fecha_Total = Encripta('„ˇÛ˛Ö¯ÔÖ˝˚') Then
            Dias:=StrToDate(Encripta(Lee1))-Date
          else
            Dias:=StrToDate(Encripta(Lee1))-StrToDate(Principal.Fecha_Total);
          Acerca.Caption:=Acerca.Caption+'   ---   Video Rental 2000 Æ Vence en: '+FloatToStr(Dias)+' DÌas';
        end;  
    end;
  finally
    registro.free;
  end;
end;

function  TAcerca.ObtieneVersion(Form: TForm):string;
var
 Size, Size2: DWord;
 Pt, Pt2: Pointer;
begin
  Size := GetFileVersionInfoSize(PChar (ParamStr (0)), Size2);
  if Size > 0 then
  begin
    GetMem (Pt, Size);
    try
       GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
       VerQueryValue (Pt, '\', Pt2, Size2);
       with TVSFixedFileInfo (Pt2^) do
       begin
         Result:= IntToStr (HiWord (dwFileVersionMS)) +'.'
         + IntToStr (LoWord (dwFileVersionMS)) + '.'
         + IntToStr (HiWord (dwFileVersionLS)) + '.'
         + IntToStr (LoWord (dwFileVersionLS));
      end;
    finally
      FreeMem (Pt);
    end;
  end;
end;

procedure TAcerca.FormActivate(Sender: TObject);
var
  MS: TMemoryStatus;
begin
{ Para el manejo de la versiÛn del programa, se ha convenido, utilizar el formato
  y la numeraciÛn que a continuaciÛn se presenta:

  PrimerNumero.SegundoNumero.Tercernumero.CuartoNumero

  en donde, las definiciones de cada numero est·n como se especifica a continuaciÛn:
  PrimerNumero: VersiÛn Mayor (Grandes Modificaciones a la estructura del programa).
                               Nuevos MÛdulos, eliminaciones de mÛdulos, etc.
  SegundoNumero: VersiÛn Menor (Modificaciones menores).
                               Modificaciones a pantallas ya hechas.
  Tercernumero: Lanzamiento (Veces que el programa es distribuido).
  CuartoNumero: Construidas (Veces que los mÛdulos son contruidos (BUILD)
                            Esto es la compilaciÛn de todas las unidades declaradas.
}
  GlobalMemoryStatus(MS);
  Label11.Caption:=ObtieneVersion(Principal);
  Label1.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  Label2.Caption := Format('%d %%', [MS.dwMemoryLoad]);
  Label3.caption := IntToStr((Disksize(0) div 1024) div 1024) + ' Mbytes.';
  Label4.caption := IntToStr((DiskFree(0) div 1024) div 1024) + ' Mbytes.';
  Label5.Caption := Inttostr(((Disksize(0) div 1024) div 1024)-((DiskFree(0) div 1024) div 1024))+ ' Mbytes.';
//  Principal.ASIS.BringToFront;
//  Principal.ASIS.GestureAt(Acerca.Left,Acerca.Top);
end;

procedure TAcerca.FormShow(Sender: TObject);
begin
  Lee_Registro;
end;

end.
