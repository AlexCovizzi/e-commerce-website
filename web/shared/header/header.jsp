<nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <div class="navbar-header">
      
      <a class="navbar-brand" href="#">Libreria Sant'Ale</a>
      
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle Navigation</span>
        <i class="glyphicon glyphicon-user"></i>
      </button>
      
    </div>

    <% if(false) {%>
        <!-- menu a destra (logged in) -->
        <div id="navbar" class="navbar-right navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li>
                <a href="#"><i class="glyphicon glyphicon-shopping-cart"></i>
                <span class="visible-xs-inline" style="padding-left:16px;">Carrello</span>
                <span class="badge">4</span>
                </a>
              </li>
              <li>
                <a href="#"><i class="glyphicon glyphicon-eur"></i>
                <span class="visible-xs-inline" style="padding-left:16px;">Ordini</span>
                </a>
              </li>
              <li>
                <a href="#"><i class="glyphicon glyphicon-list-alt"></i>
                <span class="visible-xs-inline" style="padding-left:16px;">Lista desideri</span>
                </a>
              </li>
              <li>
                <a href="#"><i class="glyphicon glyphicon-log-out"></i>
                <span class="visible-xs-inline" style="padding-left:16px;">Logout</span>
                </a>
              </li>
            </ul>
        </div> <!-- menu a destra (logged in) -->
    
    <%} else {%>
        <!-- menu a destra (logged out) -->
        <div id="navbar" class="navbar-right navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li>
                <a href="#">Accedi/Registrati</a>
              </li>
            </ul>
        </div> <!-- menu a destra (logged out) -->
        
    <% } %>

    <!-- barra di ricerca -->
    <div id="search-bar" class="navbar-collapse">
      <form id="search-form" class="navbar-form">

        <div id="search-form-group" class="form-group">
          <div id="search-input-group" class="input-group">
            <div class="input-group-btn" style="width:1%;">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Titolo
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu">
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