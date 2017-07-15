<!-- <link href="../../../shared/sotto-header/admin-sotto-header.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript" src="../../../shared/sotto-header/admin-sotto-header.js"></script>

<nav id="account-navbar" class='navbar navbar-default'>
  <div class='container-fluid'>
    
    <div id="account-navbar-header" class="navbar-header">
      
    </div>
    
    <div id="account-navbar-menu">
      <ul class='nav navbar-nav'>
        <li><a href="javascript: gestioneUtenti();">Gestione Utenti</a></li>
        <li><a href="javascript: gestioneAdmin();">Gestione Amministratori</a></li>
        <li><a href="javascript: gestioneOrdini()">Gestione Ordini</a></li>
        <li><a href="javascript: gestioneCoupon()">Gestione Coupon</a></li>
        <li><a href="javascript: aggiungiLibro()">Aggiungi Libro</a></li>
        <li><a href="javascript: gestioneRecensioni()">Gestione Recensioni</a></li>
        <li><a href="javascript: logout()">Logout</a></li>
      </ul>
    </div>
    
    <form name="gestioneUtentiForm" method="post" action="../../c-admin/users/users.jsp">
      <input type="hidden" name="action" value="view"/>
    </form>
    
    <form name="gestioneAdminForm" method="post" action="../../c-admin/admin-users/admin-users.jsp">
      <input type="hidden" name="action" value="view"/>
    </form>
    
    <form name="gestioneOrdiniForm" method="post" action="../../c-admin/admin-orders/admin-orders.jsp">
      <input type="hidden" name="action" value="view"/>
    </form>
    
    <form name="gestioneCouponForm" method="post" action="../../c-admin/coupons/coupons.jsp">
      <input type="hidden" name="action" value="view"/>
    </form>
    
    <form name="aggiungiLibroForm" method="post" action="../../c-admin/add-book/add-book.jsp">
      <input type="hidden" name="action" value="view"/>
    </form>
    
    <form name="gestioneRecensioniForm" method="post" action="../../c-admin/admin-reviews/admin-reviews.jsp">
      <input type="hidden" name="action" value="view"/>
    </form>
    
    <form name="modificaInformazioniForm" method="post" action="../../c-account/account-info/account-info.jsp">
      <input type="hidden" name="action" value="view"/>
    </form>
    
    <form name="logoutForm" method="post" action="../../c-login/login/login.jsp">
      <input type="hidden" name="action" value="logout"/>
    </form>
    
  </div>
</nav>

