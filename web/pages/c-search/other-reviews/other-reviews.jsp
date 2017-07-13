<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Recensioni Titolo del libro</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="other-reviews.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/review/review.css" rel="stylesheet" type="text/css" />
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="other-reviews.js"></script>
    <script type="text/javascript" src="../../shared/review/review.js"></script>
    
  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../shared/sotto-header/sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
        <div class="my-jumbotron">
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
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 2 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 3 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 4 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 5 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 6 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 7 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 8 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 9 -->
        <div class="my-jumbotron recensione">
            <%@ include file="../../shared/review/review.jsp" %>
        </div>
        
        <!-- 10 -->
        <div class="my-jumbotron recensione">
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
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../shared/footer/footer.jsp" %>
    </div>

    <%if (message != null) {%>
      <script>alert("<%=message%>");</script>
    <%}%>
    
  </body>
</html>
