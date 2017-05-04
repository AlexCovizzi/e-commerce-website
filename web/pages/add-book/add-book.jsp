<%-- 
    Document   : add-book
    Created on : 4-mag-2017, 10.04.53
    Author     : alemo
--%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Informazioni del libro">

    <jsp:attribute name="sotto_header">
        <!-- metti qui il sotto header della pagina -->
    </jsp:attribute>

    <jsp:attribute name="content_area">
        <!-- metti qui il contenuto della pagina -->
        <h4>Informazioni del libro</h4>
    
        <div class="divider-horizontal"></div>


        <form class="form-horizontal">

            <div class="form-group">
                <label class="control-label col-sm-2" for="copertina">Copertina</label>
                <div class="col-sm-8">
                    <input type="file" id="copertina">
                    <p class="help-block">Carica la copertina del libro.</p>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="titolo">Titolo</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="titolo"
                        placeholder="Inserisci il titolo del libro">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="autore">Autore</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="autore"
                        placeholder="Inserisci l'autore del libro">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="ISBN">Codice ISBN</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="ISBN" 
                        pattern="([0-9]{15})" placeholder="Inserisci l'ISBN" maxlength="15" minlength="15">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="pagine">Numero di pagine</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="pagine"
                        pattern="([0-9]{1,})" placeholder="Inserisci il numero di pagine">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="editore">Editore</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="editore"
                        placeholder="Inserisci l'editore">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="data-pubbl">Data di pubblicazione</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" minlength="10" maxlength="10"
                        pattern="([0-9]{2})/([0-9]{2})/([0-9]{4})" id="data-pubbl"
                        placeholder="Inserisci la data di pubblicazione (gg/mm/aaaa)">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="lingua">Lingua</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" id="lingua"
                        placeholder="Inserisci la lingua">
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="prezzo">Prezzo</label>
                <div class="col-sm-8">
                    <div class="input-group">
                        <div class="input-group-addon">&euro;</div>
                        <input type="text" class="form-control" id="prezzo"
                            pattern="([0-9]{1,}).([0-9]{2})"
                            placeholder="Inserisci il prezzo (es.: 19.99)">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="lingua">Lingua</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" id="lingua"
                        placeholder="Inserisci la lingua">
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
        <link href="add-book.css" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="js_imports">
        <!-- metti qui i js da importare -->
    </jsp:attribute>

</t:base-layout>