/*
 * ErrorLog.java
 *
 * Created on May 8, 2000, 3:22 PM
 */
 
package services.logservice;

import global.*;

/** 
 * Permette di astrarre, per le eccezioni dell'applicazione,
 * dal nome del file di log che contiene gli errori relativi al tipo
 * di eccezione che viene lanciata.
 * <p>
 * E' presente un metodo per ogni tipo di errore, i metodi sono statici
 * e vengono chiamati dalle singole eccezioni.
 *
 * @author  Mario Zambrini
 * 
 */

public class ErrorLog {

  /** 
   * Class Constructor.
   * <p>
   * Non utilizzato in quanto i metodi della classe sono statici.
   *
   */
   
  public ErrorLog() {
  }
  

  /** 
   * Scrive sul file di log dei fatal error un 
   * messaggio di errore. 
   * <p>
   * @param logMessage Messaggio di errore da scrivere sul log file
   *
   * @see LService
   *
   */    
  
  public static void fatalErrorLog(String logMessage) {   
    LService.logPrintln(Constants.FATAL_LOG_FILE,logMessage);    
  }
  
  /** 
   * Scrive sul file di log dei general error un 
   * messaggio di errore. 
   * <p>
   * @param logMessage Messaggio di errore da scrivere sul log file
   *
   * @see LService
   *
   */    
  
  public static void generalErrorLog(String logMessage) {   
    LService.logPrintln(Constants.GENERAL_LOG_FILE,logMessage);    
  }  
  
  /** 
   * Scrive sul file di log delle general exception un 
   * messaggio di errore. 
   * <p>
   * @param logMessage Messaggio di errore da scrivere sul log file
   *
   * @see LService
   *
   */      
  
  public static void generalExceptionLog(String logMessage) {   
    LService.logPrintln(Constants.GENERAL_EXCEPTION_LOG_FILE,logMessage);    
  }  
  
  /** 
   * Scrive sul file di log dei warning un 
   * messaggio di errore. 
   * <p>
   * @param logMessage Messaggio di errore da scrivere sul log file
   *
   * @see LService
   *
   */       
  
  public static void warningLog(String logMessage) {   
    LService.logPrintln(Constants.WARNING_LOG_FILE,logMessage);    
  }
  
  /** 
   * Scrive sul file di log degli errori del database service un 
   * messaggio di errore. 
   * <p>
   * @param logMessage Messaggio di errore da scrivere sul log file
   *
   * @see LService
   * @see services.databaseservice
   * @see services.databaseservice.exception
   *
   */         
  
  public static void databaseErrorLog(String logMessage) {   
    LService.logPrintln(Constants.DATABASE_SERVICE_LOG_FILE,logMessage);    
  }  
  
  
  /** 
   * Scrive sul file di log degli errori che giungerebbero fino
   * alle pagine del sito.
   * <p>
   * @param logMessage Messaggio di errore da scrivere sul log file
   *
   * @see LService
   * @see blogics.suppliermanager
   * @see blogics.suppliermanager.exception
   *
   */           
  
  public static void FrontendErrorLog(String logMessage) {   
    LService.logPrintln(Constants.FRONTEND_ERROR_LOG_FILE,logMessage);    
  }    
  
  // End of Class ErrorLog
  
}