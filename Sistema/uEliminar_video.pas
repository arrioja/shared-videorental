unit uEliminar_video;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Spin, Mask, DB, DBTables, ComCtrls, Gauges;

type
  TEliminar_video = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    MaskEdit2: TMaskEdit;
    OKBTn: TBitBtn;
    CancelBtn: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    MaskEdit3: TMaskEdit;
    RadioGroup1: TRadioGroup;
    Gauge1: TGauge;
    Label7: TLabel;
    Bevel3: TBevel;
    MaskEdit1: TMaskEdit;
    GroupBox1: TGroupBox;
    Video_Doble_Check: TCheckBox;
    CheckBox1: TCheckBox;
    Bevel5: TBevel;
    CheckBox2: TCheckBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure OKBTnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Eliminar_video: TEliminar_video;
  movienumber:integer;
  primero:string;
  Titulo:string;
  Categoria:String;
  Censura:Char;
  Precio:Integer;

implementation

uses uprincipal, uconfirmar, MODULO_DE_DATOS;

{$R *.DFM}

procedure TEliminar_video.CancelBtnClick(Sender: TObject);
begin
  close;
end;

procedure TEliminar_video.ComboBox1Change(Sender: TObject);
begin
if combobox1.itemindex=18 then
  begin
    combobox2.itemindex:=4;
    combobox2.enabled:=false;
  end
else
    combobox2.enabled:=true;
end;

procedure TEliminar_video.OKBTnClick(Sender: TObject);
var
  y:integer;
  Codiguis:string;
  Ejemplaris:integer;
  st:string;
  Desglozar:string;
  Codigo_a_Eliminar:string;
  Encontrado:Boolean;
begin
  Try
    Begin
      Try
        Begin
          Encontrado:=False;
          Gauge1.MaxValue:=999;
          Confirmar:=TConfirmar.Create(Self);
          Confirmar.Label1.caption:='Está Seguro ?.';
          Confirmar.BitBtn1.Hint:='Eliminar Video (s)';
          Confirmar.BitBtn2.Hint:='Cancelar la Eliminación.';
          Confirmar.Caption:='C o n f i r m a r .';
          Confirmar.showmodal;
          if Confirmar.modalresult = mrok then
            Begin
              If Radiogroup1.Itemindex = 0 then
                Begin
                  Datos.Videos.Refresh;
                  Datos.Videos.First;
                  Datos.Videos.indexname:='';
                  Datos.Videos.setkey;
                  Datos.Videos.fieldbyname('codigo_Video').asstring:=MaskEdit1.Text;
                  Datos.Videos.Gotokey;
                  Datos.Videos.Delete;
                  Datos.Videos.FlushBuffers;
                  Datos.Videos.Refresh;

//Se comprueba que exista otro video de este tipo, y si no existe mas
//ninguno, se eliminan sus datos del Historial y de Total.
                  Codiguis:=Maskedit1.text;
                  st:='001';
                  Codiguis[6]:='0';
                  Codiguis[7]:='0';
                  Codiguis[8]:='1';
                  Ejemplaris:=strtoint(st);
                  Datos.Videos.Refresh;
                  Datos.Videos.First;
                  Datos.Videos.indexname:='';
                  Datos.Videos.setkey;
                  Datos.Videos.fieldbyname('codigo_Video').asstring:=Codiguis;
                  While ((Ejemplaris <=999) and (Encontrado = False)) do
                    Begin
                      Datos.Videos.Refresh;
                      If Datos.Videos.Gotokey = True then
                        Begin
                          Encontrado:=True;
                        end;
                      Ejemplaris:=Ejemplaris+1;
                      st:=inttostr(Ejemplaris);
                      if length(st) = 1 then
                        begin
                          Codiguis[6]:='0';
                          Codiguis[7]:='0';
                          Codiguis[8]:=st[1];
                        end;
                      if length(st) = 2 then
                        begin
                          for y:=7 to 8 do
                            begin
                              Codiguis[6]:='0';
                              Codiguis[7]:=st[1];
                              Codiguis[8]:=st[2];
                            end;
                        end;
                      if length(st) = 3 then
                        begin
                          for y:=6 to 8 do
                            begin
                              Codiguis[6]:=st[1];
                              Codiguis[7]:=st[2];
                              Codiguis[8]:=st[3];
                            end;
                        end;
                      Datos.Videos.setkey;
                      Datos.Videos.fieldbyname('codigo_Video').asstring:=Codiguis;
                    end;
                  If Encontrado = False then
                    Begin
                      Desglozar:='';
                      Desglozar:=MaskEdit1.Text;
                      Codigo_a_Eliminar:='';
                      Codigo_a_Eliminar:=Desglozar[1]+Desglozar[2]+Desglozar[3]+Desglozar[4];
                      Datos.Historia.Refresh;
                      Gauge1.Maxvalue:=Datos.Historia.Recordcount;
                      Gauge1.Progress:=0;
                      Datos.Historia.First;
                      While Not(Datos.Historia.EOF) do
                        Begin
                          If Datos.Historia.Fieldbyname('Codigo_Video').Asstring = Codigo_a_Eliminar then
                            Begin
                              Datos.Historia.Edit;
                              Datos.Historia.Delete;
                              Datos.Historia.FlushBuffers;
                            End
                          else
                            BEgin
                              Datos.Historia.MoveBy(1);
                            end;
                          Gauge1.Progress:=Gauge1.Progress+1;
                        end;

                      Datos.Total.Refresh;
                      Datos.Total.First;
                      Datos.Total.IndexName:='';
                      Datos.Total.Setkey;
                      Datos.Total.Fieldbyname('Codigo_Video').Asstring:=Codigo_a_Eliminar;
                      Datos.Total.Gotokey;
                      Datos.Total.Edit;
                      Datos.Total.Delete;
                      Datos.Total.FlushBuffers;
                    end;
                  Gauge1.Progress:=999;
                end
             else
                Begin    // Si se desean eliminar todos los ejemplares
                  Codiguis:=Maskedit1.text;
                  st:='001';
                  Codiguis[6]:='0';
                  Codiguis[7]:='0';
                  Codiguis[8]:='1';
                  Ejemplaris:=strtoint(st);
                  Datos.Videos.Refresh;
                  Datos.Videos.First;
                  Datos.Videos.indexname:='';
                  Datos.Videos.setkey;
                  Datos.Videos.fieldbyname('codigo_Video').asstring:=Codiguis;
                  While (Ejemplaris <=999) do
                    Begin
                      Datos.Videos.Refresh;
                      If Datos.Videos.Gotokey then
                        Begin
                          Datos.Videos.Delete;
                          Datos.Videos.FlushBuffers;
                        end;
                      Gauge1.Progress:=Ejemplaris;
                      Ejemplaris:=Ejemplaris+1;
                      st:=inttostr(Ejemplaris);
                      if length(st) = 1 then
                        begin
                          Codiguis[6]:='0';
                          Codiguis[7]:='0';
                          Codiguis[8]:=st[1];
                        end;
                      if length(st) = 2 then
                        begin
                          for y:=7 to 8 do
                            begin
                              Codiguis[6]:='0';
                              Codiguis[7]:=st[1];
                              Codiguis[8]:=st[2];
                            end;
                        end;
                      if length(st) = 3 then
                        begin
                          for y:=6 to 8 do
                            begin
                              Codiguis[6]:=st[1];
                              Codiguis[7]:=st[2];
                              Codiguis[8]:=st[3];
                            end;
                        end;
                      Datos.Videos.setkey;
                      Datos.Videos.fieldbyname('codigo_Video').asstring:=Codiguis;
                    end;
                Gauge1.Progress:=999;
                Desglozar:='';
                Desglozar:=MaskEdit1.Text;
                Codigo_a_Eliminar:='';
                Codigo_a_Eliminar:=Desglozar[1]+Desglozar[2]+Desglozar[3]+Desglozar[4];
                Gauge1.Maxvalue:=Datos.Historia.Recordcount;
                Gauge1.Progress:=0;
                Datos.Historia.Refresh;
                Datos.Historia.First;
                While Not(Datos.Historia.EOF) do
                  Begin
                    If Datos.Historia.Fieldbyname('Codigo_Video').Asstring = Codigo_a_Eliminar then
                      Begin
                        Datos.Historia.Edit;
                        Datos.Historia.Delete;
                        Datos.Historia.FlushBuffers;
                      End
                    else
                      BEgin
                        Datos.Historia.Next;
                      end;
                    Gauge1.Progress:=Gauge1.Progress+1;
                  end;

                Datos.Total.Refresh;
                Datos.Total.First;
                Datos.Total.IndexName:='';
                Datos.Total.Setkey;
                Datos.Total.Fieldbyname('Codigo_Video').Asstring:=Codigo_a_Eliminar;
                If Datos.Total.Gotokey = True Then
                  Begin
                    Datos.Total.Edit;
                    Datos.Total.Delete;
                    Datos.Total.FlushBuffers;
                  end;
                end;

     //Luego de Haber Eliminado el Video, se limpian los campos y se
     //vuelve a pedir otro video a eliminar
             MaskEdit1.Text:='';
             MaskEdit2.Text:='';
             MaskEdit3.Text:='';
             Video_Doble_Check.Checked:=False;
             CheckBox1.Checked:=False;
             CheckBox2.Checked:=False;             
             Edit1.Text:='';
             Combobox1.Text:='';
             Combobox2.Text:='';
             Gauge1.progress:=0;
             RadioGroup1.Itemindex:=0;
             Maskedit1.SetFocus;
             OKBTN.Enabled:=False;
             RadioGroup1.Enabled:=False;
             Showmessage('Vídeo(s) Eliminado(s).');
            end
          else
            Begin
              MaskEdit1.Text:='';
              MaskEdit2.Text:='';
              MaskEdit3.Text:='';
              Video_Doble_Check.Checked:=False;
              Edit1.Text:='';
              Combobox1.Text:='';
              Combobox2.Text:='';
              Gauge1.progress:=0;
              RadioGroup1.Itemindex:=0;
              Maskedit1.SetFocus;
              OKBTN.Enabled:=False;
              RadioGroup1.Enabled:=False;
            end;
        end
{***********************************************************************}
      except
//        on EdatabaseError do
//          Begin
//            Showmessage('Ha Ocurrido un ERROR grave con la Base de datos del sistema, '+
//                        'Por favor, contacte a Pedro Arrioja por el Teléfono: 016-796-13-06 '+
//                        'para una revisión inmediata y corrección del problema; para la '+
//                        'inmediata protección de los archivos, Vídeo Rental se Cerrará.');
//            Application.Terminate;
//          end;
      end;
    end
  Finally
    Begin
      Confirmar.Free;
      Confirmar:=Nil;
    end;
  end;
end;


procedure TEliminar_video.FormShow(Sender: TObject);
begin
  Gauge1.MaxValue:=999;
  MaskEdit1.Text:='';
  MaskEdit2.Text:='';
  MaskEdit3.Text:='';
  Video_Doble_Check.Checked:=False;
  Edit1.Text:='';
  Combobox1.Text:='';
  Combobox2.Text:='';
  Gauge1.progress:=0;
  RadioGroup1.Itemindex:=0;

  MaskEdit2.Enabled:=False;
  MaskEdit3.Enabled:=False;
  Video_Doble_Check.Enabled:=False;
  Edit1.Enabled:=False;
  Combobox1.Enabled:=False;
  Combobox2.Enabled:=False;
  RadioGroup1.Enabled:=False;
  OKBTN.Enabled:=False;
  MaskEdit1.Setfocus;
end;



procedure TEliminar_video.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key = #13) then
  begin
    Gauge1.MaxValue:=999;
    Datos.Videos.Refresh;
    Datos.Videos.indexname:='';
    Datos.Videos.setkey;
    Datos.Videos.fieldbyname('Codigo_Video').asstring:=Maskedit1.Text;
    If (Datos.Videos.gotokey = true) then
       Begin
         OKBTN.Enabled:=True;
         RadioGroup1.Enabled:=True;
         Edit1.Text:=Datos.Videos.fieldbyname('Titulo_Video').asstring;
         Combobox1.Text:=Datos.Videos.fieldbyname('Categoria_Video').asstring;
         MaskEdit2.Text:=Datos.Videos.fieldbyname('Fecha_Ingreso_Video').asstring;
         combobox2.text:=Datos.Videos.fieldbyname('Clase_Video').asstring;
         Checkbox1.Checked:=Datos.Videos.fieldbyname('Estreno').asboolean;
         Checkbox2.Checked:=Datos.Videos.fieldbyname('DVD').asboolean;         
         MaskEdit3.Text:=Datos.Videos.fieldbyname('Precio_Video').asstring;
         Video_Doble_Check.Checked:=Datos.Videos.fieldbyname('Video_Doble').asboolean;
       end
    else
       Begin
         MaskEdit1.Text:='';
         MaskEdit2.Text:='';
         MaskEdit3.Text:='';
         Video_Doble_Check.Checked:=False;
         Edit1.Text:='';
         Combobox1.Text:='';
         Combobox2.Text:='';
         Gauge1.progress:=0;
         RadioGroup1.Itemindex:=0;
         RadioGroup1.Enabled:=False;
         Showmessage('El Código del video que ha introducido no se encuentra '+
                     'registrado, por favor, corrija el problema para poder '+
                     'continuar.');
         OKBTN.Enabled:=False;
         Maskedit1.SetFocus;
       end;
  end;
 If (Key = #27) then
  Begin
    Close;
  end;
end;

end.
