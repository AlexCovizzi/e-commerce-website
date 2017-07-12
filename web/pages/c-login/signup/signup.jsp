<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Signup Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<jsp:useBean id="loginManagement" scope="page" class="bflows.LoginManagement" />
<jsp:setProperty name="loginManagement" property="*" />

<%
  String message = null;
  Cookie[] cookies = request.getCookies();
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
  
  String action = request.getParameter("action");
  if (action == null) action="view";
    
  if(action.equals("signup")) {
    loginManagement.signup();
  }
  
  message = loginManagement.getErrorMessage();
  // In caso di errori viene rimostrato il modulo di registrazione
  if(message != null) action = "view";
%>

<html>
  <head>
    <title>Registrazione</title>
    
    <% if(loggedIn && !admin) { %>
      <script language="javascript">
        location.replace("../../c-search/homepage/homepage.jsp");
      </script>
    <% } %>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="signup.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="signup.js"></script>

  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../../shared/sotto-header/sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
      <% if(action.equals("view")) {%>
        
      <h4>
        <% if(loggedIn && Session.isUserAdmin(cookies)) { %>
        Aggiungi amministratore
        <% } else { %>
        Registrati
        <% } %>
      </h4>

      <div class="divider-horizontal"></div>

      <form class="form-horizontal" method='post'
        <% if(loggedIn && Session.isUserAdmin(cookies)) { %>
        action="../../c-admin/admin-users/admin-users.jsp"
        <% } else { %>
        action="signup.jsp"
        <% } %>
        >

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-first-name">Nome</label>
          <div class="col-sm-4">
            <input type="text" name="name" class="form-control" id="signup-first-name" placeholder="Inserisci il nome">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-last-name">Cognome</label>
          <div class="col-sm-4">
            <input type="text" name="surname" class="form-control" id="signup-last-name" placeholder="Inserisci il cognome">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-email">Email</label>
          <div class="col-sm-4">
            <input required type="email" name='email' class="form-control" id="signup-email" placeholder="Inserisci l'email">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-password">Password</label>
          <div class="col-sm-4">
            <input required type="password" name='password' minlength="6" class="form-control" id="signup-password" placeholder="Inserisci la password">
          </div>
        </div>
        
        <!--
        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-confirm-password">Conferma password</label>
          <div class="col-sm-4">
            <input required type="password" minlength="6" class="form-control" id="signup-confirm-password" placeholder="Reinserisci la tua password">
          </div>
        </div>
        -->

        <div class="form-group"> 
          <div class="col-sm-offset-4 col-sm-4">
            <input type="hidden" name="action"
              <% if(loggedIn && Session.isUserAdmin(cookies)) { %>
              value="add"
              <% } else { %>
              value="signup"
              <% } %>
              />
            <button type="submit" class="btn btn-default">
              <% if(loggedIn && Session.isUserAdmin(cookies)) { %>
              Aggiungi amministratore
              <% } else { %>
              Registrati
              <% } %>
            </button>
          </div>
          <% if(loggedIn && Session.isUserAdmin(cookies)) { %>
          <% } else { %>
          <div class="col-sm-offset-4 col-sm-4" style="margin-top: 16px;">
            Sei già registrato? 
            <a href="../login/login.jsp">Accedi ora.</a>
          </div>
          <% } %>
        </div>

      </form>
      
      <%} else if(action.equals("signup")) {%>
      
        Registrazione avvenuta con successo. Verrai reindirizzato alla pagina di <a href="../login/login.jsp">login</a><br />
        <script language="javascript">
          setTimeout(function(){
            window.location.replace("../login/login.jsp");
          }, 2000);
        </script>
      
      <%}%>
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

