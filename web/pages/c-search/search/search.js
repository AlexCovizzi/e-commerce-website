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

function submitFilter() {
    // Ogni volta che metto un filtro ritorno alla prima pagina
    document.getElementsByName("page")[0].value = 1;

    document.getElementById("filter-form").submit();

    return;
}

function submitOrd(ord) {
  document.getElementsByName("ord")[0].value = ord;
  submitFilter();
  return;
}

function submitPriceFilter(min, max) {
    if(min > -1) {
      document.getElementsByName("priceMin")[0].value = min;
    } else {
      document.getElementsByName("priceMin")[0].value = '';
    }
    if(max > -1) {
      document.getElementsByName("priceMax")[0].value = max;
    } else {
      document.getElementsByName("priceMax")[0].value = '';
    }
    submitFilter();
    return;
}

function submitVoteFilter(vote) {
    document.getElementsByName("vote")[0].value = vote;
    submitFilter();
    return;
}

function submitPage(n) {
    if(n <= 0) n = 1;
    document.getElementsByName("page")[0].value = n;
    document.getElementById("filter-form").submit();
    return;
}

function submitActionWithIsbn(action, isbn) {
    document.getElementsByName("action")[0].value = action;
    document.getElementsByName("isbn")[0].value = isbn;
    document.getElementById("filter-form").submit();
    return;
}