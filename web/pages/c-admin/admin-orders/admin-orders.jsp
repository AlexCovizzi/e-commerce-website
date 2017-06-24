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
          <th>Coupon usato</th>
        </tr>
        
        <% for(int j = 0; j < adminManagement.getOrders().size(); j++) { %>
        <tr>
          <td><%= adminManagement.getOrders().get(j).getId() %></td>
          <td><%= adminManagement.getOrders().get(j).getUserName() %> <%= adminManagement.getOrders().get(j).getUserSurname() %></td>
          <td><%= adminManagement.getOrders().get(j).getCreated() %></td>
          <td><%= adminManagement.getOrders().get(j).getTotPrice() %></td>
          <td>
            <div class="input-group">
              <select name="orderStateList" class="form-control"
                <% if(adminManagement.getOrders().get(j).getState().equals("Consegnato") || adminManagement.getOrders().get(j).getState().equals("Cancellato")) { %>
                  disabled
                <% } %>>
                <option
                  <% if(adminManagement.getOrders().get(j).getState().equals("In preparazione")) { %>
                    selected="selected"
                  <% } %>
                  >In preparazione</option>
                <option
                  <% if(adminManagement.getOrders().get(j).getState().equals("In spedizione")) { %>
                    selected="selected"
                  <% } %>
                  >In spedizione</option>
                <option
                  <% if(adminManagement.getOrders().get(j).getState().equals("In magazzino")) { %>
                    selected="selected"
                  <% } %>
                  >In magazzino</option>
                <option
                  <% if(adminManagement.getOrders().get(j).getState().equals("In consegna")) { %>
                    selected="selected"
                  <% } %>
                  >In consegna</option>
                <option
                  <% if(adminManagement.getOrders().get(j).getState().equals("Consegnato")) { %>
                    selected="selected"
                  <% } %>
                  >Consegnato</option>
                <option
                  <% if(adminManagement.getOrders().get(j).getState().equals("Cancellato")) { %>
                    selected="selected"
                  <% } %>
                  >Cancellato</option>
              </select>
                  
                  <button class="btn btn-default"
                    onclick="submitCambiaStatoForm(<%= adminManagement.getOrders().get(j).getId() %>)"
                    <% if(adminManagement.getOrders().get(j).getState().equals("Consegnato") || adminManagement.getOrders().get(j).getState().equals("Cancellato")) { %>
                      disabled
                    <% } %>
                  >Cambia stato</button>
            </div>
          </td>
          <td><%= adminManagement.getOrders().get(j).getReceiver() %></td>
          <td>
            <% if(adminManagement.getOrders().get(j).getCouponCode() != null) { %>
              <%= adminManagement.getOrders().get(j).getCouponCode() %>
            <% } else { %>
              Nessun coupon
            <% } %>
          </td>
        </tr>
        <% } %>
      </table>
      
      <form name="cambiaStatoForm" action="coupons.jsp" method="post">
        <input type="hidden" name="action" value="change">
        <input type="hidden" name="orderId">
        <input type="hidden" name="orderState">
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
