<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Il mio account</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="account.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="account.js"></script>

  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../../shared/sotto-header/account-sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
      <h4>Il mio account: <b>Nome utente</b></h4>

      <div class="divider-horizontal"></div>

      <h4 class="account-page-link"><a  href="../orders/orders.jsp">I miei Ordini</a><br>
        <small>Spediti: 2 su 4</small>
      </h4>
      <h4 class="account-page-link"><a href="#">Il mio Carrello</a></br>
        <small>Libri: 3, Totale: 45&euro;</small>
      </h4>
      <h4 class="account-page-link"><a href="#">La mia Lista Desideri</a></h4>
      <h4 class="account-page-link"><a href="../address/address.jsp">Il mio Indirizzo</a></br>
        <small>Indirizzo dell'utente</small>
      </h4>
      <h4 class="account-page-link"><a href="#">Cambia Password</a></h4>
      
      <form action="../../c-login/login/login.jsp" id="logout" method="post">
        <input type="hidden" name="action" value="logout" />
      </form>
      <h4 class="account-page-link">
        <a href="javascript:;" onclick="javascript:document.getElementById('logout').submit()">Logout</a>
      </h4>
      
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>
