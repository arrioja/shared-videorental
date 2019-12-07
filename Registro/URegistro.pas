unit URegistro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Math, Registry;

type
  TRegistro = class(TForm)
    REG: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Bevel5: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    REG2: TSpeedButton;
    REG3: TSpeedButton;
    function GetVolumeID(DriveChar: Char): String;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    Procedure Calcula_PWRD_Pago_1;
    Procedure Calcula_PWRD_Pago_2;
    Procedure Calcula_PWRD_Pago_3;
    procedure REGClick(Sender: TObject);
    Function  Encripta(X:String): String;
    procedure REG2Click(Sender: TObject);
    procedure REG3Click(Sender: TObject);
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

uses uconfirmar;

{$R *.DFM}

Function TRegistro.Encripta(X:String): String;
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

function TRegistro.GetVolumeID(DriveChar: Char): String;
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


// C·lculo del primer pago de las tres cuotas...
Procedure TRegistro.Calcula_PWRD_Pago_1;
Var
  I,X,Cont:Integer;
  Esta:Boolean;
  Diferencia:Real;
Begin
  Diferencia:=0;
  VRPWRD:='';
  Tempo3:='';
  Tempo2:='';
  Tempo1:=Label6.Caption;
// ConversiÛn Inicial de la Cadena a N˙meros
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
  Label5.Caption:=Tempo2;

// UtilizaciÛn de una funciÛn para generaciÛn de Claves
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
  For I:=1 to Length(VRPWRD) do
     Begin
       Pago_1:=Pago_1+VRPWRD[(Length(VRPWRD)-I)+1];
     end;
end;


// C·lculo del segundo pago de las tres cuotas...
Procedure TRegistro.Calcula_PWRD_Pago_2;
Var
  I,X,Cont:Integer;
  Esta:Boolean;
  Diferencia:Real;
Begin
  Diferencia:=0;
  VRPWRD:='';
  Tempo3:='';
  Tempo2:='';
  Tempo1:=Label6.Caption;
// ConversiÛn Inicial de la Cadena a N˙meros
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
  Label5.Caption:=Tempo2;

// UtilizaciÛn de una FunciÛn para generaciÛn de Claves
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
  For I:=1 to Length(VRPWRD) do
     Begin
       Pago_2:=Pago_2+VRPWRD[(Length(VRPWRD)-I)+1];
     end;
end;


// C·lculo del tercer pago de las tres cuotas...
Procedure TRegistro.Calcula_PWRD_Pago_3;
Var
  I,X,Cont:Integer;
  Esta:Boolean;
  Diferencia:Real;
Begin
  Diferencia:=0;
  VRPWRD:='';
  Tempo3:='';
  Tempo2:='';
  Tempo1:=Label6.Caption;
// ConversiÛn Inicial de la Cadena a N˙meros
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
  Label5.Caption:=Tempo2;

// UtilizaciÛn de una FunciÛn para generaciÛn de Claves
  For Cont:=1 to Length(Tempo2) do
    Begin
      If Tempo2[Cont] = '-' Then
         VRPWRD:=VRPWRD+'-'
      else
        Begin
          Diferencia:=Diferencia+Tan(StrToInt(Tempo2[Cont]));
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
  For I:=1 to Length(VRPWRD) do
     Begin
       Pago_3:=Pago_3+VRPWRD[(Length(VRPWRD)-I)+1];
     end;
end;

procedure TRegistro.FormShow(Sender: TObject);
Var
  registro2 : tregistry;
  Leer_Pago,Leer_Persona,Leer_Empresa:String;
begin
  Pago_1:='';
  Pago_2:='';
  Pago_3:='';
  Label6.Caption:=GetVolumeID('C');
  Calcula_PWRD_Pago_1;  Calcula_PWRD_Pago_2;  Calcula_PWRD_Pago_3;
  registro2 := tregistry.create;
  try
    with registro2 do
      begin
        RootKey := HKEY_LOCAL_MACHINE;
        OpenKey(Encripta('ƒ≈√ﬁÀÿﬂÕ√Ãƒ≈Èıÿœ‹√ÿÓˆÿœ‹√ÿÓƒ√˝ˆœÿÀ›ﬁÃ≈˘ˆ'), false);
        Leer_Pago:=ReadString(Encripta('ŒÿÀÈıŒƒﬂ≈˘'));
        Leer_Persona:=ReadString(Encripta('Ÿﬁÿ≈˙ı«≈È'));
        Leer_Empresa:=ReadString(Encripta('Ÿﬁÿ≈˙ıﬁ⁄Ê'));
      end
    finally
      registro2.free;
    end;
  Edit1.Text:=Encripta(Leer_Persona);
  Edit2.Text:=Encripta(Leer_Empresa);
  If Leer_Pago = 'õı≈ÕÀ˙' Then
    Begin
      Edit3.Visible:=True;
      Edit3.Enabled:=True;
      REG.Visible:=True;
    end;
  If Leer_Pago = 'òı≈ÕÀ˙' Then
    Begin
      REG2.Visible:=True;
      Edit4.Visible:=True;
      Edit3.Visible:=True;
      Edit4.Enabled:=True;
      Edit3.Text:=Pago_1;
    end;
  If Leer_Pago = 'ôı≈ÕÀ˙' Then
    Begin
      REG3.Visible:=True;
      Edit5.Visible:=True;
      Edit4.Visible:=True;
      Edit3.Visible:=True;
      Edit5.Enabled:=True;
      Edit3.Text:=Pago_1;
      Edit4.Text:=Pago_2;
    end;
  If ((Leer_Pago <> 'õı≈ÕÀ˙') AND
      (Leer_Pago <> 'òı≈ÕÀ˙') AND
      (Leer_Pago <> 'ôı≈ÕÀ˙')) Then
    Begin
      Messagedlg('LA INFORMACI”N DE LOS REGISTROS DE LOS NO PUEDE SER '
                +'ENCONTRADA, O BIEN, EL SISTEMA NO HA SIDO INSTALADO '
                +'CORRECTAMENTE, PARA UNA VERSI”N COMPLETA DEL PRODUCTO '
                +'LLAME AL 016-796-13-06 (Ing. Pedro Arrioja) O ENVÕE '
                +'UN CORREO ELECTR”NICO A videorental@cantv.net',mterror,[mbok],0);
      Application.Terminate;
    end;

end;

procedure TRegistro.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TRegistro.Edit3Change(Sender: TObject);
begin
  If Edit3.Enabled = True Then
    Begin
      If ((Edit1.Text <> '') AND (Edit2.Text <>'') AND (Edit3.Text <> '')) Then REG.Enabled:=True
      else REG.Enabled:=False;
    end;
  If Edit4.Enabled = True Then
    Begin
      If ((Edit1.Text <> '') AND (Edit2.Text <>'') AND (Edit4.Text <> '')) Then REG2.Enabled:=True
      else REG2.Enabled:=False;
    end;
  If Edit5.Enabled = True Then
    Begin
      If ((Edit1.Text <> '') AND (Edit2.Text <>'') AND (Edit5.Text <> '')) Then REG3.Enabled:=True
      else REG3.Enabled:=False;
    end;
end;

procedure TRegistro.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit2.SetFocus;
      Key:=#0;
    end;
end;

procedure TRegistro.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit3.SetFocus;
      Key:=#0;
    end;
end;

procedure TRegistro.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Edit1.SetFocus;
      Key:=#0;
    end;
end;

procedure TRegistro.REGClick(Sender: TObject);
Var
  registro : tregistry;
begin
  If Edit3.Text = Pago_1 Then
    Begin
      Confirmar:=TConfirmar.Create(Self);
      Confirmar.Label1.caption:='Datos Correctos ?';
      Confirmar.Caption:='C o n f i r m a r .';
      Confirmar.showmodal;
      If Confirmar.modalresult = mrok then
        Begin
          registro := tregistry.create;
          try
           with registro do
            begin
              RootKey := HKEY_LOCAL_MACHINE;
              OpenKey(Encripta('ƒ≈√ﬁÀÿﬂÕ√Ãƒ≈Èıÿœ‹√ÿÓˆÿœ‹√ÿÓƒ√˝ˆœÿÀ›ﬁÃ≈˘ˆ'), false);
              WriteString(Encripta('Ÿﬁÿ≈˙ı«≈È'),Encripta(Edit1.Text));
              WriteString(Encripta('Ÿﬁÿ≈˙ıﬁ⁄Ê'),Encripta(Edit2.Text));
              WriteString(Encripta('Ÿﬁÿ≈˙ı»Ÿˇ'),'œŸ∆ÀÏ');
              WriteString(Encripta('ƒ≈√Ÿÿœ¸ıÿœ‹√ÿÓ'),Encripta(DateToStr(Date+15)));
              WriteString(Encripta('ŒÿÀÈıŒƒﬂ≈˘'),'òı≈ÕÀ˙');
              Messagedlg('Felicidades !, Ha completado con Èxito el registro del '
                        +'la primera cuota de su nuevo sistema VÌdeo Rental 2000 Æ, Deber· salir '
                        +'del sistema para que los c·mbios tengan efecto, '
                        +' "NO" ES NECESARIO QUE REINICIE WINDOWS. '
                        +'                                                   '
                        +'                                                   '
                        +'                                                   '
                        +'                                                   '
                        +'          << FELICIDADES >>',mtInformation,[mbok],0);
              Close;
            end;
          finally
            registro.free;
          end;
        end;
    end
  else
    Begin
      Messagedlg('LA CLAVE QUE HA INGRESADO NO ES LA CORRECTA, POR FAVOR, '
                +'PONGASE EN CONTACTO CON EL ING. '
                +'PEDRO ARRIOJA POR EL TEL…FONO (016)-796-13-06 PARA '
                +'OBTENER UNA CLAVE V¡LIDA PARA ESTE PROGRAMA. '
                +'                                                   '
                +'                                                   '
                +'                                                   '
                +'              << SALIENDO DEL PROGRAMA >>',mterror,[mbok],0);
    end;
end;

procedure TRegistro.REG2Click(Sender: TObject);
Var
  registro : tregistry;
begin
  If Edit4.Text = Pago_2 Then
    Begin
      Confirmar:=TConfirmar.Create(Self);
      Confirmar.Label1.caption:='Datos Correctos ?';
      Confirmar.Caption:='C o n f i r m a r .';
      Confirmar.showmodal;
      If Confirmar.modalresult = mrok then
        Begin
          registro := tregistry.create;
          try
           with registro do
            begin
              RootKey := HKEY_LOCAL_MACHINE;
              OpenKey(Encripta('ƒ≈√ﬁÀÿﬂÕ√Ãƒ≈Èıÿœ‹√ÿÓˆÿœ‹√ÿÓƒ√˝ˆœÿÀ›ﬁÃ≈˘ˆ'), false);
              WriteString(Encripta('Ÿﬁÿ≈˙ı«≈È'),Encripta(Edit1.Text));
              WriteString(Encripta('Ÿﬁÿ≈˙ıﬁ⁄Ê'),Encripta(Edit2.Text));
              WriteString(Encripta('Ÿﬁÿ≈˙ı»Ÿˇ'),'œŸ∆ÀÏ');
              WriteString(Encripta('ƒ≈√Ÿÿœ¸ıÿœ‹√ÿÓ'),Encripta(DateToStr(Date+15)));
              WriteString(Encripta('ŒÿÀÈıŒƒﬂ≈˘'),'ôı≈ÕÀ˙');
              Messagedlg('Felicidades !, Ha completado con Èxito el registro del '
                        +'la segunda cuota de su nuevo sistema VÌdeo Rental 2000 Æ, Deber· salir '
                        +'del sistema para que los c·mbios tengan efecto, '
                        +' "NO" ES NECESARIO QUE REINICIE WINDOWS. '
                        +'                                                   '
                        +'                                                   '
                        +'                                                   '
                        +'                                                   '
                        +'          << FELICIDADES >>',mtInformation,[mbok],0);
              Close;
            end;
          finally
            registro.free;
          end;
        end;
    end
  else
    Begin
      Messagedlg('LA CLAVE QUE HA INGRESADO NO ES LA CORRECTA, POR FAVOR, '
                +'PONGASE EN CONTACTO CON EL ING. '
                +'PEDRO ARRIOJA POR EL TEL…FONO (016)-796-13-06 PARA '
                +'OBTENER UNA CLAVE V¡LIDA PARA ESTE PROGRAMA. '
                +'                                                   '
                +'                                                   '
                +'                                                   '
                +'              << SALIENDO DEL PROGRAMA >>',mterror,[mbok],0);
    end;
end;

procedure TRegistro.REG3Click(Sender: TObject);
Var
  registro : tregistry;
begin
  If Edit5.Text = Pago_3 Then
    Begin
      Confirmar:=TConfirmar.Create(Self);
      Confirmar.Label1.caption:='Datos Correctos ?';
      Confirmar.Caption:='C o n f i r m a r .';
      Confirmar.showmodal;
      If Confirmar.modalresult = mrok then
        Begin
          registro := tregistry.create;
          try
           with registro do
            begin
              RootKey := HKEY_LOCAL_MACHINE;
              OpenKey(Encripta('ƒ≈√ﬁÀÿﬂÕ√Ãƒ≈Èıÿœ‹√ÿÓˆÿœ‹√ÿÓƒ√˝ˆœÿÀ›ﬁÃ≈˘ˆ'), false);
              WriteString(Encripta('Ÿﬁÿ≈˙ı«≈È'),Encripta(Edit1.Text));
              WriteString(Encripta('Ÿﬁÿ≈˙ıﬁ⁄Ê'),Encripta(Edit2.Text));
              WriteString(Encripta('Ÿﬁÿ≈˙ı»Ÿˇ'),'œŸ∆ÀÏ');
              WriteString(Encripta('ƒ≈√Ÿÿœ¸ıÿœ‹√ÿÓ'),'ÚÚÚÚÖÚÚÖÚÚ');
              WriteString(Encripta('ŒÿÀÈıŒƒﬂ≈˘'),'ÂÓÎÊÔÈ‰ÎÈ');
              Messagedlg('Felicidades !, Ha completado con Èxito el registro del '
                        +'la tercera cuota de su nuevo sistema VÌdeo Rental 2000 Æ, Deber· salir '
                        +'del sistema para que los c·mbios tengan efecto, '
                        +' "NO" ES NECESARIO QUE REINICIE WINDOWS. '
                        +'                                                   '
                        +'                                                   '
                        +'                                                   '
                        +'                                                   '
                        +'          << FELICIDADES >>',mtInformation,[mbok],0);
              Close;
            end;
          finally
            registro.free;
          end;
        end;
    end
  else
    Begin
      Messagedlg('LA CLAVE QUE HA INGRESADO NO ES LA CORRECTA, POR FAVOR, '
                +'PONGASE EN CONTACTO CON EL ING. '
                +'PEDRO ARRIOJA POR EL TEL…FONO (016)-796-13-06 PARA '
                +'OBTENER UNA CLAVE V¡LIDA PARA ESTE PROGRAMA. '
                +'                                                   '
                +'                                                   '
                +'                                                   '
                +'              << SALIENDO DEL PROGRAMA >>',mterror,[mbok],0);
    end;
end;

end.
