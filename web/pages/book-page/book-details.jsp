<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Dettagli libro</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="book-page.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/header/sotto-header.css" rel="stylesheet" type="text/css"/>
    <link href="../../shared/review/review.css" rel="stylesheet" type="text/css"/>

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="book-page.js"></script>

  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../shared/header/sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
      <div class="navbar-default">
          <h5><a href="#">Categoria</a> &raquo; Il Trono di Spade</h5>
      </div>

      <div class="row" id="copertina-info">

          <div class="my-jumbotron col-sm-3 " id="div_copertina">
              <div id="copertina-book-page">
                  <img class="copertina" src="../../assets/img/download.jpg"/>
              </div>
          </div>

          <div class="col-sm-4" id="informazioni">
              <h2>Il Trono di Spade</h2>
              <h3>Giorgio R.R. Martino</h3>

              <p><i>ISBN:</i> 777777777777777</p>
              <p><i>Pagine:</i> 777</p>
              <p><i>Editore:</i> NonnoLaser Editore</p>
              <p><i>Data di pubblicazione:</i> 01/01/2000</p>
              <p><i>Lingua:</i> Italiano</p>
              <p><b><a href="#valutazioni_altri_utenti">VOTO MEDIO</a></b>: 0%</p>
          </div>

          <div class="col-sm-4" id="prezzo">
              <h3><b>10.99 &euro;</b></h3>
              Venduto e spedito da Libreria Sant'Ale
              <div style="margin-bottom: 15px;"></div>
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
          </div>
      </div>

      <div class="horiz-divider"></div>

      <div class="my-jumbotron sezione-bookpage">
          <button id="btn_descrizione" class="btn btn-primary btn_bookpage" type="button" data-toggle="collapse"
                  data-target="#descrizione" aria-expanded="false" aria-controls="descrizione">
              <b>DESCRIZIONE</b> <i class="glyphicon glyphicon-chevron-down"></i>
          </button>

          <div class="collapse" id="descrizione">
              Eddard Stark, lord di Grande Inverno, viene incaricato dal suo re e
              amico Robert Baratheon di recarsi ad Approdo del Re per ricoprire la
              carica di Primo Cavaliere del Re. La guerra fra i Sette Regni è però
              alle porte, a causa degli intrighi e delle mire al Trono di Spade dei
              membri della nobile Casa Lannister. Jon Snow, figlio illegittimo di
              Eddard Stark, si arruola invece nei Guardiani della notte e si reca
              sulla Barriera, enorme muro di ghiaccio che separa il mondo degli
              uomini dalle ostili terre dell'Eterno Inverno, da cui sta arrivando
              una minaccia terribile. Nel frattempo, Daenerys Targaryen e il suo crudele
              fratello Viserys, ultimi superstiti della nobile Casa Targaryen
              regnante prima della rivolta dei Baratheon, cercano di ricostruire
              l'antico potere nelle selvagge terre al di là del mare.
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
          <!--<form name="valutazione_libro" method="post">-->
              <table>
                  <tr>
                      <th>
                          <div id="voto" class="btn-group-vertical" data-toggle="buttons">
                              <label title="Lo Consiglio" class="btn btn-primary">
                                  <input type="radio" name="options" id="option1" autocomplete="off">
                                  <i class="glyphicon glyphicon-thumbs-up"></i>
                              </label>
                              <label title="Non lo Consiglio" class="btn btn-primary">
                                  <input type="radio" name="options" id="option2" autocomplete="off">
                                  <i class="glyphicon glyphicon-thumbs-down"></i>
                              </label>
                          </div>
                      </th>
                      <td>
                          <textarea id="recensione" class="form-control"
                                  placeholder="Scrivi la tua recensione... (facoltativo)"
                                  cols="100" rows="5"></textarea>
                      </td>
                  </tr>
              </table>

              <button id="submit_voto" class="btn btn-primary" type="button">
                  <i class="glyphicon glyphicon-ok"></i> Invia Valutazione
              </button>
          <!--</form>-->
      </div>

      <div class="my-jumbotron" id="valutazioni_altri_utenti">
          <h3>Gli altri utenti la pensano così...</h3>
          <%@ include file="../../shared/review/review.jsp" %>
          <%@ include file="../../shared/review/review.jsp" %>
          <%@ include file="../../shared/review/review.jsp" %>

          <a href="../other-reviews/other-reviews.jsp">
              <button id="altre_recensioni" class="btn btn-primary" type="button">
                      <i class="glyphicon glyphicon-eye-open"></i> Altre recensioni...
              </button>
          </a>
      </div>
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>