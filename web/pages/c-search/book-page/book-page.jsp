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
  } else if(action.equals("edit_review")) {
    searchManagement.bookEditReview();
  } else if(action.equals("remove_review")) {
    searchManagement.bookRemoveReview();
  }
%>

<html>
  <head>
    <title>Dettagli libro</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="book-page.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="book-page.js"></script>

    <script>
      function setReviewAction(a) {
        document.getElementsByName("action")[0].value = a;
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
      
      <% if(action.equals("view")) { %>
        
      <!-- Torna alla pagina di ricerca se non è stato trovato nessun libro con l'isbn specificato -->
      <% if(searchManagement.getBook() == null) { %>
        <script language="javascript">
          location.replace('../search/search.jsp');
        </script>
      <% } else { %>

      <div class="row" id="copertina-info">

        <div class="col-sm-4" id="div_copertina">
          <div id="copertina-book-page">
            <img class="copertina"
              <% if(!searchManagement.getBook().getCover().equals("-")) { %>
              src="<%= searchManagement.getBook().getCover() %>"
              <% } else { %>
              src="http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg"
              <% } %>
            />
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
          
          <p><b>Pagine:</b>
            <% if(searchManagement.getBook().getPages() > 0) { %>
              <%=searchManagement.getBook().getPages()%>
            <% } else { %>
              dato non disponibile
            <% } %>
          </p>
          
          <p><b>Editore:</b> <%=searchManagement.getBook().getPublisher() %></p>
          
          <p><b>Data di pubblicazione:</b>
            <% if(searchManagement.getBook().getPublicationDate() != null) { %>
              <%=searchManagement.getBook().getPublicationDate()%>
            <% } else { %>
              dato non disponibile
            <% } %>
          </p>
          
          <p><b>Lingua:</b> <%=searchManagement.getBook().getLanguage() %></p>
          <p><b><a href="#valutazioni_altri_utenti">Voto</a></b>: <%=searchManagement.getBook().getVotePercent()%>% <small>(<%=searchManagement.getBook().getNVotes()%> voti)</small></p>
        </div>

        <div class="col-sm-4" id="prezzo">
          <h3><b><%=searchManagement.getBook().getPrice()%> &euro;</b></h3>
          Venduto e spedito da Libreria Sant'Ale
          <div style="margin-bottom: 15px;"></div>

          <% if(searchManagement.getBook().getStock() > 0) { %>
            Prodotto disponibile
          <% } else { %>
            Prodotto non disponibile al momento
          <% } %>

          <% if(!admin) { %>
            <div id="carrello-desideri">
              
              <form id="add-to-cart-form" action="../../c-account/cart/cart.jsp" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="isbn" value="<%=searchManagement.getBook().getIsbn()%>">
                <input type="hidden" name="title" value="<%=searchManagement.getBook().getTitle()%>">
                <button type="submit" title="Aggiungi al carrello" class="btn btn-default"
                        <% if(searchManagement.getBook().getStock() < 1) { %>disabled<% } %> >
                  <i class="glyphicon glyphicon-shopping-cart"></i>
                  Aggiungi al carrello
                </button>
              </form>
              
              <form id="add-to-wishlist-form" action="../../c-account/wishlist/wishlist.jsp" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="isbn" value="<%=searchManagement.getBook().getIsbn()%>">
                <input type="hidden" name="title" value="<%=searchManagement.getBook().getTitle()%>">
                <button type="submit" title="Aggiungi ai desideri" class="btn btn-default" >
                  <i class="glyphicon glyphicon-heart"></i>
                  Aggiungi ai desideri
                </button>
              </form>
                
            </div>
          <% } else { %>
          
            <div style="margin-bottom: 15px;"></div>
            <div class='container'>
              <button title="Modifica" class="btn btn-primary" type="button" onclick="submitAdminLibroForm('view')">
                <i class="glyphicon glyphicon-edit"></i> Modifica
              </button>
              <br/><div style="margin-bottom: 15px;"></div>
              <button title="Rimuovi" class="btn btn-danger" type="button" onclick="submitAdminLibroForm('remove')">
                <i class="glyphicon glyphicon-remove"></i> Rimuovi
              </button>
            </div>

            <form name="adminLibroForm" action="../../c-admin/add-book/add-book.jsp">
              <input type="hidden" name="action">
              <input type="hidden" name="isbn" value="<%= searchManagement.getBook().getIsbn() %>">
            </form>

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
            <% if(!searchManagement.getBook().getDescription().equals("-")) { %>
            <%=searchManagement.getBook().getDescription()%>
            <% } else { %>
            Descrizione non disponibile
            <% } %>
              
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

      <!-- è possibile mettere una valutazione solo se non si è admin -->
      <% if(!admin) { %>
      <div class="my-jumbotron" id="valutazione">
          <h3>La tua valutazione</h3>
          
          <form name="valutazione_libro" action='book-page.jsp' method="post">
            <input type='hidden' name='action' value='view'>
            <input type='hidden' name='isbn' value='<%=searchManagement.getIsbn()%>' />
              <table>
                  <tr>
                      <th>
                          <div id="voto" class="btn-group-vertical" data-toggle="buttons">
                              <label title="Lo Consiglio" class="btn btn-primary">
                                  <input type="radio" name="thumbUp" value='true' id="option1">
                                  <i class="glyphicon glyphicon-thumbs-up"></i>
                              </label>
                              <label title="Non lo Consiglio" class="btn btn-primary">
                                  <input type="radio" name="thumbUp" value='false' id="option2">
                                  <i class="glyphicon glyphicon-thumbs-down"></i>
                              </label>
                            
                              <% if(searchManagement.getUserBookReview() != null) { %>
                              <% if(searchManagement.getUserBookReview().isThumbUp()) { %>
                              <script>
                                document.getElementById("option1").click();
                              </script>
                              <% } else {%>
                              <script>
                                document.getElementById("option2").click();
                              </script>
                              <% } %>
                              <% } %>
                          </div>
                      </th>
                      <td>
                          <textarea name='comment' id="recensione" class="form-control"
                                  placeholder="Scrivi la tua recensione... (facoltativo)"
                                  cols="100" rows="5"></textarea>
                        <% if(searchManagement.getUserBookReview() != null) { %>
                          <% if(searchManagement.getUserBookReview().getComment() != null) { %>
                          <script>
                            document.getElementById("recensione").value = '<%=searchManagement.getUserBookReview().getComment()%>';
                          </script>
                          <% } %>
                        <% } %>
                      </td>
                  </tr>
              </table>
            
              <% if(loggedIn) { %>
                <% if(searchManagement.getUserBookReview() == null) { %>
                  <button id="submit_voto" class="btn btn-primary" type="submit"
                          onclick='setReviewAction("review")'>
                      <i class="glyphicon glyphicon-ok"></i>
                      Invia valutazione
                  </button>
                <% } else { %>
                  <button id="submit_voto" class="btn btn-primary" type="submit"
                          onclick='setReviewAction("edit_review")'>
                      <i class="glyphicon glyphicon-ok"></i>
                    Modifica valutazione
                  </button>
                  <button class="btn btn-danger" type="submit"
                          onclick='setReviewAction("remove_review")'>
                      <i class="glyphicon glyphicon-remove"></i>
                    Rimuovi valutazione
                  </button>
                <% } %>
              <% } else { %>
                Devi essere registrato per valutare questo libro!
                <a href="../../c-login/login/login.jsp">Accedi</a>
              <% } %>
          </form>
          
          </BR>
      </div>
          
      <% } %>

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
      <% } %>
      <% } else if(action.equals("review")) { %>
        La tua recensione è stata inserita, grazie del contributo! </br>
        <a href='book-page.jsp?isbn=<%=searchManagement.getIsbn()%>'>Ritorna al libro</a>
      <% } else if(action.equals("edit_review")) { %>
        La tua recensione è stata modificata! </br>
        <a href='book-page.jsp?isbn=<%=searchManagement.getIsbn()%>'>Ritorna al libro</a>
        <% } else if(action.equals("remove_review")) { %>
        La tua recensione è stata cancellata! </br>
        <a href='book-page.jsp?isbn=<%=searchManagement.getIsbn()%>'>Ritorna al libro</a>
        <% } %>
        
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>