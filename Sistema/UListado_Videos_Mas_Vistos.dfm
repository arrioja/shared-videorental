ÿ
 TLISTADO_VIDEOS_MAS_VISTOS 0  TPF0TListado_Videos_Mas_VistosListado_Videos_Mas_VistosLeft$TopWidthéHeightÙCaption5Listado de Vídeos más vistos de una fecha a otra. . .Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrder
OnKeyPressFormKeyPressOnShowFormShowPixelsPerInch`
TextHeight TBevelBevel2LeftTopPWidthÑHeightA  TBevelBevel1LeftTopWidthÑHeightA  TBevelBevel3LeftxTopXWidthYHeight1  TDBGridDBGrid1LeftTopWidthÁHeight1TabStop
DataSourceDataSource1OptionsdgTitles
dgColLinesdgTabsdgConfirmDeletedgCancelOnExit TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameCodigo_VideoTitle.CaptionCodigoWidthKVisible	 Expanded	FieldNameTitulo_VideoTitle.CaptionTitulo del VideoWidthVisible	 Expanded	FieldNameNumeroTitle.Caption
# de vecesWidthbVisible	 Expanded	FieldNameCosteTitle.CaptionDinero (Bs)Visible	    	TGroupBox	GroupBox1LeftTopXWidthaHeight1Caption&Indique las fechas a continuación. . .TabOrder TLabelLabel1LeftTopWidth-HeightCaptionDel. . .Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightó	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel2Left¸ TopWidth#HeightCaptionAl. . .Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightó	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  	TMaskEditEdit1LeftBTopWidthIHeightEditMask
99/99/9999	MaxLength
TabOrder Text
  /  /    
OnKeyPressEdit1KeyPress  	TMaskEditEdit2Leftì TopWidthIHeightEditMask
99/99/9999	MaxLength
TabOrderText
  /  /    
OnKeyPressEdit2KeyPress   TBitBtnBitBtn2LeftTop`Width¡ Height!CaptionListarTabOrderOnClickBitBtn2Click  TBitBtnBitBtn1LeftTopWidthÑHeight!CaptionOKModalResultTabOrderOnClickBitBtn1Click
Glyph.Data
Ò  Î  BMÎ      6   (   $                                                                                          ÿÿÿ                                    ÿÿÿ                                      ÿÿÿ                                        ÿÿÿ                                          ÿÿÿ                 ÿ                   ÿÿÿ  ÿÿÿ   ÿÿÿ              ÿ   ÿ                 ÿÿÿ  ÿÿÿ  ÿÿÿ        ÿ    ÿ     ÿ                ÿÿÿ   ÿÿÿ  ÿÿÿ        ÿ       ÿ                     ÿÿÿ  ÿÿÿ              ÿ                      ÿÿÿ  ÿÿÿ              ÿ                      ÿÿÿ  ÿÿÿ              ÿ                      ÿÿÿ  ÿÿÿ              ÿ                      ÿÿÿ  ÿÿÿ              ÿ                     ÿÿÿ ÿÿÿ               ÿ                    ÿÿÿ                 ÿ                                                        	NumGlyphs  TBitBtnImprimirBtnLeft8Top`Width Height!CaptionImprimirTabOrderOnClickImprimirBtnClick
Glyph.Data
z  v  BMv      v   (                                                     ¿¿¿   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ 0      7wwwwwws3333337ÿÿÿÿÿÿ÷        wwwwwwww333333÷øøøøøùð3333377ÿÿÿÿÿÿ÷        wwwwwwww30ÿÿÿÿ337óÿÿ?330ð 337÷wss330ÿÿÿÿ337óÿ?ÿ330ð  337÷swws330ÿÿð3337óó73330ð3337÷3s3330ÿÿ 33337ÿÿw33330  33337wws333	NumGlyphs  TDataSourceDataSource1DataSetQuery1Left`TopA  TSelfRefreshQueryQuery1DatabaseNameVRDataSessionNameVRSESIONSQL.StringsSelect Registro.Codigo_Video, Videos.Titulo_Video, COUNT(Registro.Codigo_Video) AS Numero, SUM(Registro.Costo) as Coste from Registro,Videos ÚWhere ((Registro.Codigo_Video = Videos.Codigo_Video) AND ((Registro.Fecha_Salida > "01/01/1998") AND (Registro.Fecha_Salida <"03/01/1998"))) Group BY Registro.Codigo_Video,Videos.Titulo_Video ORDER BY Numero Descending Left Top@   