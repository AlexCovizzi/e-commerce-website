<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Book book = (Book) request.getAttribute("book");
  boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
%>

<div class="book-container row">
  
  <div class="img-wrapper col-xs-3 col-sm-2" style="min-width: 60px; max-width: 130px;">
    <a href="../book-page/book-page.jsp?isbn=<%=book.getIsbn()%>">
      <!--<img src="<%=book.getCover()%>" class="img-thumbnail">-->
    </a>
  </div>
  
  <div class="col-xs-9 col-sm-10" style="padding-left: 4px;">
    
    <div class="col-xs-12 col-sm-8">
      <h4><b><a class="book-link" href="../book-page/book-page.jsp?isbn=<%=book.getIsbn()%>"><%=book.getTitle()%></a></b></h4>
      <h6><b>Autore: </b>
        <% for(int i=0; i<book.getAuthors().size(); i++) {
          if(i > 0) %>, 
          <a class="book-link" href="../../c-search/search/search.jsp?authors=<%=book.getAuthors().get(i).getName()%>"><%=book.getAuthors().get(i).getName()%></a>
        <% } %>
      </h6>
      <h6><b>Editore: </b><a class="book-link" href="../../c-search/search/search.jsp?publishers=<%=book.getPublisher()%>"><%=book.getPublisher()%></a></h6>
      <h6><b>Genere: </b>
        <% for(int i=0; i<book.getGenres().size(); i++) {
          if(i > 0) %>, 
          <a class="book-link" href="../../c-search/search/search.jsp?genres=<%=book.getGenres().get(i).getName()%>"><%=book.getGenres().get(i).getName()%></a>
        <% } %>
      </h6>
      <h6><b>ISBN: </b><%=book.getIsbn()%></h6>
      <div class="custom-divider"></div>
      <h5><b>Voto: </b><%=book.getVotePercent()%>% <small>(<%=book.getNVotes()%> voti)</small></h5>
    </div>
    
    <div class="col-xs-12 col-sm-4">

      <div class="col-xs-6 col-sm-12">
        <h4 style="color: #46b8da;"><b>&euro;<%=book.getPrice()%></b></h4>

        <% if(book.getStock() > 0) { %>
          <h6 class="disponibilita-immediata">Disponibile</h6>
        <% } else { %>
          <h6 class="non-disponibile">Non disponibile</h6>
        <% } %>
      </div>

      <% if(!isAdmin) { %>
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
      <% } %>
      
    </div>
  </div>
</div>
