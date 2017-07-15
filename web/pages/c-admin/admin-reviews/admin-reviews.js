/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function submitRimuoviRecensioneForm(userId, bookIsbn) {
  var f = document.rimuoviRecensioneForm;
  f.isbn.value = bookIsbn;
  f.userReviewId.value = userId;
  f.submit();
  return;
}