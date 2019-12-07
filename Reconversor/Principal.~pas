unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Gauges, DBTables, DB, Refresh, Math;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    G1: TGauge;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    G2: TGauge;
    Label2: TLabel;
    Label3: TLabel;
    Base: TDatabase;
    Sesion: TSession;
    Clientes: TSelfRefreshTable;
    Cheques: TSelfRefreshTable;
    Total: TSelfRefreshTable;
    Videos: TSelfRefreshTable;
    Debe: TSelfRefreshTable;
    Usuarios_Desactivados: TSelfRefreshTable;
    procedure BitBtn1Click(Sender: TObject);
    function Redondear(Valor: Real; Redondeo: Integer):Real;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uconfirmar;

{$R *.dfm}


function TForm1.Redondear(Valor: Real; Redondeo: Integer):Real;
begin
   Redondear := Round(Valor * Power(10, Redondeo)) / Power(10,Redondeo);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
Var
Conv:real;
begin
  Confirmar.ShowModal;
  If Confirmar.ModalResult = mrOk Then
    Begin
      BitBtn1.Enabled:=False;
//**************************************************************************************
      Clientes.Open;
      Clientes.First;
      G1.MaxValue:=Clientes.RecordCount;
      While Not(Clientes.Eof) do
        Begin

          Clientes.Edit;
          Conv:=Clientes.fieldbyname('Gastado_en_Alquiler').AsCurrency*1000;
          Clientes.fieldbyname('Gastado_en_Alquiler').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Gastado_en_Multa').AsCurrency*1000;
          Clientes.fieldbyname('Gastado_en_Multa').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Debe_Multas').AsCurrency*1000;
          Clientes.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Debe_Alquileres').AsCurrency*1000;
          Clientes.fieldbyname('Debe_Alquileres').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Maximo_Deuda').AsCurrency*1000;
          Clientes.fieldbyname('Maximo_Deuda').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Monto_Deposito').AsCurrency*1000;
          Clientes.fieldbyname('Monto_Deposito').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Monto_Inscripcion').AsCurrency*1000;
          Clientes.fieldbyname('Monto_Inscripcion').AsCurrency:=Redondear(Conv, 2);

          Clientes.Post;
          Clientes.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Clientes.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //************************************************************************************

      Cheques.Open;
      Cheques.First;
      G1.Progress:=0;
      G1.MaxValue:=Cheques.RecordCount;
      While Not(Cheques.Eof) do
        Begin

          Cheques.Edit;
          Conv:=Cheques.fieldbyname('Cantidad_cheque').AsCurrency*1000;
          Cheques.fieldbyname('Cantidad_cheque').AsCurrency:=Redondear(Conv, 2);

          Cheques.Post;
          Cheques.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Cheques.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************

      Videos.Open;
      Videos.First;
      G1.MaxValue:=Videos.RecordCount;
      While Not(Videos.Eof) do
        Begin

          Videos.Edit;
          Conv:=Videos.fieldbyname('Precio_Video').AsCurrency*1000;
          Videos.fieldbyname('Precio_Video').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Ingresos_del_Video').AsCurrency*1000;
          Videos.fieldbyname('Ingresos_del_Video').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Ingresos_por_Alquiler').AsCurrency*1000;
          Videos.fieldbyname('Ingresos_por_Alquiler').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Ingresos_por_Multa').AsCurrency*1000;
          Videos.fieldbyname('Ingresos_por_Multa').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Debe_Multas').AsCurrency*1000;
          Videos.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Debe_Alquileres').AsCurrency*1000;
          Videos.fieldbyname('Debe_Alquileres').AsCurrency:=Redondear(Conv, 2);

          Videos.Post;
          Videos.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Videos.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //************************************************************************************
      Total.Open;
      Total.First;
      G1.Progress:=0;
      G1.MaxValue:=Total.RecordCount;
      While Not(Total.Eof) do
        Begin

          Total.Edit;
          Conv:=Total.fieldbyname('Ingreso_Total').AsCurrency*1000;
          Total.fieldbyname('Ingreso_Total').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Alquiler_Total').AsCurrency*1000;
          Total.fieldbyname('Alquiler_Total').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Debe_Multas').AsCurrency*1000;
          Total.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Debe_Alquileres').AsCurrency*1000;
          Total.fieldbyname('Debe_Alquileres').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Multa_Total').AsCurrency*1000;
          Total.fieldbyname('Multa_Total').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Valor_Total').AsCurrency*1000;
          Total.fieldbyname('Valor_Total').AsCurrency:=Redondear(Conv, 2);

          Total.Post;

          Total.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Total.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************

      Debe.Open;
      Debe.First;
      G1.Progress:=0;
      G1.MaxValue:=Debe.RecordCount;
      While Not(Debe.Eof) do
        Begin

          Debe.Edit;
          Conv:=Debe.fieldbyname('Monto').AsCurrency*1000;
          Debe.fieldbyname('Monto').AsCurrency:=Redondear(Conv, 2);

          Debe.Post;

          Debe.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Debe.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************

 //******************************************************************************


      Usuarios_Desactivados.Open;
      Usuarios_Desactivados.First;
      G1.MaxValue:=Usuarios_Desactivados.RecordCount;
      While Not(Usuarios_Desactivados.Eof) do
        Begin

          Usuarios_Desactivados.Edit;
          Conv:=Usuarios_Desactivados.fieldbyname('Gastado_en_Alquiler').AsCurrency*1000;
          Usuarios_Desactivados.fieldbyname('Gastado_en_Alquiler').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Gastado_en_Multa').AsCurrency*1000;
          Usuarios_Desactivados.fieldbyname('Gastado_en_Multa').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Debe_Multas').AsCurrency*1000;
          Usuarios_Desactivados.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Debe_Alquileres').AsCurrency*1000;
          Usuarios_Desactivados.fieldbyname('Debe_Alquileres').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Maximo_Deuda').AsCurrency*1000;
          Usuarios_Desactivados.fieldbyname('Maximo_Deuda').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Monto_Deposito').AsCurrency*1000;
          Usuarios_Desactivados.fieldbyname('Monto_Deposito').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Monto_Inscripcion').AsCurrency*1000;
          Usuarios_Desactivados.fieldbyname('Monto_Inscripcion').AsCurrency:=Redondear(Conv, 2);

          Usuarios_Desactivados.Post;
          Usuarios_Desactivados.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Usuarios_Desactivados.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //************************************************************************************

    end;
end;





procedure TForm1.FormCreate(Sender: TObject);
begin
  Sesion.AddPassword('pupi');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  BitBtn2.Focused;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
