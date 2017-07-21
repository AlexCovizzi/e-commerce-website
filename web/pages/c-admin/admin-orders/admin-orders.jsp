<%@page import="util.Conversion"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<%@ page import="bflows.AdminManagement"%>
<!DOCTYPE html>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="adminManagement" scope="page" class="bflows.AdminManagement" />
<jsp:setProperty name="adminManagement" property="*" />

<% /* 2 azioni:
    * view
    * change
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
    <script type="text/javascript" src="../../../shared/shared.js"></script>
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
      <h4>Lista degli ordini effettuati</h4>
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
          <td>
            <a href="single-order.jsp?orderId=<%= adminManagement.getOrders().get(j).getId() %>">
              <%= adminManagement.getOrders().get(j).getId() %>
            </a>
          </td>
          <td><%= adminManagement.getOrders().get(j).getUserName() %> <%= adminManagement.getOrders().get(j).getUserSurname() %></td>
          <td><%= Conversion.getDateAsString(adminManagement.getOrders().get(j).getCreated()) %></td>
          <td><%= Conversion.getPriceAsString(adminManagement.getOrders().get(j).getTotPrice() + adminManagement.getOrders().get(j).getShippingCost()) %></td>
          <td>
            <div class="input-group">
              <select id="orderStateList<%= adminManagement.getOrders().get(j).getId() %>" name="orderStateList<%= adminManagement.getOrders().get(j).getId() %>" class="form-control"
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
      
      <form name="cambiaStatoForm" action="admin-orders.jsp" method="post">
        <input type="hidden" name="action" value="change">
        <input type="hidden" name="orderId">
        <input type="hidden" name="orderState">
        <input type="hidden" name="orderUser" value="<%= adminManagement.getOrderUser() %>">
      </form>
      
      <form name="annullaForm" action="../admin-account/admin.jsp" method="post">
        <input type="hidden" name="action" value="view">
      </form>

      <button class="btn btn-link" onclick="annulla()">Torna all'account</button>
      
      <div class="container">
        <ul class="list-inline">
          <% for(int j = 1; j <= adminManagement.getNumeroPagine(); j++) { %>
          <% if(j == 1) { %>
          <li> < </li>
          <% } %>
          <li>
            <% if(j != adminManagement.getPagina()) { %>
              <a href="javascript: submitCambiaPaginaForm(<%= j %>, <%= (j - 1) * AdminManagement.risultatiPerPagina %>)">
                <%= j %>
              </a>
            <% } else { %>
              <%= j %>
            <% } %>
          </li>
          <% if(j == adminManagement.getNumeroPagine()) { %>
          <li> > </li>
          <% } %>
          <% } %>
        </ul>
      </div>
    </div>
    
    <form name="cambiaPaginaForm" action="admin-orders.jsp" method="post">
      <input type="hidden" name="action" value="view">
      <input type="hidden" name="pagina">
      <input type="hidden" name="offset">
      <input type="hidden" name="numeroPagine" value="<%= adminManagement.getNumeroPagine() %>">
    </form>
      
    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
    <%if (message != null) {%>
      <script>alert("<%=message%>");</script>
    <%}%>
    
  </body>
</html>
