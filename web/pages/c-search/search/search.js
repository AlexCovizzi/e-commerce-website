$('.filter-menu').on('hidden.bs.collapse', function (e) {
    alert('Event fired on #' + e.currentTarget.id);
});

$(window).load(function(){
  if ($(this).width() < 768) {
    $('.filter-menu').collapse('hide');
  } else {
    $('.filter-menu').collapse('show');
  }
});

$(window).resize(function() {
  if ($(this).width() < 768) {
    $('.filter-menu').collapse('hide');
  } else {
    $('.filter-menu').collapse('show');
  }
});

function submitAdminLibroForm(isbn, action) {
  var f = document.getElementsByName("adminLibroForm" + isbn)[0];
  f.action.value = action;
  f.submit();
  return;
}
