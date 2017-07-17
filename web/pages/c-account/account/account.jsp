<%@page import="util.Logger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Account Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="accountManagement" scope="page" class="bflows.AccountManagement" />
<jsp:setProperty name="accountManagement" property="*" />

<%
  Cookie[] cookies = request.getCookies();
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
%>

<html>
  <head>
    
    <!-- Se l'utente non è loggato o è un admin ritorno alla homepage immantinente -->
    <% if(!loggedIn | admin) { %>
      <script language="javascript">
        location.replace("../../c-search/homepage/homepage.jsp");
      </script>
    <% } %>
    
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
      
      <h3>Il mio account: <b><%=Session.getUserName(cookies)%> <%=Session.getUserSurname(cookies)%></b></h3>

      <div class="divider-horizontal"></div>

      <h4 class="account-page-link"><a href="../orders/orders.jsp">I miei Ordini</a></h4>
      
      <h4 class="account-page-link"><a href="../cart/cart.jsp">Il mio Carrello</a></h4>
      
      <h4 class="account-page-link"><a href="../wishlist/wishlist.jsp">La mia Lista Desideri</a></h4>
      
      <h4 class="account-page-link"><a href="../reviews/reviews.jsp">Le mie Recensioni</a></h4>
      
      <h4 class="account-page-link"><a href="../account-info/account-info.jsp">Modifica Informazioni Account</a></h4>
      
      <h4 class="account-page-link">
        <a href="javascript:document.getElementById('logout').submit();">Logout</a>
      </h4>

      <!-- Form di logout -->
      <form action="../../c-login/login/login.jsp" id="logout" method="post">
        <input type="hidden" name="action" value="logout" />
      </form>
    </div>
    

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>
