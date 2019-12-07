/*

Answer: C:\VIDEOS.DBF
Type: DBASE
AuxTables: True
RunMode: Default
Alias: WORK
LiveAnswer: FALSE

*/

SELECT V.CODIGO, V.TITULO,  G.NOMBRE, V.PE, V.COSTO FROM
  VIDEOS V,  GENEROS G
  WHERE V.GENERO=G.CODIGO
  ORDER BY G.NOMBRE
