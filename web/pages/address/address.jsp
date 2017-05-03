<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Test page">
  
<jsp:attribute name="sotto_header">
  <%@ include file="../../shared/account-sotto-header/account-sotto-header.jsp" %>
</jsp:attribute>
  
<jsp:attribute name="content_area">
  <!-- metti qui il contenuto della pagina -->
  <h4>Il mio indirizzo</h4>
    
  <div class="divider-horizontal"></div>
  
  
  <form class="form-horizontal address-form">
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="address-dest">Destinatario</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="address-dest" value="George RR Martin" placeholder="Nome  e cognome destinatario (es. Mario Rossi)">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="address-via">Via</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="address-via" value="Rosta" placeholder="Via (es. Rosta)">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="address-numero">Numero civico</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="address-numero" value="408" placeholder="Numero civico">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="address-citta">Città</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="address-citta" value="Castelnovo Bariano" placeholder="Città (es. Castelnovo)">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="address-provincia">Provincia</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="address-provincia" value="Rovigo" placeholder="Provincia (es. Rovigo)">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="address-cap">CAP</label>
      <div class="col-sm-8">
        <input class="form-control" type="text" minlength="5" maxlength="5" pattern="([0-9]{5})" id="address-cap" value="45030" placeholder="CAP (es. 45030)">
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
        
</jsp:attribute>
    
<jsp:attribute name="css_imports">
  <!-- metti qui i css da importare -->
  <link href="../../shared/account-sotto-header/account-sotto-header.css" rel="stylesheet" type="text/css" />
  <link href="address.css" rel="stylesheet" type="text/css" />
</jsp:attribute>
  
<jsp:attribute name="js_imports">
  <!-- metti qui i js da importare -->
  <script type="text/javascript" src="../../shared/account-sotto-header/account-sotto-header.js"></script>
  <script type="text/javascript" src="address.js"></script>
</jsp:attribute>
 
</t:base-layout>