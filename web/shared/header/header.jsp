<!-- l'altezza della navar è fissa a 53px
     ogni pagina che ha l'header dovrà quindi avere un margin-top di 50 px
     in modo che non vengano coperti degli elementi dalla navbar -->

<nav id="navbar-shared" class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    
    <div class="navbar-header">
      
      <a class="navbar-brand" href="../../pages/homepage/homepage.jsp">Libreria Sant'Ale</a>
      
      <button style="padding: 6px 10px;" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu-right" aria-expanded="false" aria-controls="menu-right">
        <span class="sr-only">Toggle Navigation</span>
        <i class="glyphicon glyphicon-menu-down"></i>
      </button>
      <button style="padding: 6px 10px;" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search-bar" aria-expanded="false" aria-controls="search-bar">
        <span class="sr-only">Toggle Navigation</span>
        <i class="glyphicon glyphicon-search"></i>
      </button>
      
    </div>

    <% if(true) {%>
      <!-- menu a destra (logged in) -->
      <div id="menu-right" class="collapse navbar-collapse navbar-right">
        <ul class="nav navbar-nav">
          <li title="Il mio account: Nome utente">
            <a href="#"><i class="glyphicon glyphicon-user"></i>
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
            <a href="#"><i class="glyphicon glyphicon-heart-empty"></i>
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
              <a href="../../pages/login/login.jsp">Accedi</a>
            </li>
            <li>
              <a href="../../pages/signup/signup.jsp">Registrati</a>
            </li>
          </ul>
      </div> <!-- menu a destra (logged out) -->
    <% } %>

    <!-- barra di ricerca -->
    <div id="search-bar" class="navbar-collapse collapse">
      <form id="search-form" class="navbar-form">

        <div id="search-form-group" class="form-group">
          <div id="search-input-group" class="input-group">
            <div class="input-group-btn" style="width:1%;">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Titolo
                <span class="caret"></span>
              </button>
              <ul id="search-options" class="dropdown-menu" aria-labelledby="dropdownMenu">
                <li><a href="#">Titolo</a></li>
                <li><a href="#">Autore</a></li>
                <li><a href="#">Editore</a></li>
                <li><a href="#">ISBN</a></li>
                <li class="divider"></li>
                <li><a class="navbar-link" href="../../pages/signup/signup.jsp">Ricerca Avanzata</a></li>
              </ul>
            </div>
            <input id="search-input" type="text" class="form-control" placeholder="Cerca">
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