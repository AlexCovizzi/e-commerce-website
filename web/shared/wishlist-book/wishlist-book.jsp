<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Book book = (Book) request.getAttribute("book");
%>

<div class="book-container row">
  
  <!-- immagine libro -->
  <div class="img-wrapper col-xs-3 col-sm-2">
    <a href="#">
      <img src="<%=book.getCover()%>" class="img-thumbnail">
    </a>
  </div>
  
  <!-- caratteristiche libro (nome, autore, disponibile) -->
  <div class="col-xs-4 col-sm-5">
    <h4><b><a href="#"><%=book.getTitle()%></a></b>
      <small>di 
        <% for(int i=0; i<book.getAuthors().size(); i++) {
          if(i > 0) %>, 
          <%=book.getAuthors().get(i).getName()%>
        <% } %>
      </small>
    </h4>
    
    <form id='add-to-cart-form' action='../cart/cart.jsp' method="post">
      <input type="hidden" name="action" value="add" style="display: none;">
      <input type="hidden" name="isbn" value="<%=book.getIsbn()%>" style="display: none;">
      <input type="hidden" name="title" value="<%=book.getTitle()%>" style="display: none;">
      <a href="javascript:;" onclick="javascript:document.getElementById('add-to-cart-form').submit()">Aggiungi al carrello</a>
    </form>
    
    <form id='remove-from-wishlist-form' method="post">
      <input type="hidden" name="action" value="remove" style="display: none;">
      <input type="hidden" name="isbn" value="<%=book.getIsbn()%>" style="display: none;">
      <input type="hidden" name="title" value="<%=book.getTitle()%>" style="display: none;">
      <a href="javascript:;" onclick="javascript:document.getElementById('remove-from-wishlist-form').submit()">Rimuovi</a>
    </form>
    
  </div>
  
  <!-- prezzo singolo libro -->
  <div class="col-xs-3 col-sm-2">
    <h4 style="color: #46b8da;"><b>&euro; <%=book.getPrice()%></b></h4>
    
  </div>
  
  <!-- quantita e rimuovi -->
  <div class="col-xs-2 col-sm-2">
    
  </div>
  
</div>
