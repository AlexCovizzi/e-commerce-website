<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<%@ page import="util.Conversion" %>
<%@ page import="bflows.AdminManagement"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="accountManagement" scope="page" class="bflows.AccountManagement" />
<jsp:setProperty name="accountManagement" property="*" />

<%
  Cookie[] cookies = request.getCookies();
  accountManagement.setCookies(cookies);
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view")) {
    accountManagement.visualizzaInformazioniAccount();
  } else if(action.equals("modify")) {
    accountManagement.modificaInformazioniAccount();
    for(Cookie cookie : accountManagement.getCookies())
        response.addCookie(cookie);
      cookies = accountManagement.getCookies();
  }
  
  String message = message = accountManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Informazioni sull'account di <%= Session.getUserFullName(cookies) %></title>
    
    <!-- Se l'utente non è loggato o è un admin ritorno alla homepage immantinente -->
    <% if(!loggedIn) { %>
      <script language="javascript">
        location.replace("../../c-search/homepage/homepage.jsp");
      </script>
    <% } %>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="add-book.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="add-book.js"></script>
    <script type="text/javascript" src="../../../shared/shared.js"></script>
  </head>
  
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <% if(admin) { %>
        <%@ include file="../../../shared/sotto-header/admin-sotto-header.jsp" %>
      <% } else { %>
        <%@ include file="../../../shared/sotto-header/account-sotto-header.jsp" %>
      <% } %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
      <% if(action.equals("modify")) { %>
        <h4>Le tue informazioni sono state cambiate!</h4>
      <% } %>
      
      <h3>Modifica informazioni</h3>
      
      <div class="divider-horizontal"></div>
      
      <form class="form-horizontal" method='post' action="account-info.jsp">

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-first-name">Nome</label>
          <div class="col-sm-4">
            <input type="text" name="name" class="form-control" id="signup-first-name"
                   placeholder="Inserisci il nome" value="<%= accountManagement.getName() %>">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-last-name">Cognome</label>
          <div class="col-sm-4">
            <input type="text" name="surname" class="form-control" id="signup-last-name"
                  placeholder="Inserisci il cognome" value="<%= accountManagement.getSurname() %>">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-email">Email</label>
          <div class="col-sm-4">
            <input required type="email" name='email' class="form-control" id="signup-email"
                  placeholder="Inserisci l'email" value="<%= accountManagement.getEmail() %>">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-password">Password</label>
          <div class="col-sm-4">
            <input required type="password" name='password' minlength="6" class="form-control"
                  id="signup-password" placeholder="Inserisci la password"
                  value="<%= accountManagement.getPassword() %>">
          </div>
        </div>

        <div class="form-group"> 
          <div class="col-sm-offset-4 col-sm-2">
            <input type="hidden" name="action" value="modify"/>
            <button type="submit" class="btn btn-default">
              Modifica informazioni
            </button>
          </div>
        </div>

        <div class="col-sm-4">
          <a class="btn btn-link"
            <% if(admin) { %>
              href="../../c-admin/admin-account/admin.jsp"
            <% } else { %>
              href="../account/account.jsp"
            <% } %>               
            >
            Torna all'account
          </a>
        </div>
      </form>
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

