<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<%@ page import="util.Conversion" %>
<%@ page import="bflows.AdminManagement"%>
<!DOCTYPE html>

<jsp:useBean id="accountManagement" scope="page" class="bflows.AccountManagement" />
<jsp:setProperty name="accountManagement" property="*" />

<% /* 4 azioni:
    * view (2 versioni: con o senza ISBN)
    * add
    * modify
    * remove
    */
  int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  accountManagement.setCookies(cookies);
  boolean loggedIn = (cookies != null);
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view")) {
    accountManagement.visualizzaInformazioniAccount();
  }
  if(action.equals("modify")) {
    accountManagement.modificaInformazioniAccount();
    for(Cookie cookie : accountManagement.getCookies())
        response.addCookie(cookie);
      cookies = accountManagement.getCookies();
  }
  
  String message=null;
  message = accountManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Informazioni sull'account di <%= Session.getUserFullName(cookies) %>
    </title>

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
      <%@ include file="../../../shared/sotto-header/admin-sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
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
          <div class="col-sm-offset-4 col-sm-4">
            <input type="hidden" name="action" value="modify"/>
            <button type="submit" class="btn btn-default">
              Modifica informazioni
            </button>
          </div>
          <div class="col-sm-offset-4 col-sm-4">
            <a class="btn btn-link"
              <% if(Session.isUserAdmin(cookies)) { %>
                href="../../c-admin/admin-account/admin.jsp"
              <% } else { %>
                href="../account/account.jsp"
              <% } %>               
              >
              Torna all'account
            </a>
          </div>
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

