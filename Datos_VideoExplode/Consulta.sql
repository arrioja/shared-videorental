/*
Alias: VRDATA
LiveAnswer: FALSE

*/

select Fecha, count (fecha), sum (Deuda_Alquiler), Sum (Deuda_Multa), Sum(Alquiler), Sum(Multa) from factura group by fecha
