<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Informazioni del libro</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="add-book.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/account-sotto-header/account-sotto-header.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
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
      
      <h4 class="form-title">Informazioni del libro</h4>

      <form class="form-horizontal">

        <div class="form-group">
          <label class="control-label col-sm-2" for="copertina">Copertina</label>
          <div class="col-sm-10">
            <input type="file" id="copertina">
            <p class="help-block">Carica la copertina del libro.</p>
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="titolo">Titolo</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="titolo"
              placeholder="Inserisci il titolo del libro">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="autore">Autore</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="autore"
              placeholder="Inserisci l'autore del libro">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="ISBN">Codice ISBN</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="ISBN" 
              pattern="([0-9]{15})" placeholder="Inserisci l'ISBN" maxlength="15" minlength="15">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="pagine">Numero di pagine</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="pagine"
              pattern="([0-9]{1,})" placeholder="Inserisci il numero di pagine">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="editore">Editore</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="editore"
              placeholder="Inserisci l'editore">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="data-pubbl">Data di pubblicazione</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" minlength="10" maxlength="10"
              pattern="([0-9]{2})/([0-9]{2})/([0-9]{4})" id="data-pubbl"
              placeholder="Inserisci la data di pubblicazione (gg/mm/aaaa)">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="lingua">Lingua</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" id="lingua"
              placeholder="Inserisci la lingua">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="prezzo">Prezzo</label>
          <div class="col-sm-10">
            <div class="input-group">
              <div class="input-group-addon">&euro;</div>
              <input type="text" class="form-control" id="prezzo"
                pattern="([0-9]{1,}).([0-9]{2})"
                placeholder="Inserisci il prezzo (es.: 19.99)">
            </div>
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

