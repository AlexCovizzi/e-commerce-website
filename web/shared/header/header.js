
/* 
 * questo script serve a fare in modo che la scritta nel dropdown menu a fianco
 * della serchbar cambi a seconda di quello che seleziono
 */
$(".dropdown-menu li a").click(function(e){
    var selText = $(this).text();
    $(this).parents('.input-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');       
});