/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function isEmpty(value) {
  if (value === null || value.length === 0)
    return true;
  for (var count = 0; count < value.length; count++) {
    if (value.charAt(count) !== " ") return false;
  }
  
  return true;
}

function isValidCodiceCarta(value) {
  if(value.length !== 16)
    return false;
  
  for(var count = 0; count < value.length; count++)
    if(isNaN(value.charAt(count)))
      return false;
  
  return true;
}

function isValidCodiceSicurezza(value) {
  if(value.length !== 3)
    return false;
  
  for(var count = 0; count < value.length; count++)
    if(isNaN(value.charAt(count)))
      return false;
  
  return true;
}

function submitPagamentoForm() {
  var f = document.pagamentoForm;
  
  /* Codice della carta */
  if(isEmpty(f.codiceCarta.value)) {
    alert("Inserisci il codice della carta.");
    return false;
  }
  else if(!isValidCodiceCarta(f.codiceCarta.value)) {
    alert("Inserisci un codice valido (16 numeri).");
    return false;
  }
  
  /* Titolare */
  if(isEmpty(f.titolareCarta.value)) {
    alert("Inserisci il nome del titolare.");
    return false;
  }
  
  /* Codice di sicurezza */
  if(isEmpty(f.codiceSicurezza.value)) {
    alert("Inserisci il codice di sicurezza della carta.");
    return false;
  }
  else if(!isValidCodiceSicurezza(f.codiceSicurezza.value)) {
    alert("Inserisci un codice di sicurezza valido (3 numeri).");
    return false;
  }
  
  f.submit();
  return;
}
