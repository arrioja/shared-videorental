unit UAcceso_a_Modulos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Modulo_de_Datos, ComCtrls;

type
  TAcceso_a_Modulos = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Bevel1: TBevel;
    IncluirBtn: TBitBtn;
    CerrarBtn: TBitBtn;
    TreeView1: TTreeView;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    procedure CerrarBtnClick(Sender: TObject);
    Procedure Cargar_Datos;
    Procedure Hacer_Arbol;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    Procedure Limpiar_Componentes;
    Procedure Chequea_Padres(Nodo:TTreeNode);
    Function  Quitar_Ampersan(Cadena:String):String;
    procedure IncluirBtnClick(Sender: TObject);
    Procedure Guardar_Datos;
    Procedure Concordar_Imagenes;
    procedure TreeView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Acceso_a_Modulos: TAcceso_a_Modulos;
  Salir:Boolean;
implementation

uses UPrincipal;

{$R *.DFM}

Function TAcceso_a_Modulos.Quitar_Ampersan(Cadena:String):String;
var
  x:Integer;
  Resultado:String;
Begin
  Resultado:='';
  For x:=1 to Length(Cadena) do
    If Cadena[X] <> '&' Then
       Resultado:=Resultado+Cadena[X];   // Árbol Normal.
  Result:=Resultado;
end;

Procedure TAcceso_a_Modulos.Hacer_Arbol;
var
  N,M,Y,X,Z:Integer;
  N1,M1,Y1,X1,Z1:TTreeNode;
  Mostrar:String;
Begin
  Mostrar:='';
  TreeView1.Items.Clear;
  for y:=0 to Principal.MainMenu1.Items.Count-1 do
    If Principal.MainMenu1.Items[Y].Count = 0 Then
      Begin
        Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y].Caption);
        Y1:=TreeView1.Items.Add(NIL,IntToStr(Principal.MainMenu1.Items.Items[Y].Tag)+' - '+
                                     Mostrar);
        Application.Processmessages;
      end
    else
      Begin
        Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y].Caption);
        Y1:=TreeView1.Items.Add(NIL,IntToStr(Principal.MainMenu1.Items.Items[Y].Tag)+' - '+
                                     Mostrar);
        Application.Processmessages;
        For X:=0 to Principal.MainMenu1.Items.Items[Y].Count-1 do
          Begin
            If Principal.MainMenu1.Items.Items[Y][x].Count = 0 Then
              Begin
                If Principal.MainMenu1.Items[Y][X].Caption <> '-' Then
                  Begin
                    Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y][X].Caption);
                    X1:=TreeView1.Items.AddChild(Y1,IntToStr(Principal.MainMenu1.Items.Items[Y][X].Tag)+' - '+
                                                    Mostrar);
                  end;
                Application.Processmessages;
              end
            else
              Begin
                Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y][X].Caption);
                X1:=TreeView1.Items.AddChild(Y1,IntToStr(Principal.MainMenu1.Items.Items[Y][X].Tag)+' - '+
                                                Mostrar);
                Application.Processmessages;
                For Z:=0 to Principal.MainMenu1.Items.Items[Y].Items[x].Count-1 do
                  Begin
                    If Principal.MainMenu1.Items.Items[Y][x][Z].Count = 0 Then
                      Begin
                        Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y][X][Z].Caption);
                        Z1:=TreeView1.Items.AddChild(X1,IntToStr(Principal.MainMenu1.Items.Items[Y][X][Z].Tag)+' - '+
                                                        Mostrar);
                        Application.Processmessages;
                      end
                    else
                      Begin
                        Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y][X][Z].Caption);
                        Z1:=TreeView1.Items.AddChild(X1,IntToStr(Principal.MainMenu1.Items.Items[Y][X][Z].Tag)+' - '+
                                                        Mostrar);
                        Application.Processmessages;
                        For M:=0 to Principal.MainMenu1.Items.Items[Y].Items[x].Items[Z].Count-1 do
                          Begin
                            If Principal.MainMenu1.Items.Items[Y][x][Z][M].Count = 0 Then
                              Begin
                                Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y][X][Z][M].Caption);
                                M1:=TreeView1.Items.AddChild(Z1,IntToStr(Principal.MainMenu1.Items.Items[Y][X][Z][M].Tag)+' - '+
                                                                Mostrar);
                                Application.Processmessages;
                              end
                            else
                              Begin
                                Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y][X][Z][M].Caption);
                                M1:=TreeView1.Items.AddChild(Z1,IntToStr(Principal.MainMenu1.Items.Items[Y][X][Z][M].Tag)+' - '+
                                                                Mostrar);
                                Application.Processmessages;
                                For N:=0 to Principal.MainMenu1.Items.Items[Y].Items[x].Items[Z].Items[M].Count-1 do
                                  Begin
                                    If Principal.MainMenu1.Items.Items[Y][x][Z][M][n].Count = 0 Then
                                      Begin
                                        Mostrar:=Quitar_Ampersan(Principal.MainMenu1.Items[Y][X][Z][M][N].Caption);
                                        N1:=TreeView1.Items.AddChild(M1,IntToStr(Principal.MainMenu1.Items.Items[Y][X][Z][M][N].Tag)+' - '+
                                                                        Mostrar);
                                        Application.Processmessages;
                                      end;
                                  End;
                              end;
                          End;
                      end;
                  End;
              end;
          end;
      end;
end;



Procedure TAcceso_a_Modulos.Cargar_Datos;
var
  I,X:Integer;
  St:String;
Begin
  For X:=0 to TreeView1.Items.Count-1 do
    Begin
      I:=1;
      ST:='';
      While (Treeview1.Items.Item[X].Text[I] <> ' ') do
        Begin
          St:=St+Treeview1.Items.Item[X].Text[I];
          I:=I+1;
        end;
      If Datos.TablaAccesos.Fieldbyname(St).asBoolean = True Then
         TreeView1.Items.Item[X].ImageIndex:=1
      else
         TreeView1.Items.Item[X].ImageIndex:=0
    end;
end;

Procedure TAcceso_a_Modulos.Guardar_Datos;
var
  I,X:Integer;
  St:String;
Begin
  Datos.TablaAccesos.IndexName:='';
  Datos.TablaAccesos.Setkey;
  Datos.TablaAccesos.FieldByname('Login').AsString:=Edit1.Text;
  Datos.TablaAccesos.Gotokey;
  Datos.TablaAccesos.Edit;
  For X:=0 to TreeView1.Items.Count-1 do
    Begin
      I:=1;
      ST:='';
      While (Treeview1.Items.Item[X].Text[I] <> ' ') do
        Begin
          St:=St+Treeview1.Items.Item[X].Text[I];
          I:=I+1;
        end;
      If ST <> '0' Then
        Begin
          If TreeView1.Items.Item[X].ImageIndex = 1 Then
             Datos.TablaAccesos.Fieldbyname(St).asBoolean := True
          else
             Datos.TablaAccesos.Fieldbyname(St).asBoolean := False;
        end;
    end;
  Datos.TablaAccesos.Post;
end;

Procedure TAcceso_a_Modulos.Limpiar_Componentes;
Begin
  Edit1.Text:='';
  Label1.Caption:='';
  Treeview1.Items.Clear;
end;

procedure TAcceso_a_Modulos.CerrarBtnClick(Sender: TObject);
begin
  Salir:=True;
  Close;
end;

procedure TAcceso_a_Modulos.FormShow(Sender: TObject);
begin
  Salir:=False;
  IncluirBtn.Enabled:=False;
  Edit1.Text:='';
  Label1.Caption:='';
  Treeview1.Items.Clear;
  Edit1.SetFocus;
end;

procedure TAcceso_a_Modulos.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    BEgin
      Datos.TablaAccesos.IndexName:='';
      Datos.TablaAccesos.SetKey;
      Datos.TablaAccesos.FieldByname('Login').AsString:=Edit1.Text;
      If Datos.TablaAccesos.GotoKey = True Then
        Begin
          Datos.TablaUsuarios.IndexName:='Login_Index';
          Datos.TablaUsuarios.SetKey;
          Datos.TablaUsuarios.FieldByname('Login').AsString:=Edit1.Text;
          If Datos.TablaUsuarios.GotoKey = True Then
              Label1.Caption:=Datos.TablaUsuarios.FieldByname('Nombres').AsString+' '+
                              Datos.TablaUsuarios.FieldByname('Apellidos').AsString;
          Hacer_Arbol;
          Cargar_Datos;
          Concordar_Imagenes;
          TreeView1.Refresh;
          Edit1.Enabled:=False;
          IncluirBtn.Enabled:=True;
          TreeView1.SetFocus;
          Key:=#0;
        end
      else
        Begin
          Treeview1.Items.Clear;
          Limpiar_Componentes;
          ShowMessage('El Login que ha especificado, no se encuentra '+
                      'en nuestros registros, por favor Corrija el problema '+
                      'para poder continuar.');
          Edit1.SetFocus;
        end;
    end;
end;

procedure TAcceso_a_Modulos.IncluirBtnClick(Sender: TObject);
begin
  GuarDar_Datos;
  Limpiar_Componentes;
  TreeView1.Items.Clear;
  IncluirBtn.Enabled:=False;
  Edit1.Enabled:=True;
  Edit1.SetFocus;
end;

Procedure TAcceso_a_Modulos.Concordar_Imagenes;
var
  X:Integer;
Begin
  For X:=0 to TreeView1.Items.Count-1 do
    Begin
      TreeView1.Items.Item[X].SelectedIndex := TreeView1.Items.Item[X].ImageIndex;
    end;
end;


Procedure TAcceso_a_Modulos.Chequea_Padres(Nodo:TTreeNode);
var
  I:TTreeNode;
Begin
  If Nodo.Parent <> Nil Then
    Begin
      I:=Nodo.Parent;
      Chequea_Padres(I);
      Nodo.ImageIndex:=1;
    end
  else
    Nodo.ImageIndex:=1;
end;

Procedure TAcceso_a_Modulos.TreeView1KeyPress(Sender: TObject;
  var Key: Char);
var
  i:Integer;
begin
  If Key = #32 Then
    Begin
      I:=TreeView1.Selected.AbsoluteIndex;
      If TreeView1.Items.Item[I].ImageIndex = 1 Then
        Begin
          TreeView1.Items.Item[I].ImageIndex := 0;
          TreeView1.Items.Item[I].SelectedIndex := 0;
        end
      Else
        Begin
          Chequea_Padres(TreeView1.Selected);
          TreeView1.Items.Item[I].ImageIndex := 1;
          TreeView1.Items.Item[I].SelectedIndex := 1;
        end;
      TreeView1.Refresh;
      Concordar_Imagenes;
      Key:=#0;
    end;
end;

procedure TAcceso_a_Modulos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If Salir = True Then
    CanClose:=True
  else
    CanClose:=FALSE;
end;

procedure TAcceso_a_Modulos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 Then
    Begin
      TreeView1.Items.Clear;
      Edit1.Enabled:=True;
      Edit1.Setfocus;
    end;
end;

procedure TAcceso_a_Modulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If Salir = False Then
    Action:=CaNone;
end;

end.
