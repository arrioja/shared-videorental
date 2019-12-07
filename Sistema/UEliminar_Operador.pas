unit UEliminar_Operador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Barcd4, RxLookup, ToolEdit;

type
  TEliminar_Operador = class(TForm)
    Label1: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    IncluirBtn: TSpeedButton;
    CerrarBtn: TSpeedButton;
    Cedula: TMaskEdit;
    Nombre: TEdit;
    Apellido: TEdit;
    Bevel1: TBevel;
    Sexo: TRadioGroup;
    Bevel2: TBevel;
    Fecha: TDateEdit;
    SpeedButton1: TSpeedButton;
    procedure CerrarBtnClick(Sender: TObject);
    procedure CedulaKeyPress(Sender: TObject; var Key: Char);
    Procedure Limpia_Controles;
    procedure CedulaExit(Sender: TObject);
    procedure LoginKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    Procedure Buscar;
    procedure FormShow(Sender: TObject);
    procedure IncluirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Eliminar_Operador: TEliminar_Operador;
  Cedula_Vieja: String;


Const
  Salto = #13;

implementation

uses Modulo_de_Datos, uconfirmar;

{$R *.DFM}

//  **************  FUNCIONES EN CONTROL.DLL  *********************

procedure TEliminar_Operador.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TEliminar_Operador.CedulaKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Buscar;
      Key:=#3;
    end;
end;


//Vacía los controles de la ventana
Procedure TEliminar_Operador.Limpia_Controles;
Begin
  Cedula.text:='';
  Nombre.text:='';
  Apellido.Text:='';
  Sexo.Itemindex:=0;
  Fecha.Text:='';
end;

procedure TEliminar_Operador.CedulaExit(Sender: TObject);
var
  Cedula_str:string;
  cont:integer;
begin
 if length(Cedula.text) <= 0 then
    Begin
      Cedula.text:='00.000.000'
    end
 else
    Begin
      //se comprueban los espacios en blanco y se suplantan
      //cada uno de ellos por ceros para que no haya errores en la
      //insersión por falta de caracteres
      Cedula_str:=Cedula.Text;
      For Cont:= 1 to length(Cedula_str) do
        Begin
          if (cedula_str[cont] = #32) then
            Begin
              Cedula_str[cont]:='0';
            end;
        end;
      Cedula.Text:=Cedula_str;
    end;
end;

procedure TEliminar_Operador.LoginKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;


Procedure TEliminar_Operador.Buscar;
Begin
  Datos.TablaUsuarios.indexname:='Cedula_Index';
  Datos.TablaUsuarios.setkey;
  Datos.TablaUsuarios.fieldbyname('Cedula').asstring:=Cedula.text;
  if (Datos.TablaUsuarios.gotokey = true) then
    Begin
      Cedula_Vieja:=Cedula.Text;
      Cedula.text:=Datos.TablaUsuarios.fieldbyname('Cedula').Asstring;
      Nombre.text:=Datos.TablaUsuarios.fieldbyname('Nombres').Asstring;
      Apellido.Text:=Datos.TablaUsuarios.fieldbyname('Apellidos').Asstring;
      If Datos.TablaUsuarios.fieldbyname('Sexo').Asstring = '&Masculino' Then Sexo.ItemIndex:=1 else Sexo.ItemIndex:=0;
      Fecha.Text:=Datos.TablaUsuarios.fieldbyname('Fecha_Ingreso').Asstring;
      IncluirBtn.Enabled:=True;
    end
  else
    Begin
      Limpia_Controles;
      IncluirBtn.Enabled:=False;
      Cedula.Enabled:=True;
      messagedlg('La cédula que desea buscar, no se encuentra en '+
                 'nuestros registros, asegúrese que la cédula sea la correcta'+
                 'e inténtentelo de nuevo.',mterror,[mbok],0);
      Cedula.Setfocus;
    end
end;

procedure TEliminar_Operador.SpeedButton1Click(Sender: TObject);
begin
  Buscar;
end;

procedure TEliminar_Operador.FormShow(Sender: TObject);
begin
  Cedula.Setfocus;
end;

procedure TEliminar_Operador.IncluirBtnClick(Sender: TObject);
begin
  Confirmar:=TConfirmar.Create(Self);
  Confirmar.Bitbtn1.Hint:='Eliminar Operador';
  Confirmar.Bitbtn2.Hint:='Cancelar la Eliminción';
  Confirmar.Label1.caption:='Eliminar Operador ?.';
  Confirmar.Caption:='C o n f i r m a r .';
  Confirmar.showmodal;
  if Confirmar.modalresult = mrok then
    begin
      Datos.TablaAccesos.indexname:='';
      Datos.TablaAccesos.setkey;
      Datos.TablaAccesos.fieldbyname('Login').asstring:=Datos.TablaUsuarios.fieldbyname('Login').Asstring;
      if (Datos.TablaAccesos.gotokey = True) then
        begin
          Datos.TablaAccesos.Edit;
          Datos.TablaAccesos.Delete;
        end;
      Datos.TablaUsuarios.Edit;
      Datos.TablaUsuarios.Delete;
      Limpia_Controles;
      IncluirBtn.Enabled:=False;
      Cedula.Enabled:=True;
    end;
end;

end.
