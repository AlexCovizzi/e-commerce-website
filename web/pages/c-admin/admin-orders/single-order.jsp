<%@page import="bflows.AdminManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Orders Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<jsp:useBean id="adminManagement" scope="page" class="bflows.AdminManagement" />
<jsp:setProperty name="adminManagement" property="*" />

<%
  String message = null;
  Cookie[] cookies = request.getCookies();
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
  
  String action = request.getParameter("action");
  if (action == null) action = "view";
  
  message = adminManagement.getErrorMessage();
  
  if (action.equals("change")) {
    adminManagement.cambiaStatoOrdine();
  }
  adminManagement.visualizzaOrdineSingolo();
  
%>

<html>
  <head>
    <title>Ordine singolo</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="../../../shared/order/order.css" rel="stylesheet" type="text/css" />
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="../../../shared/order/order.js"></script>
    <script>
      function submitCambiaStatoForm(codice) {
        var f = document.cambiaStatoForm;
        var selects = document.getElementById("orderStateList" + codice);
        f.orderState.value = selects.options[selects.selectedIndex].text;
        f.submit();
        return;
      }
    </script>
    
  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../../shared/sotto-header/admin-sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
      <h4>Ordine: <%=adminManagement.getOrder().getId()%></h4>

      <div class="col-xs-12 divider-horizontal"></div>

      <div style="margin-top: 16px;">
        <% if(adminManagement.getOrder() == null) { %>
          <div class="col-sm-12">Non c'e nessun ordine!</div>
        <% } else { %>
          <div class="col-sm-12">
            <% request.setAttribute("order", adminManagement.getOrder()); %>
            <% request.setAttribute("admin", admin); %>
            <jsp:include page="../../../shared/order/order.jsp" />
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
