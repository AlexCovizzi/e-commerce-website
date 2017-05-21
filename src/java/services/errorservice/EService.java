
package services.errorservice;

import java.util.*;
import java.io.*;
import org.xml.sax.*;

import global.*;
import services.logservice.*;


public class EService {
  
  /**
   * Rappresenta un errore ingestibile.
   * <p>
   * Ogni volta che nel flusso del sito si verifica una eccezione
   * che rappresenta una anormale condizione del flusso tale
   * da non poter essere gestita, l'errore è classificato con
   * questa costante affinché il flusso venga redirezionato
   * verso una pagina di errore.
   *
   */  
  
  public static final int UNRECOVERABLE_ERROR = -1; 
  
  /** 
   * Rappresenta un errore gestibile.
   * <p>
   * Ogni volta che nel flusso del sito si verifica una eccezione
   * che rappresenta una anormale condizione del flusso tale
   * da poter essere gestita, l'errore è classificato con
   * questa costante affinché il flusso lo possa gestire.
   *
   */  
      
  public static final int RECOVERABLE_ERROR = -2; 
          
  /** 
   * Class Constructor.
   * <p>
   * Non utilizzato in quanto i metodi della classe sono statici.
   *
   */
  
  public EService() {
  }
  
  /** 
   * Gestisce il recover di un Fatal Error. 
   * <p>
   * Gestisce il recover di un Fatal Error facendo la RollBack,
   * inviando una mail di notifica al responsabile e loggando l'errore
   * sia sul log dei fatal error che su quello della sezione di codice
   * relativa all'errore.
   * <p>
   * @param fatalError L'errore da gestire
   *
   * @see FatalError
   *
   */      
  
  public static void logAndRecover(FatalError fatalError) {
 
    fatalError.makeRollBack();
    fatalError.log();
    
    ErrorLog.fatalErrorLog(fatalError.getLogMessage());    
        
  }
  
  /** 
   * Gestisce il recover di un General Error. 
   * <p>
   * Gestisce il recover di un General Error facendo la RollBack e 
   * loggando l'errore sia sul log dei General Error che su quello
   * della sezione di codice relativa all'errore.
   * <p>
   * @param generalError L'errore da gestire
   *
   * @see GeneralError
   *
   */        
  
  public static void logAndRecover(GeneralError generalError) {
 
    generalError.makeRollBack();
    generalError.log();
    
    ErrorLog.generalErrorLog(generalError.getLogMessage());      
    
  }  
  
  /** 
   * Gestisce il recover di un General Exception. 
   * <p>
   * Gestisce il recover di un General Exception  
   * loggando l'errore sia sul log delle General Exception che su quello
   * della sezione di codice relativa all'errore.
   * <p>
   * @param generalException L'errore da gestire
   *
   * @see GeneralException
   *
   */          
  
  public static void logAndRecover(GeneralException generalException) {
 
    generalException.log();
    
    ErrorLog.generalExceptionLog(generalException.getLogMessage());    
        
  }  

  /** 
   * Gestisce il recover di un Warning. 
   * <p>
   * Gestisce il recover di un Warning  
   * loggando l'errore sia sul log dei Warning che su quello
   * della sezione di codice relativa all'errore.
   * <p>
   * @param warning L'errore da gestire
   *
   * @see Warning
   *
   */            
  
  public static void logAndRecover(Warning warning) {
 
    warning.log();
    
    ErrorLog.warningLog(warning.getLogMessage());    
        
  }
  

  public static void logAndRecover(FileNotFoundException ex) {
 
    ErrorLog.generalExceptionLog(ex.getMessage());
        
  }


  public static void logAndRecover(IOException ex) {

    ErrorLog.generalExceptionLog(ex.getMessage());

  }


  public static void logAndRecover(SAXException ex) {

    ErrorLog.generalExceptionLog(ex.getMessage());

  }


  /**
   * Gestisce il recover di un Warning. 
   * <p>
   * Gestisce il recover di un Warning  
   * loggando l'errore sia sul log dei Warning che su quello
   * della sezione di codice relativa all'errore.
   * <p>
   * @param warning L'errore da gestire
   *
   * @see Warning
   *
   */            
  
  public static void logFrontendException(Throwable exception,Hashtable info,Vector parameters) {
    
    StringBuffer parametersView=new StringBuffer();
    int i;
    
    String message=exception.getMessage();
    
    ByteArrayOutputStream stackTrace=new ByteArrayOutputStream();
    exception.printStackTrace(new PrintWriter(stackTrace,true));              
    
    for (i=0;i<parameters.size();i++) {
      parametersView.append( parameters.elementAt(i)+"\n" );
    }    
    
    ErrorLog.FrontendErrorLog(message+"\n\n"+stackTrace.toString()+"\n\n"+info.toString()+"\n\n"+parametersView.toString());  
    
  }  
  
  public static void logFrontend(String sMesg,Hashtable info,Vector parameters) {
    
    StringBuffer parametersView=new StringBuffer();
    int i;
    
    String message=sMesg;
    
    for (i=0;i<parameters.size();i++) {
      parametersView.append( parameters.elementAt(i)+"\n" );
    }    
    
    ErrorLog.FrontendErrorLog(message+"\n\n"+info.toString()+"\n\n"+parametersView.toString());  
    
  }  
  
  // End of Class
  
}