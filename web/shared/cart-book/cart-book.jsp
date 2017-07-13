<%@page import="global.Constants"%>
<%@page import="util.Conversion"%>
<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Book book = (Book) request.getAttribute("book");
  int quantity = (int) request.getAttribute("quantity");
%>

<div class="book-container row">
  
  <!-- immagine libro -->
  <div class="img-wrapper col-xs-3 col-sm-2" style="max-width: 100px;">
    <a href="#">
      <img class="img-thumbnail"
        src="<%=book.getCover()%>"
        onerror="src='<%=Constants.DEFAULT_COVER%>'"
      >
    </a>
  </div>
  
  <!-- caratteristiche libro (nome, autore, disponibile) -->
  <div class="col-xs-6 col-sm-7">
    <h4><a class='book-title' href="#"><%=book.getTitle()%></a>
      <small>di 
        <% for(int i=0; i<book.getAuthors().size(); i++) {
          if(i > 0) %>, 
          <%=book.getAuthors().get(i).getName()%>
        <% } %>
      </small>
    </h4>
    <% if(book.getStock() > 0) { %>
      <h5 style="color: green">Prodotto disponibile</h5>
    <% } else { %>
      <h5 style="color: red">Prodotto non disponibile</h5>
    <% } %>
    
    <form id='remove-from-cart-form-<%=book.getIsbn()%>' method="post">
      <input type="hidden" name="action" value="remove" >
      <input type="hidden" name="isbn" value="<%=book.getIsbn()%>" >
      <input type="hidden" name="title" value="<%=book.getTitle()%>" >
      <a href="javascript:;" onclick="javascript:document.getElementById('remove-from-cart-form-<%=book.getIsbn()%>').submit()">Rimuovi</a>
    </form>
    
  </div>
  
  <!-- prezzo singolo libro -->
  <div class="col-xs-3 col-sm-3">
    <h4 class='price'><b>&euro; <%=Conversion.getPriceAsString(book.getPrice())%></b></h4>
    
    <form method="post">
      <input type="hidden" name="action" value="modify">
      <input type="hidden" name="isbn" value="<%=book.getIsbn()%>">
      <input type="hidden" name="title" value="<%=book.getTitle()%>">
      <input name="quantity" value="<%=quantity%>" required class="form-control input-sm" type="number" min="1" max="<%=book.getStock()%>" style="width: 80px;" >
      <button class="btn btn-default btn-sm" type="submit" style="width: 80px;">Aggiorna</button>
    </form>
  </div>
  
  <!-- quantita e rimuovi -->
  <div class="col-xs-2 col-sm-2">
    
  </div>
  
</div>