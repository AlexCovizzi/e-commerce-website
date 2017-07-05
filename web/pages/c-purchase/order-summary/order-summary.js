/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function submitInformazioniOrdineForm(page, action) {
  var f = document.informazioniOrdineForm;
  f.setAttribute("action", page);
  f.action.value = action;
  f.submit();
  return;
}
