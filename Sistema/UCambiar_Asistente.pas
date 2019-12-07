unit UCambiar_Asistente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, oaPanel, StdCtrls, Menus, Buttons, oaAssist,oaTypes,
  jpeg, MLCBRB;

type
  TCambiar_Asistente = class(TForm)
    Memo1: TMemo;
    PopupMenu1: TPopupMenu;
    IncluirBtn: TSpeedButton;
    Panel: TAssistantPanel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    MultiCheckBox1: TMultiCheckBox;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure IncluirBtnClick(Sender: TObject);
    procedure bar1IconClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cambiar_Asistente: TCambiar_Asistente;
  Ruta_Programa:String;

implementation

uses UPrincipal, Modulo_de_Datos;

{$R *.DFM}

procedure TCambiar_Asistente.FormShow(Sender: TObject);
begin
{  Ruta_Programa:=ExtractFilePath(Application.ExeName);
  Panel.BgPicture.LoadFromFile(Ruta_Programa+'Imagenes\Granito.gif');
  Bar1.Items[0].Items[0].Enabled:=FileExists(Ruta_Programa+'Actores\Claude.aal');
  Bar1.Items[0].Items[1].Enabled:=FileExists(Ruta_Programa+'Actores\Peedy.aal');
  Bar1.Items[0].Items[2].Enabled:=FileExists(Ruta_Programa+'Actores\Genie.aal');
  Bar1.Items[0].Items[3].Enabled:=FileExists(Ruta_Programa+'Actores\Merlin.aal');
  Bar1.Items[0].Items[4].Enabled:=FileExists(Ruta_Programa+'Actores\Robby.aal');
  MultiCheckBox1.Checked:=Usuario.Inicio_ASIS;
  Panel.ActorLibrary:=Principal.Asis.ActorLibrary;
  Panel.Play('Show');
}
end;

procedure TCambiar_Asistente.IncluirBtnClick(Sender: TObject);
begin
{  Usuario.Inicio_ASIS:=MultiCheckBox1.Checked;
  Panel.StopAll;
  Principal.Asis.ActorLibrary:=Panel.ActorLibrary;
  Panel.ActorLibrary:='';
  Close;
}end;

procedure TCambiar_Asistente.bar1IconClick(Sender: TObject);
//var
//  Action: TActorAction;
begin
{  If Bar1.SelectedButton = 0 Then
    Begin
      Memo1.Lines.Clear;
      Panel.StopAll;
      Panel.WaitFor(Panel.Play('Hide'));
      Case Bar1.SelectedIcon Of
        0:Begin
            Panel.ActorLibrary:=Ruta_Programa+'Actores\Claude.aal';
            Memo1.Lines.Clear;
            Memo1.Lines.Add('Hola, soy Claudio *Hic*, nunca creas cuando '+
                            'alguien te dice que un oso borracho no puede '+
                            'ser de utilidad... yo te ayudaré en lo que desees...');
          end;
        1:Begin
            Panel.ActorLibrary:=Ruta_Programa+'Actores\Peedy.aal';
            Memo1.Lines.Add('Hola, mi nombre es Cotorrín, si me das una galleta '+
                            'te ayudaré en lo que desees saber acerca del '+
                            'programa... ');
          end;
        2:Begin
            Panel.ActorLibrary:=Ruta_Programa+'Actores\Genie.aal';
            Memo1.Lines.Add('Hola, AMO, soy Genio, como las leyes del Sindicato '+
                            'cambiaron después de las últimas elecciones, '+
                            'el "Sindicato Bolivariano de Genios" te concede '+
                            'Ayuda INFINITA...');
          end;
        3:Begin
            Panel.ActorLibrary:=Ruta_Programa+'Actores\Merlin.aal';
            Memo1.Lines.Add('Hola, soy Merlín, a través de mis poderes '+
                            'mágicos, trataré de hacer lo posible para '+
                            'ayudarte en lo que desees en el sistema... ');
          end;
        4:Begin
            Panel.ActorLibrary:=Ruta_Programa+'Actores\Robby.aal';
            Memo1.Lines.Add('Hola, soy Robby, y estoy especialmente '+
                            'diseñado y construido para ayudarte en las '+
                            'tareas que harás en el sistema... ');
          end;
      end;
      Panel.WaitFor(Panel.Play('Show'));
      Panel.Play('Greet');
      Panel.Play('RestPose');
    end
  else
    Begin
      Case Bar1.SelectedIcon Of
        0:Begin
            if Panel.AnimationCount > 0 then
              begin
                Panel.StopAll;
                Repeat
                  Action := TActorAction(Random(Ord(High(TActorAction))+1));
                until Panel.Play(Action) <> 0;
                Panel.Play('RestPose');
                if Action = aaHide then Panel.Play(aaRestPose);
              end;
          end;
        1:Begin
            Datos.TablaUsuarios.IndexName:='Cedula_Index';
            Datos.TablaUsuarios.Setkey;
            Datos.TablaUsuarios.Fieldbyname('Cedula').AsString:=Usuario.Cedula;
            Datos.TablaUsuarios.Gotokey;
            Datos.TablaUsuarios.Edit;
            Datos.TablaUsuarios.Fieldbyname('Asistente').AsString:= Panel.ActorName+'.aal';
            Datos.TablaUsuarios.Fieldbyname('Asistente_al_Inicio').AsBoolean:=MultiCheckBox1.Checked;
            Datos.TablaUsuarios.Post;
            Showmessage('El Asistente se ha cambiado con éxito...');
          end;
      end;
    end;
}end;

procedure TCambiar_Asistente.SpeedButton1Click(Sender: TObject);
begin
 // Close;
end;

end.
