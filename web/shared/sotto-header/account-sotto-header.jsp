<nav id="account-navbar" class='navbar navbar-default'>
  <div class='container-fluid'>
    
    <div id="account-navbar-header" class="navbar-header">
      
    </div>
    
    <div id="account-navbar-menu">
      <ul class='nav navbar-nav'>
        <li><a href="../../c-account/orders/orders.jsp">I miei Ordini</a></li>
        <li><a href="../../c-account/cart/cart.jsp">Il mio Carrello</a></li>
        <li><a href="../../c-account/wishlist/wishlist.jsp">La mia Lista Desideri</a></li>
        <li><a href="../../c-account/reviews/reviews.jsp">Le mie Recensioni</a></li>
        <li><a href="../../c-account/account-info/account-info.jsp">Modifica Informazioni</a></li>
        <li><a href="javascript:;" onclick="javascript:document.getElementById('logout').submit()">Logout</a></li>
      </ul>
      
      <form action="../../c-login/login/login.jsp" id="logout" method="post">
        <input type="hidden" name="action" value="logout" />
      </form>
    </div>
    
  </div>
</nav>
