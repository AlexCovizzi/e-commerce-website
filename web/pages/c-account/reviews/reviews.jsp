<%@page import="util.Logger"%>
<%@page import="blogics.Review"%>
<%@page import="blogics.Order"%>
<%@page import="blogics.Book"%>
<%@page import="bflows.AccountManagement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page info="Orders Page" %>
<%@page session="false" %>
<%@page buffer="30kb" %>
<%@page errorPage="../../ErrorPage.jsp" %>

<%@ page import="services.session.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="accountManagement" scope="page" class="bflows.AccountManagement" />
<jsp:setProperty name="accountManagement" property="*" />

<%
  Cookie[] cookies = request.getCookies();
  accountManagement.setCookies(cookies);
  boolean loggedIn = Session.isUserLoggedIn(cookies);
  boolean admin = Session.isUserAdmin(cookies);
  
  String action = request.getParameter("action");
  if (action == null) action = "view";
  
  if(action.equals("view")) {
    accountManagement.reviewsView();
  } else if(action.equals("modify")) {
    accountManagement.reviewsModify();
  } else if(action.equals("remove")) {
    accountManagement.reviewsRemove();
  }
  
  String message = accountManagement.getErrorMessage();
  if(message != null) action = "view";
%>

<html>
  <head>
    <title>Le mie recensioni</title>
    
    <!-- Se l'utente non è loggato o è un admin ritorno alla homepage immantinente -->
    <% if(!loggedIn | admin) { %>
      <script language="javascript">
        location.replace("../../c-search/homepage/homepage.jsp");
      </script>
    <% } %>
    
    <!-- comprende css e script del framework, header e footer -->
    <%@ include file="../../../shared/head-common.html" %>

    <!-- carica i tuoi file css qui -->
    <link href="../../../shared/review/review.css" rel="stylesheet" type="text/css" />
    <link href="reviews.css" rel="stylesheet" type="text/css" />
    
    <!-- carica i tuoi file js qui -->
    <script type="text/javascript" src="reviews.js"></script>
    <script type="text/javascript" src="../../../shared/review/review.js"></script>
  </head>
    
  <body>
    <!-- header -->
    <div class="header">
      <%@ include file="../../../shared/header/header.jsp" %>
    </div>
    
    <!-- sotto-header -->
    <div class="sotto-header">
      <%@ include file="../../../shared/sotto-header/account-sotto-header.jsp" %>
    </div>

    <!-- content-area -->
    <div class="container content-area">
        
      <% if(action.equals("remove")) { %>
        <h4>La recensione è stata rimossa</h4>
      <% } else if(action.equals("modify")) { %>
        <h4>La recensione è stata modificata</h4>
      <% } %>

      <h3>Le mie Recensioni</h3>

      <div class="divider-horizontal"></div>

      <div class='row'>
        <% if(accountManagement.getReviews().isEmpty()) { %>
          <div class="col-xs-12">Non hai ancora scritto nessuna recensione</div>
        <% } else { %>
          <div class="col-xs-12">
            <% for(Review review : accountManagement.getReviews()) { %>
              
              <table class="recensione_singola table table-striped">
                <tr>
                  <th>
                    <h5 class='subsection-title'>Libro</h5>
                    <a class='book-title' href='../../c-search/book-page/book-page.jsp?isbn=<%=review.getBookIsbn()%>' >
                      <%=review.getBookTitle()%>
                    </a>
                  </th>

                  <th>
                    <h5 class='subsection-title'>Voto</h5>
                    <div id="voto" class="btn-group" data-toggle="buttons">
                      <label title="Lo Consiglio" class="btn btn-default">
                          <input type="radio" name="thumbUp" value='true' id="thumb-up-<%=review.getBookIsbn()%>">
                          <i class="glyphicon glyphicon-thumbs-up"></i>
                      </label>
                      <label title="Non lo Consiglio" class="btn btn-default">
                          <input type="radio" name="thumbUp" value='false' id="thumb-down-<%=review.getBookIsbn()%>">
                          <i class="glyphicon glyphicon-thumbs-down"></i>
                      </label>
                        <% if(review.isThumbUp()) { %>
                          <script>
                            document.getElementById("thumb-up-<%=review.getBookIsbn()%>").click();
                          </script>
                        <% } else {%>
                          <script>
                            document.getElementById("thumb-down-<%=review.getBookIsbn()%>").click();
                          </script>
                        <% } %>
                    </div>
                  </th>
                  
                  <th>
                    <h5 class='subsection-title'>Data</h5>
                    <%=review.getTimestamp()%>
                  </th>
                  
                  <th>
                    </br>
                    <button class="btn btn-default" type="button" onclick="submitReviewForm('modify', '<%=review.getBookIsbn()%>')">
                      <i class="glyphicon glyphicon-edit"></i>
                      Modifica
                    </button>
                    <button class="btn btn-danger" type="button" onclick="submitReviewForm('remove', '<%=review.getBookIsbn()%>')">
                      <i class="glyphicon glyphicon-remove"></i>
                      Rimuovi
                    </button>
                  </th>
                      
                </tr>
                <tr>
                  <td colspan="4">
                    <% if(review.getComment() != null) { %>
                      <p id="comment-<%=review.getBookIsbn()%>" contenteditable="true" ><%=review.getComment()%></p>
                    <% } %>
                  </td>
                </tr>
            </table>
            
            <% } %>
          </div>
        <% } %>
        
        <div class='col-xs-12' style='margin-top: 12px;'>
          <a href='../account/account.jsp'>Torna all'account</a>
        </div>
        
      </div>
      
    </div>
      
    <form method="post" id="review-form">
      <input id="action-input" type="hidden" name="action">
      <input id="isbn-input" type="hidden" name="isbn">
      <input id="thumbUp-input" type="hidden" name="thumbUp">
      <input id="comment-input" type="hidden" name="comment">
    </form>

    <!-- footer -->
    <div class="footer">
      <%@ include file="../../../shared/footer/footer.jsp" %>
    </div>

    <%if (message != null) {%>
      <script>alert("<%=message%>");</script>
    <%}%>
    
  </body>
</html>