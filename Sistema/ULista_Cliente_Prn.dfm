�
 TLISTA_CLIENTE_PRN 0'"  TPF0TLista_Cliente_PrnLista_Cliente_PrnLeft4TopWidth�HeightKCaptionLista_Cliente_PrnColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style OldCreateOrder	ScaledPixelsPerInch`
TextHeight 	TQuickRepReporteLeft Top Width�HeightMFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetLista_Clientes.Query1Description.Strings@This customer listing report shows the following basic features:- Setup of some common bands0  (title, column header, detail and page footer)- Connecting a dataset#- Use TQRLabel to print static text%- Use TQRDBText to print table fields You can also see how to6- Use TQRSysData to print current time and page number'- Use different fonts, sizes and colors- How to right align text- How to center text in a band Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstPrintIfEmpty
SnapToGrid	UnitsMMZoomP TQRBandDetailBand1LeftTopQWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidth)HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@��������@      ��@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetLista_Clientes.Query1	DataFieldCodigo_ClienteTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left2TopWidth7HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU]�@      ��@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetLista_Clientes.Query1	DataFieldCedula_ClienteTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3LeftlTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@     *�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetLista_Clientes.Query1	DataFieldNombres_ClienteTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@     \�@      ��@������ņ@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetLista_Clientes.Query1	DataFieldApellidos_ClienteTransparentWordWrap	FontSize
  	TQRDBText	QRDBText5Left�TopWidthSHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@TUUUUUά	@      ��@������@�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetLista_Clientes.Query1	DataFieldTelefono_1_clienteTransparentWordWrap	FontSize
  	TQRDBText	QRDBText6Left�TopWidthSHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@     \�	@      ��@������@�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetLista_Clientes.Query1	DataFieldTelefono_2_clienteTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1LeftTop>WidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������Z�@�����*'�	@ BandTyperbColumnHeader TQRLabelQRLabel1LeftTopWidth)HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@��������@      ��@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionC�digoColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel2Left2TopWidth7HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU]�@      ��@�������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionC�dulaColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel3LeftlTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@     *�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionNombresColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel4Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@     \�@      ��@������ņ@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption	ApellidosColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel7Left�TopWidthSHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@TUUUUUά	@      ��@������@�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionTelef.1ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel8Left�TopWidthSHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@     \�	@      ��@������@�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchCaptionTelef.1ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
   TQRBandPageFooterBand1LeftTopaWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������J�@�����*'�	@ BandTyperbPageFooter 
TQRSysData
QRSysData1LeftTopWidthPHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@������J�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	ColorclWhiteDataqrsDateTextImpreso el:TransparentFontSize
  
TQRSysData
QRSysData2LeftTopWidthCHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@TUUUUUt�	@      ��@��������@ 	AlignmenttaRightJustifyAlignToBand	AutoSize	ColorclWhiteDataqrsPageNumberText# Pag.TransparentFontSize
  TQRLabelQRLabel5Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@��������@��������@      O�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption'Fuente: "Arrioja's V�deo Rental 2000" �ColorclWhiteTransparentWordWrap	FontSize
   TQRBand
TitleBand1LeftTopWidthQHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbTitle TQRLabelQRLabel6Left� TopWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������@      ��@UUUUU�Q�	@ 	AlignmenttaCenterAlignToBand	AutoSize	AutoStretchCaption$Listado Total de Clientes Inscritos.ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsItalic 
ParentFontTransparentWordWrap	FontSize     