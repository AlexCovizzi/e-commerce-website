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
        $desiderato = false;
    }
    else
    {
        document.getElementById("desiderato").style.background="red";
        $desiderato = true;
    }
}
