unit UProtector_Pantalla;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls;

type
  TProtector_Pantalla = class(TForm)
    tmrTick: TTimer;
    procedure tmrTickTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    procedure Dibuja_Esfera(x, y, Tamanio : integer; color : TColor);
    procedure Desactivar(var Msg : TMsg; var Handled : boolean);
  public
    // Procedimientos para obtener el fondo de pantalla y dar la ilusión
    // de transparencia en la Forma
    // Proc #1
    Procedure CreateParams( Var params: TCreateParams ); override;
    // Proc #2
    Procedure WMEraseBkGnd( var msg: TWMEraseBkGnd );message WM_ERASEBKGND;
    { Public declarations }
  end;

var
  Protector_Pantalla: TProtector_Pantalla;

implementation

{$R *.DFM}

var
  crs : TPoint;  {Posición Original del mouse}

//Proc #1
procedure TProtector_Pantalla.CreateParams;
begin
    inherited CreateParams( params );
    params.ExStyle := params.ExStyle or WS_EX_TRANSPARENT;
end;

//Proc #2
procedure TProtector_Pantalla.WMEraseBkGnd;
begin
    msg.result := 1;
end;

function Min(a, b : integer) : integer;
begin
  if b < a then
    Result := b
  else
    Result := a;
end; {Min}

procedure TProtector_Pantalla.Dibuja_Esfera(x, y, Tamanio : integer; color : TColor);
var
  i, dw    : integer;
  xy1, xy2 : integer;
  r, g, b  : byte;
begin
  with Canvas do begin
    Pen.Style := psClear;
    Brush.Style := bsSolid;
    Brush.Color := color;
    {Prepara los colores para las esferas}
    r := GetRValue(color);
    g := GetGValue(color);
    b := GetBValue(color);
    {Dibuja la Esfera}
    dw := Tamanio div 16;
    for i := 0 to 15 do begin
      xy1 := (i * dw) div 2;
      xy2 := Tamanio - xy1;
      Brush.Color := RGB(Min(r + (i * 8), 255), Min(g + (i * 8), 255),
                         Min(b + (i * 8), 255));
      Ellipse(x + xy1, y + xy1, x + xy2, y + xy2);
    end;
  end;
end;

procedure TProtector_Pantalla.Desactivar(var Msg : TMsg; var Handled : boolean);
var
  Listo : boolean;
begin
  if Msg.message = WM_MOUSEMOVE then
    Listo := (Abs(LOWORD(Msg.lParam) - crs.x) > 5) or
            (Abs(HIWORD(Msg.lParam) - crs.y) > 5)
  else
    Listo := (Msg.message = WM_KEYDOWN)     or (Msg.message = WM_KEYUP)       or
            (Msg.message = WM_SYSKEYDOWN)  or (Msg.message = WM_SYSKEYUP)    or
            (Msg.message = WM_ACTIVATE)    or (Msg.message = WM_NCACTIVATE)  or
            (Msg.message = WM_ACTIVATEAPP) or (Msg.message = WM_LBUTTONDOWN) or
            (Msg.message = WM_RBUTTONDOWN) or (Msg.message = WM_MBUTTONDOWN);
  if Listo then
    begin
       Protector_Pantalla.hide;
       Protector_Pantalla.ModalResult:=MrOk;
       Close;
    end;
end; {Desactiva el Protector}

procedure TProtector_Pantalla.tmrTickTimer(Sender: TObject);
var
  x, y    : integer;
  Tamanio_2    : integer;
  r, g, b : byte;
begin
  x := Random(ClientWidth);
  y := Random(ClientHeight);
  Tamanio_2 := Random(150);
  x := x - Tamanio_2 div 2;
  y := y - Tamanio_2 div 2;
  r := Random($80);
  g := Random($80);
  b := Random($80);
  Dibuja_Esfera(x, y, Tamanio_2, RGB(r, g, b));
end;

procedure TProtector_Pantalla.FormShow(Sender: TObject);
begin
  GetCursorPos(crs);
  tmrTick.Interval      := 10;
  tmrTick.Enabled       := true;
  Application.OnMessage := Desactivar;
  ShowCursor(false);
end;

procedure TProtector_Pantalla.FormHide(Sender: TObject);
begin
  Application.OnMessage := nil;
  tmrTick.Enabled       := false;
  ShowCursor(true);
end;

end.
