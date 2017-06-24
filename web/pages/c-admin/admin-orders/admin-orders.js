
function submitCambiaStatoForm(codice) {
  var f = document.cambiaStatoForm;
  f.orderId.value = codice;
  f.orderState.value = document.getElementsByName("orderStateList").value;
  f.submit();
  return;
}

function annulla() {
  document.annullaForm.submit();
  return;
}