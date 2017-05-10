<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
    NOTA BENE:
    il tuo file .jsp deve essere inserito in una cartella
    all'interno della cartella "pages".
    In questo modo i file necessari al caricamento della pagina
    verranno inclusi in modo corretto!
-->

<html>
    <head>
        <title>
            Metti il tuo titolo qui
        </title>
        
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap -->
        <link href="../../framework/css/bootstrap.min.css" rel="stylesheet">

        <!-- File css necessari -->
        <link href="../../shared/custom-style.css"  rel="stylesheet" type="text/css" />
        <link href="../../shared/header/header.css"  rel="stylesheet" type="text/css" />
        <link href="../../shared/footer/footer.css"  rel="stylesheet" type="text/css" />

        <!-- framework -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../../framework/js/bootstrap.min.js"></script>

        <!-- File script necessari -->
        <script src="../../shared/header/header.js"></script>
        <script src="../../shared/footer/footer.js"></script>
        
        <!-- carica i tuoi file css qui -->
        <link href="account.css" rel="stylesheet" type="text/css" />
        <link href="../../shared/account-sotto-header/account-sotto-header.css" rel="stylesheet" type="text/css" />
        <!-- fine dei tuoi file css -->
        
        
        <!-- carica i tuoi file js qui -->
        <script type="text/javascript" src="account.js"></script>
        <script type="text/javascript" src="../../shared/account-sotto-header/account-sotto-header.js"></script>
        <!-- fine dei tuoi file js -->
    </head>
    
    <body>
        <div id="grande_scatola">
            <!-- header -->
            <%@ include file="../../shared/header/header.jsp" %>

            <div style="padding-top: 50px;">
                <!-- metti sotto-header qui -->
                <%@ include file="../../shared/account-sotto-header/account-sotto-header.jsp" %>
                <!-- fine sotto-header -->

                <div class="container">
                    <!-- metti contenuto pagina qui -->
                    <h4>Il mio account: <b>Nome utente</b></h4>
    
                    <div class="divider-horizontal"></div>

                    <h4 class="account-page-link"><a  href="../orders/orders.jsp">I miei Ordini</a><br>
                      <small>Spediti: 2 su 4</small>
                    </h4>
                    <h4 class="account-page-link"><a href="#">Il mio Carrello</a></br>
                      <small>Libri: 3, Totale: 45&euro;</small>
                    </h4>
                    <h4 class="account-page-link"><a href="#">La mia Lista Desideri</a></h4>
                    <h4 class="account-page-link"><a href="../address/address.jsp">Il mio Indirizzo</a></br>
                      <small>Indirizzo dell'utente</small>
                    </h4>
                    <h4 class="account-page-link"><a href="#">Cambia Password</a></h4>
                    <h4 class="account-page-link"><a href="../homepage/homepage.jsp">Logout</a></h4>
                    <!-- fine contenuto -->
                </div>
            </div>
            <%@ include file="../../shared/footer/push.jsp" %>
        </div> <!-- grande_scatola -->

        <!-- footer -->
        <%@ include file="../../shared/footer/footer.jsp" %>
    </body>
</html>