<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Registrazione</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="signup.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="signup.js"></script>

  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      
    </div>

    <!-- content-area -->
    <div class="container content-area">
        
      <h4>Registrati</h4>

      <div class="divider-horizontal"></div>

      <form class="form-horizontal">

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-first-name">Nome</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" id="signup-first-name" placeholder="Inserisci il tuo nome">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-last-name">Cognome</label>
          <div class="col-sm-4">
            <input type="text" class="form-control" id="signup-last-name" placeholder="Inserisci il tuo cognome">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-email">Email</label>
          <div class="col-sm-4">
            <input type="email" class="form-control" id="signup-email" placeholder="Inserisci la tua email">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-4" for="signup-password">Password</label>
          <div class="col-sm-4">
            <input type="password" minlength="6" class="form-control" id="signup-password" placeholder="Inserisci la tua password">
          </div>
        </div>

        <div class="form-group"> 
          <div class="col-sm-offset-4 col-sm-4">
            <button type="submit" class="btn btn-default">Registrati</button>
          </div>
          <div class="col-sm-offset-4 col-sm-4" style="margin-top: 16px;">
            Sei già registrato? 
            <a href="../login/login.jsp">Accedi ora.</a>
          </div>
        </div>

      </form>
      
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>

