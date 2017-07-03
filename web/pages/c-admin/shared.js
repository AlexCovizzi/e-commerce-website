/* 
 * Contiene i metodi usati dalla maggior parte delle pagine di questa conversazione
 */

/* Torno alla pagina definita come precedente */
function annulla() {
  document.annullaForm.submit();
  return;
}

/* Cambia pagina dei risulati */
function submitCambiaPaginaForm(pagina, offset) {
  var f = document.cambiaPaginaForm;
  f.pagina.value = pagina;
  f.offset.value = offset;
  f.submit();
  return;
}