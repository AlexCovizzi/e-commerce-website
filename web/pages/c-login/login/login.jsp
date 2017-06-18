<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Login Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<jsp:useBean id="loginManagement" scope="page" class="bflows.LoginManagement" />
<jsp:setProperty name="loginManagement" property="*" />

<%
  String message = null;
  Cookie[] cookies = request.getCookies();
  boolean loggedIn = (cookies != null);
  
  String action = request.getParameter("action");
  if (action == null) action="view";
    
  if(action.equals("login")) {
    loginManagement.login();
    if (loginManagement.getCookies() != null) {
      for(Cookie cookie : loginManagement.getCookies())
        response.addCookie(cookie);
      cookies = loginManagement.getCookies();
      loggedIn = true;
    }
  }
  
  if(action.equals("logout")) {
    if (loggedIn) {
      loginManagement.setCookies(cookies);
      loginManagement.logout();
      for(Cookie cookie : loginManagement.getCookies())
        response.addCookie(cookie);
      loggedIn = false;
    }
  }
  
  message = loginManagement.getErrorMessage();
  if(message != null) action = "view";
  
%>

<html>
  <head>
    <title>Login</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="login.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="login.js"></script>

  </head>
    
  <body>
    <!--
    <% if(loggedIn) { %>
      <script language="javascript">
        location.replace("../../c-search/homepage/homepage.jsp");
      </script>
    <% } %>
    -->
    
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

      <h4>Accedi</h4>

      <div class="divider-horizontal"></div>

      <form class="form-horizontal" method='post' action="login.jsp">

        <div class="form-group">
          <label class="control-label col-sm-4" for="login-email">Email</label>
          <div class="col-sm-4">
            <input name='email' required type="email" class="form-control" id="login-email" placeholder="Inserisci la tua email">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="login-password">Password</label>
          <div class="col-sm-4">
            <input name='password' required type="password" class="form-control" id="login-password" placeholder="Inserisci la tua password">
          </div>
        </div>

        <div class="form-group"> 
          <div class="col-sm-offset-4 col-sm-4">
            <input type="hidden" name="action" value="login"/>
            <button type="submit" class="btn btn-default">Accedi</button>
          </div>
          <div class="col-sm-offset-4 col-sm-4" style="margin-top: 16px;">
            Non sei ancora registrato? 
            <a href="../signup/signup.jsp">Registrati ora.</a>
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
