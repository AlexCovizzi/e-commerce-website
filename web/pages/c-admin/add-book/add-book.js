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

function submitInfoLibro()
{
  f=document.infoLibroForm;

  if (isEmpty(f.titolo.value)) {
    alert("Inserire il titolo.");
    return;
  }

  if (isEmpty(f.autore.value)) {
    alert("Inserire il nome dell'autore.");
    return;
  }
  
  if (isEmpty(f.isbn.value)) {
    alert("Inserire il codice ISBN.");
    return;
  }
  
  if (isEmpty(f.pagine.value)) {
    alert("Inserire il numero di pagine.");
    return;
  }
  
  if (isEmpty(f.editore.value)) {
    alert("Inserire l'editore.");
    return;
  }
  
  if (isEmpty(f.lingua.value)) {
    alert("Inserire la lingua.");
    return;
  }
  
  if (isEmpty(f.prezzo.value)) {
    alert("Inserire il prezzo.");
    return;
  }

  f.submit();
  return;
}

function annulla()
{
  document.annullaForm.submit();
  return;
}