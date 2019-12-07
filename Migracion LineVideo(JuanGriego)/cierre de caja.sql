/*

Answer: :PRIV:ANSWER.DB
AuxTables: True
RunMode: Default
Alias: WORK
LiveAnswer: TRUE

*/

select fecha, sum(Alquiler) Alquiler, sum(Adicionales) Adicionales, sum(Ventas) Ventas,
	sum(Depositos) Depositos, sum(Inscripciones) Inscripciones, sum(Retirados) Retirados, sum(Exoneracion) Exoneraciones,
	sum(ExPromocion) Promociones, sum(Efectivo) Efectivo, sum(cheque) Cheque, sum(Tarjeta) Trajeta 
from  trans 
where fecha = "06/08/1998"
group by fecha
