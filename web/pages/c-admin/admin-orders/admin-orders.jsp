<<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<!DOCTYPE html>

<jsp:useBean id="adminManagement" scope="page" class="bflows.AdminManagement" />
<jsp:setProperty name="adminManagement" property="*" />

<% /* 3 azioni:
    * view
    * add
    * modify
    */
  int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  boolean loggedIn = (cookies != null);
  
  adminManagement.setUserId(Session.getUserId(cookies)); /* Indica l'utente loggato in questo momento */
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view")) {
    adminManagement.visualizzaTabellaOrdini();
  }
  if(action.equals("change")) {
    adminManagement.cambiaStatoOrdine();
  }
  
  String message=null;
  message = adminManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Tabella degli ordini</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="admin-orders.js"></script>
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
      <h4>Lista dei coupon disponibili</h4>
      <table class="table table-striped">
        <tr>
          <th>Codice</th>
          <th>Utente</th>
          <th>Creato</th>
          <th>Costo totale</th>
          <th>Stato</th>
          <th>Nome del destinatario</th>
          <th>Coupon usato (opzionale)</th>
        </tr>
        
        <% for(int j = 0; j < adminManagement.getOrders().size(); j++) { %>
        <tr>
          <td><%= adminManagement.getOrders().get(j).getOrderCode() %></td>
          <td><%= adminManagement.getOrders().get(j).getOrderUser() %></td>
          <td><%= adminManagement.getOrders().get(j).getOrderCreation() %></td>
          <td><%= adminManagement.getOrders().get(j).getOrderCost() %></td>
          <td><%= adminManagement.getOrders().get(j).getOrderState() %></td>
          <td><%= adminManagement.getOrders().get(j).getOrderReceiver() %></td>
        </tr>
        <% } %>
      </table>
      
      <form name="cambiaStatoForm" action="coupons.jsp" method="post">
        <input type="hidden" name="action" value="change">
        <input type="hidden" name="orderCode">
      </form>

      
      <form name="annullaForm" action="../admin-account/admin.jsp" method="post">
        <input type="hidden" name="action" value="view">
      </form>

      <button class="btn btn-link" onclick="annulla()">Torna all'account</button>
    </div>
    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
    
  </body>
</html>
