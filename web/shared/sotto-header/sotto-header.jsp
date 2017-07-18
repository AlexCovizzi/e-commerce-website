
<!-- menu sotto header -->
<div class="container-fluid">
  <div id="scritta_categorie">
      Categorie
  </div>

  <button type="button" class="navbar-toggle" data-toggle="collapse"
          data-target="#sotto_header" aria-expanded="false" aria-controls="sotto_header">

      <span class="sr-only">Toggle Navigation</span>
      <i class="glyphicon glyphicon-menu-hamburger"></i>
  </button>

  <div id="sotto_header" class="collapse navbar-collapse">
      <ul style="margin: 0px;" class="nav navbar-nav">
        <li title="Libri Italiani">
            <a href="javascript:submitSearchForm('lang','it')"">Libri Italiani</a>
        </li>
        <li title="Libri in Lingua Straniera">
          <a href="javascript:submitSearchForm('lang','st')">Libri in Lingua Straniera</a>
        </li>
        <li title="Ultime pubblicazioni">
          <a href="javascript:submitSearchForm('ord',1)">Ultime pubblicazioni</a>
        </li>
        <li title="I pi&ugrave; votati">
            <a href="javascript:submitSearchForm('ord',3)">I pi&ugrave; votati</a>
        </li>
      </ul>
  </div>
  
  <form id='search-form-sotto-header' action='../../c-search/search/search.jsp' method='post'>
    <input type="hidden" id='search-input-sotto-header' name='name' value='value'>
  </form>
</div>
