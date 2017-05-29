<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <title>Inserisci indirizzo e carta di credito</title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="order-address-payment.css" rel="stylesheet" type="text/css" />
    
    <!-- carica i tuoi file js qui -->

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
        <div class="my-jumbotron">
            <h4 class="form-title">L'indirizzo di consegna</h4>
            <table>
                <tr>
                    <th> Indirizzo: </th>
                    <td> Via Rosta, 408 </td>
                </tr>
                <tr>
                    <th> Città: </th>
                    <td> Castelnovo Bariano </td>
                </tr>
                <tr>
                    <th> Provincia: </th>
                    <td> Rovigo (RO) </td>
                </tr>
                <tr>
                    <th> CAP: </th>
                    <td> 12345 </td>
                </tr>
            </table>

            <button class="btn btn-default">Scegli indirizzo</button>
            <button class="btn btn-default">Inserisci nuovo indirizzo</button>
        </div>

        <div class="my-jumbotron">
            <h4 class="form-title">La carta di credito</h4>
            <form class="form-horizontal">

                <div class="form-group">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="codice">Codice</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="codice"
                                pattern="([0-9]{16})" placeholder="Inserisci il codice (16 cifre) della carta">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="titolare">Titolare</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="titolare"
                                placeholder="Inserisci il titolare della carta">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="mese-scadenza">Data di scadenza</label>
                            <div class="col-sm-10">
                                <select name="mese-scadenza">
                                    <option value="1">1</option>
                                </select>
                                <select name="anno-scadenza">
                                    <option value="1">1</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-sm-2" for="sicurezza">Codice di sicurezza</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="titolare"
                                pattern="([0-9]{3})" placeholder="Inserisci il codice di sicurezza (3 cifre)">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../shared/footer/footer.jsp" %>
    </div>

  </body>
</html>
