<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Login">
  
  <jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="login.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>

  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    <div class="form-box row">
      <div class="form-centered">
        
        <h3>Accedi</h3>
      
        <form role="form" action="" method="post" class="login-form">
          
          <div class="form-group">
            <label for="login-email">Email</label>
            <input id="login-email" type="email" name="login-email" placeholder="Email" class="login-email form-control" required>
          </div>
          
          <div class="form-group">
            <label for="login-password">Password</label>
            <input id="login-password" type="password" name="login-password" placeholder="Password" class="login-password form-control" required>
          </div>
          
          <button type="submit" class="btn btn-default">Accedi</button>
          
        </form>
        
        <h5 style='margin-top: 20px;'>Non sei ancora registrato? <a href="../signup/signup.jsp">Registrati ora.</a></h5>
        
      </div> <!-- form-centered -->
    </div>	<!-- form-box -->
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>