<%@page import="util.Conversion"%>
<%@page import="blogics.Order"%>
<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Order order = (Order) request.getAttribute("order");
  boolean admin = (Boolean) request.getAttribute("admin");
  float subTotal = 0.0f;
%>

<div class='row order-container'>
  
  <div class="col-sm-8 divider-right">
    <div class="row">
      <div id="order-date" class="col-xs-4">
        <h5 class="subsection-title">Ordine effettuato il</h5>
        <%=Conversion.getDateAsString(order.getCreated())%>
      </div>
      <div id="order-state" class="col-xs-4">
        <h5 class="subsection-title">Stato ordine</h5>
        <%=order.getState()%>
      </div>
      
      <% if(admin) { %>
        <form name="cambiaStatoForm" action="single-order.jsp?orderId=<%=order.getId()%>" method="post">
          <input type="hidden" name="action" value="change">
          <input type="hidden" name="orderState">
        </form>
        
        <div class="col-xs-4 input-group">
          <select style="max-width: 150px;" id="orderStateList<%= order.getId() %>" name="orderStateList<%= order.getId() %>" class="form-control"
            <% if(order.getState().equals("Consegnato") || order.getState().equals("Cancellato")) { %>
              disabled
            <% } %>>
            <option
              <% if(order.getState().equals("In preparazione")) { %>
                selected="selected"
              <% } %>
              >In preparazione</option>
            <option
              <% if(order.getState().equals("In spedizione")) { %>
                selected="selected"
              <% } %>
              >In spedizione</option>
            <option
              <% if(order.getState().equals("In magazzino")) { %>
                selected="selected"
              <% } %>
              >In magazzino</option>
            <option
              <% if(order.getState().equals("In consegna")) { %>
                selected="selected"
              <% } %>
              >In consegna</option>
            <option
              <% if(order.getState().equals("Consegnato")) { %>
                selected="selected"
              <% } %>
              >Consegnato</option>
            <option
              <% if(order.getState().equals("Cancellato")) { %>
                selected="selected"
              <% } %>
              >Cancellato</option>
          </select>

              <button class="btn btn-default"
                onclick="submitCambiaStatoForm(<%= order.getId() %>)"
                <% if(order.getState().equals("Consegnato") || order.getState().equals("Cancellato")) { %>
                  disabled
                <% } %>
              >Cambia</button>
        </div>
      
      <% } else { %>
      
        <% if(order.getState().equals("In preparazione")) { %>
          <div id="order-state" class="col-xs-4">
            </br>

            <form method="post">
              <input type="hidden" name="action" value="cancel" style="display: none;">
              <input type="hidden" name="orderId" value="<%=order.getId()%>" style="display: none;">
              <button type="submit" title="Annulla ordine" class="btn btn-danger" style="margin-top: 1px; margin-bottom: 1px;">
                <i class="glyphicon glyphicon-remove"></i>
                <span class="hidden-xs hidden-sm hidden-md">Annulla ordine</span>
              </button>
            </form>
              
          </div>
        <% } %>
      <% } %>
      
    </div>
    
    <div class="col-xs-12 divider-horizontal"></div>
    
    <% for(int i=0; i<order.size(); i++) { %>
      <div id="order-books" class="col-xs-12">
      
        <div class="img-wrapper col-xs-3 col-sm-2" style="min-width: 60px; max-width: 100px;">
          <a href="../book-page/book-page.jsp?isbn=<%=order.getBook(i).getIsbn()%>">
            <% if(order.getBook(i).getCover() == null) { %>
            <img src="http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg" class="img-thumbnail">
            <% } else { %>
            <img src="<%= order.getBook(i).getCover() %>" class="img-thumbnail" onerror="src='http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg'">
            <% } %>
          </a>
        </div>

        <div class="col-xs9 col-sm-10">
          <h4><a class="book-title" href="../book-page/book-page.jsp?isbn=<%=order.getBook(i).getIsbn()%>">
            <%=order.getBook(i).getTitle()%>
            </a>
            <small>
              di 
              <% for(int j=0; j<order.getBook(i).getAuthors().size(); j++) { %>
                <% if(j > 0) { %>, <% } %> 
                <%=order.getBook(i).getAuthors().get(j).getName()%>
              <% } %>
            </small>
          </h4>
            
          <h4> &euro; <%=Conversion.getPriceAsString(order.getBook(i).getPrice())%></h4>
          
          <h5>Quantita: <%=order.getQuantity(i)%></h5>
          
          <% subTotal += order.getBook(i).getPrice()*order.getQuantity(i); %>
          
           
          <% if(!admin) { %>
            <form action="../cart/cart.jsp" method="post">
              <input type="hidden" name="action" value="add">
              <input type="hidden" name="isbn" value="<%=order.getBook(i).getIsbn()%>">
              <input type="hidden" name="title" value="<%=order.getBook(i).getTitle()%>">
              <button class="btn btn-default" type="submit">
                Acquista di nuovo
              </button>
            </form>
          <% } %>
        </div>
      
      
      </div>
    <% } %>
    
  </div>
  
  <div id="order-address" class="col-sm-4">
    <h5 class="subsection-title">Indirizzo di spedizione</h5>
    <%=order.getReceiver()%><br/>
    <%=order.getCity()%>, 
    <%=order.getAdd1()%>, <%=order.getAdd2()%><br/>
    <%=order.getProvince()%><br/>
    <%=order.getCountry()%>
    
    <div class="divider-horizontal"></div>
      
    Totale libri: <span class="pull-right">&euro; <%=Conversion.getPriceAsString(subTotal)%></span></br>
    Sconto coupon: <span class="pull-right">
      <% if(order.getCouponCode() != null) { %>
        -<%= order.getDiscount() %>%
      <% } else { %>
        -
      <% } %>
    </span></br>
    Costo spedizione: <span class="pull-right">&euro; <%=Conversion.getPriceAsString(order.getShippingCost())%></span></br>

    <div class="divider-horizontal"></div>

    <b>Totale <span class="pull-right">&euro; <%=Conversion.getPriceAsString(order.getTotPrice() + order.getShippingCost())%></span></b>
  </div>
  
  
</div>
