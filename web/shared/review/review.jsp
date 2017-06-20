<%@page import="blogics.Review"%>

<%
  Review review = (Review) request.getAttribute("review");
%>

<table class="recensione_singola">
    <tr>
        <th><b><%=review.getUserName()+" "+review.getUserSurname()%></b></th>
        <th><i>VOTO</i>:
          <% if(review.isThumbUp()) { %>
            <i class="glyphicon glyphicon-thumbs-up"></i> Consigliato</th>
          <% } else { %>
            <i class="glyphicon glyphicon-thumbs-down"></i> Sconsigliato</th>
          <% } %>
    </tr>
    <tr>
        <td colspan="2"><%=review.getComment()%></td>
    </tr>
</table>
