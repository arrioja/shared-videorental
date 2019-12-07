unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Refresh, ComCtrls, Gauges, ExtCtrls, Buttons;

type
  TPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label34444: TLabel;
    Barra1: TGauge;
    Barra2: TGauge;
    Barra3: TGauge;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel9: TBevel;
    Sesion: TSession;
    Base: TDatabase;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses uconfirmar;

{$R *.DFM}

procedure TPrincipal.BitBtn1Click(Sender: TObject);
Var
  OK:Boolean;
  Ruta:String;
  Tabla: TTable;
begin
  OK:=False;
  Try
    Begin
      Confirmar:=TConfirmar.Create(Self);
      Confirmar.Showmodal;
        If Confirmar.ModalResult = MrOk Then
          Begin
            Try
              Begin
                BitBtn1.enabled:=False;
                BitBtn2.Enabled:=False;
                Barra1.Progress:=0;
                Barra2.Progress:=0;
                Barra3.Progress:=0;

                Confirmar.Free;
                Confirmar:=Nil;
                Principal.Repaint;
                Base.Connected:=True;
                OK:=True;
                Base.Connected:=True;
                // se comprueba la ruta en la que se encuentran los datos
                Ruta:=Base.Directory;
                //  ahora se borran los archivos de indice.
                If Ruta[Length(Ruta)] = '\' Then
                  Begin
                    Barra1.Progress:=1;
                    Sysutils.DeleteFile(Ruta+'3X2.PX');
                    Barra1.Progress:=2;
                    Sysutils.DeleteFile(Ruta+'Accesos.PX');
                    Barra1.Progress:=3;
                    Sysutils.DeleteFile(Ruta+'Autorizados.PX');
                    Barra1.Progress:=5;
                    Sysutils.DeleteFile(Ruta+'Cierres.PX');
                    Barra1.Progress:=7;
                    Sysutils.DeleteFile(Ruta+'Debe.PX');
                    Barra1.Progress:=8;
                    Sysutils.DeleteFile(Ruta+'Empresa.PX');
                    Barra1.Progress:=9;
                    Sysutils.DeleteFile(Ruta+'Factura.PX');
                    Barra1.Progress:=10;
                    Sysutils.DeleteFile(Ruta+'HistConex.PX');
                    Barra1.Progress:=12;
                    Sysutils.DeleteFile(Ruta+'Historia.PX');
                    Barra1.Progress:=13;
                    Sysutils.DeleteFile(Ruta+'Historia.XG0');
                    Barra1.Progress:=14;
                    Sysutils.DeleteFile(Ruta+'Historia.XG1');
                    Barra1.Progress:=15;
                    Sysutils.DeleteFile(Ruta+'Historia.XG2');
                    Barra1.Progress:=16;
                    Sysutils.DeleteFile(Ruta+'Historia.XG3');
                    Barra1.Progress:=17;
                    Sysutils.DeleteFile(Ruta+'Historia.YG0');
                    Barra1.Progress:=19;
                    Sysutils.DeleteFile(Ruta+'Historia.YG1');
                    Barra1.Progress:=21;
                    Sysutils.DeleteFile(Ruta+'Historia.YG2');
                    Barra1.Progress:=22;
                    Sysutils.DeleteFile(Ruta+'Historia.YG3');
                    Barra1.Progress:=23;
                    Sysutils.DeleteFile(Ruta+'Ingresos_por_Alquileres.PX');
                    Barra1.Progress:=24;
                    Sysutils.DeleteFile(Ruta+'Ingresos_por_Deudas.PX');
                    Barra1.Progress:=25;
                    Sysutils.DeleteFile(Ruta+'Ingresos_por_Inscripciones.PX');
                    Barra1.Progress:=26;
                    Sysutils.DeleteFile(Ruta+'Ingresos_por_Multas.PX');
                    Barra1.Progress:=27;
                    Sysutils.DeleteFile(Ruta+'Menores.PX');
                    Barra1.Progress:=28;
                    Sysutils.DeleteFile(Ruta+'Miscelaneos.PX');
                    Barra1.Progress:=29;
                    Sysutils.DeleteFile(Ruta+'Operadores.PX');
                    Barra1.Progress:=31;
                    Sysutils.DeleteFile(Ruta+'Operadores.XG0');
                    Barra1.Progress:=33;
                    Sysutils.DeleteFile(Ruta+'Operadores.XG1');
                    Barra1.Progress:=34;
                    Sysutils.DeleteFile(Ruta+'Operadores.XG2');
                    Barra1.Progress:=35;
                    Sysutils.DeleteFile(Ruta+'Operadores.YG0');
                    Barra1.Progress:=36;
                    Sysutils.DeleteFile(Ruta+'Operadores.YG1');
                    Barra1.Progress:=37;
                    Sysutils.DeleteFile(Ruta+'Operadores.YG2');
                    Barra1.Progress:=38;
                    Sysutils.DeleteFile(Ruta+'Pago_por_cheque.PX');
                    Barra1.Progress:=39;
                    Sysutils.DeleteFile(Ruta+'Pago_por_cheque.XG0');
                    Barra1.Progress:=41;
                    Sysutils.DeleteFile(Ruta+'Pago_por_cheque.YG0');
                    Barra1.Progress:=42;
                    Sysutils.DeleteFile(Ruta+'Pago_por_Tarjeta.PX');
                    Barra1.Progress:=44;
                    Sysutils.DeleteFile(Ruta+'Pago_por_Tarjeta.XG0');
                    Barra1.Progress:=45;
                    Sysutils.DeleteFile(Ruta+'Pago_por_Tarjeta.YG0');
                    Barra1.Progress:=47;
                    Sysutils.DeleteFile(Ruta+'Registro.PX');
                    Barra1.Progress:=48;
                    Sysutils.DeleteFile(Ruta+'Selecciones.PX');
                    Barra1.Progress:=49;
                    Sysutils.DeleteFile(Ruta+'Selecciones.XG0');
                    Barra1.Progress:=50;
                    Sysutils.DeleteFile(Ruta+'Selecciones.YG0');
                    Barra1.Progress:=52;
                    Sysutils.DeleteFile(Ruta+'Total.PX');
                    Barra1.Progress:=53;
                    Sysutils.DeleteFile(Ruta+'Transacciones.PX');
                    Barra1.Progress:=55;
                    Sysutils.DeleteFile(Ruta+'Transacciones.XG0');
                    Barra1.Progress:=56;
                    Sysutils.DeleteFile(Ruta+'Transacciones.YG0');
                    Barra1.Progress:=57;
                    Sysutils.DeleteFile(Ruta+'Usuarios.PX');
                    Barra1.Progress:=58;
                    Sysutils.DeleteFile(Ruta+'Usuarios.XG0');
                    Barra1.Progress:=59;
                    Sysutils.DeleteFile(Ruta+'Usuarios.XG1');
                    Barra1.Progress:=60;
                    Sysutils.DeleteFile(Ruta+'Usuarios.XG2');
                    Barra1.Progress:=61;
                    Sysutils.DeleteFile(Ruta+'Usuarios.YG0');
                    Barra1.Progress:=62;
                    Sysutils.DeleteFile(Ruta+'Usuarios.YG1');
                    Barra1.Progress:=63;
                    Sysutils.DeleteFile(Ruta+'Usuarios.YG2');
                    Barra1.Progress:=65;
                    Sysutils.DeleteFile(Ruta+'Usuarios_Desactivados.PX');
                    Barra1.Progress:=66;
                    Sysutils.DeleteFile(Ruta+'Usuarios_Desactivados.XG0');
                    Barra1.Progress:=67;
                    Sysutils.DeleteFile(Ruta+'Usuarios_Desactivados.XG1');
                    Barra1.Progress:=68;
                    Sysutils.DeleteFile(Ruta+'Usuarios_Desactivados.XG2');
                    Barra1.Progress:=69;
                    Sysutils.DeleteFile(Ruta+'Usuarios_Desactivados.YG0');
                    Barra1.Progress:=70;
                    Sysutils.DeleteFile(Ruta+'Usuarios_Desactivados.YG1');
                    Barra1.Progress:=72;
                    Sysutils.DeleteFile(Ruta+'Usuarios_Desactivados.YG2');
                    Barra1.Progress:=74;
                    Sysutils.DeleteFile(Ruta+'Videos.PX');
                    Barra1.Progress:=76;
                    Sysutils.DeleteFile(Ruta+'Videos.XG0');
                    Barra1.Progress:=77;
                    Sysutils.DeleteFile(Ruta+'Videos.XG1');
                    Barra1.Progress:=79;
                    Sysutils.DeleteFile(Ruta+'Videos.XG2');
                    Barra1.Progress:=81;
                    Sysutils.DeleteFile(Ruta+'Videos.XG3');
                    Barra1.Progress:=82;
                    Sysutils.DeleteFile(Ruta+'Videos.XG4');
                    Barra1.Progress:=85;
                    Sysutils.DeleteFile(Ruta+'Videos.XG5');
                    Barra1.Progress:=87;
                    Sysutils.DeleteFile(Ruta+'Videos.YG0');
                    Barra1.Progress:=89;
                    Sysutils.DeleteFile(Ruta+'Videos.YG1');
                    Barra1.Progress:=90;
                    Sysutils.DeleteFile(Ruta+'Videos.YG2');
                    Barra1.Progress:=92;
                    Sysutils.DeleteFile(Ruta+'Videos.YG3');
                    Barra1.Progress:=95;
                    Sysutils.DeleteFile(Ruta+'Videos.YG4');
                    Barra1.Progress:=97;
                    Sysutils.DeleteFile(Ruta+'Videos.YG5');
                    Barra1.Progress:=100;
                  end
                else
                  Begin
                    Barra1.Progress:=1;
                    Sysutils.DeleteFile(Ruta+'\3X2.PX');
                    Barra1.Progress:=2;
                    Sysutils.DeleteFile(Ruta+'\Accesos.PX');
                    Barra1.Progress:=3;
                    Sysutils.DeleteFile(Ruta+'\Autorizados.PX');
                    Barra1.Progress:=5;
                    Sysutils.DeleteFile(Ruta+'\Cierres.PX');
                    Barra1.Progress:=7;
                    Sysutils.DeleteFile(Ruta+'\Debe.PX');
                    Barra1.Progress:=8;
                    Sysutils.DeleteFile(Ruta+'\Empresa.PX');
                    Barra1.Progress:=9;
                    Sysutils.DeleteFile(Ruta+'\Factura.PX');
                    Barra1.Progress:=10;
                    Sysutils.DeleteFile(Ruta+'\HistConex.PX');
                    Barra1.Progress:=12;
                    Sysutils.DeleteFile(Ruta+'\Historia.PX');
                    Barra1.Progress:=13;
                    Sysutils.DeleteFile(Ruta+'\Historia.XG0');
                    Barra1.Progress:=14;
                    Sysutils.DeleteFile(Ruta+'\Historia.XG1');
                    Barra1.Progress:=15;
                    Sysutils.DeleteFile(Ruta+'\Historia.XG2');
                    Barra1.Progress:=16;
                    Sysutils.DeleteFile(Ruta+'\Historia.XG3');
                    Barra1.Progress:=17;
                    Sysutils.DeleteFile(Ruta+'\Historia.YG0');
                    Barra1.Progress:=19;
                    Sysutils.DeleteFile(Ruta+'\Historia.YG1');
                    Barra1.Progress:=21;
                    Sysutils.DeleteFile(Ruta+'\Historia.YG2');
                    Barra1.Progress:=22;
                    Sysutils.DeleteFile(Ruta+'\Historia.YG3');
                    Barra1.Progress:=23;
                    Sysutils.DeleteFile(Ruta+'\Ingresos_por_Alquileres.PX');
                    Barra1.Progress:=24;
                    Sysutils.DeleteFile(Ruta+'\Ingresos_por_Deudas.PX');
                    Barra1.Progress:=25;
                    Sysutils.DeleteFile(Ruta+'\Ingresos_por_Inscripciones.PX');
                    Barra1.Progress:=26;
                    Sysutils.DeleteFile(Ruta+'\Ingresos_por_Multas.PX');
                    Barra1.Progress:=27;
                    Sysutils.DeleteFile(Ruta+'\Menores.PX');
                    Barra1.Progress:=28;
                    Sysutils.DeleteFile(Ruta+'\Miscelaneos.PX');
                    Barra1.Progress:=29;
                    Sysutils.DeleteFile(Ruta+'\Operadores.PX');
                    Barra1.Progress:=31;
                    Sysutils.DeleteFile(Ruta+'\Operadores.XG0');
                    Barra1.Progress:=33;
                    Sysutils.DeleteFile(Ruta+'\Operadores.XG1');
                    Barra1.Progress:=34;
                    Sysutils.DeleteFile(Ruta+'\Operadores.XG2');
                    Barra1.Progress:=35;
                    Sysutils.DeleteFile(Ruta+'\Operadores.YG0');
                    Barra1.Progress:=36;
                    Sysutils.DeleteFile(Ruta+'\Operadores.YG1');
                    Barra1.Progress:=37;
                    Sysutils.DeleteFile(Ruta+'\Operadores.YG2');
                    Barra1.Progress:=38;
                    Sysutils.DeleteFile(Ruta+'\Pago_por_cheque.PX');
                    Barra1.Progress:=39;
                    Sysutils.DeleteFile(Ruta+'\Pago_por_cheque.XG0');
                    Barra1.Progress:=41;
                    Sysutils.DeleteFile(Ruta+'\Pago_por_cheque.YG0');
                    Barra1.Progress:=42;
                    Sysutils.DeleteFile(Ruta+'\Pago_por_Tarjeta.PX');
                    Barra1.Progress:=44;
                    Sysutils.DeleteFile(Ruta+'\Pago_por_Tarjeta.XG0');
                    Barra1.Progress:=45;
                    Sysutils.DeleteFile(Ruta+'\Pago_por_Tarjeta.YG0');
                    Barra1.Progress:=47;
                    Sysutils.DeleteFile(Ruta+'\Registro.PX');
                    Barra1.Progress:=48;
                    Sysutils.DeleteFile(Ruta+'\Selecciones.PX');
                    Barra1.Progress:=49;
                    Sysutils.DeleteFile(Ruta+'\Selecciones.XG0');
                    Barra1.Progress:=50;
                    Sysutils.DeleteFile(Ruta+'\Selecciones.YG0');
                    Barra1.Progress:=52;
                    Sysutils.DeleteFile(Ruta+'\Total.PX');
                    Barra1.Progress:=53;
                    Sysutils.DeleteFile(Ruta+'\Transacciones.PX');
                    Barra1.Progress:=55;
                    Sysutils.DeleteFile(Ruta+'\Transacciones.XG0');
                    Barra1.Progress:=56;
                    Sysutils.DeleteFile(Ruta+'\Transacciones.YG0');
                    Barra1.Progress:=57;
                    Sysutils.DeleteFile(Ruta+'\Usuarios.PX');
                    Barra1.Progress:=58;
                    Sysutils.DeleteFile(Ruta+'\Usuarios.XG0');
                    Barra1.Progress:=59;
                    Sysutils.DeleteFile(Ruta+'\Usuarios.XG1');
                    Barra1.Progress:=60;
                    Sysutils.DeleteFile(Ruta+'\Usuarios.XG2');
                    Barra1.Progress:=61;
                    Sysutils.DeleteFile(Ruta+'\Usuarios.YG0');
                    Barra1.Progress:=62;
                    Sysutils.DeleteFile(Ruta+'\Usuarios.YG1');
                    Barra1.Progress:=63;
                    Sysutils.DeleteFile(Ruta+'\Usuarios.YG2');
                    Barra1.Progress:=65;
                    Sysutils.DeleteFile(Ruta+'\Usuarios_Desactivados.PX');
                    Barra1.Progress:=66;
                    Sysutils.DeleteFile(Ruta+'\Usuarios_Desactivados.XG0');
                    Barra1.Progress:=67;
                    Sysutils.DeleteFile(Ruta+'\Usuarios_Desactivados.XG1');
                    Barra1.Progress:=68;
                    Sysutils.DeleteFile(Ruta+'\Usuarios_Desactivados.XG2');
                    Barra1.Progress:=69;
                    Sysutils.DeleteFile(Ruta+'\Usuarios_Desactivados.YG0');
                    Barra1.Progress:=70;
                    Sysutils.DeleteFile(Ruta+'\Usuarios_Desactivados.YG1');
                    Barra1.Progress:=72;
                    Sysutils.DeleteFile(Ruta+'\Usuarios_Desactivados.YG2');
                    Barra1.Progress:=74;
                    Sysutils.DeleteFile(Ruta+'\Videos.PX');
                    Barra1.Progress:=76;
                    Sysutils.DeleteFile(Ruta+'\Videos.XG0');
                    Barra1.Progress:=77;
                    Sysutils.DeleteFile(Ruta+'\Videos.XG1');
                    Barra1.Progress:=79;
                    Sysutils.DeleteFile(Ruta+'\Videos.XG2');
                    Barra1.Progress:=81;
                    Sysutils.DeleteFile(Ruta+'\Videos.XG3');
                    Barra1.Progress:=82;
                    Sysutils.DeleteFile(Ruta+'\Videos.XG4');
                    Barra1.Progress:=85;
                    Sysutils.DeleteFile(Ruta+'\Videos.XG5');
                    Barra1.Progress:=87;
                    Sysutils.DeleteFile(Ruta+'\Videos.YG0');
                    Barra1.Progress:=89;
                    Sysutils.DeleteFile(Ruta+'\Videos.YG1');
                    Barra1.Progress:=90;
                    Sysutils.DeleteFile(Ruta+'\Videos.YG2');
                    Barra1.Progress:=92;
                    Sysutils.DeleteFile(Ruta+'\Videos.YG3');
                    Barra1.Progress:=95;
                    Sysutils.DeleteFile(Ruta+'\Videos.YG4');
                    Barra1.Progress:=97;
                    Sysutils.DeleteFile(Ruta+'\Videos.YG5');
                    Barra1.Progress:=100;
                  end;


                //--------------------------------------------------
                //**************************************************
                // Creación de Índices Primarios
                //**************************************************
                //--------------------------------------------------

                Tabla:=TTable.Create(Self);
                Tabla.SessionName:='VRSESION';
                With Tabla do
                  Begin
                    Barra2.Progress:=4;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='3X2';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=8;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Usuarios_Desactivados';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Codigo_Cliente',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=12;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Usuarios';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Codigo_Cliente',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=16;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Transacciones';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Referencia',[ixPrimary, ixUnique]);
                    AddIndex('Cliente_Fecha_Index','Codigo_Cliente;Fecha;Marca',[ixCaseInsensitive]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=20;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Total';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Codigo_Video',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=24;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Selecciones';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=28;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Registro';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Referencia',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=32;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Pago_por_Tarjeta';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=36;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Pago_por_Cheque';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=40;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Operadores';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=44;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Miscelaneos';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=48;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Menores';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Codigo_Cliente',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=52;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Ingresos_por_Multas';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Fecha',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=56;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Ingresos_por_Inscripciones';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Fecha',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=60;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Ingresos_por_Deudas';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Fecha',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=64;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Ingresos_por_Alquileres';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Fecha',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=68;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Historia';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Numero',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=72;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='HistConex';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','NumReg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=76;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Factura';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=80;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Empresa';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=84;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Debe';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Numero',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=88;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Cierres';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Fecha',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=92;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Autorizados';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Codigo_Cliente',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=96;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Accesos';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Login',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';

                    Barra2.Progress:=98;
                    Active :=False;
                    DatabaseName:='VRData';
                    TableName:='Videos';
                    TableType:= ttParadox;
                    Exclusive:=True;
                    AddIndex('Primario','Codigo_Video',[ixPrimary, ixUnique]);
                    Exclusive:=False;
                    IndexName:='';
                    Barra2.Progress:=100;
                  end;
                    //*************************************************
                    //**************************************************
                    // Creación de Índices Secundarios
                    //**************************************************
                    //--------------------------------------------------
                  Tabla.SessionName:='VRSESION';
                  With Tabla do
                    Begin
                      Barra3.Progress:=5;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Usuarios_Desactivados';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Codigo_Cliente',[ixPrimary, ixUnique]);
                      AddIndex('Apellidos_Indice','Apellidos_Cliente',[ixCaseInsensitive]);
                      AddIndex('Cedula_Indice','Cedula_Cliente',[ixCaseInsensitive]);
                      AddIndex('Nombre_Indice','Nombres_Cliente',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=15;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Usuarios';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Codigo_Cliente',[ixPrimary, ixUnique]);
                      AddIndex('Apellidos_Indice','Apellidos_Cliente',[ixCaseInsensitive]);
                      AddIndex('Cedula_Indice','Cedula_Cliente',[ixCaseInsensitive]);
                      AddIndex('Nombre_Indice','Nombres_Cliente',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=27;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Transacciones';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Referencia',[ixPrimary, ixUnique]);
                      AddIndex('Cliente_Fecha_Index','Codigo_Cliente;Fecha;Marca',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=39;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Selecciones';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                      AddIndex('Codigos_Index','Codigo_Cliente;Codigo_Video',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=50;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Pago_por_Tarjeta';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                      AddIndex('Codigo_Tipo_Index','Codigo_Cliente;Tipo',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=61;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Pago_por_Cheque';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                      AddIndex('Codigo_Tipo_Index','Codigo_Cliente;Tipo',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=72;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Operadores';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Num_Reg',[ixPrimary, ixUnique]);
                      AddIndex('Apellidos_Indice','Apellidos',[ixCaseInsensitive]);
                      AddIndex('Cedula_Index','Cedula',[ixCaseInsensitive]);
                      AddIndex('Login_Index','Login',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=85;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Historia';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Numero',[ixPrimary, ixUnique]);
                      AddIndex('Cliente_Index','Codigo_Cliente',[ixCaseInsensitive]);
                      AddIndex('Fecha_Index','Fecha_de_Alquiler',[ixCaseInsensitive]);
                      AddIndex('Nombre_Index','Nombre_Video',[ixCaseInsensitive]);
                      AddIndex('Video_Index','Codigo_Video',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';

                      Barra3.Progress:=96;
                      Active :=False;
                      DatabaseName:='VRData';
                      TableName:='Videos';
                      TableType:= ttParadox;
                      Exclusive:=True;
                      AddIndex('Primario','Codigo_Video',[ixPrimary, ixUnique]);
                      AddIndex('Categoria_Indice','Categoria_Video',[ixCaseInsensitive]);
                      AddIndex('Clase_Indice','Clase_Video',[ixCaseInsensitive]);
                      AddIndex('Codigo_de_Usuario_Indice','Codigo_Cliente',[ixCaseInsensitive]);
                      AddIndex('Ejemplar_Indice','Numero_Ejemplar_Video',[ixCaseInsensitive]);
                      AddIndex('Precio_Indice','Precio_Video',[ixCaseInsensitive]);
                      AddIndex('Titulo_Indice','Titulo_Video',[ixCaseInsensitive]);
                      Exclusive:=False;
                      IndexName:='';
                      Barra3.Progress:=100;
                    end;
               end
             Except
                Messagedlg('LA UTILIDAD DE REINDEXACIÓN AUTOMÁTICA DE VIDEO RENTAL 2000 '
                          +'HA DETECTADO ERRORES EN SU BASE DE DATOS QUE NO PUEDE '
                          +'REPARAR, POR LO QUE SE RECOMIENDA CONTACTAR LO ANTES POSIBLE '
                          +'AL SERVICIO TÉCNICO POR EL TELEFONO SIGUIENTE: '
                          +'0416-796-13-06, ATENCIÓN ING. PEDRO ARRIOJA, O SI LO '
                          +'PREFIERE, PUEDE ENVIAR UN E-MAIL A LA SIGUIENTE '
                          +'DIRECCIÓN:       videorental@cantv.net   ',mterror,[mbok],0);
               Application.Terminate;
             end;
          end;
    end
  Finally
    Begin
      Base.Connected:=False;
      Sesion.Active:=False;
      BitBtn2.Enabled:=True;
      Tabla.Free;
      Messagedlg('El proceso ha concluido satisfactoriamente, intente ahora '
                +'iniciar su VideoRental, si el problema persiste, '
                +'lesugerimos que contacte '
                +'al servicio técnico por el teléfono siguiente: '
                +'0416-796-13-06, atención Ing. Pedro Arrioja, o si lo '
                +'prefiere, puede enviar un E-MAIL a la siguiente '
                +'dirección:       videorental@cantv.net   ',mtInformation,[mbok],0);
      If OK = False Then
        Begin
          Confirmar.Free;
          Confirmar:=Nil;
        end;
    end;
  end;
end;

procedure TPrincipal.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  BitBtn2.Setfocus;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  Sesion.AddPassword('pupi');
end;

end.
