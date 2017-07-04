/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function submitRimuoviAdminForm(userId) {
  var f = document.rimuoviAdminForm;
  f.listUserId.value = userId;
  f.submit();
  return;
}

function submitAggiungiAdminForm() {
  document.aggiungiAdminForm.submit();
  return;
}
