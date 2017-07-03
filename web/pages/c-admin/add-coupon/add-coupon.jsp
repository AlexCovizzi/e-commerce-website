<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<%@ page import="bflows.AdminManagement"%>
<!DOCTYPE html>

<jsp:useBean id="adminManagement" scope="page" class="bflows.AdminManagement" />
<jsp:setProperty name="adminManagement" property="*" />

<% /* 1 azione:
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
    <title>Aggiungi un nuovo coupon</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="add-coupon.js"></script>
    <script type="text/javascript" src="../shared.js"></script>
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
      
      <h4 class="form-title">Nuovo coupon</h4>

      <form class="form-horizontal" name="couponForm" action="../coupons/coupons.jsp" method="post">

        <!-- Codice -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="codice">Codice</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="codice" id="codice"
                  placeholder="Inserisci il codice del coupon (15 caratteri)"
                  maxlength="15">
          </div>
        </div>
        
        <!-- Sconto -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="sconto">Sconto</label>
          <div class="col-sm-10">
            <div class="input-group">
              <div class="input-group-addon">%</div>
              <input type="text" class="form-control" name="sconto" id="sconto"
                placeholder="Inserisci il valore di sconto (numero intero)">
            </div>
          </div>
        </div>
                
        <div class="form-group"> 
          <div class="col-sm-offset-2 col-sm-10">
            <input type="hidden" name="action" value="add">
            <input type="button" class="btn btn-default" onclick="submitCouponForm()" value="Aggiungi coupon">

            <input type="button" class="btn btn-link" onclick="annulla()" style="margin-left: 16px;" value="Annulla">
          </div>
        </div>
      </form> 
      
      <form name="annullaForm" action="../coupons/coupons.jsp">
        <input type="hidden" name="action" value="view">
      </form>
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>
