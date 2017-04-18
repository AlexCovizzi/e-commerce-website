<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Risultati ricerca">
  
  <jsp:attribute name="css_imports">
    <link href="search.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/book-search/book-search.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    
    <div class="container">
      <div class=" col-xs-2">
        <h4 style="background:#ddd; padding:6px;">Filtra per</h4>
        
        <div class="filter-menu">
          <h5><b>Genere</b></h5>
          <a class="filter-link" href="#"><h6>Opzione 1</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 2</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 3</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 4</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 5</h6></a>

          <h5><b>Prezzo</b></h5>
          <a class="filter-link" href="#"><h6>< 5.00</h6></a>
          <a class="filter-link"  href="#"><h6>5.00 - 7.49</h6></a>
          <a class="filter-link"  href="#"><h6>7.50 - 9.99</h6></a>
          <a class="filter-link"  href="#"><h6>10.00 - 14.99</h6></a>
          <a class="filter-link"  href="#"><h6>15.99 - 29.99</h6></a>
          <a class="filter-link"  href="#"><h6>> 30.00</h6></a>
          
          
          <h5><b>Genere</b></h5>
          <a class="filter-link" href="#"><h6>Opzione 1</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 2</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 3</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 4</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 5</h6></a>

          <h5><b>Voto</b></h5>
          <a class="filter-link" href="#"><h6>> 90%</h6></a>
          <a class="filter-link"  href="#"><h6>75% - 90%</h6></a>
          <a class="filter-link"  href="#"><h6>60% - 75%</h6></a>
          <a class="filter-link"  href="#"><h6>40%- 60%</h6></a>
          <a class="filter-link"  href="#"><h6>< 40%</h6></a>
          
          <h5><b>Editore</b></h5>
          <a class="filter-link" href="#"><h6>Opzione 1</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 2</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 3</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 4</h6></a>
          <a class="filter-link"  href="#"><h6>Opzione 5</h6></a>
        </div>
      </div>
      
      <div class="col-xs-10">
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