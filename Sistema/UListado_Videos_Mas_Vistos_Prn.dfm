�
 TLISTADO_VIDEOS_MAS_VISTOS_PRN 01  TPF0TListado_Videos_Mas_Vistos_PrnListado_Videos_Mas_Vistos_PrnLeft,TopWidth�HeightICaptionListado_Videos_Mas_Vistos_PrnColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderScaledPixelsPerInch`
TextHeight 	TQuickRepReporteLeftTop	Width�HeightMFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSet Listado_Videos_Mas_Vistos.Query1Description.Strings@This customer listing report shows the following basic features:- Setup of some common bands0  (title, column header, detail and page footer)- Connecting a dataset#- Use TQRLabel to print static text%- Use TQRDBText to print table fields You can also see how to6- Use TQRSysData to print current time and page number'- Use different fonts, sizes and colors- How to right align text- How to center text in a band Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstPrintIfEmpty
SnapToGrid	UnitsMMZoomP TQRBandDetailBand1LeftTopQWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidth+HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@������6�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet Listado_Videos_Mas_Vistos.Query1	DataFieldCodigo_VideoTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2LeftRTopWidthwHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU��@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet Listado_Videos_Mas_Vistos.Query1	DataFieldTitulo_VideoTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4LeftTopWidth{HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      >�@      ��@      f�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet Listado_Videos_Mas_Vistos.Query1	DataFieldNumeroTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3Left�TopWidth9HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��	@      ��@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSet Listado_Videos_Mas_Vistos.Query1	DataFieldCosteTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1LeftTop>WidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������Z�@�����*'�	@ BandTyperbColumnHeader TQRLabelQRLabel1LeftTopWidth.HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@��������@      ��@������"�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionC�digoColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel2LeftRTopWidthwHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU��@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionT�tuloColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel4LeftTopWidth{HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      >�@      ��@      f�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionVeces de AlquilerColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel3Left�TopWidthCHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUUı	@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaption	RecaudadoColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
   TQRBandPageFooterBand1LeftTopaWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottom	ColorclWhiteForceNewColumnForceNewPageSize.Values������J�@�����*'�	@ BandTyperbPageFooter 
TQRSysData
QRSysData1LeftTopWidthPHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@������J�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	ColorclWhiteDataqrsDateTextImpreso el:TransparentFontSize
  
TQRSysData
QRSysData2LeftTopWidthCHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@TUUUUUt�	@      ��@��������@ 	AlignmenttaRightJustifyAlignToBand	AutoSize	ColorclWhiteDataqrsPageNumberText# Pag.TransparentFontSize
  TQRLabelQRLabel5Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@��������@��������@      O�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption'Fuente: "Arrioja's V�deo Rental 2000" �ColorclWhiteTransparentWordWrap	FontSize
   TQRBand
TitleBand1LeftTopWidthQHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbTitle TQRLabelQRLabel6Left� TopWidth(HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUU��@      ��@UUUUUU��@ 	AlignmenttaCenterAlignToBand	AutoSize	AutoStretchCaptionListado de V�deos M�s Vistos.ColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsItalic 
ParentFontTransparentWordWrap	FontSize     