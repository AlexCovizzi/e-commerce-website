/*
 * GeneralError.java
 *
 * Created on May 5, 2000, 2:57 PM
 */
 
package services.errorservice;

/** 
 * Interfaccia che definisce il tipo di errore General Exception.
 *
 * L'Eccezione che implementa l'errore General Exception deve prevedere i
 * metodi che consentono di gestirla.
 * E' infatti necessario aggiornare il log sul file relativo 
 * al tipo di eccezione.
 * <p>
 * E' inoltre presente un metodo per recuperare il messaggio che andrà loggato.
 *
 * @author  Mario Zambrini
 * 
 * @see EService
 * @see FatalError
 * @see GeneralError
 * @see Warning
 *
 */

public interface GeneralException {

  /** 
   * Restituisce il messaggio di errore.
   * <p>
   * Restituisce il messaggio che verrà poi aggiunto
   * ai files di log degli errori.
   *
   */       
  
  public String getLogMessage();
  
  /** 
   * Logga l'errore sul file relativo al tipo di errore.
   * <p>
   * Scrive il messaggio di errore sul file di log relativo
   * alla sezione di codice interessata all'errore.
   *
   */           
  
  public void log();
  
}
