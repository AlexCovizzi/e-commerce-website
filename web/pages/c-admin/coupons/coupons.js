/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function aggiungiCoupon() {
  document.aggiungiCouponForm.submit();
  return;
}

function disabilitaCoupon(j) {
  var f = document.disabilitaCouponForm;
  f.codice.value = j;
  f.submit();
  return;
}

function annulla() {
  document.annullaForm.submit();
  return;
}
