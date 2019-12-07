unit UGenerar_Codigo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Math;

type
  TGenerar_Codigo = class(TForm)
    REG: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Bevel5: TBevel;
    Edit1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    Procedure Generar;
    Function  Encripta(X:String): String;
    procedure REGClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Generar_Codigo: TGenerar_Codigo;
  VRPWRD:String;
  Tempo4,Tempo3,Tempo2,Tempo1:String;

implementation

{$R *.DFM}

Function TGenerar_Codigo.Encripta(X:String): String;
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

Procedure TGenerar_Codigo.Generar;
Var
  I,X,Cont:Integer;
  Esta:Boolean;
  Diferencia:Real;
Begin
  Diferencia:=0;
  VRPWRD:='';
  Tempo4:='';
  Tempo3:='';
  Tempo2:='';
  Tempo1:=Edit1.Text;
// Conversión Inicial de la Cadena a Números
  For Cont:=1 to Length(Tempo1) do
    Begin
      If Tempo1[Cont] = '-' Then
          Tempo2:=Tempo2+'-'
      else
        Begin
          Try
            Tempo2:=Tempo2+IntToStr(StrToInt(Tempo1[Cont]));
          Except
            On EConvertError do Tempo2:=Tempo2+IntToStr(Ord(Tempo1[Cont]));
          end
        end;
    end;

// Utilización de Senos para generación de Claves
  VRPWRD:='';
  For Cont:=1 to Length(Tempo2) do
    Begin
      If Tempo2[Cont] = '-' Then
         VRPWRD:=VRPWRD+'-'
      else
        Begin
          Diferencia:=Diferencia+Sin(StrToInt(Tempo2[Cont]));
          Tempo3:=FloatToStr(Diferencia);
          If Tempo3 <> '0' Then
            Begin
              Esta:=False;
              X:=1;
              While Not Esta do
                Begin
                  If Tempo3[X]=',' Then
                    Begin
                      Esta:=True;
                      VRPWRD:=VRPWRD+Tempo3[X+1];
                    end
                  else
                      X:=X+1
                end;
            end
          else
            Begin
              VRPWRD:=VRPWRD+'0';
            end
        end;
    end;

// Utilización de Senos para generación de Claves
  VRPWRD:=VRPWRD+'-';
  For Cont:=1 to Length(Tempo2) do
    Begin
      If Tempo2[Cont] = '-' Then
         VRPWRD:=VRPWRD+'-'
      else
        Begin
          Diferencia:=Diferencia+Cos(StrToInt(Tempo2[Cont]));
          Tempo3:=FloatToStr(Diferencia);
          If Tempo3 <> '0' Then
            Begin
              Esta:=False;
              X:=1;
              While Not Esta do
                Begin
                  If Tempo3[X]=',' Then
                    Begin
                      Esta:=True;
                      VRPWRD:=VRPWRD+Tempo3[X+1];
                    end
                  else
                      X:=X+1
                end;
            end
          else
            Begin
              VRPWRD:=VRPWRD+'0';
            end
        end;
    end;
    Label4.Caption:=VRPWRD;
  For I:=1 to Length(VRPWRD) do
     Begin
       Tempo4:=Tempo4+VRPWRD[(Length(VRPWRD)-I)+1];
     end;
  Label2.Caption:=Tempo4;
end;

procedure TGenerar_Codigo.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TGenerar_Codigo.Edit3Change(Sender: TObject);
begin
  If (Edit1.Text <> '') Then REG.Enabled:=True;
end;

procedure TGenerar_Codigo.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
        If (Edit1.Text <> '') Then Generar;
      Key:=#0;
    end;
end;

procedure TGenerar_Codigo.REGClick(Sender: TObject);
begin
  Generar;
end;

end.
