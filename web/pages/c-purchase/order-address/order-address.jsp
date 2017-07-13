<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<%@ page import="bflows.PurchaseManagement"%>
<!DOCTYPE html>

<jsp:useBean id="purchaseManagement" scope="page" class="bflows.PurchaseManagement" />
<jsp:setProperty name="purchaseManagement" property="*" />

<% /* 1 azione:
    * view
    */
  int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  boolean loggedIn = (cookies != null);
  
  purchaseManagement.setUserId(Session.getUserId(cookies));
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view")) {
  }
  
  String message=null;
  message = purchaseManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Inserisci l'indirizzo</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="order-address-payment.css" rel="stylesheet" type="text/css">
    
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="order-address.js"></script>
    <script type="text/javascript" src="../../../shared/shared.js"></script>
  </head>
  
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../../shared/sotto-header/account-sotto-header.jsp" %>
    </div>
    
    <!-- content-area -->
    <div class="container content-area">
      
      <h3>Procedi all'acquisto</h3>
      <h4 class="form-title">Inserisci l'indirizzo</h4>
      
      <form class="form-horizontal" name="indirizzoForm"
            <% if(purchaseManagement.getIndirizzo() != null) { %>
              action="../order-summary/order-summary.jsp"
            <% } else { %>
              action="../order-payment/order-payment.jsp"
            <% } %>
            method="post">

        <!-- Indirizzo -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="indirizzo">Indirizzo</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="indirizzo" id="indirizzo"
                placeholder="Inserisci l'indirizzo"
                <% if(purchaseManagement.getIndirizzo() != null) { %>
                value="<%= purchaseManagement.getIndirizzo() %>"
                <% } %>
                >
          </div>
        </div>
        
        <!-- Numero Civico -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="numeroCivico">Numero civico</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="numeroCivico" id="numeroCivico"
                  placeholder="Inserisci il numero civico"
                  <% if(purchaseManagement.getNumeroCivico() != null) { %>
                  value="<%= purchaseManagement.getNumeroCivico() %>"
                  <% } %>
                  >
          </div>
        </div>
        
        <!-- Città -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="citta">Città</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="citta" id="citta"
                  placeholder="Inserisci il nome della città"
                  <% if(purchaseManagement.getCitta() != null) { %>
                  value="<%= purchaseManagement.getCitta() %>"
                  <% } %>
                  >
          </div>
        </div>
        
        <!-- Provincia -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="provincia">Provincia</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="provincia" id="provincia"
                  placeholder="Inserisci il nome della provincia"
                  <% if(purchaseManagement.getProvincia() != null) { %>
                  value="<%= purchaseManagement.getProvincia() %>"
                  <% } %>
                  >
          </div>
        </div>
        
        
        <!-- Stato -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="stato">Stato</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="stato" id="stato"
                  placeholder="Inserisci il nome dello stato"
                  <% if(purchaseManagement.getStato() != null) { %>
                  value="<%= purchaseManagement.getStato() %>"
                  <% } %>
                  >
          </div>
        </div>

        <!-- CAP -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="cap">CAP</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="cap" id="cap"
                  placeholder="Inserisci il CAP" maxlength="5"
                  <% if(purchaseManagement.getCap() != null) { %>
                  value="<%= purchaseManagement.getCap() %>"
                  <% } %>
                  >
          </div>
        </div>
        
        <!-- Destinatario -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="destinatario">Destinatario</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="destinatario" id="destinatario"
                  placeholder="Inserisci il nome del destinatario"
                  <% if(purchaseManagement.getDestinatario() != null) { %>
                  value="<%= purchaseManagement.getDestinatario() %>"
                  <% } else { %>
                  value="<%= Session.getUserName(cookies) %> <%= Session.getUserSurname(cookies) %>"
                  <% } %>
                  >
          </div>
        </div>
                
        <div class="form-group"> 
          <div class="col-sm-offset-2 col-sm-10">
            <input type="hidden" name="action" value="view">
            <input type="button" class="btn btn-default" onclick="submitIndirizzoForm()" value="Procedi">
            <input type="button" class="btn btn-link" onclick="annulla()" style="margin-left: 16px;" value="Annulla">
          </div>
        </div>
                  
        <% if(purchaseManagement.getIndirizzo() != null) { %>    
          <input type="hidden" name="codiceCarta" value="<%= purchaseManagement.getCodiceCarta() %>">
          <input type="hidden" name="titolareCarta" value="<%= purchaseManagement.getTitolareCarta() %>">
          <input type="hidden" name="meseScadenza" value="<%= purchaseManagement.getMeseScadenza() %>">
          <input type="hidden" name="annoScadenza" value="<%= purchaseManagement.getAnnoScadenza() %>">
          <input type="hidden" name="codiceSicurezza" value="<%= purchaseManagement.getCodiceSicurezza() %>">
          <% if(purchaseManagement.getCodiceCoupon() != null) { %>
          <input type="hidden" name="codiceCoupon" value="<%= purchaseManagement.getCodiceCoupon() %>">
          <% } %>
        <% } %>
      </form>
      
      <form name="annullaForm"
        <% if(purchaseManagement.getIndirizzo() != null) { %>
        <% /* Arrivo dalla order-summary e voglio modificare le informazioni */ %>
          action="../order-summary/order-summary.jsp"
        <% } else { %>
        <% /* Arrivo dal carrello e voglio annullare l'acquisto */ %>
          action="../../c-account/cart/cart.jsp"
        <% } %>
        >
        <% if(purchaseManagement.getIndirizzo() != null) { %>
          <input type="hidden" name="action" value="view">
          <input type="hidden" name="indirizzo" value="<%= purchaseManagement.getIndirizzo() %>">
          <input type="hidden" name="numeroCivico" value="<%= purchaseManagement.getNumeroCivico() %>">
          <input type="hidden" name="citta" value="<%= purchaseManagement.getCitta() %>">
          <input type="hidden" name="provincia" value="<%= purchaseManagement.getProvincia() %>">
          <input type="hidden" name="stato" value="<%= purchaseManagement.getStato() %>">
          <input type="hidden" name="cap" value="<%= purchaseManagement.getCap() %>">
          <input type="hidden" name="destinatario" value="<%= purchaseManagement.getDestinatario() %>">
          <input type="hidden" name="codiceCarta" value="<%= purchaseManagement.getCodiceCarta() %>">
          <input type="hidden" name="titolareCarta" value="<%= purchaseManagement.getTitolareCarta() %>">
          <input type="hidden" name="meseScadenza" value="<%= purchaseManagement.getMeseScadenza() %>">
          <input type="hidden" name="annoScadenza" value="<%= purchaseManagement.getAnnoScadenza() %>">
          <input type="hidden" name="codiceSicurezza" value="<%= purchaseManagement.getCodiceSicurezza() %>">
          <% if(purchaseManagement.getCodiceCoupon() != null) { %>
          <input type="hidden" name="codiceCoupon" value="<%= purchaseManagement.getCodiceCoupon() %>">
          <% } %>
        <% } else { %>
          <input type="hidden" name="action" value="view">
        <% } %>
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
    
