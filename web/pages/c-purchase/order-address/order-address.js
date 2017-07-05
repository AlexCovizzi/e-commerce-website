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

function isValidCap(value) {
  if(value.length !== 5)
    return false;
  
  for(var count = 0; count < value.length; count++)
    if(isNaN(value.charAt(count)))
      return false;
  
  return true;
}

function submitIndirizzoForm() {
  var f = document.indirizzoForm;
  
  /* Indirizzo */
  if(isEmpty(f.indirizzo.value)) {
    alert("Inserisci l'indirizzo.");
    return false;
  }
  
  /* Numero civico */
  if(isEmpty(f.numeroCivico.value)) {
    alert("Inserisci il numero civico.");
    return false;
  }
  
  /* Città */
  if(isEmpty(f.citta.value)) {
    alert("Inserisci il nome della città.");
    return false;
  }
  
  /* Provincia */
  if(isEmpty(f.provincia.value)) {
    alert("Inserisci il nome della provincia.");
    return false;
  }
  
  /* Stato */
  if(isEmpty(f.stato.value)) {
    alert("Inserisci il nome dello stato.");
    return false;
  }
  
  /* CAP */
  if(isEmpty(f.cap.value)) {
    alert("Inserisci il CAP.");
    return false;
  }
  else if(!isValidCap(f.cap.value)) {
    alert("Inserisci un CAP valido (5 numeri).");
    return false;
  }
  
  /* Destinatario */
  if(isEmpty(f.destinatario.value)) {
    alert("Inserisci il nome del destinatario.");
    return false;
  }
  
  f.submit();
  return;
}