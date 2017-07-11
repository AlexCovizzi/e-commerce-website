<%@page import="util.Conversion"%>
<%@page import="services.session.Session"%>
<%@page import="blogics.Author"%>
<%@page import="blogics.Genre"%>
<%@page import="blogics.Book"%>
<%
  Book book = (Book) request.getAttribute("book");
  boolean admin = (Boolean) request.getAttribute("admin");
%>

<div class="col-sm-4">
  <div class="img-wrapper col-sm-8 col-sm-offset-2" style="min-width: 60px; max-width: 150px;">
    <a href="../book-page/book-page.jsp?isbn=<%=book.getIsbn()%>">
      <img 
        <% if(!book.getCover().equals("-")) { %>
        src="<%=book.getCover()%>" onerror="this.src='http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg'"
        <% } else { %>
        src="http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg"
        <% } %>
        class="img-thumbnail">
    </a>
  </div>
  <div class="col-sm-8 col-sm-offset-2">
    <h4>
      <a style="color: black;" class="book-link" href="../book-page/book-page.jsp?isbn=<%=book.getIsbn()%>">
          <%=book.getTitle()%>
      </a>
      </br>
      <small>di 
        <% for(int k=0; k<book.getAuthors().size(); k++) {
        if(k > 0) %>, 
          <%=book.getAuthors().get(k).getName()%>
        <% } %>
      </small>
    </h4>
    <h5><%=book.getVotePercent()%>% (<%=book.getNVotes()%> voti)</h5>
    <h5>&euro; <%=Conversion.getPriceAsString(book.getPrice())%></h5>
  </div>
</div>
