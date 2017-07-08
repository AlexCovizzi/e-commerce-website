<%@page import="util.Conversion"%>
<%@page import="blogics.Order"%>
<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Order order = (Order) request.getAttribute("order");
%>

<div class='row order-container'>
  
  <div class="col-sm-8 divider-right">
    <div class="row">
      <div id="order-date" class="col-xs-4">
        <h5 class="subsection-title">Ordine effettuato il</h5>
        <%=order.getCreated()%>
      </div>
      <div id="order-state" class="col-xs-4">
        <h5 class="subsection-title">Stato ordine</h5>
        <%=order.getState()%>
      </div>
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
    </div>
    
    <div class="divider-horizontal"></div>
    
    <% for(int i=0; i<order.size(); i++) { %>
      <div id="order-books" class="col-xs-12">
      
        <div class="img-wrapper col-xs-3 col-sm-2" style="min-width: 60px; max-width: 100px;">
          <a href="../book-page/book-page.jsp?isbn=<%=order.getBook(i).getIsbn()%>">
            <img src="http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg" class="img-thumbnail">
          </a>
        </div>

        <div class="col-xs9 col-sm-10">
          <h4><a class="book-link" href="../book-page/book-page.jsp?isbn=<%=order.getBook(i).getIsbn()%>">
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
          Quantita: <%=order.getQuantity(i)%>
          </br>

          &euro; <%=Conversion.getPriceAsString(order.getBook(i).getPrice())%></br></br>

          <form action="../cart/cart.jsp" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="isbn" value="<%=order.getBook(i).getIsbn()%>">
            <button class="btn btn-default" type="submit">
              Acquista di nuovo
            </button>
          </form>
        </div>
      
      
      </div>
    <% } %>
    
  </div>
  
  <div id="order-address" class="col-sm-4">
    <h5 class="subsection-title">Indirizzo di spedizione</h5>
    <%=order.getReceiver()%></br>
    <%=order.getCity()%>
    <%=order.getAdd1()%>, <%=order.getAdd2()%></br>
    <%=order.getProvince()%></br>
    <%=order.getCountry()%>
    
    <div class="divider-horizontal"></div>
      
    Totale libri: <span class="pull-right">&euro; <%=Conversion.getPriceAsString(order.getTotPrice())%></span></br>
    Costo spedizione: <span class="pull-right">&euro; <%=Conversion.getPriceAsString(order.getShippingCost())%></span></br>
    Sconto coupon: <span class="pull-right">
      <% if(order.getCouponCode() != null) { %>
        -<%=order.getDiscount()%>%
      <% } else { %>
        -
      <% } %>
    </span></br>

    <div class="divider-horizontal"></div>

    <b>Totale <span class="pull-right">&euro; <%=Conversion.getPriceAsString(order.getFullTotal())%></span></b>
  </div>
  
  
</div>
