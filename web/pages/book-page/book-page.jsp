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
        
        <div class="jumbotron">
            <img id="copertina" src="../../assets/img/download.jpg"/>
            <div id="informazioni">
                <h2>Il Trono di Spade</h2>
                <h3>Giorgio R.R. Martino</h3>
                
                <a class="btn btn-primary btn-lg" href="#" role="button">
                    <i class="glyphicon glyphicon-shopping-cart"></i>
                </a>
                <a class="btn btn-primary btn-lg" href="#" role="button">
                    <i class="glyphicon glyphicon-heart"></i>
                </a>
                
                <p><h3><b>Numerosi &euro;</b></h3></p>
                <p><i>ISBN:</i> 777777777777777</p>
                <p><i>Pagine:</i> 777</p>
                <p><i>Editore:</i> NonnoLaser Editore</p>
                <p><i>Data di pubblicazione:</i> 01/01/2000</p>
                <p><i>Lingua:</i> Italiano</p>
                
                <a class="btn btn-primary btn-lg" href="#" role="button">
                    <i class="glyphicon glyphicon-thumbs-up"></i>
                </a>
                <a class="btn btn-primary btn-lg" href="#" role="button">
                    <i class="glyphicon glyphicon-thumbs-down"></i>
                </a>
                
                <p><i><strong>DESCRIZIONE:</strong></i></p>
                <button class="btn btn-primary" type="button" data-toggle="collapse"
                        data-target="#descrizione" aria-expanded="false" aria-controls="descrizione">
                    <i class="glyphicon glyphicon-chevron-down"></i>
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
            
            <div class="jumbotron">
                <h2>Altri prodotti consigliati</h2>
                
                <button class="btn btn-primary" type="button" data-toggle="collapse"
                        data-target="#consigliati" aria-expanded="false" aria-controls="consigliati">
                    <i class="glyphicon glyphicon-chevron-down"></i>
                </button>
                
                <div class="row collapse" id="consigliati">
                    <div class="col-lg-3 libro_consigliato">
                        <img src="../../assets/img/download.jpg"/>
                        <h2>Titolo</h2>
                        <p>Descrizione veloce</p>
                        <p>10.99 &euro;</p>
                        <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                    </div>
                    <div class="col-lg-3 libro_consigliato">
                        <img src="../../assets/img/download.jpg"/>
                        <h2>Titolo</h2>
                        <p>Descrizione veloce</p>
                        <p>10.99 &euro;</p>
                        <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                    </div>
                    <div class="col-lg-3 libro_consigliato">
                        <img src="../../assets/img/download.jpg"/>
                        <h2>Titolo</h2>
                        <p>Descrizione veloce</p>
                        <p>10.99 &euro;</p>
                        <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                    </div>
                    <div class="col-lg-3 libro_consigliato">
                        <img src="../../assets/img/download.jpg"/>
                        <h2>Titolo</h2>
                        <p>Descrizione veloce</p>
                        <p>10.99 &euro;</p>
                        <p><a class="btn btn-primary" href="#" role="button">Dettagli &raquo;</a></p>
                    </div>
                </div>
            </div>
            
        </div>
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>
