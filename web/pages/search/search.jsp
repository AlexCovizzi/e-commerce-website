<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Risultati ricerca">
    
  <jsp:attribute name="sotto_header">
     <%@ include file="../../shared/header/sotto-header.jsp" %>
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    <div class="row">
      
    <div id="filter-container" class="col-xs-12 col-sm-3 col-md-3 col-lg-2">
      
      <h4 class="hidden-xs" style="color: gray;">Filtra per</h4>
      
      <h4 class="visible-xs" style="color: gray;">
        <a href="#" data-toggle="collapse" data-target="#filter-menu">
        Filtra per
        </a>
      </h4>

      <div id="filter-menu" class="filter-menu collapse in">
        <h5><b>Genere</b></h5>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Avventura </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Fantasia </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Storico </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Guerra </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Romanzo </label>
        </a></br>

        <h5><b>Autore</b></h5>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> George RR Martino </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Giorgio R Martino </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Giorg ARAR Martinez </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Georrrg RRR Marrrtin </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Ancora Georgr Martino RR </label>
        </a></br>

        <h5><b>Prezzo</b></h5>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> < 5,00 </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> 5,00 - 7,49 </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> 7,50 - 9,99 </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> 10,00 - 14,99 </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> 15,00 - 29,99 </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> > 30,00 </label>
        </a></br>

        <h5><b>Voto</b></h5>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> > 90% </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> 75% - 90% </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> 60% - 75% </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> 40% - 75% </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> < 40% </label>
        </a></br>

        <h5><b>Editore</b></h5>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Editore del trono di spade </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Editore di Game of Thrones </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Editore di GoT </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Altro editore di GoT </label>
        </a></br>
        <a class="filter-link" href="#">
          <label><input type="checkbox"> Editore di Geroge RR Martin </label>
        </a></br>
      </div>
    </div>
    
    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10">
      
      <h5>Hai cercato: <b style="color: #46b8da;">Quello cercato</b></h5>
      
      
      <div class="row">
        <div class="col-xs-9">
          <h5>Risultati: 1-25 di <b>1200</b></h5>
        </div>

        <div class="col-xs-3">
          <button title="Ordina per" class="btn btn-default dropdown-toggle pull-right" type="button" id="sort-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
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
      
      <div class="divider-horizontal"></div>
      
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
    
  <jsp:attribute name="css_imports">
    <link href="search.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/header/sotto-header.css" rel="stylesheet" type="text/css" />
    <link href="../../shared/book-search/book-search.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
    <script>
      $(window).resize(function() {
        if ($(this).width() < 768) {
          $('.filter-menu').collapse('hide');
        } else {
          $('.filter-menu').collapse('show');
        }
      });
    </script>
    
  </jsp:attribute>
 
</t:base-layout>