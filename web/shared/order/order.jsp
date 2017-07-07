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
      <div id="order-state" class="col-xs-4">
        </br>
        <button title="Annulla ordine" class="btn btn-danger" style="margin-top: 1px; margin-bottom: 1px;">
          <i class="glyphicon glyphicon-remove"></i>
          <span class="hidden-xs hidden-sm hidden-md">Annulla ordine</span>
        </button>
      </div>
    </div>
    
    <div class="divider-horizontal"></div>
    
    <div id="order-books" class="col-xs-12">
      
      <div class="img-wrapper col-xs-3 col-sm-2" style="min-width: 60px; max-width: 100px;">
        <a href="../book-page/book-page.jsp?isbn=">
          <img src="http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg" class="img-thumbnail">
        </a>
      </div>

      <div class="col-xs9 col-sm-10">
        <a class="book-link" href="../book-page/book-page.jsp?isbn=">Titolo del libro</a>
        <small>x2</small>
        </br>
        di autori</br>
        &euro; 12.89</br>
        
        
      </div>
      
    </div>
    
  </div>
  
  <div id="order-address" class="col-sm-4">
    <h5 class="subsection-title">Indirizzo di spedizione</h5>
    <%=order.getReceiver()%></br>
    <%=order.getCity()%>
    <%=order.getAdd1()%>, <%=order.getAdd2()%></br>
    <%=order.getProvince()%></br>
    <%=order.getCountry()%>
    
    <div class="divider-horizontal"></div>
      
    Totale libri: <span class="pull-right"><%=order.getTotPrice()%> &euro;</span></br>
    Costo spedizione: <span class="pull-right"><%=order.getShippingCost()%> &euro;</span></br>
    <% if(order.getCouponCode() != null) { %>
      Coupon: <span class="pull-right">-<%=order.getDiscount()%>%</span></br>
    <% } %>

    <div class="divider-horizontal"></div>

    <b>Totale <span class="pull-right"><%=order.getFullTotal()%> &euro;</span></b>
  </div>
  
  
</div>
