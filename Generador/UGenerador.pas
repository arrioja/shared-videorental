unit UGenerador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Math, Registry, Menus;

type
  TRegistro = class(TForm)
    SpeedButton1: TSpeedButton;
    Bevel5: TBevel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    PopupMenu1: TPopupMenu;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    Procedure Calcula_PWRD_Pago_1;
    Procedure Calcula_PWRD_Pago_2;
    Procedure Calcula_PWRD_Pago_3;
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Registro: TRegistro;
  VRPWRD:String;
  Tempo4,Tempo3,Tempo2,Tempo1:String;
  Pago_1,Pago_2,Pago_3:String;

implementation

{$R *.DFM}

// Cálculo del primer pago de las tres cuotas...
Procedure TRegistro.Calcula_PWRD_Pago_1;
Var
  I,X,Cont:Integer;
  Esta:Boolean;
  Diferencia:Real;
Begin
  Diferencia:=0;
  VRPWRD:='';
  Tempo3:='';
  Tempo2:=Edit6.Text;
// Utilización de una función para generación de Claves
  VRPWRD:='';
  For Cont:=1 to Length(Tempo2) do
    Begin
      If Tempo2[Cont] = '-' Then
         VRPWRD:=VRPWRD+'-'
      else
        Begin
          Diferencia:=Diferencia+Sin(StrToInt(Tempo2[Cont]));
          Tempo3:=FloatToStr(Diferencia);
          If Length(Tempo3) = 1 Then
            Begin
              Tempo3:='0,'+Tempo3;
            end;
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
                      X:=X+1;
                end;
            end
          else
            Begin
              VRPWRD:=VRPWRD+'0';
            end
        end;
    end;
  For I:=1 to Length(VRPWRD) do
     Begin
       Pago_1:=Pago_1+VRPWRD[(Length(VRPWRD)-I)+1];
     end;
end;


// Cálculo del segundo pago de las tres cuotas...
Procedure TRegistro.Calcula_PWRD_Pago_2;
Var
  I,X,Cont:Integer;
  Esta:Boolean;
  Diferencia:Real;
Begin
  Diferencia:=0;
  VRPWRD:='';
  Tempo3:='';
  Tempo2:=Edit6.Text;

// Utilización de una Función para generación de Claves
  For Cont:=1 to Length(Tempo2) do
    Begin
      If Tempo2[Cont] = '-' Then
         VRPWRD:=VRPWRD+'-'
      else
        Begin
          Diferencia:=Diferencia+Cos(StrToInt(Tempo2[Cont]));
          Tempo3:=FloatToStr(Diferencia);
          If Length(Tempo3) = 1 Then
            Begin
              Tempo3:='0,'+Tempo3;
            end;
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
  For I:=1 to Length(VRPWRD) do
     Begin
       Pago_2:=Pago_2+VRPWRD[(Length(VRPWRD)-I)+1];
     end;
end;


// Cálculo del tercer pago de las tres cuotas...
Procedure TRegistro.Calcula_PWRD_Pago_3;
Var
  I,X,Cont:Integer;
  Esta:Boolean;
  Diferencia:Real;
Begin
  Diferencia:=0;
  VRPWRD:='';
  Tempo3:='';
  Tempo2:=Edit6.Text;
// Utilización de una Función para generación de Claves
  For Cont:=1 to Length(Tempo2) do
    Begin
      If Tempo2[Cont] = '-' Then
         VRPWRD:=VRPWRD+'-'
      else
        Begin
          Diferencia:=Diferencia+Tan(StrToInt(Tempo2[Cont]));
          Tempo3:=FloatToStr(Diferencia);
          If Length(Tempo3) = 1 Then
            Begin
              Tempo3:='0,'+Tempo3;
            end;
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
  For I:=1 to Length(VRPWRD) do
     Begin
       Pago_3:=Pago_3+VRPWRD[(Length(VRPWRD)-I)+1];
     end;
end;

procedure TRegistro.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TRegistro.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit3.SetFocus;
      Key:=#0;
    end;
end;

procedure TRegistro.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Pago_1:='';Pago_2:='';Pago_3:='';
      Calcula_PWRD_Pago_1;
      Calcula_PWRD_Pago_2;
      Calcula_PWRD_Pago_3;
      Edit3.Text:='';Edit4.Text:='';Edit5.Text:='';
      Edit3.Text:=Pago_1;Edit4.Text:=Pago_2;Edit5.Text:=Pago_3;
    end;
end;

end.
