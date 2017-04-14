<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Base page</title>

  <!-- Bootstrap -->
  <link href="../../framework/css/bootstrap.min.css" rel="stylesheet">

  <!-- carica tutti i file css qui -->
  <link rel="stylesheet" href="signup.css">
  <link href="../../shared/header/header.css"  rel="stylesheet" type="text/css" />
  <link href="../../shared/footer/footer.css"  rel="stylesheet" type="text/css" />

</head>

<body>
  <div id="grande_scatola">
    <!-- header -->
    <%@ include file="../../shared/header/header.jsp" %>

    <div style="margin-top: 50px;">
      <!-- metti pagina qui -->
      
      
      
    </div>
    <%@ include file="../../shared/footer/push.jsp" %>
  </div> <!-- grande_scatola -->
  
  <!-- footer -->
  <%@ include file="../../shared/footer/footer.jsp" %>

  <!-- framework -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="../../framework/js/bootstrap.min.js"></script>

  <!-- carica tutti gli script qui -->
  <script src="../../shared/header/header.js"></script>
  <script src="../../shared/footer/footer.js"></script>
</body>
</html>
