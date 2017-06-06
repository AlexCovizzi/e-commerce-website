
function isEmpty(value) {

  if (value === null || value.length === 0)
    return true;
  for (var count = 0; count < value.length; count++) {
    if (value.charAt(count) !== " ") return false;
  }
  return true;

}

function isValidIsbn(value)
{
  if(value.length !== 15)
    return false;
  
  for(var count = 0; count < value.length; count++) {
    if(isNaN(value.charAt(count)))
      return false;
  }
  
  return true;
}

function isValidNumeroPagine(value)
{
  return !isNaN(value);
}

function isValidData(value)
{
  for(var count = 0; count < value.length; count++) {
    if((count === 2 || count === 5) && value.charAt(count) !== "/")
      return false;
    else if(isNaN(value.charAt(count)))
      return false;
  }
  
  return true;
}

function submitInfoLibro()
{
  f=document.infoLibroForm;

  // Titolo
  if (isEmpty(f.titolo.value)) {
    alert("Inserire il titolo.");
    return;
  }
  
  // Autore
  if (isEmpty(f.autore.value)) {
    alert("Inserire il nome dell'autore.");
    return;
  }
  
  // ISBN
  if (isEmpty(f.isbn.value)) {
    alert("Inserire il codice ISBN.");
    return;
  }
  
  if(!isValidIsbn(f.isbn.value)) {
    alert("Il codice ISBN è formato da 15 cifre. Inserirne uno corretto.");
    return;
  }
  
  // Pagine
  if (!isEmpty(f.pagine.value))
    if(!isValidNumeroPagine(f.pagine.value)) {
      alert("Inserire un numero di pagine corretto (numero intero).");
      return;
    }
  
  // Editore
  if (isEmpty(f.editore.value)) {
    alert("Inserire l'editore.");
    return;
  }
  
  // Data di pubblicazione
  if(!isEmpty(f.dataPubbl.value))
    if(!isValidData(f.dataPubbl.value)) {
      alert("Inserire una data nel formato: \"gg/mm/aaaa\".");
      return;
    }
  
  // Lingua
  if (isEmpty(f.lingua.value)) {
    alert("Inserire la lingua.");
    return;
  }
  
  // Prezzo
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