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
  searchManagement.setCookies(cookies);
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  message = searchManagement.getErrorMessage();
  
  if(action.equals("view")) {
    searchManagement.searchView();
  }
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
        // Ogni volta che metto un filtro ritorno alla prima pagina
        document.getElementsByName("page")[0].value = 1;
        
        document.getElementById("filter-form").submit();
        return;
      }
      function submitOrd(ord) {
          document.getElementsByName("ord")[0].value = ord;
          submitFilter();
          return;
      }
      function submitPriceFilter(min, max) {
        if(min > -1) {
          document.getElementsByName("priceMin")[0].value = min;
        } else {
          document.getElementsByName("priceMin")[0].value = '';
        }
        if(max > -1) {
          document.getElementsByName("priceMax")[0].value = max;
        } else {
          document.getElementsByName("priceMax")[0].value = '';
        }
        submitFilter();
        return;
      }
      function submitPage(n) {
        if(n <= 0) n = 1;
        document.getElementsByName("page")[0].value = n;
        document.getElementById("filter-form").submit();
        return;
      }
      function submitActionWithIsbn(action, isbn) {
        document.getElementsByName("action")[0].value = action;
        document.getElementsByName("isbn")[0].value = isbn;
        document.getElementById("filter-form").submit();
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
            <input type="hidden" name="page" value="<%=searchManagement.getPage()%>" style="display: none;">
            
            <h5><b>Genere</b></h5>
            
            <% for(Pair<String, Integer> genreFilter : searchManagement.getGenreFilters()) { %>
            
              <a class="filter-link">
                <label><input type="checkbox" name="genres" value="<%=genreFilter.getFirst()%>" onclick="submitFilter()" <% if(searchManagement.hasGenre(genreFilter.getFirst())) {%> checked <%}%> > <%=genreFilter.getFirst()%> </label>
                
              </a>
              &nbsp;<small>(<%=genreFilter.getSecond()%>)</small></br>
            <% } %>
            
            <h5><b>Autore</b></h5>
            
            <% for(Pair<String, Integer> authorFilter : searchManagement.getAuthorFilters()) { %>
            
              <a class="filter-link">
                <label><input type="checkbox" name="authors" value="<%=authorFilter.getFirst()%>" onclick="submitFilter()" <% if(searchManagement.hasAuthor(authorFilter.getFirst())) {%> checked <%}%> > <%=authorFilter.getFirst()%> </label>
                
              </a>
              &nbsp;<small>(<%=authorFilter.getSecond()%>)</small></br>
            <% } %>
            
            <h5><b>Editore</b></h5>
            
            <% for(Pair<String, Integer> publisherFilter : searchManagement.getPublisherFilters()) { %>
            
              <a class="filter-link">
                <label><input type="checkbox" name="publishers" value="<%=publisherFilter.getFirst()%>" onclick="submitFilter()" <% if(searchManagement.hasPublisher(publisherFilter.getFirst())) {%> checked <%}%> > <%=publisherFilter.getFirst()%> </label>
              </a>
              &nbsp;<small>(<%=publisherFilter.getSecond()%>)</small></br>
            <% } %>
            
            <h5><b>Prezzo</b></h5>
            <% for(int i= 0; i<SearchManagement.PRICE_RANGE_OPTIONS.length; i++) { %>
              <a class="filter-link" onclick="submitPriceFilter(<%=SearchManagement.PRICE_RANGE_VALUES[0][i]%>, <%=SearchManagement.PRICE_RANGE_VALUES[1][i]%>)">
                <%=SearchManagement.PRICE_RANGE_OPTIONS[i] %> &euro;
              </a>
              &nbsp;<small>(<%=searchManagement.getPriceFilters()[i]%>)</small></br>
            <% } %>
            </br>
            Min <input min="0" class="form-control" type="number" name="priceMin" <%if(searchManagement.getPriceMin()>-1) {%> value="<%=searchManagement.getPriceMin()%>" <%}%> />
            Max <input min="0" class="form-control" type="number" name="priceMax" <%if(searchManagement.getPriceMax()>-1) {%> value="<%=searchManagement.getPriceMax()%>" <%}%> />
            <button class="btn btn-default" onclick="submitFilter()">Applica</button>
            
          </form>
          </div>
        </div>

        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10">


          <h5>Hai cercato: <b style="color: #46b8da;"><%=searchManagement.getSearch()%></b></h5>

          <div class="row">
            
            <div class="col-xs-9">
              <h5>Risultati: <b><%=searchManagement.getTotResults()%></b></h5>
            </div>
            

            <div class="col-xs-3">
              <button title="Ordina per" class="btn btn-default dropdown-toggle pull-right" type="button" id="sort-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <i class="glyphicon glyphicon-sort"></i>
                <span class="hidden-xs">Ordina</span>
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu pull-right" aria-labelledby="sort-dropdown">
                <% for(int i=0; i<SearchManagement.ORDER_OPTIONS.length; i++) { %>
                  <li <% if(i == searchManagement.getOrd()) { %> style="color: cyan" <% } %> >
                    <a onclick="submitOrd(<%=i%>)"><%=SearchManagement.ORDER_OPTIONS[i]%></a>
                  </li>
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
                <% request.setAttribute("admin", admin); %>
                <jsp:include page="../../../shared/book-search/book-search.jsp" />
          <% } } %>

          <ul class="pagination pagination-centered">
            <% int nPages = (int)Math.ceil(searchManagement.getTotResults()/(double)SearchManagement.RESULTS_PER_PAGE); %>
            <% if (searchManagement.getPage() > 1) {%>
              <li><a onclick="submitPage(<%=searchManagement.getPage()-1%>)"><</a></li>
            <%}%>
            <%for(int i=0; i<nPages; i++) {%>
              <li><a <% if(searchManagement.getPage()==i+1) {%>style=" background-color: #c7ddef;"<%}%> onclick="submitPage(<%=i+1%>)"><%=i+1%></a></li>
            <%}%>
            <%if(searchManagement.getPage() < nPages) {%>
              <li><a onclick="submitPage(<%=searchManagement.getPage()+1%>)">></a></li>
            <%}%>
          </ul>
        </div>

      </div>
      
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
    <% if(action.equals("add-to-cart")) { %>
      <script language="javascript">
        alert("Il libro è stato aggiunto al tuo carrello!");
      </script>
    <% }%>

  </body>
</html>

