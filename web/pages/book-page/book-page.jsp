<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Titolo del Libro">
  
  <jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="book-page.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/header/sotto-header.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
        <!-- metti qui il contenuto della pagina -->
        
        <!--Menù sotto-header-->
        <%@ include file="../../shared/header/sotto-header.jsp" %>
        
        <div class="navbar-default">
            <h5><a href="#">Categoria</a> &raquo; Il Trono di Spade</h5>
        </div>
        
        <div id="copertina-info">
            
            <div class="jumbotron" id="div_copertina">
                <div id="copertina-book-page">
                    <img class="copertina" src="../../assets/img/download.jpg"/>
                </div>
            </div>
            
            <div id="informazioni">
                <h2>Il Trono di Spade</h2>
                <h3>Giorgio R.R. Martino</h3>
                
                <p><i>ISBN:</i> 777777777777777</p>
                <p><i>Pagine:</i> 777</p>
                <p><i>Editore:</i> NonnoLaser Editore</p>
                <p><i>Data di pubblicazione:</i> 01/01/2000</p>
                <p><i>Lingua:</i> Italiano</p>
                <p><b><a href="#valutazioni_altri_utenti">VOTO MEDIO</a></b>: 0%</p>
            </div>
            
            <div class="jumbotron" id="prezzo">
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
            
        <div class="jumbotron sezione-bookpage">
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
            
            
        <div id="consigliati_div" class="jumbotron sezione-bookpage">
            <button class="btn btn-primary btn_bookpage" type="button" data-toggle="collapse"
                    data-target="#consigliati" aria-expanded="false" aria-controls="consigliati">
                Sant'Ale Ti Consiglia Anche <i class="glyphicon glyphicon-chevron-down"></i>
            </button>

            <div class="row collapse" id="consigliati">
                <div class="libro_consigliato col-lg-3">
                    <img class="copertina" src="../../assets/img/IL.png"/>
                    <h2>Titolo</h2>
                    <p>Descrizione veloce</p>
                    <p>10.99 &euro;</p>
                    <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                </div>
                <div class="libro_consigliato col-lg-3">
                    <img class="copertina" src="../../assets/img/ruotadeltempo.jpg"/>
                    <h2>Titolo</h2>
                    <p>Descrizione veloce</p>
                    <p>10.99 &euro;</p>
                    <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                </div>
                <div class="libro_consigliato col-lg-3">
                    <img class="copertina" src="../../assets/img/download.jpg"/>
                    <h2>Titolo</h2>
                    <p>Descrizione veloce</p>
                    <p>10.99 &euro;</p>
                    <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                </div>
                <div class="libro_consigliato col-lg-3">
                    <img class="copertina" src="../../assets/img/ruotadeltempo.jpg"/>
                    <h2>Titolo</h2>
                    <p>Descrizione veloce</p>
                    <p>10.99 &euro;</p>
                    <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                </div>
            </div>
        </div>
        
        <div class="jumbotron" id="valutazione">
            <h3>La tua valutazione</h3>
            <form name="valutazione_libro" method="post">
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
            </form>
        </div>
        
        <div class="jumbotron" id="valutazioni_altri_utenti">
            <h3>Gli altri utenti la pensano così...</h3>
            <table class="recensione_singola">
                <tr>
                    <th><b>NOME COGNOME</b></th>
                    <th><i>VOTO</i>: <i class="glyphicon glyphicon-thumbs-down"></i> Sconsigliato</th>
                </tr>
                <tr>
                    <td colspan="2">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                        Ut odio. Nam sed est. Nam a risus et est iaculis adipiscing. Vestibulum
                        ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                        Curae; Integer ut justo. In tincidunt viverra nisl. Donec dictum malesuada
                        magna. Curabitur id nibh auctor tellus adipiscing pharetra. Fusce vel
                        justo non orci semper feugiat. Cras eu leo at purus ultrices tristique.</td>
                </tr>
            </table>
            <table class="recensione_singola">
                <tr>
                    <th><b>NOME COGNOME</b></th>
                    <th><i>VOTO</i>: <i class="glyphicon glyphicon-thumbs-down"></i> Sconsigliato</th>
                </tr>
                <tr>
                    <td colspan="2">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                        Ut odio. Nam sed est. Nam a risus et est iaculis adipiscing. Vestibulum
                        ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                        Curae; Integer ut justo. In tincidunt viverra nisl. Donec dictum malesuada
                        magna. Curabitur id nibh auctor tellus adipiscing pharetra. Fusce vel
                        justo non orci semper feugiat. Cras eu leo at purus ultrices tristique.</td>
                </tr>
            </table>
            <table class="recensione_singola">
                <tr>
                    <th><b>NOME COGNOME</b></th>
                    <th><i>VOTO</i>: <i class="glyphicon glyphicon-thumbs-down"></i> Sconsigliato</th>
                </tr>
                <tr>
                    <td colspan="2">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                        Ut odio. Nam sed est. Nam a risus et est iaculis adipiscing. Vestibulum
                        ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
                        Curae; Integer ut justo. In tincidunt viverra nisl. Donec dictum malesuada
                        magna. Curabitur id nibh auctor tellus adipiscing pharetra. Fusce vel
                        justo non orci semper feugiat. Cras eu leo at purus ultrices tristique.</td>
                </tr>
            </table>
            <button id="altre_recensioni" class="btn btn-primary" type="button">
                    <i class="glyphicon glyphicon-eye-open"></i> Altre recensioni...
            </button>
        </div>

  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
        <!-- metti qui i js da importare -->
        <script type="text/javascript" src="book-page.js"></script>
  </jsp:attribute>
 
</t:base-layout>
