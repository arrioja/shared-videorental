unit UPrimera_Entrada;

interface

uses
  Windows,  Messages,  SysUtils,  Classes,  Graphics,  Controls,  Forms,
  Dialogs,  ExtCtrls,  RXClock,  StdCtrls,  Buttons,  Torrybtn,  Counter,
  Graphlbl,  Gradpan,  GIFCtrl,  Animate, marquee, jpeg, GradBtn, Modulo_de_Datos,
  Noshape;

type
  TPrimera_entrada = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    RxClock1: TRxClock;
    GrapLabel1: TGrapLabel;
    GrapLabel2: TGrapLabel;
    GrapLabel3: TGrapLabel;
    GrapLabel4: TGrapLabel;
    GrapLabel5: TGrapLabel;
    GrapLabel6: TGrapLabel;
    GrapLabel7: TGrapLabel;
    GrapLabel8: TGrapLabel;
    GrapLabel9: TGrapLabel;
    Label1: TLabel;
    Counter2: TCounter;
    Label2: TLabel;
    TorryButton1: TTorryButton;
    Bevel2: TBevel;
    GrapLabel10: TGrapLabel;
    Panel_de_Fondo: TPanel;
    Marquee1: TMarquee;
    TorryButton2: TTorryButton;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Panel4: TPanel;
    Image4: TImage;
    Panel5: TPanel;
    Image5: TImage;
    Panel6: TPanel;
    Image6: TImage;
    Panel7: TPanel;
    Image7: TImage;
    Panel8: TPanel;
    Image8: TImage;
    Panel9: TPanel;
    Image9: TImage;
    Panel10: TPanel;
    Image10: TImage;
    Panel11: TPanel;
    Image11: TImage;
    Panel12: TPanel;
    Image12: TImage;
    Panel13: TPanel;
    Image13: TImage;
    Panel14: TPanel;
    Image14: TImage;
    Panel15: TPanel;
    Image15: TImage;
    Prohibido1: TImage;
    Prohibido2: TImage;
    Prohibido3: TImage;
    Prohibido4: TImage;
    Prohibido5: TImage;
    Prohibido6: TImage;
    Prohibido7: TImage;
    Prohibido8: TImage;
    Prohibido9: TImage;
    Prohibido10: TImage;
    Prohibido11: TImage;
    Prohibido12: TImage;
    Prohibido13: TImage;
    Prohibido14: TImage;
    Prohibido15: TImage;
    GrapLabel11: TGrapLabel;
    GrapLabel12: TGrapLabel;
    NoShape1: TNoShape;
    NoShape2: TNoShape;
    NoShape3: TNoShape;
    NoShape4: TNoShape;
    BitBtn1: TBitBtn;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    Procedure Desselecciona_botones;    
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure TorryButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Mostrar_15_Imagenes;
    procedure DesSeleccionar_Paneles;
    Procedure Limpiar_Imagenes;
    procedure Ordenar_por_Categoria(C:String);
    procedure GrapLabel9Click(Sender: TObject);
    procedure GrapLabel6Click(Sender: TObject);
    procedure GrapLabel7Click(Sender: TObject);
    procedure GrapLabel8Click(Sender: TObject);
    procedure GrapLabel4Click(Sender: TObject);
    procedure GrapLabel5Click(Sender: TObject);
    procedure GrapLabel2Click(Sender: TObject);
    procedure GrapLabel3Click(Sender: TObject);
    procedure GrapLabel1Click(Sender: TObject);
    procedure GrapLabel10Click(Sender: TObject);
    procedure TorryButton2Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure Image4DblClick(Sender: TObject);
    procedure Image5DblClick(Sender: TObject);
    procedure Image6DblClick(Sender: TObject);
    procedure Image7DblClick(Sender: TObject);
    procedure Image8DblClick(Sender: TObject);
    procedure Image9DblClick(Sender: TObject);
    procedure Image10DblClick(Sender: TObject);
    procedure Image11DblClick(Sender: TObject);
    procedure Image12DblClick(Sender: TObject);
    procedure Image13DblClick(Sender: TObject);
    procedure Image14DblClick(Sender: TObject);
    procedure Image15DblClick(Sender: TObject);
    procedure GrapLabel11Click(Sender: TObject);
    procedure NoShape1Click(Sender: TObject);
    procedure NoShape2Click(Sender: TObject);
    procedure NoShape4Click(Sender: TObject);
    procedure NoShape3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Primera_entrada: TPrimera_entrada;
  Comenzar_Con:Integer;
  Reg_Actual:Integer;

implementation

uses UMostrar_Seleccion, UPrincipal, UVista_Grande_Pelicula,
  UAlquilar_y_Devolver;

{$R *.DFM}

procedure TPrimera_entrada.Image1Click(Sender: TObject);
begin
  If Image1.Cursor = CrHandPoint Then
  If Panel1.Color=clNavy Then Panel1.Color:=ClRed else Panel1.Color:=clNavy;
end;

procedure TPrimera_entrada.Image2Click(Sender: TObject);
begin
  If Image2.Cursor = CrHandPoint Then
  If Panel2.Color=clNavy Then Panel2.Color:=ClRed else Panel2.Color:=clNavy;
end;

procedure TPrimera_entrada.Image3Click(Sender: TObject);
begin
  If Image3.Cursor = CrHandPoint Then
  If Panel3.Color=clNavy Then Panel3.Color:=ClRed else Panel3.Color:=clNavy;
end;

procedure TPrimera_entrada.Image4Click(Sender: TObject);
begin
  If Image4.Cursor = CrHandPoint Then
  If Panel4.Color=clNavy Then Panel4.Color:=ClRed else Panel4.Color:=clNavy;
end;

procedure TPrimera_entrada.Image5Click(Sender: TObject);
begin
  If Image5.Cursor = CrHandPoint Then
  If Panel5.Color=clNavy Then Panel5.Color:=ClRed else Panel5.Color:=clNavy;
end;

procedure TPrimera_entrada.Image6Click(Sender: TObject);
begin
  If Image6.Cursor = CrHandPoint Then
  If Panel6.Color=clNavy Then Panel6.Color:=ClRed else Panel6.Color:=clNavy;
end;

procedure TPrimera_entrada.Image7Click(Sender: TObject);
begin
  If Image7.Cursor = CrHandPoint Then
  If Panel7.Color=clNavy Then Panel7.Color:=ClRed else Panel7.Color:=clNavy;
end;

procedure TPrimera_entrada.Image8Click(Sender: TObject);
begin
  If Image8.Cursor = CrHandPoint Then
  If Panel8.Color=clNavy Then Panel8.Color:=ClRed else Panel8.Color:=clNavy;
end;

procedure TPrimera_entrada.Image9Click(Sender: TObject);
begin
  If Image9.Cursor = CrHandPoint Then
  If Panel9.Color=clNavy Then Panel9.Color:=ClRed else Panel9.Color:=clNavy;
end;

procedure TPrimera_entrada.Image10Click(Sender: TObject);
begin
  If Image10.Cursor = CrHandPoint Then
  If Panel10.Color=clNavy Then Panel10.Color:=ClRed else Panel10.Color:=clNavy;
end;

procedure TPrimera_entrada.Image11Click(Sender: TObject);
begin
  If Image11.Cursor = CrHandPoint Then
  If Panel11.Color=clNavy Then Panel11.Color:=ClRed else Panel11.Color:=clNavy;
end;

procedure TPrimera_entrada.Image12Click(Sender: TObject);
begin
  If Image12.Cursor = CrHandPoint Then
  If Panel12.Color=clNavy Then Panel12.Color:=ClRed else Panel12.Color:=clNavy;
end;

procedure TPrimera_entrada.Image13Click(Sender: TObject);
begin
  If Image13.Cursor = CrHandPoint Then
  If Panel13.Color=clNavy Then Panel13.Color:=ClRed else Panel13.Color:=clNavy;
end;

procedure TPrimera_entrada.Image14Click(Sender: TObject);
begin
  If Image14.Cursor = CrHandPoint Then
  If Panel14.Color=clNavy Then Panel14.Color:=ClRed else Panel14.Color:=clNavy;
end;

procedure TPrimera_entrada.Image15Click(Sender: TObject);
begin
  If Image15.Cursor = CrHandPoint Then
  If Panel15.Color=clNavy Then Panel15.Color:=ClRed else Panel15.Color:=clNavy;
end;

procedure TPrimera_entrada.TorryButton1Click(Sender: TObject);
begin
  Try
    Begin
      Datos.Query_General.DisableControls;
      Datos.Query_General.Sql.Clear;
      Datos.Query_General.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                                  'Videos.Foto_Miniatura, Videos.Foto_Grande, Selecciones.Codigo_Cliente, '+
                                  'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                                  'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                                  '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
      Datos.Query_General.ParamByName('Cod_Cliente').AsString:=Principal.MaskEdit1.Text;
      Datos.Query_General.Open;
      Datos.Query_General.EnableControls;
      If Datos.Query_General.RecordCount > 0 Then
        Begin
          Mostrar_Seleccion:=TMostrar_Seleccion.Create(Self);
          Mostrar_Seleccion.Edit1.Caption:=Edit1.Caption;
          Mostrar_Seleccion.ShowModal;
        end
      else
        Begin
          MessageDlg('Usted no ha añadido ninguna película a su selección '+
                     'para hacerlo, señale alguna película de las imágenes de abajo '+
                     'y luego presione "AÑADIR A MI LISTA" en la parte superior de esta pantalla.', mtError, [mbOk], 0);
        end;
    end
  Finally
    Counter2.Value:=IntToStr(Datos.Query_General.RecordCount);
    Alquilar_y_Devolver.Counter2.Value:=IntToStr(Datos.Query_General.RecordCount);
    Mostrar_Seleccion.Free;
    Mostrar_Seleccion:=Nil;
  end;
end;

procedure TPrimera_entrada.DesSeleccionar_Paneles;
Begin
  Panel1.Color:=clNavy;
  Panel2.Color:=clNavy;
  Panel3.Color:=clNavy;
  Panel4.Color:=clNavy;
  Panel5.Color:=clNavy;
  Panel6.Color:=clNavy;
  Panel7.Color:=clNavy;
  Panel8.Color:=clNavy;
  Panel9.Color:=clNavy;
  Panel10.Color:=clNavy;
  Panel11.Color:=clNavy;
  Panel12.Color:=clNavy;
  Panel13.Color:=clNavy;
  Panel14.Color:=clNavy;
  Panel15.Color:=clNavy;
  Application.Processmessages;
end;

Procedure TPrimera_entrada.Limpiar_Imagenes;
Begin
  Prohibido1.Visible:=False;
  Prohibido2.Visible:=False;
  Prohibido3.Visible:=False;
  Prohibido4.Visible:=False;
  Prohibido5.Visible:=False;
  Prohibido6.Visible:=False;
  Prohibido7.Visible:=False;
  Prohibido8.Visible:=False;
  Prohibido9.Visible:=False;
  Prohibido10.Visible:=False;
  Prohibido11.Visible:=False;
  Prohibido12.Visible:=False;
  Prohibido13.Visible:=False;
  Prohibido14.Visible:=False;
  Prohibido15.Visible:=False;
  Panel1.Hint:='';
  Panel2.Hint:='';
  Panel3.Hint:='';
  Panel4.Hint:='';
  Panel5.Hint:='';
  Panel6.Hint:='';
  Panel7.Hint:='';
  Panel8.Hint:='';
  Panel9.Hint:='';
  Panel10.Hint:='';
  Panel11.Hint:='';
  Panel12.Hint:='';
  Panel13.Hint:='';
  Panel14.Hint:='';
  Panel15.Hint:='';
  Image1.Picture:=Nil;
  Image1.Cursor:=CrNo;
  Image1.Hint:='PELICULA NO DISPONIBLE';
  Image2.Picture:=Nil;
  Image2.Cursor:=CrNo;
  Image2.Hint:='PELICULA NO DISPONIBLE';
  Image3.Picture:=Nil;
  Image3.Cursor:=CrNo;
  Image3.Hint:='PELICULA NO DISPONIBLE';
  Image4.Picture:=Nil;
  Image4.Cursor:=CrNo;
  Image4.Hint:='PELICULA NO DISPONIBLE';
  Image5.Picture:=Nil;
  Image5.Cursor:=CrNo;
  Image5.Hint:='PELICULA NO DISPONIBLE';
  Image6.Picture:=Nil;
  Image6.Cursor:=CrNo;
  Image6.Hint:='PELICULA NO DISPONIBLE';
  Image7.Picture:=Nil;
  Image7.Cursor:=CrNo;
  Image7.Hint:='PELICULA NO DISPONIBLE';
  Image8.Picture:=Nil;
  Image8.Cursor:=CrNo;
  Image8.Hint:='PELICULA NO DISPONIBLE';
  Image9.Picture:=Nil;
  Image9.Cursor:=CrNo;
  Image9.Hint:='PELICULA NO DISPONIBLE';
  Image10.Picture:=Nil;
  Image10.Cursor:=CrNo;
  Image10.Hint:='PELICULA NO DISPONIBLE';
  Image11.Picture:=Nil;
  Image11.Cursor:=CrNo;
  Image11.Hint:='PELICULA NO DISPONIBLE';
  Image12.Picture:=Nil;
  Image12.Cursor:=CrNo;
  Image12.Hint:='PELICULA NO DISPONIBLE';
  Image13.Picture:=Nil;
  Image13.Cursor:=CrNo;
  Image13.Hint:='PELICULA NO DISPONIBLE';
  Image14.Picture:=Nil;
  Image14.Cursor:=CrNo;
  Image14.Hint:='PELICULA NO DISPONIBLE';
  Image15.Picture:=Nil;
  Image15.Cursor:=CrNo;
  Image15.Hint:='PELICULA NO DISPONIBLE';
  Application.Processmessages;
end;


procedure TPrimera_entrada.Mostrar_15_Imagenes;
Begin
  DesSeleccionar_Paneles;
  Limpiar_Imagenes;
  If Comenzar_Con <= 0 Then Datos.Query_Peliculas.First;
    Begin
      // Primera Imágen
      If Comenzar_Con <= 0 Then Comenzar_Con:=-1;
      Comenzar_Con:=Comenzar_Con+1;
     Datos.Query_Peliculas.First;
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Datos.Query_Peliculas.MoveBy(Comenzar_Con);
          Try
            Begin
              Image1.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image1.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel1.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido1.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image1.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image1.Picture:=Nil;
                Image1.Cursor:=CrNo;
                Image1.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image1.Picture:=Nil;
                Image1.Cursor:=CrNo;
                Image1.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;

          // Segunda Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image2.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image2.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel2.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido2.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image2.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image2.Picture:=Nil;
                Image2.Cursor:=CrNo;
                Image2.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image2.Picture:=Nil;
                Image2.Cursor:=CrNo;
                Image2.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;


          // Tercera Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image3.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image3.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel3.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido3.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image3.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image3.Picture:=Nil;
                Image3.Cursor:=CrNo;
                Image3.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image3.Picture:=Nil;
                Image3.Cursor:=CrNo;
                Image3.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image4.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image4.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel4.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido4.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image4.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image4.Picture:=Nil;
                Image4.Cursor:=CrNo;
                Image4.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image4.Picture:=Nil;
                Image4.Cursor:=CrNo;
                Image4.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image5.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image5.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel5.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido5.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image5.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image5.Picture:=Nil;
                Image5.Cursor:=CrNo;
                Image5.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image5.Picture:=Nil;
                Image5.Cursor:=CrNo;
                Image5.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image6.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image6.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Image6.Cursor:=CrHandPoint;
              Prohibido6.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Panel6.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image6.Picture:=Nil;
                Image6.Cursor:=CrNo;
                Image6.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image6.Picture:=Nil;
                Image6.Cursor:=CrNo;
                Image6.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image7.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image7.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel7.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido7.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image7.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image7.Picture:=Nil;
                Image7.Cursor:=CrNo;
                Image7.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image7.Picture:=Nil;
                Image7.Cursor:=CrNo;
                Image7.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image8.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image8.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel8.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido8.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image8.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image8.Picture:=Nil;
                Image8.Cursor:=CrNo;
                Image8.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image8.Picture:=Nil;
                Image8.Cursor:=CrNo;
                Image8.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image9.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image9.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel9.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido9.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image9.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image9.Picture:=Nil;
                Image9.Cursor:=CrNo;
                Image9.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image9.Picture:=Nil;
                Image9.Cursor:=CrNo;
                Image9.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image10.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image10.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel10.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido10.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image10.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image10.Picture:=Nil;
                Image10.Cursor:=CrNo;
                Image10.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image10.Picture:=Nil;
                Image10.Cursor:=CrNo;
                Image10.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image11.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image11.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel11.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido11.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image11.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image11.Picture:=Nil;
                Image11.Cursor:=CrNo;
                Image11.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image11.Picture:=Nil;
                Image11.Cursor:=CrNo;
                Image11.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image12.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image12.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel12.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido12.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image12.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image12.Picture:=Nil;
                Image12.Cursor:=CrNo;
                Image12.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image12.Picture:=Nil;
                Image12.Cursor:=CrNo;
                Image12.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image13.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image13.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel13.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido13.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image13.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image13.Picture:=Nil;
                Image13.Cursor:=CrNo;
                Image13.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image13.Picture:=Nil;
                Image13.Cursor:=CrNo;
                Image13.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;



          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image14.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image14.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel14.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido14.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image14.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image14.Picture:=Nil;
                Image14.Cursor:=CrNo;
                Image14.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image14.Picture:=Nil;
                Image14.Cursor:=CrNo;
                Image14.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
       end;

          // Otra Imágen
     If Datos.Query_Peliculas.EOF = False Then
       Begin
          Comenzar_Con:=Comenzar_Con+1;
          Datos.Query_Peliculas.Next;
          Try
            Begin
              Image15.Picture.LoadFromFile(Datos.Query_Peliculas.Fieldbyname('Foto_Miniatura').AsString);
              Image15.Hint:=Datos.Query_Peliculas.Fieldbyname('Titulo_Video').AsString;
              Panel15.Hint:=Datos.Query_Peliculas.Fieldbyname('Codigo_Video').AsString;
              Prohibido15.Visible:=Datos.Query_Peliculas.Fieldbyname('Video_Alquilado').AsBoolean;
              Image15.Cursor:=CrHandPoint;
            end
          Except
            On EInvalidGraphic do
              Begin
                Image15.Picture:=Nil;
                Image15.Cursor:=CrNo;
                Image15.Hint:='PELICULA NO DISPONIBLE';
              end;
            On EFOpenError do
              Begin
                Image15.Picture:=Nil;
                Image15.Cursor:=CrNo;
                Image15.Hint:='PELICULA NO DISPONIBLE';
              end;
          end;
          Application.Processmessages;
        end;
       end;
end;


procedure TPrimera_entrada.FormShow(Sender: TObject);
begin
  Datos.Query_General.DisableControls;
  Datos.Query_General.Sql.Clear;
  Datos.Query_General.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                              'Videos.Foto_Miniatura, Videos.Foto_Grande, Selecciones.Codigo_Cliente, '+
                              'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                              'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                              '(Selecciones.Codigo_Cliente = :Cod_Cliente)) ORDER BY Videos.Titulo_Video');
  Datos.Query_General.ParamByName('Cod_Cliente').AsString:=Principal.MaskEdit1.Text;
  Datos.Query_General.Open;
  Datos.Query_General.EnableControls;
  Counter2.Value:=IntToStr(Datos.Query_General.RecordCount);
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel9Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel9.BackColor:=ClBlue;
  GrapLabel9.ForColor:=ClNavy;
  Datos.Query_Peliculas.DisableControls;
  Datos.Query_Peliculas.Sql.Clear;
  Datos.Query_Peliculas.Sql.Add('Select Codigo_Video, Titulo_Video, Foto_Miniatura, Foto_Grande, Estreno, '+
                                'Video_Alquilado, Categoria_Video from Videos '+
                                'Where ((Anaquel <> :A1) AND (Linea <> :A1) AND (Posicion <> :A1) AND (Foto_Miniatura <> :A1) AND (Foto_Grande <> :A1)) '+
                                'ORDER BY Titulo_Video');
  Datos.Query_Peliculas.ParamByName('A1').AsString:='';
  Datos.Query_Peliculas.Open;
  Datos.Query_Peliculas.EnableControls;
  Datos.Query_Peliculas.First;
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;


Procedure TPrimera_entrada.Ordenar_por_Categoria(C:String);
Begin
  Datos.Query_Peliculas.DisableControls;
  Datos.Query_Peliculas.Sql.Clear;
  Datos.Query_Peliculas.Sql.Add('Select Codigo_Video, Titulo_Video, Foto_Miniatura, Foto_Grande, Estreno, '+
                                'Video_Alquilado, Categoria_Video from Videos '+
                                'Where ((Categoria_Video = :Categ) AND (Anaquel <> :A1) AND (Linea <> :A1) AND (Posicion <> :A1) AND (Foto_Miniatura <> :A1) AND (Foto_Grande <> :A1)) '+
                                'ORDER BY Titulo_Video');
  Datos.Query_Peliculas.ParamByName('Categ').AsString:=C;
  Datos.Query_Peliculas.ParamByName('A1').AsString:='';
  Datos.Query_Peliculas.Open;
  Datos.Query_Peliculas.EnableControls;
  Datos.Query_Peliculas.First;
end;

procedure TPrimera_entrada.GrapLabel6Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel6.BackColor:=ClBlue;
  GrapLabel6.ForColor:=ClNavy;
  Ordenar_Por_Categoria('TERROR');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel7Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel7.BackColor:=ClBlue;
  GrapLabel7.ForColor:=ClNavy;
  Ordenar_Por_Categoria('SUSPENSO');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel8Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel8.BackColor:=ClBlue;
  GrapLabel8.ForColor:=ClNavy;
  Ordenar_Por_Categoria('CENSURA');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel4Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel4.BackColor:=ClBlue;
  GrapLabel4.ForColor:=ClNavy;
  Ordenar_Por_Categoria('INFANTILES');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel5Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel5.BackColor:=ClBlue;
  GrapLabel5.ForColor:=ClNavy;
  Ordenar_Por_Categoria('CIENCIA FICCION');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel2Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel2.BackColor:=ClBlue;
  GrapLabel2.ForColor:=ClNavy;
  Ordenar_Por_Categoria('DRAMA');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel3Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel3.BackColor:=ClBlue;
  GrapLabel3.ForColor:=ClNavy;
  Ordenar_Por_Categoria('COMEDIA');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel1Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel1.BackColor:=ClBlue;
  GrapLabel1.ForColor:=ClNavy;
  Ordenar_Por_Categoria('ACCION');
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.GrapLabel10Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel10.BackColor:=ClBlue;
  GrapLabel10.ForColor:=ClNavy;
  Datos.Query_Peliculas.DisableControls;
  Datos.Query_Peliculas.Sql.Clear;
  Datos.Query_Peliculas.Sql.Add('Select Codigo_Video, Titulo_Video, Foto_Miniatura, Foto_Grande, Estreno, '+
                                'Video_Alquilado, Categoria_Video from Videos '+
                                'Where ((Estreno = :Est) AND ((Anaquel <> :A1) AND (Linea <> :A1) AND (Posicion <> :A1) AND (Foto_Miniatura <> :A1) AND (Foto_Grande <> :A1))) '+
                                'ORDER BY Titulo_Video');
  Datos.Query_Peliculas.ParamByName('A1').AsString:='';
  Datos.Query_Peliculas.ParamByName('Est').AsBoolean:=True;
  Datos.Query_Peliculas.Open;
  Datos.Query_Peliculas.EnableControls;
  Datos.Query_Peliculas.First;
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.TorryButton2Click(Sender: TObject);
begin
  Datos.Selecciones.Open;
  Datos.Selecciones.IndexName:='Codigos_Index';
  If Panel1.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel1.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel1.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;

  If Panel2.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel2.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel2.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel3.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel3.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel3.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;



  If Panel4.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel4.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel4.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel5.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel5.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel5.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;



  If Panel6.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel6.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel6.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel7.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel7.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel7.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel8.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel8.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel8.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel9.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel9.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel9.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel10.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel10.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel10.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel11.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel11.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel11.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel12.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel12.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel12.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel13.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel13.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel13.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel14.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel14.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel14.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;


  If Panel15.Color = ClRed Then
    Begin
      Datos.Selecciones.Setkey;
      Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
      Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel15.Hint;
      If Datos.Selecciones.GotoKey = False Then
        Begin
          Datos.Selecciones.Last;
          Datos.Selecciones.Append;
          Datos.Selecciones.Fieldbyname('Codigo_Cliente').AsString:=Principal.Maskedit1.Text;
          Datos.Selecciones.Fieldbyname('Codigo_Video').AsString:=Panel15.Hint;
          Datos.Selecciones.Post;
          Datos.Selecciones.First;
        end;
    end;
  Datos.Selecciones.Close;
  Datos.Query_General.DisableControls;
  Datos.Query_General.Sql.Clear;
  Datos.Query_General.Sql.Add('Select Videos.Codigo_Video, Videos.Titulo_Video, '+
                              'Videos.Foto_Miniatura, Videos.Foto_Grande, Selecciones.Codigo_Cliente, '+
                              'Selecciones.Num_Reg, Selecciones.Codigo_Video from Videos, Selecciones '+
                              'Where ((Videos.Codigo_Video = Selecciones.Codigo_Video) AND '+
                              '(Selecciones.Codigo_Cliente = :Cod_Cliente))');
  Datos.Query_General.ParamByName('Cod_Cliente').AsString:=Principal.MaskEdit1.Text;
  Datos.Query_General.Open;
  Datos.Query_General.EnableControls;
  Counter2.Value:=IntToStr(Datos.Query_General.RecordCount);
  Alquilar_y_Devolver.Counter2.Value:=IntToStr(Datos.Query_General.RecordCount);
  DesSeleccionar_Paneles;
end;

procedure TPrimera_entrada.Image1DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image1.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel1.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image2DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image2.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel2.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image3DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image3.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel3.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image4DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image4.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel4.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image5DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image5.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel5.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image6DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image6.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel6.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image7DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image7.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel7.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image8DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image8.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel8.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;

end;

procedure TPrimera_entrada.Image9DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image9.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel9.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image10DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image10.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel10.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;
end;

procedure TPrimera_entrada.Image11DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image11.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel11.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;

end;

procedure TPrimera_entrada.Image12DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image12.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel12.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;

end;

procedure TPrimera_entrada.Image13DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image13.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel13.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;

end;

procedure TPrimera_entrada.Image14DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image14.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel14.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;

end;

procedure TPrimera_entrada.Image15DblClick(Sender: TObject);
begin
  Datos.Videos.Open;
  If Image15.Cursor = CrHandPoint Then
    Begin
      Try
        Begin
          Datos.Videos.IndexName:='';
          Datos.Videos.Setkey;
          Datos.Videos.Fieldbyname('Codigo_Video').AsString:=Panel15.Hint;
          If Datos.Videos.GotoKey = True Then
            Begin
              Vista_Grande_Pelicula:=TVista_Grande_Pelicula.Create(Self);
              Vista_Grande_Pelicula.Image1.Picture.LoadFromFile(Datos.Videos.Fieldbyname('Foto_Grande').AsString);
              Vista_Grande_Pelicula.ShowModal;
            end
          else
            Begin
              MessageDlg('La Vista en grande de esta película no está disponible '+
                         'por favor asegúrese que sea correcto e inténtelo de nuevo '+
                         'o comuníquese con algún empleado.', mtError, [mbOk], 0);
            end;
        end
      Finally
        Vista_Grande_Pelicula.Free;
        Vista_Grande_Pelicula:=Nil;
      end;
    end;
  Datos.Videos.Close;

end;

procedure TPrimera_entrada.GrapLabel11Click(Sender: TObject);
begin
  DesSelecciona_Botones;
  GrapLabel11.BackColor:=ClBlue;
  GrapLabel11.ForColor:=ClNavy;
  Datos.Query_Peliculas.SQL.Clear;
  Datos.Query_Peliculas.SQL.Add('Select Registro.Codigo_Video, Videos.Titulo_Video, Videos.Foto_Miniatura, '+
                                'Videos.Foto_Grande, Videos.Video_Alquilado, COUNT(Registro.Codigo_Video) AS Numero, '+
                                'SUM(Registro.Costo) as Coste from Registro,Videos '+
                                'Where ((Registro.Codigo_Video = Videos.Codigo_Video) AND '+
                                '((Anaquel <> :A1) AND (Linea <> :A1) AND (Posicion <> :A1) AND (Foto_Miniatura <> :A1) AND (Foto_Grande <> :A1))) '+
                                'Group BY Registro.Codigo_Video,Videos.Titulo_Video, Videos.Foto_Miniatura, '+
                                'Videos.Foto_Grande, Videos.Video_Alquilado ORDER BY Numero Descending');
  Datos.Query_Peliculas.ParamByName('A1').AsString:='';
  Datos.Query_Peliculas.Open;
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

Procedure TPrimera_entrada.Desselecciona_botones;
Begin
  GrapLabel1.ForColor:=ClGreen;
  GrapLabel1.BackColor:=ClOlive;
  GrapLabel2.ForColor:=ClGreen;
  GrapLabel2.BackColor:=ClOlive;
  GrapLabel3.ForColor:=ClGreen;
  GrapLabel3.BackColor:=ClOlive;
  GrapLabel4.ForColor:=ClGreen;
  GrapLabel4.BackColor:=ClOlive;
  GrapLabel5.ForColor:=ClGreen;
  GrapLabel5.BackColor:=ClOlive;
  GrapLabel6.ForColor:=ClGreen;
  GrapLabel6.BackColor:=ClOlive;
  GrapLabel7.ForColor:=ClGreen;
  GrapLabel7.BackColor:=ClOlive;
  GrapLabel8.ForColor:=ClGreen;
  GrapLabel8.BackColor:=ClOlive;
  GrapLabel9.ForColor:=ClGreen;
  GrapLabel9.BackColor:=ClOlive;
  GrapLabel10.ForColor:=ClGreen;
  GrapLabel10.BackColor:=ClOlive;
  GrapLabel11.ForColor:=ClGreen;
  GrapLabel11.BackColor:=ClOlive;
  GrapLabel12.ForColor:=ClGreen;
  GrapLabel12.BackColor:=ClOlive;
end;

procedure TPrimera_entrada.NoShape1Click(Sender: TObject);
begin
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.NoShape2Click(Sender: TObject);
begin
  Comenzar_Con:=Comenzar_Con-30;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.NoShape4Click(Sender: TObject);
begin
  Comenzar_Con:=0;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.NoShape3Click(Sender: TObject);
begin
  Comenzar_Con:=Datos.Query_Peliculas.RecordCount-30;
  Mostrar_15_Imagenes;
end;

procedure TPrimera_entrada.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
