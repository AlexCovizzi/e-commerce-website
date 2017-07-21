<%@page import="util.Conversion"%>
<%@page import="blogics.Review"%>

<%
  Review review = (Review) request.getAttribute("review");
  boolean admin = (Boolean) request.getAttribute("admin");
%>

<table class="recensione_singola table table-striped">
    <tr>
        <th><b><%=review.getUserName()+" "+review.getUserSurname()%></b></th>
    
        <th>
          <% if(review.isThumbUp()) { %>
          <i class="glyphicon glyphicon-thumbs-up"></i> Consigliato
          <% } else { %>
            <i class="glyphicon glyphicon-thumbs-down"></i> Sconsigliato
          <% } %>
        </th>
        
        <th>
          <%=Conversion.getDateAsString(review.getTimestamp())%>
        </th>
          
        <% if(admin) { %>
        <th>
          <button title="Rimuovi recensione" class="btn btn-danger" style="margin-top: 1px; margin-bottom: 1px;"
                  onclick='submitRimuoviRecensioneAdmin(<%= review.getUserId() %>)'>
            <i class="glyphicon glyphicon-remove"></i>
            <span class="hidden-xs hidden-sm hidden-md">Rimuovi recensione</span>
          </button>
        </th>
        <% } %>
    </tr>
    <tr>
        <td <% if(admin) { %>colspan="4"<% } else { %>colspan="3"<% } %>>
          <% if(!review.getComment().equals("null")) { %>
          <%=review.getComment()%>
          <% } else { %>
          <i>L'utente non ha lasciato commenti</i>
          <% } %>
        </td>
    </tr>
</table>

<% if(admin) { %>
<form name="rimuoviRecensioneAdmin" action="book-page.jsp" method="post">
  <input type="hidden" name="action" value="remove_review">
  <input type="hidden" name="isbn" value="<%= review.getBookIsbn() %>">
  <input type="hidden" name="userId">
</form>
<% } %>
        
<div class='divider-horizontal'></div>
