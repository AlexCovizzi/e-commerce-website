
function isEmpty(value) {
  if (value === null || value.length === 0)
    return true;
  for (var count = 0; count < value.length; count++) {
    if (value.charAt(count) !== " ") return false;
  }
  
  return true;
}

function isValidIsbn(value) {
  if(value.length !== 13)
    return false;
  
  for(var count = 0; count < value.length; count++) {
    if(isNaN(value.charAt(count)))
      return false;
  }
  
  return true;
}

function isValidNumeroPagine(value) {
  return !isNaN(value);
}

function isValidData(value) {
  for(var count = 0; count < value.length; count++) {
    if((count === 4 || count === 7) && value.charAt(count) !== "-")
      return false;
    if((count !== 4 && count !== 7) && isNaN(value.charAt(count)))
      return false;
  }
  
  return true;
}

function submitInfoLibro() {
  f = document.infoLibroForm;

  // Titolo
  if (isEmpty(f.titolo.value)) {
    alert("Inserire il titolo.");
    return;
  }
  
  // Autore
  var autore = document.getElementById("formAutore0");
  if (isEmpty(autore.value)) {
    alert("Inserire il nome dell'autore nel primo campo.");
    return;
  }
  
  // ISBN
  if (isEmpty(f.isbn.value)) {
    alert("Inserire il codice ISBN.");
    return;
  }
  
  if(!isValidIsbn(f.isbn.value)) {
    alert("Il codice ISBN è formato da 13 cifre. Inserirne uno corretto.");
    return;
  }
  
  // Pagine
  if (!isEmpty(f.pagine.value))
    if(!isValidNumeroPagine(f.pagine.value)) {
      alert("Inserire un numero di pagine corretto (numero intero).");
      return;
    }
  
  // Editore
  if(isEmpty(f.editore.value)) {
    alert("Inserire l'editore.");
    return;
  }
  
  // Genere
  var checkedGenere = false;
  var bookGeneri = document.getElementsByName("bookGeneri");
  for (i = 0; i < bookGeneri.length; i++) {
    if (bookGeneri[i].checked) {
      checkedGenere = true;
      break;
    }
  }
  
  if(!checkedGenere) {
    alert("Selezionare almeno un genere.");
    return;
  }
  
  // Data di pubblicazione
  if(!isEmpty(f.dataPubbl.value))
    if(!isValidData(f.dataPubbl.value)) {
      alert("Inserire una data nel formato: \"aaaa-mm-gg\".");
      return;
    }
  
  // Lingua
  if(isEmpty(f.lingua.value)) {
    alert("Inserire la lingua.");
    return;
  }
  
  // Prezzo
  if(isEmpty(f.prezzo.value)) {
    alert("Inserire il prezzo.");
    return;
  }

  f.submit();
  return;
}

/* Variabile per tenere il conto degli autori inseriti */
var i = 0;

function inc() {
  i = i + 1;
}

function dec() {
  if(i > 1)
    i = i - 1;
}

/* Rimuovo un div */
function removeElement(parentDiv, childDiv) {
  if (childDiv === parentDiv){
    alert("The parent div cannot be removed.");
  }
  else if (document.getElementById(childDiv)) {
    var child = document.getElementById(childDiv);
    var parent = document.getElementById(parentDiv);
    parent.removeChild(child);
    dec();
  }
  else {
    alert("Child div has already been removed or does not exist.");
    return false;
  }
}

/* Aggiungo un campo autore al click sul bottone "Aggiungi autore" */
function aggiungiAutore() {
  inc();
  var divNuovoAutore = document.createElement('div');
  divNuovoAutore.setAttribute("class", "autoreCampo input-group");
  divNuovoAutore.setAttribute("id", "autore" + i);

  var formNuovoAutore = document.createElement("input");
  formNuovoAutore.setAttribute("type", "text");
  formNuovoAutore.setAttribute("class", "form-control");
  formNuovoAutore.setAttribute("name", "autore");
  formNuovoAutore.setAttribute("id", "formAutore" + i);
  formNuovoAutore.setAttribute("placeholder", "Inserisci l'autore del libro");

  var spanInputGroupBtn = document.createElement("span");
  spanInputGroupBtn.setAttribute("class", "input-group-btn");

  var bottoneRimuovi = document.createElement("input");
  bottoneRimuovi.setAttribute("type", "button");
  bottoneRimuovi.setAttribute("class", "btn btn-danger");
  bottoneRimuovi.setAttribute("onclick", "removeElement('autoriDiv','autore" + i + "')");
  bottoneRimuovi.setAttribute("value", "X");

  divNuovoAutore.appendChild(formNuovoAutore);
  divNuovoAutore.appendChild(spanInputGroupBtn);
  spanInputGroupBtn.appendChild(bottoneRimuovi);

  document.getElementById("autoriDiv").appendChild(divNuovoAutore);
}

function setCounter(count) {
  i = count;
}