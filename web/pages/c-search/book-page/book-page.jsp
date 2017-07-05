<%@page import="blogics.Review"%>
<%@page import="blogics.Book"%>
<%@page import="bflows.SearchManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Book Page" %>
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
    searchManagement.bookView();
  } else if(action.equals("review")) {
    searchManagement.bookReview();
  }
%>

<html>
  <head>
    <title>Dettagli libro</title>
    
    <!-- Torna alla pagina di ricerca se non è stato trovato nessun libro -->
    <% if(searchManagement.getBook() == null) { %>
      <script language="javascript">
        location.replace('../search/search.jsp');
      </script>
    <% } %>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="book-page.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="book-page.js"></script>

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
      
      <% if(action.equals("view") && searchManagement.getBook() != null) { %>
      <div class="navbar-default">
          <h5><a href="#">Categoria</a> &raquo; Il Trono di Spade</h5>
      </div>

      <div class="row" id="copertina-info">

          <div class="img-wrapper col-sm-3 " id="div_copertina">
              <div id="copertina-book-page">
                  <img class="copertina" src="../../assets/img/download.jpg"/>
              </div>
          </div>

          <div class="col-sm-4" id="informazioni">
              <h2><%=searchManagement.getBook().getTitle()%></h2>
              
              <h3><%=searchManagement.getBook().getAuthors().get(0).getName()%>
              <% for(int i=1; i<searchManagement.getBook().getAuthors().size(); i++) { %>
                , <%=searchManagement.getBook().getAuthors().get(i).getName()%>
              <% } %>
              </h3>

              <p><b>ISBN:</b> <%=searchManagement.getBook().getIsbn()%></p>
              <p><b>Pagine:</b> <%=searchManagement.getBook().getPages()%></p>
              <p><b>Editore:</b> <%=searchManagement.getBook().getPublisher() %></p>
              <p><b>Data di pubblicazione:</b> <%=searchManagement.getBook().getPublicationDate()%></p>
              <p><b>Lingua:</b> <%=searchManagement.getBook().getLanguage() %></p>
              <p><b><a href="#valutazioni_altri_utenti">Voto</a></b>: <%=searchManagement.getBook().getVotePercent()%>% <small>(<%=searchManagement.getBook().getNVotes()%> voti)</small></p>
          </div>

          <div class="col-sm-4" id="prezzo">
              <h3><b><%=searchManagement.getBook().getPrice()%> &euro;</b></h3>
              Venduto e spedito da Libreria Sant'Ale
              <div style="margin-bottom: 15px;"></div>
              
              <% if(!admin) { %>
                <div id="carrello-desideri">
                    <button title="Aggiungi al Carrello" class="btn btn-primary" type="button">
                        <i class="glyphicon glyphicon-shopping-cart"></i> Aggiungi al Carrello
                    </button>
                    <br/><div style="margin-bottom: 15px;"></div>
                    <button title="Aggiungi ai Desideri" id="desiderato"
                            class="btn btn-primary" type="button" onclick="cambia_colore()" >
                        <i class="glyphicon glyphicon-heart"></i> Aggiungi ai Desideri
                    </button>
                </div>
              <% } else { %>
                <button title="Modifica" class="btn btn-primary" type="button">
                  <i class="glyphicon glyphicon-edit"></i> Modifica
                </button>
                <br/><div style="margin-bottom: 15px;"></div>
                <button title="Rimuovi" class="btn btn-danger" type="button" >
                  <i class="glyphicon glyphicon-remove"></i> Rimuovi
                </button>
              <% } %>
          </div>
      </div>

      <div class="horiz-divider"></div>

      <div class="my-jumbotron sezione-bookpage">
          <button id="btn_descrizione" class="btn btn-primary btn_bookpage" type="button" data-toggle="collapse"
                  data-target="#descrizione" aria-expanded="false" aria-controls="descrizione">
              <b>DESCRIZIONE</b> <i class="glyphicon glyphicon-chevron-down"></i>
          </button>

          <div class="collapse" id="descrizione">
              <%=searchManagement.getBook().getDescription()%>
          </div>
      </div>


      <div id="consigliati_div" class="my-jumbotron sezione-bookpage">
          <button class="btn btn-primary btn_bookpage" type="button" data-toggle="collapse"
                  data-target="#consigliati" aria-expanded="false" aria-controls="consigliati">
              Sant'Ale Ti Consiglia Anche <i class="glyphicon glyphicon-chevron-down"></i>
          </button>

          <div class="container-fluid">
              <div class="row collapse" id="consigliati">
                  <div class="libro_consigliato col-sm-3">
                      <div class="copertina-consigliati">
                          <img class="copertina" src="../../assets/img/IL.png"/>
                      </div>
                      <h2>Titolo</h2>
                      <p>Descrizione veloce</p>
                      <p>10.99 &euro;</p>
                      <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                  </div>
                  <div class="libro_consigliato col-sm-3">
                      <div class="copertina-consigliati">
                          <img class="copertina" src="../../assets/img/ruotadeltempo.jpg"/>
                      </div>
                      <h2>Titolo</h2>
                      <p>Descrizione veloce</p>
                      <p>10.99 &euro;</p>
                      <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                  </div>
                  <div class="libro_consigliato col-sm-3">
                      <div class="copertina-consigliati">
                          <img class="copertina" src="../../assets/img/download.jpg"/>
                      </div>
                      <h2>Titolo</h2>
                      <p>Descrizione veloce</p>
                      <p>10.99 &euro;</p>
                      <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                  </div>
                  <div class="libro_consigliato col-sm-3">
                      <div class="copertina-consigliati">
                          <img class="copertina" src="../../assets/img/ruotadeltempo.jpg"/>
                      </div>
                      <h2>Titolo</h2>
                      <p>Descrizione veloce</p>
                      <p>10.99 &euro;</p>
                      <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                  </div>
              </div>
          </div>
      </div>

      <div class="my-jumbotron" id="valutazione">
          <h3>La tua valutazione</h3>
          
          <form name="valutazione_libro" action='book-page.jsp' method="post">
            <input type='hidden' name='action' value='review' />
            <input type='hidden' name='isbn' value='<%=searchManagement.getIsbn()%>' />
              <table>
                  <tr>
                      <th>
                          <div id="voto" class="btn-group-vertical" data-toggle="buttons">
                              <label title="Lo Consiglio" class="btn btn-primary">
                                  <input type="radio" name="thumbUp" value='true' id="option1" autocomplete="off"
                                         <%if(searchManagement.getUserBookReview() != null) { 
                                           if(searchManagement.getUserBookReview().isThumbUp()) {%> checked <%}}%> >
                                  <i class="glyphicon glyphicon-thumbs-up"></i>
                              </label>
                              <label title="Non lo Consiglio" class="btn btn-primary">
                                  <input type="radio" name="thumbUp" value='false' id="option2" autocomplete="off"
                                         <%if(searchManagement.getUserBookReview() != null) { 
                                           if(!searchManagement.getUserBookReview().isThumbUp()) {%> checked <%}}%> >
                                  <i class="glyphicon glyphicon-thumbs-down"></i>
                              </label>
                          </div>
                      </th>
                      <td>
                          <textarea name='comment' id="recensione" class="form-control"
                                  placeholder="Scrivi la tua recensione... (facoltativo)"
                                  cols="100" rows="5" 
                                  <%if(searchManagement.getUserBookReview() != null) { 
                                    if(searchManagement.getUserBookReview().getComment() != null) {%>
                                    value='<%=searchManagement.getComment()%>'
                                  <%}}%> ></textarea>
                      </td>
                  </tr>
              </table>
            
              <% if(loggedIn) { %>
                <button id="submit_voto" class="btn btn-primary" type="submit">
                    <i class="glyphicon glyphicon-ok"></i> Invia Valutazione
                </button>
              <% } else { %>
                Devi essere registrato per valutare questo libro!
                <a href="../../c-login/login/login.jsp">Accedi</a>
              <% } %>
          </form>
          
          </BR>
      </div>

      <div class="my-jumbotron" id="valutazioni_altri_utenti">
          <h3>Gli altri utenti la pensano così...</h3>
          
          <% if(searchManagement.getBookReviews().size() == 0) { %>
            Non c'è nessuna recensione
          <% } %>
          
          <% for(Review review : searchManagement.getBookReviews()) { %>
            <% request.setAttribute("review", review); %>
            <% request.setAttribute("admin", admin); %>
            <jsp:include page="../../../shared/review/review.jsp" />
          <% } %>
      </div>
      
      <% } else if(action.equals("review")) { %>
        La tua recensione è stata inserita, grazie del contributo! </br>
        <a href='book-page.jsp?isbn=<%=searchManagement.getIsbn()%>'>Ritorna al libro</a>
      <% } %>
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>