<!-- Utenti, Admins, Ordini, Coupon, Catalogo, Logout -->
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<%@ page import="bflows.AdminManagement"%>
<!DOCTYPE html>

<jsp:useBean id="adminManagement" scope="page" class="bflows.AdminManagement" />
<jsp:setProperty name="adminManagement" property="*" />

<%/* 1 azione:
    * view
    */
  int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  boolean loggedIn = (cookies != null);
  
  adminManagement.setUserId(Session.getUserId(cookies)); /* Indica l'utente loggato in questo momento */
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  String message=null;
  message = adminManagement.getErrorMessage();
  if(message != null) action = "view";
%>

<html>
  <head>
    <title>Account Amministratore</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->

    <!-- carica i tuoi file js qui -->
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
      <h3>Account Amministratore di <%= Session.getUserName(cookies) %> <%= Session.getUserSurname(cookies) %></h3>
      
      Qui hai accesso alle seguenti opzioni:
      
      <h4><a href="javascript: gestioneUtenti();">Gestione Utenti</a></h4>
      <h4><a href="javascript: gestioneAdmin();">Gestione Amministratori</a></h4>
      <h4><a href="javascript: gestioneOrdini()">Gestione Ordini</a></h4>
      <h4><a href="javascript: gestioneCoupon()">Gestione Coupon</a></h4>
      <h4><a href="javascript: aggiungiLibro()">Aggiungi Libro</a></h4>
      <h4><a href="javascript: logout()">Logout</a></h4>
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