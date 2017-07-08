<%@page import="util.Conversion"%>
<%@page import="bflows.AccountManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Shopping cart Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<jsp:useBean id="accountManagement" scope="page" class="bflows.AccountManagement" />
<jsp:setProperty name="accountManagement" property="*" />

<%
  String message = null;
  Cookie[] cookies = request.getCookies();
  accountManagement.setCookies(cookies);
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
  
  String action = request.getParameter("action");
  if (action == null) action = "view";
  
  message = accountManagement.getErrorMessage();
  
  if(action.equals("add")) {
    accountManagement.addToCart();
  } else if(action.equals("remove")) {
    accountManagement.removeFromCart();
  } else if(action.equals("modify")) {
    accountManagement.modifyQuantity();
  }
  accountManagement.cartView();
  
%>

<html>
  <head>
    <title>Il mio carrello</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="cart.css" rel="stylesheet" type="text/css" />
    <link href="../../../shared/cart-book/cart-book.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="cart.js"></script>
    <script type="text/javascript" src="../../../shared/cart-book/cart-book.js"></script>

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
      
      <% if(action.equals("add")) { %>
        <h4>
        <a href="../../c-search/book-page/book-page.jsp?isbn=<%=accountManagement.getIsbn()%>">
           <%=accountManagement.getTitle()%>
        </a> aggiunto al carrello!
        </h4></br>
      <% } else if(action.equals("remove")) { %>
        <h4>
        <a href="../../c-search/book-page/book-page.jsp?isbn=<%=accountManagement.getIsbn()%>">
           <%=accountManagement.getTitle()%>
        </a> rimosso dal carrello
        </h4></br>
      <% } %>
      
      <h4>Il mio carrello</h4>

      <div class="divider-horizontal"></div>

      <div class="row">

        <% if(accountManagement.getShoppingCart().isEmpty()) { %>
          <div class="col-sm-9">Non hai nessun libro nel carrello!</div>
        <% } else { %>
          <div class="col-sm-9">
            <% for(int i=0; i<accountManagement.getShoppingCart().size(); i++) { %>
              <% request.setAttribute("book", accountManagement.getShoppingCart().getBook(i)); %>
              <% request.setAttribute("quantity", accountManagement.getShoppingCart().getQuantity(i)); %>
              <jsp:include page="../../../shared/cart-book/cart-book.jsp" />
            <% } %>
          </div>

          <div class="col-sm-3">
            <h4>Totale provvisorio (libri: <%=accountManagement.getShoppingCart().getN()%>)</h4>
            <h4 style="color: #46b8da;"><b>&euro; <%=Conversion.getPriceAsString(accountManagement.getShoppingCart().getTotal())%></b></h4>
            <button class="btn btn-default block" onclick="submitCreaOrdineForm()">
              Procedi all'acquisto
            </button>
            
            <form name="creaOrdineForm" action="../../c-purchase/order-address/order-address.jsp">
              <input type="hidden" name="action" value="view">
            </form>
          </div>
        <% } %>

      </div>
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>
