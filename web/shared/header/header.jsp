<script>
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
</script>

<nav id="navbar-shared" class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    
    <div class="navbar-header">
      
      <a class="navbar-brand" href="../../c-search/homepage/homepage.jsp">Libreria Sant'Ale</a>
      
      <button style="padding: 6px 10px;" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu-right" aria-expanded="false" aria-controls="menu-right">
        <span class="sr-only">Toggle Navigation</span>
        <i class="glyphicon glyphicon-menu-down"></i>
      </button>
      <button style="padding: 6px 10px;" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search-bar" aria-expanded="false" aria-controls="search-bar">
        <span class="sr-only">Toggle Navigation</span>
        <i class="glyphicon glyphicon-search"></i>
      </button>
      
    </div>

    <% if(loggedIn) {%>
      <!-- menu a destra (logged in) -->
      <div id="menu-right" class="collapse navbar-collapse navbar-right">
        <ul class="nav navbar-nav">
          <li title="Il mio account: Nome utente">
            <a href="../../c-account/account/account.jsp"><i class="glyphicon glyphicon-user"></i>
            <span class="visible-xs-inline" style="padding-left:16px;">Il mio account: Nome utente</span>
            </a>
          </li>
          <li title="Carrello">
            <a href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
            <span class="visible-xs-inline" style="padding-left:16px;">Carrello</span>
            <span class="badge">4</span>
            </a>
          </li>
          <li title="Lista desideri">
            <a href="#"><i class="glyphicon glyphicon-heart"></i>
            <span class="visible-xs-inline" style="padding-left:16px;">Lista desideri</span>
            </a>
          </li>
        </ul>
      </div> <!-- menu a destra (logged in) -->
    
    <%} else {%>
      <!-- menu a destra (logged out) -->
      <div id="menu-right" class="navbar-right navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li>
              <a href="../../c-login/login/login.jsp">Accedi</a>
            </li>
            <li>
              <a href="../../c-login/signup/signup.jsp">Registrati</a>
            </li>
          </ul>
      </div> <!-- menu a destra (logged out) -->
    <% } %>

    <!-- barra di ricerca -->
    <div id="search-bar" class="navbar-collapse collapse">
      <form id="search-form" class="navbar-form" action="../../c-search/search/search.jsp">

        <div id="search-form-group" class="form-group">
          <div id="search-input-group" class="input-group">
            <div class="input-group-btn" style="width:1%;">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownField" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Titolo
                <span class="caret"></span>
              </button>
              <ul id="search-options" class="dropdown-menu" aria-labelledby="dropdownField">
                <li><a onclick="changeField('title', 'Titolo')">Titolo</a></li>
                <li><a onclick="changeField('description', 'Descrizione')">Descrizione</a></li>
                <li><a onclick="changeField('isbn', 'ISBN')">ISBN</a></li>
                <li class="divider"></li>
                <li><a class="navbar-link" href="../../c-login/signup/signup.jsp">Ricerca Avanzata</a></li>
              </ul>
            </div>
            <input id="field-input" type="hidden" name="field" value="title" style="display:none;">
            <input id="search-input" name="value" type="text" class="form-control" placeholder="Cerca">
            <div class="input-group-btn" style="width:1%;">
              <button class="btn btn-default" type="submit">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </div>
      </form>
    </div> <!-- barra di ricerca -->
    
  </div>
</nav>