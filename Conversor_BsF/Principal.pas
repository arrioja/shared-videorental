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
    Registro: TSelfRefreshTable;
    Transacciones: TSelfRefreshTable;
    Cierres: TSelfRefreshTable;
    Facturas: TSelfRefreshTable;
    Usuarios_Desactivados: TSelfRefreshTable;
    II: TSelfRefreshTable;
    Multas: TSelfRefreshTable;
    Multas_DS: TDataSource;
    Inscripciones: TSelfRefreshTable;
    Inscripciones_DS: TDataSource;
    Alquileres: TSelfRefreshTable;
    Alquileres_DS: TDataSource;
    Deudas: TSelfRefreshTable;
    Deudas_DS: TDataSource;
    IM: TSelfRefreshTable;
    ID: TSelfRefreshTable;
    IA: TSelfRefreshTable;
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
          Conv:=Clientes.fieldbyname('Gastado_en_Alquiler').AsCurrency/1000;
          Clientes.fieldbyname('Gastado_en_Alquiler').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Gastado_en_Multa').AsCurrency/1000;
          Clientes.fieldbyname('Gastado_en_Multa').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Debe_Multas').AsCurrency/1000;
          Clientes.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Debe_Alquileres').AsCurrency/1000;
          Clientes.fieldbyname('Debe_Alquileres').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Maximo_Deuda').AsCurrency/1000;
          Clientes.fieldbyname('Maximo_Deuda').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Monto_Deposito').AsCurrency/1000;
          Clientes.fieldbyname('Monto_Deposito').AsCurrency:=Redondear(Conv, 2);

          Conv:=Clientes.fieldbyname('Monto_Inscripcion').AsCurrency/1000;
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
          Conv:=Cheques.fieldbyname('Cantidad_cheque').AsCurrency/1000;
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
          Conv:=Videos.fieldbyname('Precio_Video').AsCurrency/1000;
          Videos.fieldbyname('Precio_Video').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Ingresos_del_Video').AsCurrency/1000;
          Videos.fieldbyname('Ingresos_del_Video').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Ingresos_por_Alquiler').AsCurrency/1000;
          Videos.fieldbyname('Ingresos_por_Alquiler').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Ingresos_por_Multa').AsCurrency/1000;
          Videos.fieldbyname('Ingresos_por_Multa').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Debe_Multas').AsCurrency/1000;
          Videos.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Videos.fieldbyname('Debe_Alquileres').AsCurrency/1000;
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

      Cierres.Open;
      Cierres.First;
      G1.Progress:=0;
      G1.MaxValue:=Cierres.RecordCount;
      While Not(Cierres.Eof) do
        Begin
          If Cierres.fieldbyname('Fecha').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              Cierres.Edit;
              Conv:=Cierres.fieldbyname('MontoDepositado').AsCurrency/1000;
              Cierres.fieldbyname('MontoDepositado').AsCurrency:=Redondear(Conv, 2);

              Cierres.Post;
            end;
          Cierres.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Cierres.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

  //************************************************************************************

      Facturas.Open;
      Facturas.First;
      G1.Progress:=0;
      G1.MaxValue:=Facturas.RecordCount;
      While Not(Facturas.Eof) do
        Begin
          If Facturas.fieldbyname('Fecha').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              Facturas.Edit;
              Conv:=Facturas.fieldbyname('Deuda_Alquiler').AsCurrency/1000;
              Facturas.fieldbyname('Deuda_Alquiler').AsCurrency:=Redondear(Conv, 2);

              Conv:=Facturas.fieldbyname('Deuda_Multa').AsCurrency/1000;
              Facturas.fieldbyname('Deuda_Multa').AsCurrency:=Redondear(Conv, 2);

              Conv:=Facturas.fieldbyname('Multa').AsCurrency/1000;
              Facturas.fieldbyname('Multa').AsCurrency:=Redondear(Conv, 2);

              Conv:=Facturas.fieldbyname('Alquiler').AsCurrency/1000;
              Facturas.fieldbyname('Alquiler').AsCurrency:=Redondear(Conv, 2);

              Facturas.Post;
            end;
          Facturas.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Facturas.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************


      Total.Open;
      Total.First;
      G1.Progress:=0;
      G1.MaxValue:=Total.RecordCount;
      While Not(Total.Eof) do
        Begin

          Total.Edit;
          Conv:=Total.fieldbyname('Ingreso_Total').AsCurrency/1000;
          Total.fieldbyname('Ingreso_Total').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Alquiler_Total').AsCurrency/1000;
          Total.fieldbyname('Alquiler_Total').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Debe_Multas').AsCurrency/1000;
          Total.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Debe_Alquileres').AsCurrency/1000;
          Total.fieldbyname('Debe_Alquileres').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Multa_Total').AsCurrency/1000;
          Total.fieldbyname('Multa_Total').AsCurrency:=Redondear(Conv, 2);

          Conv:=Total.fieldbyname('Valor_Total').AsCurrency/1000;
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
          Conv:=Debe.fieldbyname('Monto').AsCurrency/1000;
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


      Registro.Open;
      Registro.First;
      G1.Progress:=0;
      G1.MaxValue:=Registro.RecordCount;
      While Not(Registro.Eof) do
        Begin
          If Registro.fieldbyname('Fecha_Salida').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              Registro.Edit;
              Conv:=Registro.fieldbyname('Costo').AsCurrency/1000;
              Registro.fieldbyname('Costo').AsCurrency:=Redondear(Conv, 2);

              Conv:=Registro.fieldbyname('Excento').AsCurrency/1000;
              Registro.fieldbyname('Excento').AsCurrency:=Redondear(Conv, 2);

              Registro.Post;
            end;
          Registro.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Registro.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************



      Transacciones.Open;
      Transacciones.First;
      G1.Progress:=0;
      G1.MaxValue:=Transacciones.RecordCount;
      While Not(Transacciones.Eof) do
        Begin
          If Transacciones.fieldbyname('Fecha').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              Transacciones.Edit;

              Conv:=Transacciones.fieldbyname('Inscripcion').AsCurrency/1000;
              Transacciones.fieldbyname('Inscripcion').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Rebaja_Inscripcion').AsCurrency/1000;
              Transacciones.fieldbyname('Rebaja_Inscripcion').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Alquiler').AsCurrency/1000;
              Transacciones.fieldbyname('Alquiler').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Deuda_Alquiler').AsCurrency/1000;
              Transacciones.fieldbyname('Deuda_Alquiler').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Excento_Alquiler').AsCurrency/1000;
              Transacciones.fieldbyname('Excento_Alquiler').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Rebaja_Alquiler').AsCurrency/1000;
              Transacciones.fieldbyname('Rebaja_Alquiler').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Multa').AsCurrency/1000;
              Transacciones.fieldbyname('Multa').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Deuda_Multa').AsCurrency/1000;
              Transacciones.fieldbyname('Deuda_Multa').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Excento_Multa').AsCurrency/1000;
              Transacciones.fieldbyname('Excento_Multa').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Rebaja_Multa').AsCurrency/1000;
              Transacciones.fieldbyname('Rebaja_Multa').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Deposito').AsCurrency/1000;
              Transacciones.fieldbyname('Deposito').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Rebaja_Deposito').AsCurrency/1000;
              Transacciones.fieldbyname('Rebaja_Deposito').AsCurrency:=Redondear(Conv, 2);

              Conv:=Transacciones.fieldbyname('Retiro').AsCurrency/1000;
              Transacciones.fieldbyname('Retiro').AsCurrency:=Redondear(Conv, 2);

              Transacciones.Post;
            end;
          Transacciones.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;


        end;
      Transacciones.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************


      Usuarios_Desactivados.Open;
      Usuarios_Desactivados.First;
      G1.MaxValue:=Usuarios_Desactivados.RecordCount;
      While Not(Usuarios_Desactivados.Eof) do
        Begin

          Usuarios_Desactivados.Edit;
          Conv:=Usuarios_Desactivados.fieldbyname('Gastado_en_Alquiler').AsCurrency/1000;
          Usuarios_Desactivados.fieldbyname('Gastado_en_Alquiler').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Gastado_en_Multa').AsCurrency/1000;
          Usuarios_Desactivados.fieldbyname('Gastado_en_Multa').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Debe_Multas').AsCurrency/1000;
          Usuarios_Desactivados.fieldbyname('Debe_Multas').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Debe_Alquileres').AsCurrency/1000;
          Usuarios_Desactivados.fieldbyname('Debe_Alquileres').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Maximo_Deuda').AsCurrency/1000;
          Usuarios_Desactivados.fieldbyname('Maximo_Deuda').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Monto_Deposito').AsCurrency/1000;
          Usuarios_Desactivados.fieldbyname('Monto_Deposito').AsCurrency:=Redondear(Conv, 2);

          Conv:=Usuarios_Desactivados.fieldbyname('Monto_Inscripcion').AsCurrency/1000;
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


      IM.Open;
      IM.First;
      G1.Progress:=0;
      G1.MaxValue:=IM.RecordCount;
      While Not(IM.Eof) do
        Begin
          If IM.fieldbyname('Fecha').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              IM.Edit;
              Conv:=IM.fieldbyname('Cantidad').AsCurrency/1000;
              IM.fieldbyname('Cantidad').AsCurrency:=Redondear(Conv, 2);

              IM.Post;
            end;
          IM.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;

        end;
      IM.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************



      IA.Open;
      IA.First;
      G1.Progress:=0;
      G1.MaxValue:=IA.RecordCount;
      While Not(IA.Eof) do
        Begin
          If IA.fieldbyname('Fecha').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              IA.Edit;
              Conv:=IA.fieldbyname('Cantidad').AsCurrency/1000;
              IA.fieldbyname('Cantidad').AsCurrency:=Redondear(Conv, 2);

              IA.Post;
            end;
          IA.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;

        end;
      IA.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************

      ID.Open;
      ID.First;
      G1.Progress:=0;
      G1.MaxValue:=ID.RecordCount;
      While Not(ID.Eof) do
        Begin
          If ID.fieldbyname('Fecha').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              ID.Edit;
              Conv:=ID.fieldbyname('Cantidad').AsCurrency/1000;
              ID.fieldbyname('Cantidad').AsCurrency:=Redondear(Conv, 2);

              ID.Post;
            end;
          ID.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;

        end;
      ID.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************



      II.Open;
      II.First;
      G1.Progress:=0;
      G1.MaxValue:=II.RecordCount;
      While Not(II.Eof) do
        Begin
          If II.fieldbyname('Fecha').AsDateTime > StrToDate('31/12/2007') Then
            Begin
              II.Edit;
              Conv:=II.fieldbyname('Cantidad').AsCurrency/1000;
              II.fieldbyname('Cantidad').AsCurrency:=Redondear(Conv, 2);

              II.Post;
            end;
          II.Next;

          G1.Progress:=G1.Progress+1;
          Application.ProcessMessages;

        end;
      II.Close;
      G2.Progress:=G2.Progress+1;
      Application.ProcessMessages;

 //******************************************************************************

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
