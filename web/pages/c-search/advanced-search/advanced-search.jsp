<%@page import="blogics.Genre"%>
<%@page import="blogics.Publisher"%>
<%@page import="blogics.Author"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Advanced Search Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="searchManagement" scope="page" class="bflows.SearchManagement" />
<jsp:setProperty name="searchManagement" property="*" />

<%
  String message = null;
  Cookie[] cookies = request.getCookies();
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  
  message = searchManagement.getErrorMessage();
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
if(action.equals("view")) {
  searchManagement.advancedSearchView();
}
  
%>

<html>
  <head>
    <title>Ricerca avanzata</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="signup.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="signup.js"></script>
    <script type="text/javascript" src="advanced-search.js"></script>
    
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
        
      <h3>Ricerca avanzata</h3>

      <div class="divider-horizontal"></div>

      <form class="form-horizontal" method='post' action='../search/search.jsp'>

        <div class="form-group">
          <label class="control-label col-sm-2" for="search-title">Titolo/ISBN</label>
          <div class="col-sm-10">
            <input type="text" name='search' class="form-control" id="search-title" placeholder="Titolo o ISBN del libro">
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-2">Autori</label>
          <div id='authors-div' class="col-sm-10">
            <div>
              <input type="text" name='authors' class="form-control" id="search-authors-1" list='authors-list'>
            </div>
          </div>
          <div class="col-sm-2"></div>
          <div class='col-sm-10' style="padding-top:4px;">
            <button class='btn btn-default' type='button' onclick='addInput("authors", nAuthors)'>
              Aggiungi autore
            </button>
          </div></br>
        </div>
        
        <datalist id="authors-list">
          <% for(Author author : searchManagement.getAllAuthors()) { %>
            <option value="<%=author.getName()%>">
          <% } %>
        </datalist>
        
        <div class="form-group">
          <label class="control-label col-sm-2">Editori</label>
          <div id='publishers-div' class="col-sm-10">
            <div>
              <input type="text" name='publishers' class="form-control" id="search-publishers-1" list='publishers-list'>
            </div>
          </div>
          <div class="col-sm-2"></div>
          <div class='col-sm-10' style="padding-top:4px;">
            <button class='btn btn-default' type='button' onclick='addInput("publishers", nPublishers)'>
              Aggiungi editore
            </button>
          </div></br>
        </div>
        <datalist id="publishers-list">
          <% for(Publisher publisher : searchManagement.getAllPublishers()) { %>
            <option value="<%=publisher.getName()%>">
          <% } %>
        </datalist>
        
        <div class="form-group">
          <label class="control-label col-sm-2">Generi</label>
          <div id='genres-div' class="col-sm-10">
            <div>
              <input type="text" name='genres' class="form-control" id="search-genres-1" list='genres-list'>
            </div>
          </div>
          <div class="col-sm-2"></div>
          <div class='col-sm-10' style="padding-top:4px;">
            <button class='btn btn-default' type='button' onclick='addInput("genres", nGenres)'>
              Aggiungi genere
            </button>
          </div></br>
        </div>
        <datalist id="genres-list">
          <% for(Genre genre : searchManagement.getAllGenres()) { %>
            <option value="<%=genre.getName()%>">
          <% } %>
        </datalist>
        
        <div class="form-group">
          <label class="control-label col-sm-2" for="search-price-min">Prezzo min</label>
          <div class="col-sm-2">
            <div class="input-group">
            <div class="input-group-addon">&euro;</div>
            <input type="number" name='priceMin' class="form-control" id="search-price-min">
            </div>
          </div>
          <label class="control-label col-sm-2" for="search-price-max">Prezzo max</label>
          <div class="col-sm-2">
            <div class="input-group">
            <div class="input-group-addon">&euro;</div>
            <input type="text" name='priceMax' class="form-control" id="search-price-max">
            </div>
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-2" for="search-vote">Voto minimo</label>
          <div class="col-sm-2">
            <input type="number" name='vote' min="0" max="100" class="form-control" id="search-vote">
          </div>
        </div></br>
        
        <div class="form-group">
          <div class="col-sm-2"></div>
          <div class="col-sm-10">
            <button class='btn btn-default' type='submit'>
              Effettua ricerca
            </button>
          </div>
        </div>
        
      </form>
      
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>

    <%if (message != null) {%>
      <script>alert("<%=message%>");</script>
    <%}%>
    
  </body>
</html>
