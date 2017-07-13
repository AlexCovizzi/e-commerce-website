<%@page import="global.Constants"%>
<%@page import="util.Conversion"%>
<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Book book = (Book) request.getAttribute("book");
%>

<div class="row">
  
  <!-- immagine libro -->
  <div class="img-wrapper col-xs-3 col-sm-2">
    <a href="../../c-seach/book-page/book-page?isbn=<%=book.getIsbn()%>">
      <img  class="img-thumbnail"
        <%if(book.getCover() != null) { %>
          src="<%=book.getCover()%>" onerror="src='<%=Constants.DEFAULT_COVER%>'"
        <% } else { %>
          src='<%=Constants.DEFAULT_COVER%>'
        <% } %>
      >
    </a>
  </div>
  
  <!-- caratteristiche libro (nome, autore, disponibile) -->
  <div class="col-xs-6">
    <div class="col-xs-12">
      <h4><a class="book-title" href="../../c-seach/book-page/book-page?isbn=<%=book.getIsbn()%>"><%=book.getTitle()%></a></b>
        <small>di 
          <% for(int i=0; i<book.getAuthors().size(); i++) {
            if(i > 0) %>, 
            <%=book.getAuthors().get(i).getName()%>
          <% } %>
        </small>
      </h4>

      <h4 style="margin-bottom: 32px;">&euro; <%=Conversion.getPriceAsString(book.getPrice())%></h4>
      
      <h5
        <% if(book.getStock() > 0) { %>
          style="color: green"> Prodotto disponibile
        <% } else { %>
          style="color: red"> Prodotto non disponibile
        <% } %>
      </h5>
    </div>
    
    <div class="col-xs-12">
      <form id='add-to-cart-form-<%=book.getIsbn()%>' action='../cart/cart.jsp' method="post">
        <input type="hidden" name="action" value="add" >
        <input type="hidden" name="isbn" value="<%=book.getIsbn()%>" >
        <input type="hidden" name="title" value="<%=book.getTitle()%>" >
        <button type="submit" title="Aggiungi al carrello" class="btn btn-default" 
                <% if(book.getStock()<=0) { %> disabled <% } %> >
          <i class="glyphicon glyphicon-shopping-cart"></i>
          Aggiungi al carrello
        </button>
        <!--<a href="javascript:;" onclick="javascript:document.getElementById('add-to-cart-form-<%=book.getIsbn()%>').submit()">Aggiungi al carrello</a>
        -->
      </form>
    </div>
    
    <div class="col-xs-12">
      <form id='remove-from-wishlist-form-<%=book.getIsbn()%>' method="post">
        <input type="hidden" name="action" value="remove" >
        <input type="hidden" name="isbn" value="<%=book.getIsbn()%>" >
        <input type="hidden" name="title" value="<%=book.getTitle()%>" >
        <a href="javascript:;" onclick="javascript:document.getElementById('remove-from-wishlist-form-<%=book.getIsbn()%>').submit()">
          Rimuovi
        </a>
      </form>
    </div>
      
  </div>
  
  <!-- prezzo singolo libro -->
  <div class="col-xs-3 col-sm-2">
    
    
  </div>
  
  <!-- quantita e rimuovi -->
  <div class="col-xs-2 col-sm-2">
    
  </div>
  
</div>
