object Form1: TForm1
  Left = 510
  Top = 243
  Width = 328
  Height = 278
  Caption = 'Conversor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 64
    Width = 305
    Height = 50
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 297
    Height = 39
    Caption = 
      'Esta Utilidad transformar'#225' los datos de Video Rental a la nueva'#13 +
      #10'denominaci'#243'n monetaria de Venezuela (Bol'#237'vares Fuertes), '#13#10'Para' +
      ' iniciar el proceso, haga click en Convertir.'
  end
  object G1: TGauge
    Left = 16
    Top = 72
    Width = 289
    Height = 36
    BackColor = clRed
    ForeColor = clLime
    Progress = 0
  end
  object Bevel2: TBevel
    Left = 8
    Top = 128
    Width = 305
    Height = 50
  end
  object Bevel3: TBevel
    Left = 8
    Top = 184
    Width = 305
    Height = 50
  end
  object G2: TGauge
    Left = 16
    Top = 136
    Width = 289
    Height = 36
    BackColor = clRed
    ForeColor = clLime
    MaxValue = 14
    Progress = 0
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 134
    Height = 13
    Caption = 'Progreso de la Tabla Actual:'
  end
  object Label3: TLabel
    Left = 16
    Top = 120
    Width = 154
    Height = 13
    Caption = 'Progreso Total de la Conversi'#243'n:'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 192
    Width = 137
    Height = 33
    Caption = '&Convertir'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 192
    Width = 137
    Height = 33
    Caption = '&Salir'
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object Base: TDatabase
    AliasName = 'VRDATA'
    DatabaseName = 'VrData'
    SessionName = 'Default'
    Left = 480
    Top = 168
  end
  object Sesion: TSession
    Active = True
    SessionName = 'VRSESION'
    Left = 480
    Top = 120
  end
  object Clientes: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Usuarios.DB'
    Left = 8
    Top = 384
  end
  object Cheques: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Pago_por_cheque.DB'
    Left = 48
    Top = 384
  end
  object Total: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Total.DB'
    Left = 8
    Top = 424
  end
  object Videos: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Videos.DB'
    Left = 88
    Top = 384
  end
  object Debe: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Debe.DB'
    Left = 48
    Top = 424
  end
  object Registro: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Registro.DB'
    Left = 88
    Top = 424
  end
  object Transacciones: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Transacciones.db'
    Left = 128
    Top = 424
  end
  object Cierres: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Cierres.db'
    Left = 128
    Top = 384
  end
  object Facturas: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Factura.db'
    Left = 168
    Top = 384
  end
  object Usuarios_Desactivados: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Usuarios_Desactivados.DB'
    Left = 168
    Top = 424
  end
  object II: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Inscripciones.DB'
    Left = 448
    Top = 352
  end
  object Multas: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Multas.db'
    Left = 776
    Top = 272
  end
  object Multas_DS: TDataSource
    DataSet = Multas
    Left = 808
    Top = 272
  end
  object Inscripciones: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Inscripciones.db'
    Left = 776
    Top = 320
  end
  object Inscripciones_DS: TDataSource
    DataSet = Inscripciones
    Left = 808
    Top = 320
  end
  object Alquileres: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Alquileres.db'
    Left = 776
    Top = 368
  end
  object Alquileres_DS: TDataSource
    DataSet = Alquileres
    Left = 808
    Top = 368
  end
  object Deudas: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Deudas.db'
    Left = 776
    Top = 416
  end
  object Deudas_DS: TDataSource
    DataSet = Deudas
    Left = 808
    Top = 416
  end
  object IM: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Multas.DB'
    Left = 208
    Top = 424
  end
  object ID: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Deudas.DB'
    Left = 416
    Top = 320
  end
  object IA: TSelfRefreshTable
    DatabaseName = 'VrData'
    SessionName = 'VRSESION'
    TableName = 'Ingresos_por_Alquileres.DB'
    Left = 208
    Top = 384
  end
end
