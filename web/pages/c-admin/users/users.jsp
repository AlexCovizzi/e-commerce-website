<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<%@ page import="bflows.AdminManagement"%>
<!DOCTYPE html>

<jsp:useBean id="adminManagement" scope="page" class="bflows.AdminManagement" />
<jsp:setProperty name="adminManagement" property="*" />

<% /* 3 azioni:
    * view
    * block
    * unblock
    */
  int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  boolean loggedIn = (cookies != null);
  
  adminManagement.setUserId(Session.getUserId(cookies)); /* Indica l'utente loggato in questo momento */
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view")) {
    adminManagement.visualizzaTabellaUtenti();
  }
  if(action.equals("block")) {
    adminManagement.bloccaUtente();
  }
  if(action.equals("unblock")) {
    adminManagement.sbloccaUtente();
  }
  
  String message=null;
  message = adminManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Tabella degli utenti</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="users.js"></script>
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
      <h4>Lista degli utenti iscritti</h4>
      <table class="table table-striped">
        <tr>
          <th>Nome</th>
          <th>Cognome</th>
          <th>Indirizzo e-mail</th>
          <th>Bloccato</th>
          <th>Blocca/Sblocca Utente</th>
          <th>Numero di ordini</th>
          <th>Numero di recensioni</th>
        </tr>
        
        <% for(int j = 0; j < adminManagement.getUsers().size(); j++) { %>
        <tr>
          <td><%= adminManagement.getUsers().get(j).getName() %></td>
          <td><%= adminManagement.getUsers().get(j).getSurname() %></td>
          <td><%= adminManagement.getUsers().get(j).getEmail() %></td>
          <% if(adminManagement.getUsers().get(j).isBlocked()) { %>
          <td>
            Sì
          </td>
          <td>
            <button class="btn btn-default glyphicon glyphicon-ok" onclick="submitSbloccaUtenteForm(<%= adminManagement.getUsers().get(j).getId() %>)">
            </button>
          </td>
          <% } else { %>
          <td>
            No
          </td>
          <td>
            <button class="btn btn-default glyphicon glyphicon-remove" onclick="submitBloccaUtenteForm(<%= adminManagement.getUsers().get(j).getId() %>)">
            </button>
          </td>
          <% } %>
          
          <td>
            <a href="javascript: submitVediOrdiniUtenteForm(<%= adminManagement.getUsers().get(j).getId() %>)">
              <%= adminManagement.getNumeroOrdini().get(j) %>
            </a>
          </td>
          <td><%= adminManagement.getNumeroRecensioni().get(j) %></td>
        </tr>
        <% } %>
      </table>
      
      <form name="bloccaUtenteForm" action="users.jsp" method="post">
        <input type="hidden" name="action" value="block">
        <input type="hidden" name="listUserId">
      </form>
      
      <form name="sbloccaUtenteForm" action="users.jsp" method="post">
        <input type="hidden" name="action" value="unblock">
        <input type="hidden" name="listUserId">
      </form>
      
      <form name="vediOrdiniUtenteForm" action="../admin-orders/admin-orders.jsp">
        <input type="hidden" name="action" value="view">
        <input type="hidden" name="orderUser">
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
    
    <form name="cambiaPaginaForm" action="users.jsp" method="post">
      <input type="hidden" name="action" value="view">
      <input type="hidden" name="pagina">
      <input type="hidden" name="offset">
      <input type="hidden" name="numeroPagine" value="<%= adminManagement.getNumeroPagine() %>">
    </form>
      
    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>