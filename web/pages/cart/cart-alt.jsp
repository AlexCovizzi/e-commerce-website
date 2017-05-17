<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Il mio carrello</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="cart.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/account-sotto-header/account-sotto-header.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/cart-book/cart-book.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="cart.js"></script>
    <script type="text/javascript" src="../../shared/account-sotto-header/account-sotto-header.js"></script>
    <script type="text/javascript" src="../../shared/cart-book/cart-book.js"></script>

  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../shared/account-sotto-header/account-sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
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
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>
