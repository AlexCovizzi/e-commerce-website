<%@ page info="Error Page" %>
<%@ page contentType="text/html" %>
<%@ page session="false" %>
<%@ page buffer="10kb" %>
<%@ page isErrorPage="true" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="services.errorservice.*"%>

<%int i;%>

<html>
  <head><title>Errore</title></head>

  <body>																		

  <%if (exception!=null){
      String message=(exception.getMessage()!=null)?exception.getMessage():"Nessun Messaggio";
      ByteArrayOutputStream stackTrace=new ByteArrayOutputStream();
      exception.printStackTrace(new PrintWriter(stackTrace,true)); %>
      <%=message%><br/>
      <pre><%=stackTrace.toString()%></pre>
  <%} else { %>
      ERRORE!! Eccezione NULLA<br/>
      No Stack Trace
  <%} %>

    <table>
    <%int pc;
      String parameterName;  
      Vector parameters=new Vector();
      Enumeration parameterNames=request.getParameterNames(); %>      
      <%while (parameterNames.hasMoreElements()) {
          parameterName=(String)parameterNames.nextElement();    
          String[] parameterValues=request.getParameterValues(parameterName);
          for (pc=0;pc<parameterValues.length;pc++) {%>
            <tr>
              <td><%=parameterName%>[<%=pc%>]</td>		
              <td><%=parameterValues[pc]%></td>
            </tr>      
          <%parameters.add( parameterName+"["+pc+"]: "+parameterValues[pc] );
          }      
       } %>      
    </table>	
    <br/><br/>

    <table>

    <%Enumeration headersNames; 
      String headerName;
      String header; 
      Hashtable info=new Hashtable();
      headersNames=request.getHeaderNames(); %>
      <%while (headersNames.hasMoreElements()) {
        headerName=(String)headersNames.nextElement(); %>
        <tr>
          <td><%=headerName%></td>		                  
      <%Enumeration headers=request.getHeaders(headerName);
        while (headers.hasMoreElements()) {
          header=(String)headers.nextElement();      
          if (header!=null)
            info.put(headerName,(info.get(headerName)!=null?info.get(headerName):"")+" "+header);  %>
            <td><%=(header!=null)?header:"-"%></td>
          </tr>
      <%}%>
    <%}%>
        <%String remoteHost=request.getRemoteHost();%>
        <tr>
          <td>REMOTEHOST</td>		                  
          <td><%=(remoteHost!=null)?remoteHost:"-"%></td>
        </tr>
        <%if (remoteHost!=null) info.put("RemoteHost",remoteHost);  %>
        <%String remoteUser=request.getRemoteUser();%>
        <tr>
          <td>REMOTEUSER</td>		                  
          <td><%=(remoteUser!=null)?remoteUser:"-"%></td>
        </tr>
        <%if (remoteUser!=null) info.put("RemoteUser",remoteUser);  %>
    </table>		

  </body>
</html>

<%if (exception!=null){
      EService.logFrontendException(exception,info,parameters); 
  } else {
      EService.logFrontend("No Exception",info,parameters);
  }%>



