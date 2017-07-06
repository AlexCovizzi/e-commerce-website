
function submitCambiaStatoForm(codice) {
  var f = document.cambiaStatoForm;
  f.orderId.value = codice;
  var selects = document.getElementById("orderStateList" + codice);
  f.orderState.value = selects.options[selects.selectedIndex].text;
  f.submit();
  return;
}

function submitVediOrdineForm(codice) {
  var f = document.vediOrdineForm;
  f.orderId.value = codice;
  f.submit();
  return;
}