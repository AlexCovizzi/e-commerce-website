
package services.database.exception;

import services.errorservice.*;
import services.database.*;
import services.logservice.*;

import java.io.*;

public class ResultSetDBException extends DBException implements GeneralError {
  
  
  public ResultSetDBException(String msg,Database database) {    
    super("General Error: "+msg);
    this.database=database;    
    this.logMessage="General\n"+msg+"\n";    
  }
  

  public ResultSetDBException(String msg) {    
    this(msg,null);    
  }
  
  public String getLogMessage() {    
    return logMessage;    
  }
    
  public void makeRollBack() {    
    if (database!=null) this.database.rollBack();    
  }
  
}