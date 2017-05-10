<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Metti il tuo titolo qui</title>

    <%@ include file="../../shared/common.html" %>

    <!-- carica i tuoi file css qui -->

    <!-- carica i tuoi file js qui -->

  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../shared/account-sotto-header/account-sotto-header.jsp" %>
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