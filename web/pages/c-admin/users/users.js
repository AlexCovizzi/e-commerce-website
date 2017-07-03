/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function submitBloccaUtenteForm(userId) {
  var f = document.bloccaUtenteForm;
  f.listUserId.value = userId;
  f.submit();
  return;
}

function submitSbloccaUtenteForm(userId) {
  var f = document.sbloccaUtenteForm;
  f.listUserId.value = userId;
  f.submit();
  return;
}

function submitVediOrdiniUtenteForm(userId) {
  var f = document.vediOrdiniUtenteForm;
  f.orderUser.value = userId;
  f.submit();
  return;
}
