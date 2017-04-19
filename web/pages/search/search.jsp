<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Risultati ricerca">
  
  <jsp:attribute name="css_imports">
    <link href="search.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/book-search/book-search.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    <div class="row">
      
    <div id="filter-container" class="col-xs-12 col-sm-3 col-lg-2">
      
      <h4 class="" style="background:#ddd; padding:6px;">Filtra per</h4>

      <div id="filter-menu" class="filter-menu">
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
    
    <div class="col-xs-12 col-sm-9 col-lg-10">
      
      <h5>Hai cercato: <b style="color: #46b8da;">Quello cercato</b></h5>
      
      <div class="row">
        <div class="col-xs-10 col-sm-9">
          <h5>Risultati: 1-25 di <b>1200</b></h5>
        </div>

        <div class="col-xs-2 col-sm-3">
          <button title="Ordina per" class="btn btn-default dropdown-toggle" type="button" id="sort-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            <i class="glyphicon glyphicon-sort"></i>
            <span class="hidden-xs">Ordina</span>
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu pull-right" aria-labelledby="sort-dropdown">
            <li><a href="#">Rilevanza</a></li>
            <li><a href="#">Ultimi arrivi</a></li>
            <li><a href="#">Voto</a></li>
            <li><a href="#">Prezzo: crescente</a></li>
            <li><a href="#">Prezzo: decrescente</a></li>
          </ul>
        </div>
      </div>
      
      <div style="background: #ddd; height: 1px; margin-top: 8px; margin-bottom: 8px;"></div>
      
      <%@include file="../../shared/book-search/book-search.jsp" %>
      <%@include file="../../shared/book-search/book-search.jsp" %>
      <%@include file="../../shared/book-search/book-search.jsp" %>
      <%@include file="../../shared/book-search/book-search.jsp" %>
      
      <ul class="pagination pagination-centered">
        <li><a href="#"><</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">></a></li>
      </ul>
    </div>
    
    </div>
    
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>