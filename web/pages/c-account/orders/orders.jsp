<%@page import="blogics.Order"%>
<%@page import="blogics.Book"%>
<%@page import="bflows.AccountManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Orders Page" %>
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
  
  if (action.equals("cancel")) {
    accountManagement.cancelOrder();
  }
  accountManagement.ordersView();
  
%>

<html>
  <head>
    <title>I miei ordini</title>

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
        L'ordine è stato cancellato!
      <% } %>
      
      <div class="col-xs-10">
        <h4>I miei ordini</h4>
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
          <div class="col-sm-12">Non hai ancora effettuato nessun ordine</div>
        <% } else { %>
          <div class="col-sm-12">
            <% for(Order order : accountManagement.getOrders()) { %>
              <% request.setAttribute("order", order); %>
              <% request.setAttribute("admin", false); %>
              <jsp:include page="../../../shared/order/order.jsp" />
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
