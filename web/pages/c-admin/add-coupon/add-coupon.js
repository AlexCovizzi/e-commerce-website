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

function isValidCodice(value) {
  if(value.length !== 15)
    return false;
  
  return true;
}

function isValidSconto(value) {
  if(isNaN(value))
    return false;
  
  if(value < 0)
    return false;
  
  return true;
}

function submitCouponForm() {
  f=document.couponForm;

  // Codice
  if (isEmpty(f.codice.value)) {
    alert("Inserire il codice del coupon.");
    return;
  }
  
  if(!isValidCodice(f.codice.value)) {
    alert("Il codice del coupon è formato da 15 caratteri alfanumerici.");
    return;
  }
  
  // Sconto
  if (isEmpty(f.sconto.value)) {
    alert("Inserire il valore dello sconto del coupon.");
    return;
  }
  
  if(!isValidSconto(f.sconto.value)) {
    alert("Il valore dello sconto del coupon è un numero intero positivo.");
    return;
  }
  
  f.submit();
  return;
}

function annulla() {
  document.annullaForm.submit();
  return;
}
