/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(".dropdown-menu li a").click(function(e){
    var selText = $(this).text();
    $(this).parents('.input-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');       
});
