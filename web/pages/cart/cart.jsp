<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Il mio carrello">
  
  <jsp:attribute name="sotto_header">
    <!-- metti qui il sotto header della pagina -->
    <%@ include file="../../shared/account-sotto-header/account-sotto-header.jsp" %>
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    
    <h4>Il mio carrello</h4>
    
    <div class="divider-horizontal"></div>
    
    <div class="row">
      
      <div class="col-sm-9">
        <%@include file="../../shared/cart-book/cart-book.jsp" %>
        <%@include file="../../shared/cart-book/cart-book.jsp" %>
        <%@include file="../../shared/cart-book/cart-book.jsp" %>
      </div>
      
      <div class="col-sm-3">
        <h4>Totale provvisorio (libri: 1)</h4>
        <h4 style="color: #46b8da;"><b>&euro; 99,99</b></h4>
        <button class="btn btn-default block">Procedi all'acquisto</button>
      </div>
      
    </div>
    
  </jsp:attribute>

  <jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="cart.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/account-sotto-header/account-sotto-header.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/cart-book/cart-book.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
    <script type="text/javascript" src="cart.js"></script>
    <script type="text/javascript" src="../../shared/account-sotto-header/account-sotto-header.js"></script>
    <script type="text/javascript" src="../../shared/cart-book/cart-book.js"></script>
  </jsp:attribute>
 
</t:base-layout>