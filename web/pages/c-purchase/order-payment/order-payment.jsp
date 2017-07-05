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
    <title>Inserisci le coordinate del pagamento</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="order-address-payment.css" rel="stylesheet" type="text/css">
    
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="order-payment.js"></script>
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
      <h4 class="form-title">Inserisci le coordinate del pagamento</h4>
      
      <form class="form-horizontal" name="pagamentoForm" action="../order-summary/order-summary.jsp" method="post">

        <!-- Codice della carta -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="codiceCarta">Codice</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="codiceCarta" id="codiceCarta"
                  placeholder="Inserisci il codice della carta" maxlength="16"
                  <% if(purchaseManagement.getCodiceCarta() != null) { %>
                  value="<%= purchaseManagement.getCodiceCarta() %>"
                  <% } %>
                  >
          </div>
        </div>
        
        <!-- Titolare -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="titolareCarta">Titolare</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="titolareCarta" id="titolareCarta"
                  placeholder="Inserisci il titolare"
                  <% if(purchaseManagement.getTitolareCarta() != null) { %>
                  value="<%= purchaseManagement.getTitolareCarta() %>"
                  <% } else { %>
                  value="<%= Session.getUserName(cookies) %> <%= Session.getUserSurname(cookies) %>"
                  <% } %>
                  >
          </div>
        </div>
        
        <!-- Scadenza -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="scadenza">Data di scadenza</label>
          <div class="col-sm-10">
            <div class="input-group" id="scadenza">
              <select name="meseScadenza">
                <% for(int j = 1; j < 13; j++) { %>
                  <option value="<%= j %>"
                          <% if(purchaseManagement.getMeseScadenza() != null && purchaseManagement.getMeseScadenza().equals("" + j)) { %>
                          selected="selected"
                          <% } %>
                          ><%= j %></option>
                <% } %>
              </select>

              <select name="annoScadenza">
                <% for(int j = 17; j < 28; j++) { %>
                  <option value="<%= j %>"
                          <% if(purchaseManagement.getAnnoScadenza() != null && purchaseManagement.getAnnoScadenza().equals("" + j)) { %>
                          selected="selected"
                          <% } %>
                          ><%= j %></option>
                <% } %>
              </select>
            </div>
          </div>
        </div>

        <!-- Codice di sicurezza -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="codiceSicurezza">Codice di sicurezza</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="codiceSicurezza" id="codiceSicurezza"
                  placeholder="Inserisci il codice di sicurezza" maxlength="3"
                  <% if(purchaseManagement.getCodiceSicurezza() != null) { %>
                  value="<%= purchaseManagement.getCodiceSicurezza() %>"
                  <% } %>
                  >
          </div>
        </div>
                
        <div class="form-group"> 
          <div class="col-sm-offset-2 col-sm-10">
            <input type="hidden" name="action" value="view">
            <input type="button" class="btn btn-default" onclick="submitPagamentoForm()" value="Procedi">
            <% if(purchaseManagement.getCodiceCarta() != null) { %>
            <input type="button" class="btn btn-link" onclick="annulla()" style="margin-left: 16px;" value="Annulla">
            <% } %>
          </div>
        </div>
        
        
        <input type="hidden" name="action" value="view">
        <input type="hidden" name="indirizzo" value="<%= purchaseManagement.getIndirizzo() %>">
        <input type="hidden" name="numeroCivico" value="<%= purchaseManagement.getNumeroCivico() %>">
        <input type="hidden" name="citta" value="<%= purchaseManagement.getCitta() %>">
        <input type="hidden" name="provincia" value="<%= purchaseManagement.getProvincia() %>">
        <input type="hidden" name="stato" value="<%= purchaseManagement.getStato() %>">
        <input type="hidden" name="cap" value="<%= purchaseManagement.getCap() %>">
        <input type="hidden" name="destinatario" value="<%= purchaseManagement.getDestinatario() %>">
        <% if(purchaseManagement.getCodiceCoupon() != null) { %>
        <input type="hidden" name="codiceCoupon" value="<%= purchaseManagement.getCodiceCoupon() %>">
        <% } %>
      </form>
      
      <% if(purchaseManagement.getCodiceCarta() != null) { %>
      <form name="annullaForm" action="../order-summary/order-summary.jsp">
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
      </form>
      <% } %>
      
    </div>
    
    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>
    
