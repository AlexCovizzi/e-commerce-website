/*
 * LService.java
 *
 * Created on May 8, 2000, 3:29 PM
 */
 
package services.logservice;

import java.io.*;
import java.util.*;
import java.sql.*;

import util.*;
import services.database.*;
import services.errorservice.*;

/** 
 * Contiene un solo metodo statico (sicronizzato) per scrivere un messaggio
 * su un file di log. 
 *
 * @author  Mario Zambrini
 * 
 */

public class LService extends Object {

  /** 
   * Class Constructor.
   * <p>
   * Non utilizzato in quanto i metodi della classe sono statici.
   *
   */
  
  public LService() {
  }
   
  /** 
   * Scrive un messaggio in coda ad un file di log aggiungendo
   * in testa un timestamp.
   * <p>
   * @param logFile File di log su cui scrivere
   * @param logMessage Messaggio da scrivere sul log file
   *
   */  
      
  public static synchronized void logPrintln(String logFile,String logMessage) {

    try {
    
      PrintWriter log=new PrintWriter(new FileOutputStream(logFile,true),true);
      
      java.util.Date now=new java.util.Date();      
      log.println(now+"\t"+logMessage);
      log.flush();
      
    } catch (FileNotFoundException ex) {
      util.Debug.println("LService: logPrintln(): Impossibile trovare il File di Log degli Errori : "+logFile);
      ex.printStackTrace();
    }      
               
  }  
  
}