<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>
<!DOCTYPE html>

<jsp:useBean id="adminManagement" scope="page" class="bflows.AdminManagement" />
<jsp:setProperty name="adminManagement" property="*" />

<% /* 3 azioni:
    * view
    * add
    * modify
    */
  int i;

  Cookie[] cookies=null;
  cookies=request.getCookies();
  boolean loggedIn = (cookies != null);
  
  //adminManagement.setUserId(Session.getUserId(cookies)); /* Indica l'utente loggato in questo momento */
  
  String action = request.getParameter("action");
  if (action == null) action="view";
  
  if(action.equals("view") && !adminManagement.getIsbn().equals("null")) {
    adminManagement.recuperaInfo();
  }
  if(action.equals("add")) {
    adminManagement.addBook();
  }
  if(action.equals("modify")) {
    adminManagement.modifyBook();
  }
  
  String message=null;
  message = adminManagement.getErrorMessage();
  if(message != null) action = "view";
%>
<html>
  <head>
    <title>Informazioni 
    <% if(adminManagement.getIsbn().equals("null")) { %> del libro
    <% } else { %> di <%= adminManagement.getTitolo() %> <% } %>
    </title>

    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="add-book.css" rel="stylesheet" type="text/css" />

    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="add-book.js"></script>
  </head>
  
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../../shared/sotto-header/admin-sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
      
      <h4 class="form-title">Informazioni del libro</h4>

      <form class="form-horizontal" name="infoLibroForm" action="add-book.jsp" method="post">

        <div class="form-group">
          <label class="control-label col-sm-2" for="copertina">Copertina</label>
          <div class="col-sm-10">
            <input type="file" id="copertina">
            <p class="help-block">Carica la copertina del libro.</p>
          </div>
        </div>
        
        <!-- Titolo -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="titolo">Titolo</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="titolo" id="titolo"
                  placeholder="Inserisci il titolo del libro"
                  <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getTitolo() %>"
                  <% } %>
                  >
          </div>
        </div>
        
        <!-- Autore -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="autore">Autore</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="autore" id="autore"
              placeholder="Inserisci l'autore del libro"
              <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getAutore() %>"
                  <% } %>
              >
          </div>
        </div>
        
        <!-- Isbn -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="ISBN">Codice ISBN</label>
          <div class="col-sm-10">
            <% if(adminManagement.getIsbn().equals("null")) { %>
            <input type="text" class="form-control" name="isbn" id="ISBN" 
              placeholder="Inserisci il codice ISBN" maxlength="15" minlength="15">
            <% } else { %>
            <p name="ISBN"> <%= adminManagement.getIsbn() %> </p>
          </div>
        </div>

        <!-- Pagine -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="pagine">Numero di pagine*</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="pagine" id="pagine"
              placeholder="Inserisci il numero di pagine"
              <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getPagine() %>"
                  <% } %>
              >
          </div>
        </div>

        <!-- Editore -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="editore">Editore</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="editore" id="editore"
              placeholder="Inserisci l'editore"
              <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getEditore() %>"
                  <% } %>
              >
          </div>
        </div>
         
        <!-- Generi -->
        <div class="form-group">
          <label class="control-label col-sm-2">Generi</label>
          <table>
            <tr>
              <td style="padding-right: 10px">
                <input type="checkbox" name="genere" value="giallo"
                      <% if(adminManagement.checkGenere("giallo")) { %>
                      checked="checked"
                      <% } %>>Giallo<br/>
                <input type="checkbox" name="genere" value="thriller"
                      <% if(adminManagement.checkGenere("thriller")) { %>
                      checked="checked"
                      <% } %>>Thriller<br/>
                <input type="checkbox" name="genere" value="horror"
                      <% if(adminManagement.checkGenere("horror")) { %>
                      checked="checked"
                      <% } %>>Horror<br/>
                <input type="checkbox" name="genere" value="fantasy"
                      <% if(adminManagement.checkGenere("fantasy")) { %>
                      checked="checked"
                      <% } %>>Fantasy<br/>
                <input type="checkbox" name="genere" value="fantascienza"
                      <% if(adminManagement.checkGenere("fantascienza")) { %>
                      checked="checked"
                      <% } %>>Fantascienza<br/>
                <input type="checkbox" name="genere" value="bambini"
                      <% if(adminManagement.checkGenere("bambini")) { %>
                      checked="checked"
                      <% } %>>Per bambini<br/>
                <input type="checkbox" name="genere" value="ragazzi"
                      <% if(adminManagement.checkGenere("ragazzi")) { %>
                      checked="checked"
                      <% } %>>Per ragazzi<br/>
                <input type="checkbox" name="genere" value="societa"
                      <% if(adminManagement.checkGenere("societa")) { %>
                      checked="checked"
                      <% } %>>Società<br/>
              </td>
              <td style="vertical-align: text-top">
                <input type="checkbox" name="genere" value="politica"
                      <% if(adminManagement.checkGenere("politica")) { %>
                      checked="checked"
                      <% } %>>Politica<br/>
                <input type="checkbox" name="genere" value="storia"
                      <% if(adminManagement.checkGenere("storia")) { %>
                      checked="checked"
                      <% } %>>Storia<br/>
                <input type="checkbox" name="genere" value="economia"
                      <% if(adminManagement.checkGenere("economia")) { %>
                      checked="checked"
                      <% } %>>Economia<br/>
                <input type="checkbox" name="genere" value="diritto"
                      <% if(adminManagement.checkGenere("diritto")) { %>
                      checked="checked"
                      <% } %>>Diritto<br/>
                <input type="checkbox" name="genere" value="cucina"
                      <% if(adminManagement.checkGenere("cucina")) { %>
                      checked="checked"
                      <% } %>>Cucina<br/>
                <input type="checkbox" name="genere" value="turismo"
                      <% if(adminManagement.checkGenere("turismo")) { %>
                      checked="checked"
                      <% } %>>Turismo<br/>
                <input type="checkbox" name="genere" value="fumetto"
                      <% if(adminManagement.checkGenere("fumetto")) { %>
                      checked="checked"
                      <% } %>>Fumetto<br/>
              </td>
            </tr>
          </table>
        </div>

        <!-- Data di pubblicazione -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="data-pubbl">Data di pubblicazione*</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="dataPubbl" minlength="10" maxlength="10"
              id="data-pubbl" placeholder="Inserisci la data di pubblicazione (gg/mm/aaaa)"
              <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getDataPubbl() %>"
                  <% } %>
              >
          </div>
        </div>

        <!-- Lingua -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="lingua">Lingua</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="lingua" id="lingua"
              placeholder="Inserisci la lingua"
              <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getLingua() %>"
                  <% } %>
              >
          </div>
        </div>

        <!-- Prezzo -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="prezzo">Prezzo</label>
          <div class="col-sm-10">
            <div class="input-group">
              <div class="input-group-addon">&euro;</div>
              <input type="text" class="form-control" name="prezzo" id="prezzo"
                pattern="([0-9]{1,}).([0-9]{2})"
                placeholder="Inserisci il prezzo (es.: 19.99)"
                <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getPrezzo() %>"
                  <% } %>
                >
            </div>
          </div>
        </div>
        <small>*il campo non è obbligatorio</small>
                
        <div class="form-group"> 
          <div class="col-sm-offset-2 col-sm-10">
            <% if(!adminManagement.getIsbn().equals("null")) { %>
            <input type="hidden" name="action" value="modify">
            <input type="button" class="btn btn-default" onclick="submitInfoLibro()" value="Salva modifiche">
            <% } else { %>
            <input type="hidden" name="action" value="add">
            <input type="button" class="btn btn-default" onclick="submitInfoLibro()" value="Aggiungi libro">
            <% } %>

            <input type="button" class="btn btn-link" onclick="annulla()" style="margin-left: 16px;" value="Annulla">
          </div>
        </div>
      </form> 
      
      <form name="annullaForm" action="../admin-account/admin.jsp">
        <input type="hidden" name="action" value="view">
      </form>
    </div>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>
    
  </body>
</html>

