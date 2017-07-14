<%@page import="global.Constants"%>
<%@page import="util.Conversion"%>
<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Book book = (Book) request.getAttribute("book");
  boolean admin = (Boolean) request.getAttribute("admin");
%>

<script>
function getCurrentUrl() {
    return window.location.href;
}

function setAction(form) {
  document.getElementById(form).action = getCurrentUrl();
}

</script>

<div class="book-container row">
  
  <div class="img-wrapper col-xs-3 col-sm-2" style="min-width: 60px; max-width: 130px;">
    <a href="../book-page/book-page.jsp?isbn=<%=book.getIsbn()%>">
      <img class="img-thumbnail"
        src="<%=book.getCover()%>"
        onerror="src='<%=Constants.DEFAULT_COVER%>'"
      >
    </a>
  </div>
  
  <div class="col-xs-9 col-sm-10" style="padding-left: 4px;">
    
    <div class="col-xs-12 col-sm-8">
      <h4><b><a class="book-title" href="../book-page/book-page.jsp?isbn=<%=book.getIsbn()%>"><%=book.getTitle()%></a></b></h4>
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
      <h6><b>Lingua: </b><%=book.getLanguage() %></h6>
      <h6><b>ISBN: </b><%=book.getIsbn()%></h6>
      <div class="custom-divider"></div>
      <h5><b>Voto: </b><%=book.getVotePercent()%>% <small>(<%=book.getNVotes()%> voti)</small></h5>
    </div>
    
    <div class="col-xs-12 col-sm-4">

      <div class="col-xs-6 col-sm-12">
        <h4 class="price"><b>&euro;<%=Conversion.getPriceAsString(book.getPrice())%></b></h4>

        <% if(book.getStock() > 0) { %>
          <h6 class="disponibilita-immediata">Disponibile</h6>
        <% } else { %>
          <h6 class="non-disponibile">Non disponibile</h6>
        <% } %>
      </div>

      <% if(!admin) { %>
        <div class="col-xs-6 col-sm-12">
          <form id="add-to-cart-form" action="../../c-account/cart/cart.jsp" method="post" style="margin-bottom: 4px;" >
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="isbn" value="<%=book.getIsbn()%>">
            <input type="hidden" name="title" value="<%=book.getTitle()%>">
            <button type="submit" title="Aggiungi al carrello" class="btn btn-default" style="margin-top: 1px; margin-bottom: 1px;"
                    <% if(book.getStock() < 1) { %>disabled<% } %> >
              <i class="glyphicon glyphicon-shopping-cart" style="font-size: 18px;"></i>
              <span class="hidden-xs hidden-sm hidden-md">Aggiungi al carrello</span>
            </button>
          </form>
          <form id="add-to-wishlist-form" action="../../c-account/wishlist/wishlist.jsp" method="post" style="margin-bottom: 4px;" >
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="isbn" value="<%=book.getIsbn()%>">
            <input type="hidden" name="title" value="<%=book.getTitle()%>">
            <button title="Aggiungi alla lista desideri" class="btn btn-default" style="margin-top: 1px; margin-bottom: 1px;">
              <i class="glyphicon glyphicon-heart" style="font-size: 18px;"></i>
              <span class="hidden-xs hidden-sm hidden-md">Aggiungi ai desideri</span>
            </button>
          </form>
        </div>
      <% } else {%>
        <div class="col-xs-6 col-sm-12">
          <div class="">
          <button title="Modifica" class="btn btn-default" style="margin-top: 1px; margin-bottom: 1px;"
                  onclick="submitAdminLibroForm('<%= book.getIsbn() %>', 'view')">
            <i class="glyphicon glyphicon-edit" style="font-size: 18px;"></i>
            <span class="hidden-xs hidden-sm hidden-md">Modifica</span>
          </button>
          <button title="Aggiungi alla lista desideri" class="btn btn-danger" 
                  style="margin-top: 1px; margin-bottom: 1px;" onclick="submitAdminLibroForm('<%= book.getIsbn() %>', 'remove')">
            <i class="glyphicon glyphicon-remove" style="font-size: 18px;"></i>
            <span class="hidden-xs hidden-sm hidden-md">Rimuovi</span>
          </button>
          </div>
          
          <form name="adminLibroForm<%= book.getIsbn() %>" action="../../c-admin/add-book/add-book.jsp">
            <input type="hidden" name="action">
            <input type="hidden" name="isbn" value="<%= book.getIsbn() %>">
          </form>
        </div>
      <% } %>
      
    </div>
  </div>
</div>
