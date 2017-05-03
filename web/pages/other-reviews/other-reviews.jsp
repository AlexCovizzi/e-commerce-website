<%-- 
    Document   : other-reviews
    Created on : 3-mag-2017, 10.11.17
    Author     : alemo
--%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Recensioni Titolo del libro">
  
    <jsp:attribute name="css_imports">
        <!-- metti qui i css da importare -->
        <link href="other-reviews.css" rel="stylesheet" type="text/css" />
        <link href="../../shared/header/sotto-header.css" rel="stylesheet" type="text/css"/>
        <link href="../../shared/review/review.css" rel="stylesheet" type="text/css"/>
    </jsp:attribute>

    <jsp:attribute name="content_area">
        <!-- metti qui il contenuto della pagina -->
        
        <!--Menù sotto-header--> <!-- colspan="2"-->
        <%@ include file="../../shared/header/sotto-header.jsp" %>
        
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-4" id="col-copertina">
                    <img src="../../assets/img/download.jpg" id="copertina">
                </div>
                <div class="col-md-8 informazioni" id="titolo">
                    Il Trono di Spade
                </div>
                
                <div class="col-md-8 informazioni">
                    Giorgio Roberto Roberto Martino
                </div>
                <div class="col-md-8 informazioni">
                    Editore Mia Nonna
                </div>
                <div class="col-md-8 informazioni">
                    <b>99.99 &euro;</b>
                </div>
            </div>
            
            <div class="container">
                <div class="bottone">
                    <button title="Aggiungi al Carrello" class="btn btn-primary" type="button">
                        <i class="glyphicon glyphicon-shopping-cart"></i> Aggiungi al Carrello
                    </button>
                </div>
                <div class="bottone">
                    <button title="Aggiungi ai Desideri" id="desiderato"
                        class="btn btn-primary" type="button" onclick="cambia_colore()" >
                        <i class="glyphicon glyphicon-heart"></i> Aggiungi ai Desideri
                    </button>
                </div>
                <div class="bottone">
                    <a href="../book-page/book-page.jsp">
                        <button title="Torna alla Scheda" class="btn btn-primary" type="button">
                            <i class="glyphicon glyphicon-arrow-left"></i> Torna alla Scheda
                        </button>
                    </a>
                </div>
            </div>
        </div>
        
        <!-- 1 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 2 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 3 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 4 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 5 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 6 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 7 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 8 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 9 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 10 -->
        <div class="jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <ul class="pagination pagination-centered">
            <li><a href="#"><</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">></a></li>
        </ul>
        
    </jsp:attribute>

    <jsp:attribute name="js_imports">
        <!-- metti qui i js da importare -->
        <script type="text/javascript" src="../book-page/book-page.js"></script>
    </jsp:attribute>

</t:base-layout>