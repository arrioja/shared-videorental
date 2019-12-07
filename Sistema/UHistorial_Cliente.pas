unit UHistorial_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, HeadLbl, marquee, Grids, DBGrids, Db,
  DBTables, Buttons, Gradpan, Counter;

type
  THistorial_Cliente = class(TForm)
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    HeadLabel1: THeadLabel;
    HeadLabel2: THeadLabel;
    HeadLabel3: THeadLabel;
    DBGrid1: TDBGrid;
    Bevel2: TBevel;
    Marquee1: TMarquee;
    DetallesBtn: TBitBtn;
    CerrarBtn: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    HeadLabel4: THeadLabel;
    HeadLabel5: THeadLabel;
    Observaciones: TMemo;
    Label33: TLabel;
    Valor_Debe_Multas: TCounter;
    Valor_Debe_Alquileres: TCounter;
    Valor_Multas: TCounter;
    Valor_Alquileres: TCounter;
    Valor_Total: TCounter;
    procedure CerrarBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DetallesBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Historial_Cliente: THistorial_Cliente;

implementation

uses Uprincipal, uDetalles, Ulista_clientes, UHistorial_Videos,
  ualquilar_y_devolver, MODULO_DE_DATOS, UControl_Observaciones;

{$R *.DFM}

procedure THistorial_Cliente.CerrarBtnClick(Sender: TObject);
begin
  Close;
end;

procedure THistorial_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If Desde_Principal = False then
    Begin
      If Ultima_Cliente = 'Lista_Clientes' then
        Begin
          Lista_Clientes.Enabled:=True;
        end;
      If Ultima_Cliente = 'Alquilar y Devolver' then
        Begin
          Datos.Videos.Refresh;
          Datos.Videos.Cancelrange;
          Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
          Datos.Videos.setrange([Alquilar_y_Devolver.Maskedit1.text]
                               ,[Alquilar_y_Devolver.Maskedit1.text]);
          Datos.Videos.Refresh;
          Datos.Videos.First;
          Alquilar_y_Devolver.Enabled:=True;
        end;
    end;
end;

procedure THistorial_Cliente.FormShow(Sender: TObject);
begin
  If Desde_Principal = True then
    Begin
      Observaciones.Clear;
      DetallesBtn.Enabled:=False;
      Valor_Multas.Value:='0';
      Valor_Alquileres.Value:='0';
      Valor_Debe_Multas.Value:='0';
      Valor_Debe_Alquileres.Value:='0';
      Valor_Total.Value:='0';
      MaskEdit1.Text:='';
      Datos.Videos.Active:=False;
      Label3.caption:='0';
      Edit1.Text:='';
      MaskEdit1.Setfocus;
    end
  else
    Begin
      Datos.Clientes.indexname:='';
      Datos.Clientes.setkey;
      Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit1.Text;
      If (Datos.Clientes.gotokey = true) then
        Begin
          Valor_Multas.Value:=Datos.Clientes.Fieldbyname('Gastado_en_Multa').AsString;
          Valor_Alquileres.Value:=Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').AsString;
          Valor_Debe_Multas.Value:=Datos.Clientes.Fieldbyname('Debe_Multas').AsString;
          Valor_Debe_Alquileres.Value:=Datos.Clientes.Fieldbyname('Debe_Alquileres').AsString;
          Valor_Total.Value:=IntToStr(StrToInt(Valor_Multas.Value) + StrToInt(Valor_Alquileres.Value));

          Edit1.Text:=Datos.Clientes.Fieldbyname('Nombres_Cliente').Asstring+' '+
                      Datos.Clientes.Fieldbyname('Apellidos_Cliente').Asstring;
          Datos.Videos.Open;
          Observaciones.Clear;
          Observaciones.Lines.Add(Datos.Clientes.Fieldbyname('Observaciones').Asstring);
          //Se buscan todos los videos que tenga alquilado ese usuario
          Datos.Videos.Refresh;
          Datos.Videos.Cancelrange;
          Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
          Datos.Videos.setrange([Maskedit1.text]
                         ,[Maskedit1.text]);
          Datos.Videos.Refresh;
          Datos.Videos.First;
          Label3.caption:=inttostr(Datos.Videos.Recordcount);
          DetallesBtn.Enabled:=True;
          MaskEdit1.Enabled:=False;
        End
    end;
end;


procedure THistorial_Cliente.MaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key = #13) then
  begin
    Datos.Clientes.indexname:='';
    Datos.Clientes.setkey;
    Datos.Clientes.fieldbyname('Codigo_Cliente').asstring:=Maskedit1.Text;
    If (Datos.Clientes.gotokey = true) then
       Begin
         Valor_Multas.Value:=Datos.Clientes.Fieldbyname('Gastado_en_Multa').AsString;
         Valor_Alquileres.Value:=Datos.Clientes.Fieldbyname('Gastado_en_Alquiler').AsString;
         Valor_Debe_Multas.Value:=Datos.Clientes.Fieldbyname('Debe_Multas').AsString;
         Valor_Debe_Alquileres.Value:=Datos.Clientes.Fieldbyname('Debe_Alquileres').AsString;
         Valor_Total.Value:=IntToStr(StrToInt(Valor_Multas.Value) + StrToInt(Valor_Alquileres.Value));
         Edit1.Text:=Datos.Clientes.Fieldbyname('Nombres_Cliente').Asstring+' '+
                     Datos.Clientes.Fieldbyname('Apellidos_Cliente').Asstring;
         Observaciones.Clear;
         Observaciones.Lines.Add(Datos.Clientes.Fieldbyname('Observaciones').Asstring);
       //Se buscan todos los videos que tenga alquilado ese usuario
         If Datos.Videos.ACTIVE = False Then
            Datos.Videos.ACTIVE := True;
         Datos.Videos.Refresh;
         Datos.Videos.Cancelrange;
         Datos.Videos.indexname:='Codigo_de_Usuario_Indice';
         Datos.Videos.setrange([Maskedit1.text]
                        ,[Maskedit1.text]);
         Datos.Videos.Refresh;
         Datos.Videos.First;
         Label3.caption:=inttostr(Datos.Videos.Recordcount);
         DetallesBtn.Enabled:=True;
         key:=#3;
       End
    else
       Begin
         Observaciones.Clear;
         Datos.Videos.Active:=False;
         Valor_Multas.Value:='0';
         Valor_Alquileres.Value:='0';
         Valor_Debe_Multas.Value:='0';
         Valor_Debe_Alquileres.Value:='0';
         Valor_Total.Value:='0';
         Label3.caption:='0';
         Edit1.Text:='';
         DetallesBtn.Enabled:=False;
         Showmessage('El código que ha ingresado no se encuentra, por '+
                     'favor, corrija el problema y continúe la búsqueda.');
         MaskEdit1.Text:='';
         Maskedit1.Setfocus;
         key:=#3;
       end;
  end;
 If Key = #27 then
  Begin
    Close;
  end;
end;

procedure THistorial_Cliente.DetallesBtnClick(Sender: TObject);
begin
  Try
    Begin
      Detalles:=TDetalles.Create(Self);
      Detalles.Showmodal;
    end
  Finally
    Begin
      Detalles.Free;
      Detalles:=Nil;
    end
  end;
end;
procedure THistorial_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_F4) then
   Begin
     Try
       Begin
         Control_Observaciones:=TControl_Observaciones.Create(Self);
         Control_Observaciones.ABuscar.Caption:=MAskEdit1.Text;
         Control_Observaciones.Showmodal;
         Observaciones.Clear;
         Observaciones.Lines.Add(Datos.Clientes.Fieldbyname('Observaciones').Asstring);
       end
     Finally
       Begin
         Control_Observaciones.Free;
         Control_Observaciones:=Nil;
       end;
     end;
   end;
end;

end.
