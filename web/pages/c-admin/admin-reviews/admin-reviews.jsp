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
    * remove
    */
  int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  boolean loggedIn = (cookies != null);
  
  adminManagement.setUserId(Session.getUserId(cookies)); /* Indica l'utente loggato in questo momento */
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view")) {
    adminManagement.visualizzaTabellaRecensioni();
  }
  if(action.equals("remove")) {
    adminManagement.rimuoviRecensione();
  }
  
  String message=null;
  message = adminManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Lista delle recensioni</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="admin-reviews.js"></script>
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
      <h4>Lista delle recensioni</h4>
      <small><b>Nota</b>: sono mostrate solo le recensioni con un commento non vuoto.</small>
      <br/>
      <br/>
      <table class="table table-striped">
        <tr>
          <th>Utente</th>
          <th>Titolo</th>
          <th>ISBN</th>
          <th>Voto</th>
          <th>Recensione</th>
          <th>Rimuovi recensione</th>
        </tr>
        
        <% for(int j = 0; j < adminManagement.getRecensioni().size(); j++) { %>
        <tr>
          <td><%= adminManagement.getRecensioni().get(j).getUserName() %> <%= adminManagement.getRecensioni().get(j).getUserSurname() %></td>
          <td><%= adminManagement.getRecensioni().get(j).getBookTitle() %></td>
          <td>
            <a href="../../c-search/book-page/book-page.jsp?isbn=<%= adminManagement.getRecensioni().get(j).getBookIsbn() %>">
              <%= adminManagement.getRecensioni().get(j).getBookIsbn() %>
            </a>
          </td>
          <td>
            <% if(adminManagement.getRecensioni().get(j).isThumbUp()) { %>
            <i class="glyphicon glyphicon-thumbs-up"/>
            <% } else { %>
            <i class="glyphicon glyphicon-thumbs-down"/>
            <% } %>
          </td>
          <td><%= adminManagement.getRecensioni().get(j).getComment() %></td>
          <td>
            <button class="btn btn-danger glyphicon glyphicon-remove" onclick="submitRimuoviRecensioneForm(<%= adminManagement.getRecensioni().get(j).getUserId() %>, '<%= adminManagement.getRecensioni().get(j).getBookIsbn() %>')">
              Rimuovi
            </button>
          </td>
        </tr>
        <% } %>
      </table>
      
      <form name="rimuoviRecensioneForm" action="admin-reviews.jsp" method="post">
        <input type="hidden" name="action" value="remove">
        <input type="hidden" name="userReviewId">
        <input type="hidden" name="isbn">
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
    
    <form name="cambiaPaginaForm" action="admin-reviews.jsp" method="post">
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