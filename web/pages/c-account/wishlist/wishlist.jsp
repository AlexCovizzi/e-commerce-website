<%@page import="blogics.Book"%>
<%@page import="bflows.AccountManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Wishlist Page" %>
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
  
  if(action.equals("view")) {
    accountManagement.wishlistView();
  } else if(action.equals("add")) {
    accountManagement.addToWishlist();
  } else if(action.equals("remove")) {
    accountManagement.removeFromWishlist();
  }
  
%>

<html>
  <head>
    <title>La mia lista desideri</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="cart.css" rel="stylesheet" type="text/css" />
    <link href="../../../shared/wishlist-book/wishlist-book.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="wishlist.js"></script>
    <script type="text/javascript" src="../../../shared/wishlist-book/wishlist-book.js"></script>

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
        </a> aggiunto alla lista desideri!
        </h4></br>
      <% } else if(action.equals("remove")) { %>
        <h4>
        <a href="../../c-search/book-page/book-page.jsp?isbn=<%=accountManagement.getIsbn()%>">
           <%=accountManagement.getTitle()%>
        </a> rimosso dalla lista desideri
        </h4></br>
      <% } %>
      
      <h4>La mia Lista Desideri</h4>

      <div class="divider-horizontal"></div>

      <div class="row">

        <% if(accountManagement.getWishlist().isEmpty()) { %>
          <div class="col-sm-9">Non hai nessun libro nei tuoi desideri!</div>
        <% } else { %>
          <div class="col-sm-9">
            <% for(Book book : accountManagement.getWishlist()) { %>
              <% request.setAttribute("book", book); %>
              <jsp:include page="../../../shared/wishlist-book/wishlist-book.jsp" />
            <% } %>
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
