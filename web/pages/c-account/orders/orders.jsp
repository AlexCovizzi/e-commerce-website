<%@page import="blogics.Order"%>
<%@page import="blogics.Book"%>
<%@page import="bflows.AccountManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Orders Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="accountManagement" scope="page" class="bflows.AccountManagement" />
<jsp:setProperty name="accountManagement" property="*" />

<%
  Cookie[] cookies = request.getCookies();
  accountManagement.setCookies(cookies);
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
  
  String action = request.getParameter("action");
  if (action == null) action = "view";
  
  if(action.equals("view")) {
    accountManagement.ordersView();
  } else if (action.equals("cancel")) {
    accountManagement.cancelOrder();
  }
  
  String message = accountManagement.getErrorMessage();
  if(message != null) action = "view";
%>

<html>
  <head>
    <title>I miei ordini</title>
    
    <!-- Se l'utente non è loggato ritorno alla homepage immantinente -->
    <% if(!loggedIn | admin) { %>
      <script language="javascript">
        location.replace("../../c-search/homepage/homepage.jsp");
      </script>
    <% } %>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="../../../shared/order/order.css" rel="stylesheet" type="text/css" />
    <link href="orders.css" rel="stylesheet" type="text/css" />
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="orders.js"></script>
    <script type="text/javascript" src="../../../shared/order/order.js"></script>
    
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
      
      <% if(action.equals("cancel")) { %>
        <div class="col-xs-12">
          <h4>L'ordine è stato cancellato!</h4>
        </div>
      <% } %>
      
      <div class="col-xs-10">
        <h3>I miei ordini</h3>
      </div>
        
      <div class="col-xs-2">
        <form method="get">
          <% if(accountManagement.getShow().equals("all")) { %>
            <input type="hidden" name="show" value="current">
            <button class="btn btn-block" type="submit">
              Mostra in corso
            </button>
          <% } else { %>
            <input type="hidden" name="show" value="all">
            <button class="btn btn-block" type="submit">
              Mostra tutti
            </button>
          <% } %>
        </form>
      </div>

      <div class="col-xs-12 divider-horizontal"></div>

      <div style="margin-top: 16px;">
        <% if(accountManagement.getOrders().isEmpty()) { %>
          <% if(accountManagement.getShow().equals("all")) { %>
            <div class="col-sm-12">Non hai ancora effettuato nessun ordine</div>
          <% } else { %>
            <div class="col-sm-12">Non c'è nessun ordine in corso</div>
          <% } %>
        <% } else { %>
          <div class="col-sm-12">
            <% for(Order order : accountManagement.getOrders()) { %>
              <% request.setAttribute("order", order); %>
              <% request.setAttribute("admin", false); %>
              <jsp:include page="../../../shared/order/order.jsp" />
              </br>
            <% } %>
          </div>
        <% } %>
        
        
        <div class='col-xs-12' style='margin-top: 12px;'>
          <a href='../account/account.jsp'>Torna all'account</a>
        </div>
      </div>
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
    <%if (message != null) {%>
      <script>alert("<%=message%>");</script>
    <%}%>
    
  </body>
</html>
