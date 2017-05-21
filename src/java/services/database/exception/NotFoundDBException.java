 
package services.database.exception;

import java.io.*;

import global.*;
import services.errorservice.*;
import services.database.*;
import services.logservice.*;

public class NotFoundDBException extends DBException implements FatalError {

    public NotFoundDBException(String msg, Database database) {

      super("Fatal Error: "+msg);
      this.database=database;

      this.logMessage="Fatal Error\n"+msg+"\n";

      ByteArrayOutputStream stackTrace=new ByteArrayOutputStream();
      this.printStackTrace(new PrintWriter(stackTrace,true));        

      this.logMessage=this.logMessage+stackTrace.toString();        

    }    

    public NotFoundDBException(String msg) {    
      this(msg,null);            
    }  

   /** Ritorna il messaggio di Errore corrispondente al Fatal Error **/   
    public String getLogMessage() {    
      return logMessage;    
    }

   /** Chiamata di RollBack (implementazione classe Astratta FatalError) **/   
    public void makeRollBack() {          
      if (database!=null) this.database.rollBack();           
    }

}