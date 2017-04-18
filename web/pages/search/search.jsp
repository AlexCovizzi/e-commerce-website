<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Risultati ricerca">
  
  <jsp:attribute name="css_imports">
    <link href="../../shared/book-search/book-search.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    
    <div class="container">
      <div class="col-xs-3">
        <h4 style="background:#ddd; padding:6px;">Filtra per</h4>
        <h5 style="outline: #ddd solid 1px; padding:6px;">Genere</h4>
        <a href="#">Opzione 1</a></br>
        <a href="#">Opzione 2</a></br>
        <a href="#">Opzione 3</a></br>
        <a href="#">Opzione 4</a></br>
        <a href="#">Opzione 5</a></br>
        <h5 style="outline: #ddd solid 1px; padding:6px;">Prezzo</h4>
        <a href="#">Opzione 1</a></br>
        <a href="#">Opzione 2</a></br>
        <a href="#">Opzione 3</a></br>
        <h5 style="outline: #ddd solid 1px; padding:6px;">Autore</h4>
        <a href="#">Opzione 1</a></br>
        <a href="#">Opzione 2</a></br>
        <a href="#">Opzione 3</a></br>
        <a href="#">Opzione 4</a></br>
        <a href="#">Opzione 5</a></br>
        <h5 style="outline: #ddd solid 1px; padding:6px;">Editore</h4>
        <a href="#">Opzione 1</a></br>
        <a href="#">Opzione 2</a></br>
        <a href="#">Opzione 3</a></br>
        <a href="#">Opzione 4</a></br>
      </div>
      <div class="col-xs-9">
        <h4 style="background:#ddd; padding: 6px;">Hai trovato</h4>
        <%@include file="../../shared/book-search/book-search.jsp" %>
        <%@include file="../../shared/book-search/book-search.jsp" %>
        <%@include file="../../shared/book-search/book-search.jsp" %>
        <%@include file="../../shared/book-search/book-search.jsp" %>
      </div>
    </div>
    
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>