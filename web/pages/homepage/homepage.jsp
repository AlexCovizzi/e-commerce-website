<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Libreria Online Sant'Ale">
  
  <jsp:attribute name="css_imports">
    <link href=homepage.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    
    <!-- menu sotto header -->
    <div class="container-fluid">
        <div id="scritta_categorie">Categorie</div>
        
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#sotto_header" aria-expanded="false" aria-controls="sotto_header">

            <span class="sr-only">Toggle Navigation</span>
            <i class="glyphicon glyphicon-menu-hamburger"></i>
        </button>

        <div id="sotto_header" class="collapse navbar-collapse">
            <ul style="margin: 0px;" class="nav navbar-nav">
                <li title="Libri Italiani">
                    <a href="#">Libri Italiani</a>
                </li>
                <li title="Libri in Lingua Straniera">
                    <a href="#">Libri in Lingua Straniera</a>
                </li>
                <li title="eBook">
                    <a href="#">eBook</a>
                </li>
                <li title="Fumetti">
                    <a href="#">Fumetti</a>
                </li>
                <li title="Dizionari">
                    <a href="#">Dizionari</a>
                </li>
            </ul>
        </div>
    </div>
    
      <!-- Sezione di benvenuto -->
    <div class="jumbotron" id="benvenuto">
        <div class="container">
            <h1>Benvenuto!</h1>
            <p>La Libreria Oline Sant'Ale ti offre la scelta su numerosi
                libri, in italiano e in lingua straniera! Inizia subito la
                ricerca iscrivendoti o cercando qualche libro!</p>
            <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
        </div>
    </div>
      
      <!--Ultimi Arrivi-->
        <div class="jumbotron sezione">
            <h2>Ultimi Arrivi</h2>
            <div id="ultimiArrivi" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#ultimiArrivi" data-slide-to="0" class="active"></li>
                    <li data-target="#ultimiArrivi" data-slide-to="1"></li>
                    <li data-target="#ultimiArrivi" data-slide-to="2"></li>
                </ol>
                
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img class="first-slide" src="../../assets/img/download.jpg" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img class="second-slide" src="../../assets/img/download.jpg" alt="Second slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img class="third-slide" src="../../assets/img/download.jpg" alt="Third slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <a class="left carousel-control" href="#ultimiArrivi" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                
                <a class="right carousel-control" href="#ultimiArrivi" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div><!-- /.carousel -->
        </div>

        <!--I più Quotati-->
        <div class="jumbotron sezione">
            <h2>I pi&ugrave; Quotati</h2>
            <div id="iPiuQuotati" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#iPiuQuotati" data-slide-to="0" class="active"></li>
                    <li data-target="#iPiuQuotati" data-slide-to="1"></li>
                    <li data-target="#iPiuQuotati" data-slide-to="2"></li>
                </ol>
                
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img class="first-slide" src="../../assets/img/download.jpg" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img class="second-slide" src="../../assets/img/download.jpg" alt="Second slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img class="third-slide" src="../../assets/img/download.jpg" alt="Third slide">
                            <div class="container">
                                <div class="carousel-caption">
                                    <h3>Titolo</h3>
                                    <p>Veloce descrizione...</p>
                                    <p>Costo: Numerosi &euro;</p>
                                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                                </div>
                            </div>
                    </div>
                </div>
                
                <a class="left carousel-control" href="#iPiuQuotati" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#iPiuQuotati" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div><!-- /.carousel -->
        </div>

        <!--Consigliati per Te-->
        <div class="jumbotron sezione">
            <h2>Consigliati per Te</h2>
            <div id="consigliati" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#consigliati" data-slide-to="0" class="active"></li>
                    <li data-target="#consigliati" data-slide-to="1"></li>
                    <li data-target="#consigliati" data-slide-to="2"></li>
                    <li data-target="#consigliati" data-slide-to="3"></li>
                </ol>
                
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img class="first-slide" src="../../assets/img/download.jpg" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img class="second-slide" src="../../assets/img/download.jpg" alt="Second slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img class="third-slide" src="../../assets/img/download.jpg" alt="Third slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="item">
                        <img class="fourth-slide" src="../../assets/img/download.jpg" alt="Fourth slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <a class="left carousel-control" href="#consigliati" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                
                <a class="right carousel-control" href="#consigliati" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        
      </div>
      
    </div><!-- /.carousel -->
      </div>
      
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>

