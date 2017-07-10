<%@page import="blogics.Review"%>

<%
  Review review = (Review) request.getAttribute("review");
  boolean admin = (Boolean) request.getAttribute("admin");
%>

<table class="recensione_singola table table-striped">
    <tr>
        <th><b><%=review.getUserName()+" "+review.getUserSurname()%></b></th>
        
        <% if(admin) { %>
            <button title="Blocca utente" class="btn btn-danger" style="margin-top: 1px; margin-bottom: 1px;">
              <i class="glyphicon glyphicon-remove-sign" style="font-size: 18px;"></i>
              <span class="hidden-xs hidden-sm hidden-md">Blocca utente</span>
            </button>
          <% } %>
    
        <th><i>VOTO</i>:
          <% if(review.isThumbUp()) { %>
            <i class="glyphicon glyphicon-thumbs-up"></i> Consigliato</th>
          <% } else { %>
            <i class="glyphicon glyphicon-thumbs-down"></i> Sconsigliato</th>
          <% } %>
          
          <% if(admin) { %>
            <button title="Rimuovi recensione" class="btn btn-danger" style="margin-top: 1px; margin-bottom: 1px;">
              <i class="glyphicon glyphicon-remove" style="font-size: 18px;"></i>
              <span class="hidden-xs hidden-sm hidden-md">Rimuovi recensione</span>
            </button>
          <% } %>
    </tr>
    <tr>
        <td colspan="2">
          <% if(!review.getComment().equals("null")) { %>
          <%=review.getComment()%>
          <% } else { %>
          <i>L'utente non ha lasciato commenti</i>
          <% } %>
        </td>
    </tr>
</table>
        
<div class='divider-horizontal'></div>
