/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$desiderato = false;

function cambia_colore()
{
    if($desiderato)
    {
        document.getElementById("desiderato").style.background="#337ab7";
        document.getElementById("desiderato").title = "Aggiungi alla Lista dei Desideri";
        $desiderato = false;
    }
    else
    {
        document.getElementById("desiderato").style.background="red";
        document.getElementById("desiderato").title = "Rimuovi dalla Lista dei Desideri";
        $desiderato = true;
    }
}

function submitModificaLibroForm() {
  document.modificaLibroForm.submit();
  return;
}
