<!-- NB: i css e js hanno path assoluti, i file inclusi invece hanno path relativo -->

<!DOCTYPE html>
<%@tag description="Base layout" pageEncoding="UTF-8"%>

<%@attribute name="title" %>
<%@attribute name="css_imports" fragment="true" %>
<%@attribute name="js_imports" fragment="true" %>
<%@attribute name="content_area" fragment="true" %>
 
<html>
<head>
  <title>${title}</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap -->
  <link href="${pageContext.request.contextPath}/framework/css/bootstrap.min.css" rel="stylesheet">

  <!-- carica tutti i file css qui -->
  <link href="${pageContext.request.contextPath}/shared/header/header.css"  rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/shared/footer/footer.css"  rel="stylesheet" type="text/css" />
  
  <jsp:invoke fragment="css_imports"/>
</head>
<body>
  <div id="grande_scatola">
    <!-- header -->
    <%@ include file="../../shared/header/header.jsp" %>

    <div style="margin-top: 50px;">
      <!-- metti pagina qui -->
      <jsp:invoke fragment="content_area"/>
    </div>
    <%@ include file="../../shared/footer/push.jsp" %>
  </div> <!-- grande_scatola -->
  
  <!-- footer -->
  <%@ include file="../../shared/footer/footer.jsp" %>

  <!-- framework -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/framework/js/bootstrap.min.js"></script>

  <!-- carica tutti gli script qui -->
  <script src="${pageContext.request.contextPath}/shared/header/header.js"></script>
  <script src="${pageContext.request.contextPath}/shared/footer/footer.js"></script>
  
  <jsp:invoke fragment="js_imports"/>
</body>
</html>