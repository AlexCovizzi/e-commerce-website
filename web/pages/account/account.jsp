<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Il mio account">
  
  <jsp:attribute name="sotto_header">
    <%@ include file="../../shared/account-sotto-header/account-sotto-header.jsp" %>
  </jsp:attribute>
  
  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    <h4>Il mio account: <b>Nome utente</b></h4>
    
    <div class="divider-horizontal"></div>
    
    <h4 class="account-page-link"><a  href="../orders/orders.jsp">I miei Ordini</a><br>
      <small>Spediti: 2 su 4</small>
    </h4>
    <h4 class="account-page-link"><a href="#">Il mio Carrello</a></br>
      <small>Libri: 3, Totale: 45&euro;</small>
    </h4>
    <h4 class="account-page-link"><a href="#">La mia Lista Desideri</a></h4>
    <h4 class="account-page-link"><a href="#">Il mio Indirizzo</a></br>
      <small>Indirizzo dell'utente</small>
    </h4>
    <h4 class="account-page-link"><a href="#">Cambia Password</a></h4>
    <h4 class="account-page-link"><a href="../homepage/homepage.jsp">Logout</a></h4>
    
  </jsp:attribute>
    
  <jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="account.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/account-sotto-header/account-sotto-header.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
    <script type="text/javascript" src="account.js"></script>
    <script type="text/javascript" src="../../shared/account-sotto-header/account-sotto-header.js"></script>
  </jsp:attribute>
 
</t:base-layout>
