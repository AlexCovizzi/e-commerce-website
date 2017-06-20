<%@ page pageEncoding="UTF-8"%>
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
    adminManagement.visualizzaTabellaCoupon();
  }
  if(action.equals("add")) {
    adminManagement.addCoupon();
  }
  if(action.equals("disable")) {
    adminManagement.disableCoupon();
  }
  
  String message=null;
  message = adminManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Coupon</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="coupons.js"></script>
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
          <th>Sconto</th>
          <th>Valido</th>
          <th>Disabilita</th>
        </tr>
        
        <% for(int j = 0; j < adminManagement.getCoupons().size(); j++) { %>
        <tr>
          <td><%= adminManagement.getCoupons().get(j).getCode() %></td>
          <td><%= adminManagement.getCoupons().get(j).getDiscount() %></td>
          <td>
            <% if(adminManagement.getCoupons().get(j).isValid()) { %>
              Valido
            <% } else { %>
              Usato
            <% } %>
          </td>
          <td>
            <form name="disabilitaCoupon<%= j %>Form" action="coupons.jsp" method="post">
              <input type="hidden" name="action" value="disable">
              <input type="hidden" name="codice" value="<%= adminManagement.getCoupons().get(j).getCode() %>">
            </form>
            
            <button class="btn btn-default" onclick="disabilitaCoupon(<%= j %>)">
              <span class="glyphicon glyphicon-trash"/>
            </button>
          </td>
        </tr>
        <% } %>
      </table>
    
      
      <form name="aggiungiCouponForm" action="../add-coupon/add-coupon.jsp" method="post">
        <input type="hidden" name="action" value="view">
      </form>

      <button class="btn btn-default" onclick="aggiungiCoupon()">Aggiungi un coupon</button>
      
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
