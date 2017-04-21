<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Registrazione">
  
  <jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="signup.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    <div class="form-box row">
      <div class="form-centered">
        
        <h3>Registrati</h3>

        <form role="form" action="" method="post" class="registration-form">

          <div class="form-group">
            <label for="signup-first-name">Nome</label>
            <input id="signup-first-name" type="text" name="signup-first-name" placeholder="Nome" class="signup-first-name form-control" required>
          </div>

          <div class="form-group">
            <label for="signup-last-name">Cognome</label>
            <input id="signup-last-name" type="text" name="signup-last-name" placeholder="Cognome" class="signup-last-name form-control" required>
          </div>

          <div class="form-group">
            <label for="signup-email">Email</label>
            <input id="signup-email" type="email" name="signup-email" placeholder="Email" class="signup-email form-control" required>
          </div>

          <div class="form-group">
            <label for="signup-password">Password</label>
            <input id="signup-password" type="password" name="signup-password" placeholder="Password" class="signup-password form-control" required>
          </div>

          <button type="submit" class="btn btn-default">Registrati ora</button>

        </form>
        
        <h5 style='margin-top: 20px;'>Sei già registrato? <a href="../login/login.jsp">Accedi ora.</a></h5>
      
      </div> <!-- form-centered -->
    </div> <!-- form-box -->
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>
