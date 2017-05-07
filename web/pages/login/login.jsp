<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Login">
  
  <jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="login.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    
    <h4>Accedi</h4>
    
    <div class="divider-horizontal"></div>

    <form class="form-horizontal">

      <div class="form-group">
        <label class="control-label col-sm-4" for="login-email">Email</label>
        <div class="col-sm-4">
          <input type="email" class="form-control" id="login-email" placeholder="Inserisci la tua email">
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-4" for="login-password">Password</label>
        <div class="col-sm-4">
          <input type="password" class="form-control" id="login-password" placeholder="Inserisci la tua password">
        </div>
      </div>

      <div class="form-group"> 
        <div class="col-sm-offset-4 col-sm-4">
          <button type="submit" class="btn btn-default">Accedi</button>
        </div>
        <div class="col-sm-offset-4 col-sm-4" style="margin-top: 16px;">
          Non sei ancora registrato? 
          <a href="../signup/signup.jsp">Registrati ora.</a>
        </div>
      </div>

    </form>
    
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>