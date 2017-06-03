<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="/ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<jsp:useBean id="SearchManagement" scope="page" class="bflows.SearchManagement" />
<jsp:setProperty name="contactManagement" property="*" />

<%int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  
  /* Da finire - Faccio prima l'Admin - Alessio */
%>
<!DOCTYPE html>

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
        <div class="jumbotron" id="benvenuto">
            <div class="container">
                <h1>Benvenuto!</h1>
                <p>La Libreria Oline Sant'Ale ti offre la scelta su numerosi
                    libri, in italiano e in lingua straniera! Inizia subito la
                    ricerca o iscriviti subito!</p>
                <p>
                    <a class="btn btn-primary btn-lg" href="../search/search.jsp" role="button">
                        Guarda il catalogo &raquo;
                    </a>
                    <a class="btn btn-primary btn-lg" href="../signup/signup.jsp" role="button">Iscriviti &raquo;</a>
                </p>
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
                        <img class="first-slide icona_libro collapsing" src="../../assets/img/download.jpg" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img class="second-slide icona_libro" src="../../assets/img/download.jpg" alt="Second slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img class="third-slide icona_libro" src="../../assets/img/download.jpg" alt="Third slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
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
        <!--Ultimi Arrivi - Fine-->

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
                        <img class="first-slide icona_libro" src="../../assets/img/download.jpg" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img class="second-slide icona_libro" src="../../assets/img/download.jpg" alt="Second slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img class="third-slide icona_libro" src="../../assets/img/download.jpg" alt="Third slide">
                            <div class="container">
                                <div class="carousel-caption libro_in_evidenza">
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
        <!--I più Quotati - Fine-->

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
                        <img class="first-slide icona_libro" src="../../assets/img/download.jpg" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img class="second-slide icona_libro" src="../../assets/img/download.jpg" alt="Second slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img class="third-slide icona_libro" src="../../assets/img/download.jpg" alt="Third slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
                                <h3>Titolo</h3>
                                <p>Veloce descrizione...</p>
                                <p>Costo: Numerosi &euro;</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Approfondisci</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img class="fourth-slide icona_libro" src="../../assets/img/download.jpg" alt="Fourth slide">
                        <div class="container">
                            <div class="carousel-caption libro_in_evidenza">
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
            </div> <!-- /.carousel -->
        </div>
        <!--Consigliati per Te - Fine-->
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>
