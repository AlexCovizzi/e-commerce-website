<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Metti il tuo titolo qui</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="address.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/account-sotto-header/account-sotto-header.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="address.js"></script>
    <script type="text/javascript" src="../../shared/account-sotto-header/account-sotto-header.js"></script>

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
      
      <h4>Il mio indirizzo</h4>
  
      <div class="divider-horizontal"></div>

      <form class="form-horizontal">

        <div class="form-group">
          <label class="control-label col-sm-2" for="address-dest">Destinatario</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="address-dest" placeholder="Nome  e cognome destinatario (es. Mario Rossi)">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="address-via">Via</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="address-via" placeholder="Via/viale/corso/piazza (es. Rosta)">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="address-numero">Numero civico</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="address-numero" placeholder="Numero civico (es. 408)">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="address-citta">Città</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="address-citta" placeholder="Città (es. Castelnovo)">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="address-provincia">Provincia</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="address-provincia" placeholder="Provincia (es. Rovigo)">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="address-cap">CAP</label>
          <div class="col-sm-8">
            <input class="form-control" type="text" minlength="5" maxlength="5" pattern="([0-9]{5})" id="address-cap" placeholder="CAP (es. 45030)">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="address-cap">Paese</label>
          <div class="col-sm-8">
            <input class="form-control" type="text" id="address-paese" value="Italia" placeholder="Paese (es. Italia)">
          </div>
        </div>

        <div class="form-group"> 
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">Salva modifiche</button>
            <button type="reset" class="btn btn-link" style="margin-left: 16px;">Annulla</button>
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
