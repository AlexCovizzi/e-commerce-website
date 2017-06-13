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
  
  if(action.equals("view") && adminManagement.getIsbn().equals("null")) {
    adminManagement.visualizza();
  }
  else {
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
        
        <!-- Descrizione -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="descrizione">Descrizione*</label>
          <div class="col-sm-10">
            <textarea id="descrizione" name="descrizione" class="form-control"
                placeholder="Scrivi una breve descrizione del libro"
                cols="100" rows="5"><% if(!adminManagement.getIsbn().equals("null") && !adminManagement.getDescrizione().equals("-")) { %><%= adminManagement.getDescrizione() %><% } %></textarea>
          </div>
        </div>
        
        <!-- Autore -->
        <div class="form-group" id="autori">
          <label class="control-label col-sm-2">Autori</label>
          <div class ="col-sm-10" id="autoriDiv">
            <div class="autoreCampo" id="autore0">
              <input type="text" class="form-control" name="autore" id="formAutore0"
                placeholder="Inserisci l'autore del libro"
                <% if(!adminManagement.getIsbn().equals("null")) { %>
                    value="<%= adminManagement.getAutore(0) %>"
                    <% } %>
                >
            </div>
          
          <% if(!adminManagement.getIsbn().equals("null")) { %>
          
          <script> setCounter(<%= adminManagement.getAutore().length %>) </script>
          
            <% for(int j = 1; j < adminManagement.getAutore().length; j++) { %>
              <div class="autoreCampo input-group" id="autore<%= j %>">
                <input type="text" class="form-control" name="autore" id="formAutore<%= j %>"
                  placeholder="Inserisci l'autore del libro"
                  <% if(!adminManagement.getIsbn().equals("null")) { %>
                      value="<%= adminManagement.getAutore(j) %>"
                      <% } %>
                  >
                <span class="input-group-btn">
                  <input type="button" class="btn btn-danger" onclick="removeElement('autoriDiv','autore<%= j %>')" value="X">
                </span>
              </div>
            <% } %>
          <% } %>
          
          </div>
          <div class="col-sm-2"></div> <!-- Serve solo per allineare il bottone -->
          <div class="col-sm-10">
            <input type="button" class="btn btn-default" onclick="aggiungiAutore()" value="Aggiungi autore"/>
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
            <% } %>
          </div>
        </div>

        <!-- Pagine -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="pagine">Numero di pagine*</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="pagine" id="pagine"
              placeholder="Inserisci il numero di pagine"
              <% if(!adminManagement.getIsbn().equals("null") && adminManagement.getPagine() != -1) { %>
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
         
        <!-- Generi dinamici -->
        <div class="form-group">
          <label class="control-label col-sm-2">Generi</label>
          <table>
            <tr>
              <td style="padding-right: 10px">
                <% for(i = 0; i < ((adminManagement.getGeneri().length / 2) + 1); i++) { %>
                <input type="checkbox" name="bookGeneri" value="<%= adminManagement.getGeneri(i) %>"
                      <% if(adminManagement.checkGenere(adminManagement.getGeneri(i))) { %>
                      checked="checked"
                      <% } %>><%= adminManagement.getGeneri(i) %><br/>
                <% } %>
              </td>
              <td style="vertical-align: text-top">
                <% for(i = ((adminManagement.getGeneri().length / 2) + 1); i < adminManagement.getGeneri().length; i++) { %>
                <input type="checkbox" name="bookGeneri" value="<%= adminManagement.getGeneri(i) %>"
                      <% if(adminManagement.checkGenere(adminManagement.getGeneri(i))) { %>
                      checked="checked"
                      <% } %>><%= adminManagement.getGeneri(i) %><br/>
                <% } %>
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
              <% if(!adminManagement.getIsbn().equals("null") && !adminManagement.getDataPubbl().equals("-")) { %>
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
                placeholder="Inserisci il prezzo (es.: 19.99)"
                <% if(!adminManagement.getIsbn().equals("null")) { %>
                  value="<%= adminManagement.getPrezzo() %>"
                  <% } %>
                >
            </div>
          </div>
        </div>
        
        <!-- Stock -->
        <div class="form-group">
          <label class="control-label col-sm-2" for="stock">Stock</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="stock" id="stock"
              placeholder="Inserisci il numero di libri presenti in magazzino"
              <% if(!adminManagement.getIsbn().equals("null")) { %>
                value="<%= adminManagement.getStock() %>"
                <% } %>
              >
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

