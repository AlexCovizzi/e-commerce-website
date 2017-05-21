
package services.database.exception;

import java.io.*;

import services.errorservice.*;
import services.database.*;
import services.logservice.*;

public class DuplicatedRecordDBException extends DBException implements Warning {
  
  
  /** Creates new NotFoundDBException */
  public DuplicatedRecordDBException(String msg) {
    super("Warning: "+msg);
    this.logMessage="Warning\n"+msg+"\n";
  }
  
  /** Ritorna il messaggio di Errore corrispondente al Warning **/
  public String getLogMessage() {
    return logMessage;
  }
  
}