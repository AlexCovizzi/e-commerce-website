
/* 
 * questo script serve a fare in modo che la scritta nel dropdown menu a fianco
 * della serchbar cambi a seconda di quello che seleziono

$("#search-options li a").click(function(e){
    var selText = $(this).text();
    $(this).parents('.input-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
    
    var selValue = $(this).val();
    $("#field-input").val(selValue);
    console.log(selValue);
  });
  
  function changeField(field, name) {
    document.getElementById("dropdownField").innerHTML = name+' <span class="caret"></span>';
    document.getElementById("field-input").value = field;
  }

 */