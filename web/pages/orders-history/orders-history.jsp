<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Storico degli ordini</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="orders-history.css" rel="stylesheet" type="text/css" />
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="orders-history.js"></script>

  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../shared/sotto-header/account-sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
        
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>

