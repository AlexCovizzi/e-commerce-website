<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Book book = (Book) request.getAttribute("book");
%>

<div class="book-container row">
  
  <div class="img-wrapper col-xs-3 col-sm-2" style="min-width: 60px; max-width: 130px;">
    <a href="#">
      <img src="../../assets/img/download.jpg" class="img-thumbnail">
    </a>
  </div>
  
  <div class="col-xs-9 col-sm-10" style="padding-left: 4px;">
    
    <div class="col-xs-12 col-sm-8">
      <h4><b><a class="book-link" href="#"><%=book.getTitle()%></a></b></h4>
      <h6><b>Autore: </b>
        <% for(int i=0; i<book.getAuthors().size(); i++) {
          if(i > 0) %>, 
          <a class="book-link" href="../../c-search/search/search.jsp?authors=<%=book.getAuthors().get(i).getName()%>"><%=book.getAuthors().get(i).getName()%></a>
        <% } %>
      </h6>
      <h6><b>Editore: </b><a class="book-link" href="#"><%=book.getPublisher()%></a></h6>
      <h6><b>Genere: </b>
        <% for(int i=0; i<book.getGenres().size(); i++) {
          if(i > 0) %>, 
          <a class="book-link" href="#"><%=book.getGenres().get(i).getName()%></a>
        <% } %>
      </h6>
      <h6><b>ISBN: </b><a class="book-link" href="#"><%=book.getIsbn()%></a></h6>
      <div class="custom-divider"></div>
      <h5><b>Voto: </b>92% <small>(1452 voti)</small></h5>
    </div>
    
    <div class="col-xs-12 col-sm-4">

      <div class="col-xs-6 col-sm-12">
        <h4 style="color: #46b8da;"><b>&euro;<%=book.getPrice()%></b></h4>

        <% if(book.getStock() > 0) { %>
          <h6 class="disponibilita-immediata">Disponibilità immediata</h6>
        <% } else { %>
          <h6 class="non-disponibile">Non disponibile</h6>
        <% } %>
      </div>

      <div class="col-xs-6 col-sm-12">
        <div class="">
        <button title="Aggiungi al carrello" class="btn btn-default" style="margin-top: 1px; margin-bottom: 1px;">
          <i class="glyphicon glyphicon-shopping-cart" style="font-size: 18px;"></i>
          <span class="hidden-xs hidden-sm hidden-md">Aggiungi al carrello</span>
        </button>
        <button title="Aggiungi alla lista desideri" class="btn btn-default" style="margin-top: 1px; margin-bottom: 1px;">
          <i class="glyphicon glyphicon-heart-empty" style="font-size: 18px;"></i>
          <span class="hidden-xs hidden-sm hidden-md">Aggiungi ai desideri</span>
        </button>
        </div>
      </div>
      
    </div>
  </div>
</div>
