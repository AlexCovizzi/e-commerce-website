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
    * verify
    * confirm
    */
  int i;
  
  Cookie[] cookies=null;
  cookies=request.getCookies();
  boolean loggedIn = (cookies != null);
  
  purchaseManagement.setUserId(Session.getUserId(cookies));
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view")) {
    purchaseManagement.visualizzaRiepilogo();
  }
  if(action.equals("verify")) {
    purchaseManagement.verificaCoupon();
  }
  if(action.equals("confirm")) {
    purchaseManagement.confermaOrdine();
  }
  
  String message=null;
  message = purchaseManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Riepilogo del tuo ordine</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="order-summary.js"></script>
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
      
      <h3>Riepilogo</h3>
      
      <% if(!purchaseManagement.isOrdineValido()) { %>
      <div class="alert alert-danger" role="alert">
        ATTENZIONE!<br/>
        Controlla le quantità ordinate! Almeno una di queste Supera le notre disponibilità in magazzino!<br/>
        Cambiale in modo corretto e torna ad inserire l'ordine.
      </div>
      <% } %>
      
      <!-- Libri nell'ordine -->
      <h4>I libri che vuoi acquistare</h4>
      <div class="my-jumbotron">
        <button class="btn btn-primary" data-toggle="collapse" data-target="#libri"
                aria-expanded="false" aria-controls="libri">
            <b>LIBRI</b> <i class="glyphicon glyphicon-chevron-down"></i>
        </button>

        <div class="collapse" id="libri">
          <% for(int j = 0; j < purchaseManagement.getLibri().size(); j++) { %>
          <div class="container">
            <div class="img-wrapper col-xs-3 col-sm-2" style="min-width: 60px; max-width: 130px;">
              <img style="min-width: 60px; max-width: 130px;" src="<%= purchaseManagement.getLibri().getBook(j).getCover() %>">
            </div>

            <div class="col-xs-9 col-sm-10" style="padding-left: 4px;">

              <div class="col-xs-12 col-sm-8">
                <h4><b> <%= purchaseManagement.getLibri().getBook(j).getTitle() %> </b></h4>
                <h6><b>Editore: </b>
                  <%= purchaseManagement.getLibri().getBook(j).getPublisher() %>
                </h6>
                <h6><b>ISBN: </b><%= purchaseManagement.getLibri().getBook(j).getIsbn() %></h6>
                <h6><b>Prezzo: </b><%= purchaseManagement.getLibri().getBook(j).getPrice() %></h6>
                <h6><b>Quantità: </b><%= purchaseManagement.getLibri().getQuantity(j) %></h6>
              </div>
            </div>
          </div>
          <% } %>
        </div>
          <big><h4><b>Prezzo Totale</b>: <%= purchaseManagement.getPrezzoTotale() %> &euro;</h4></big>
        <% if(purchaseManagement.getCodiceCoupon() != null && (action.equals("verify") || action.equals("confirm"))) { %>
          <% if(purchaseManagement.getCoupon().isValid()) { %>
          (applicato uno sconto del <%= purchaseManagement.getCoupon().getDiscount() %>%)
          <% } %>
        <% } %>
        <h4>Costo di spedizione: <%= purchaseManagement.getCostoSpedizione() %> &euro;</h4>
      </div>
      <!-- Libri nell'ordine --- FINE -->
      
      <% if(!action.equals("confirm")
          || action.equals("confirm") && purchaseManagement.getCodiceCoupon() != null && !purchaseManagement.getCoupon().isValid()
          || action.equals("confirm") && !purchaseManagement.isOrdineValido()) { %>
      <!-- Indirizzo -->
      <h4>L'indirizzo di consegna e il destinatario</h4>
      <div class="my-jumbotron">
        <ul>
          <li><b>Indirizzo</b>: <%= purchaseManagement.getIndirizzo() %>, numero <%= purchaseManagement.getNumeroCivico() %></li>
          <li><b>Città</b>: <%= purchaseManagement.getCitta() %></li>
          <li><b>Provincia</b>: <%= purchaseManagement.getProvincia() %></li>
          <li><b>Stato</b>: <%= purchaseManagement.getStato() %></li>
          <li><b>CAP</b>: <%= purchaseManagement.getCap() %></li>
          <li><b>Destinatario</b>: <%= purchaseManagement.getDestinatario() %></li>
        </ul>
        
        <button class="btn btn-default" onclick="submitInformazioniOrdineForm('../order-address/order-address.jsp', 'view')">
          Modifica indirizzo
        </button>
      </div>
      <!-- Indirizzo --- FINE -->
      
      <!-- Pagamento -->
      <h4>Le coordinate del pagamento</h4>
      <div class="my-jumbotron">
        <ul>
          <li>Carta che finisce con **<%= purchaseManagement.getCodiceCarta().charAt(14) %><%= purchaseManagement.getCodiceCarta().charAt(15) %></li>
          <li><b>Titolare</b>: <%= purchaseManagement.getTitolareCarta() %></li>
          <li><b>Scadenza</b>: <%= purchaseManagement.getMeseScadenza() %> <%= purchaseManagement.getAnnoScadenza() %></li>
        </ul>
        
        <button class="btn btn-default" onclick="submitInformazioniOrdineForm('../order-payment/order-payment.jsp', 'view')">
          Modifica coordinate pagamento
        </button>
      </div>
      <!-- Pagamento --- FINE -->
      
      <!-- Coupon e form con tutte le info dell'ordine -->
      <h4>Coupon sconto</h4>
      <div class="my-jumbotron">
        Qui puoi inserire il codice del coupon sconto di cui sei in possesso.<br/>
        Per verificare se il codice è giusto oppure il coupon è ancora valido clicca su "Verifica coupon".<br/>

        <form class="form-horizontal" name="informazioniOrdineForm" method="post">

          <!-- Codice del coupom -->
          <div class="form-group">
            <label class="control-label col-sm-2" for="codiceCoupon">Codice del coupon</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="codiceCoupon" id="codiceCoupon"
                    placeholder="Inserisci il codice del coupon" maxlength="15"
                    <% if(purchaseManagement.getCodiceCoupon() != null) { %>
                    value="<%= purchaseManagement.getCodiceCoupon() %>"
                    <% } %>
                    >
            </div>
          </div>

          <input type="hidden" name="action">
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

          <button class="btn btn-default" onclick="submitInformazioniOrdineForm('order-summary.jsp', 'verify')">
            Verifica coupon
          </button>
          
          <% if(purchaseManagement.getCodiceCoupon() != null && (action.equals("verify") || action.equals("confirm"))) { %>
            <% if(purchaseManagement.getCoupon().isValid()) { %>
            <br/>Il coupon è valido! Puoi procedere all'acquisto!
            <% } else { %>
            <br/>Il coupon non è valido. Prima di procedere all'acquisto dovrai inserire un coupon valido
            o non usare nessun coupon.
            <% } %>
          <% } %>
        </form>
      </div>
      
      <button class="btn btn-default" onclick="submitInformazioniOrdineForm('order-summary.jsp', 'confirm')">
        Conferma ordine
      </button>
      
      <% } else { %>
      Il tuo ordine è stato registrato correttamente. Grazie per aver usufruito della Libreria Online Sant'Ale.<br/>
      Ti auguriamo buon proseguimento!
      <% } %>
    </div>
    
    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>
    
