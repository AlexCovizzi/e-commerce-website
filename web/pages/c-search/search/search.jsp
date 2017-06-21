<%@page import="bflows.SearchManagement"%>
<%@page import="util.Pair"%>
<%@page import="blogics.Book"%>
<%@page import="util.Logger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Search Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<jsp:useBean id="searchManagement" scope="page" class="bflows.SearchManagement" />
<jsp:setProperty name="searchManagement" property="*" />

<%
  String message = null;
  Cookie[] cookies = request.getCookies();
  Logger.debug(String.valueOf(cookies));
  boolean loggedIn = (cookies != null);
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  message = searchManagement.getErrorMessage();
  
  if(action.equals("view")) searchManagement.searchView();
%>

<html>
  <head>
    <title>Cerca</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="search.css" rel="stylesheet" type="text/css" />
    <link href="../../../shared/book-search/book-search.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="search.js"></script>
    <script type="text/javascript" src="../../../shared/book-search/book-search.js"></script>

    <script>
      function submitFilter() {
          document.getElementById("filter-form").submit();
          return;
      }
      function submitOrd(ord) {
          document.getElementsByName("ord")[0].value = ord;
          submitFilter();
          return;
      }
    </script>
  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../../shared/sotto-header/sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
        
      <div class="row">

        <div id="filter-container" class="col-xs-12 col-sm-3 col-md-3 col-lg-2">

          <h4 class="hidden-xs" style="color: gray;">Filtra per</h4>

          <h4 class="visible-xs" style="color: gray;">
            <a href="#" data-toggle="collapse" data-target="#filter-menu">
            Filtra per
            </a>
          </h4>

          <div id="filter-menu" class="filter-menu collapse in">
          <form id="filter-form" type="get" action="search.jsp">
            
            <input type="hidden" name="search" value="<%=searchManagement.getSearch()%>" style="display: none;">
            <input type="hidden" name="ord" value="<%=searchManagement.getOrd()%>" style="display: none;">
            
            <h5><b>Genere</b></h5>
            
            <% for(Pair<String, Integer> genreFilter : searchManagement.getGenreFilters()) { %>
            
              <a class="filter-link">
                <label><input type="checkbox" name="genres" value="<%=genreFilter.getFirst()%>" onclick="submitFilter()" <% if(searchManagement.hasGenre(genreFilter.getFirst())) {%> checked <%}%> > <%=genreFilter.getFirst()%> </label>
                <small>(<%=genreFilter.getSecond()%>)</small>
              </a></br>
            
            <% } %>
            
            <h5><b>Autore</b></h5>
            
            <% for(Pair<String, Integer> authorFilter : searchManagement.getAuthorFilters()) { %>
            
              <a class="filter-link">
                <label><input type="checkbox" name="authors" value="<%=authorFilter.getFirst()%>" onclick="submitFilter()" <% if(searchManagement.hasAuthor(authorFilter.getFirst())) {%> checked <%}%> > <%=authorFilter.getFirst()%> </label>
                <small>(<%=authorFilter.getSecond()%>)</small>
              </a></br>
            
            <% } %>
            
            <h5><b>Editore</b></h5>
            
            <% for(Pair<String, Integer> publisherFilter : searchManagement.getPublisherFilters()) { %>
            
              <a class="filter-link">
                <label><input type="checkbox" name="publishers" value="<%=publisherFilter.getFirst()%>" onclick="submitFilter()" <% if(searchManagement.hasPublisher(publisherFilter.getFirst())) {%> checked <%}%> > <%=publisherFilter.getFirst()%> </label>
                <small>(<%=publisherFilter.getSecond()%>)</small>
              </a></br>
            
            <% } %>
            
            <h5><b>Prezzo</b></h5>
            <% for(int i= 0; i<SearchManagement.PRICE_RANGE_OPTIONS.length; i++) { %>
              <a class="filter-link" href="#">
                <label><input type="checkbox" value="<%=i%>" name="prices" onclick="submitFilter()" <% if(searchManagement.hasPrice(i)) {%> checked <%}%>> <%=SearchManagement.PRICE_RANGE_OPTIONS[i] %> </label>
                <small>(<%=searchManagement.getPriceFilters()[i]%>)</small>
              </a></br>
            <% } %>
            
            <h5><b>Voto</b></h5>
            <% for(int i= 0; i<SearchManagement.VOTE_RANGE_OPTIONS.length; i++) { %>
              <a class="filter-link" href="#">
                <label><input type="checkbox" value="<%=i%>" name="votes" onclick="submitFilter()" <% if(searchManagement.hasVote(i)) {%> checked <%}%>> <%=SearchManagement.VOTE_RANGE_OPTIONS[i]%> </label>
                <small>(<%=searchManagement.getVoteFilters()[i]%>)</small>
              </a></br>
            <% } %>
            
          </form>
          </div>
        </div>

        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10">



          <div class="row">
            
            <div class="col-xs-9">
          <h5>Hai cercato: <b style="color: #46b8da;"><%=searchManagement.getSearch()%></b></h5>
              <!--<h5>Risultati: 1-25 di <b><%=searchManagement.getTotResults()%></b></h5>-->
            </div>
            

            <div class="col-xs-3">
              <button title="Ordina per" class="btn btn-default dropdown-toggle pull-right" type="button" id="sort-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <i class="glyphicon glyphicon-sort"></i>
                <span class="hidden-xs">Ordina</span>
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu pull-right" aria-labelledby="sort-dropdown">
                <% for(int i=0; i<SearchManagement.ORDER_OPTIONS.length; i++) { %>
                  <li><a onclick="submitOrd(<%=i%>)"><%=SearchManagement.ORDER_OPTIONS[i]%></a></li>
                <% } %>
              </ul>
            </div>
          </div>

          <div class="divider-horizontal"></div>
          
          <% if(searchManagement.getBooks().isEmpty()) { %>
            Nessun risultato trovato
          <% } else {
              for(Book book : searchManagement.getBooks()) { %>
                <% request.setAttribute("book", book); %>
                <jsp:include page="../../../shared/book-search/book-search.jsp" />
          <% } } %>

          <ul class="pagination pagination-centered">
            <li><a href="#"><</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">></a></li>
          </ul>
        </div>

      </div>
      
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>

