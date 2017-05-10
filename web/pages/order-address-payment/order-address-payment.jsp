<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Inserisci indirizzo e carta di credito">
  
<jsp:attribute name="sotto_header">
    <!-- metti qui il sotto header della pagina -->
    <%@ include file="../../shared/header/sotto-header.jsp" %>
</jsp:attribute>
  
<jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
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
</jsp:attribute>
    
<jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="order-address-payment.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/header/sotto-header.css" rel="stylesheet" type="text/css" />
</jsp:attribute>
  
<jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
</jsp:attribute>
 
</t:base-layout>
