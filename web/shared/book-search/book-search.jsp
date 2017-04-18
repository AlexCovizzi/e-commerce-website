<div class="book-container row">
  <div class="img-wrapper col-xs-2">
    <a href="#">
      <img src="../../assets/img/download.jpg" class="img-thumbnail">
    </a>
  </div>
  <div class="col-xs-7">
    <h5><b>Titolo: </b><a class="book-link" href="#">Il trono di spade</a></h5>
    <h5><b>Autore: </b><a class="book-link" href="#">George R.R Martino</a></h5>
    <h5><b>Editore: </b><a class="book-link" href="#">Non so che editore abbia</a></h5>
    <div class="custom-divider"></div>
    <div>
      <h5><b>Voto: </b>92%</h5>
      <button class="btn btn-default">
        <i class="glyphicon glyphicon-thumbs-up"></i>
        563
      </button>
      <button class="btn btn-default">
        <i class="glyphicon glyphicon-thumbs-down"></i>
        63
      </button>
    </div>
  </div>
  <div class="col-xs-3">
    <h5>Prezzo: 100£</h5>
    
    <% if(true) { %>
      <h6 class="disponibilita-immediata">Disponibilità immediata</h6>
      
    <% } else { %>
      <h6 class="non-disponibile">Non disponibile</h6>
    <% } %>
    
    <div>
      <button title="Aggiungi al carrello" class="btn btn-default">
        <i class="glyphicon glyphicon-shopping-cart" style="font-size: 20px;"></i>
      </button>
      <button title="Aggiungi alla lista desideri" class="btn btn-default">
        <i class="glyphicon glyphicon-list-alt" style="font-size: 20px;"></i>
      </button>
    </div>
    
  </div>
</div>
