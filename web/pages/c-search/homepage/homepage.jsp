<%@page import="util.Conversion"%>
<%@page import="util.Logger"%>
<%@page import="blogics.Book"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

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
    searchManagement.homepageView();
  }
%>

<html>
  
<head>
  <title>Libreria Online Sant'Ale</title>

  <!-- comprende css e script del framework, header e footer -->
  <%@ include file="../../../shared/head-common.html" %>


  <!-- carica i tuoi file css qui -->
  <link href="homepage.css" rel="stylesheet" type="text/css" />

  <!-- carica i tuoi file js qui -->

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
    <div class="my-jumbotron" id="benvenuto">
        <div class="container">
          <h1>Benvenuto <% if(loggedIn) { %> <%=Session.getUserName(cookies)%> <% } %> !</h1>
            <p>La Libreria Oline Sant'Ale ti offre la scelta su numerosi
                libri, in italiano e in lingua straniera! Inizia subito la
                ricerca o iscriviti subito!</p>
            <p>
                <a class="btn btn-primary btn-lg" href="../search/search.jsp" role="button">
                    Guarda il catalogo &raquo;
                </a>
              <% if(!loggedIn) { %>
                <a class="btn btn-primary btn-lg" href="../../c-login/signup/signup.jsp" role="button">Iscriviti &raquo;</a>
              <% } %>
            </p>
        </div>
    </div>
        
    <!--Ultimi Arrivi-->
    <div class="my-jumbotron sezione">
      <h2>&emsp;Ultime pubblicazioni</h2>

      <div id="ultimiArrivi" class="carousel slide" data-ride="carousel">

        <div class="carousel-inner" role="listbox">
          
          <% for(int i=0; i<searchManagement.getLastPublishedBooks().size(); i+=3) { %>
            <div class="item col-sm-10 col-sm-offset-1 <%if(i==0) { %> active <% } %>">
              <%for(int j=0; j<3; j++) {%>
                <%if(searchManagement.getLastPublishedBooks().size()>i+j) {
                    Book book = searchManagement.getLastPublishedBooks().get(i+j); %>
                      <% request.setAttribute("book", book); %>
                      <jsp:include page="../../../shared/homepage-book/homepage-book.jsp" />
                <% } %>
              <% } %>
            </div>
          <% } %>
          
        </div>

        <a class="left carousel-control" href="#ultimiArrivi" role="button" data-slide="prev" style="background-image: none;">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>

        <a class="right carousel-control" href="#ultimiArrivi" role="button" data-slide="next" style="background-image: none;">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
      </div><!-- /.carousel -->
    </div>
    <!--Ultimi Arrivi - Fine-->

    <!--I più Quotati-->
    <div class="my-jumbotron sezione">
      <h2>&emsp;I pi&ugrave; venduti</h2>

      <div id="iPiuQuotati" class="carousel slide" data-ride="carousel">
        
        <div class="carousel-inner" role="listbox">

          <% for(int i=0; i<searchManagement.getMostSoldBooks().size(); i+=3) { %>
            <div class="item col-sm-10 col-sm-offset-1 <%if(i==0) { %> active <% } %>">
              <%for(int j=0; j<3; j++) {%>
                <%if(searchManagement.getMostSoldBooks().size()>i+j) {
                    Book book = searchManagement.getMostSoldBooks().get(i+j); %>
                      <% request.setAttribute("book", book); %>
                      <jsp:include page="../../../shared/homepage-book/homepage-book.jsp" />
                <% } %>
              <% } %>
            </div>
          <% } %>
        
        </div>

        <a class="left carousel-control" href="#iPiuQuotati" role="button" data-slide="prev" style="background-image: none;">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#iPiuQuotati" role="button" data-slide="next" style="background-image: none;">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
      </div><!-- /.carousel -->
    </div>
    <!--I più Quotati - Fine-->

    <!--Consigliati per Te-->
    <div class="my-jumbotron sezione">
      <h2>&emsp;Consigliati per Te</h2>

      <div id="consigliati" class="carousel slide" data-ride="carousel">

        <div class="carousel-inner" role="listbox">

          <% for(int i=0; i<searchManagement.getSuggestedBooks().size(); i+=3) { %>
            <div class="item col-sm-10 col-sm-offset-1 <%if(i==0) { %> active <% } %>">
              <%for(int j=0; j<3; j++) {%>
                <%if(searchManagement.getSuggestedBooks().size()>i+j) {
                    Book book = searchManagement.getSuggestedBooks().get(i+j); %>
                      <% request.setAttribute("book", book); %>
                      <jsp:include page="../../../shared/homepage-book/homepage-book.jsp" />
                <% } %>
              <% } %>
            </div>
          <% } %>
          
        </div>

        <a class="left carousel-control" href="#consigliati" role="button" data-slide="prev" style="background-image: none;">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>

        <a class="right carousel-control" href="#consigliati" role="button" data-slide="next" style="background-image: none;">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
      </div> <!-- /.carousel -->
    </div>
    <!--Consigliati per Te - Fine-->
        
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
