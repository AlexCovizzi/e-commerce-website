<nav id="account-navbar" class='navbar navbar-default'>
  <div class='container-fluid'>
    
    <div id="account-navbar-header" class="navbar-header">
      
    </div>
    
    <div id="account-navbar-menu">
      <ul class='nav navbar-nav'>
        <li><a href="../../pages/orders/orders.jsp">I miei Ordini</a></li>
        <li><a href="#">Il mio Carrello</a></li>
        <li><a href="#">La mia Lista Desideri</a></li>
        <li><a href="../../pages/address/address.jsp">Il mio Indirizzo</a></li>
        <li><a href="#">Cambia Password</a></li>
        <li><a href="javascript:;" onclick="javascript:document.getElementById('logout').submit()">Logout</a></li>
      </ul>
      
      <form action="../../c-login/login/login.jsp" id="logout" method="post">
        <input type="hidden" name="action" value="logout" />
      </form>
    </div>
    
  </div>
</nav>
