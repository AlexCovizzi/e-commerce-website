<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
 
<t:base-layout title="Il mio account">
  
  <jsp:attribute name="sotto_header">
    <nav class='navbar navbar-default'>
      <div class='container-fluid'>
        <ul class='nav navbar-nav'>
          <li><a href="#">I miei Ordini</a></li>
          <li><a href="#">Il mio Carrello</a></li>
          <li><a href="#">La mia Lista Desideri</a></li>
          <li><a href="#">Il mio Indirizzo</a></li>
          <li><a href="#">Cambia Password</a></li>
          <li><a href="../homepage/homepage.jsp">Logout</a></li>
        </ul>
      </div>
    </nav>
  </jsp:attribute>
  
  <jsp:attribute name="content_area">
    <!-- metti qui il contenuto della pagina -->
    
  </jsp:attribute>
    
  <jsp:attribute name="css_imports">
    <!-- metti qui i css da importare -->
    <link href="account.css" rel="stylesheet" type="text/css" />
  </jsp:attribute>
  
  <jsp:attribute name="js_imports">
    <!-- metti qui i js da importare -->
  </jsp:attribute>
 
</t:base-layout>
