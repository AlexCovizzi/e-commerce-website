/*
 * Debug.java
 *
 * Created on 13 dicembre 2000, 12.17
 */

package util;

import global.*;
import java.lang.reflect.*;

/**
 * Sostituisce la System.out per il Debug.
 *
 * Utilizzare per debuggare il metodo util.Debug.println(String)
 * al posto di System.out.println(Strin). 
 *
 * @author  Mario Zambrini
 *
 */
public class Debug extends Object {

  /** 
   * Costruttore.
   * <p>
   * Non utilizzato in quanto i metodi della classe sono statici.
   *
   */  
  public Debug() {
  }

  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(Object s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
    
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(boolean s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(char s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(char[] s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(double s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(float s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(int s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void println(long s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }  
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(Object s) {   
    if (Constants.DEBUG)
      System.out.print(s);    
  }
    
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(boolean s) {   
    if (Constants.DEBUG)
      System.out.print(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(char s) {   
    if (Constants.DEBUG)
      System.out.print(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(char[] s) {   
    if (Constants.DEBUG)
      System.out.print(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(double s) {   
    if (Constants.DEBUG)
      System.out.print(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(float s) {   
    if (Constants.DEBUG)
      System.out.print(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(int s) {   
    if (Constants.DEBUG)
      System.out.println(s);    
  }
  
  /**
   * Stampa un oggetto sullo standard output.
   * <p>
   * Stampa un oggetto sullo standard output solo se il debug è attivo
   * per l'ambiente.
   *
   * @param oDataBase Il Database.
   *
   */      
  public static void print(long s) {   
    if (Constants.DEBUG)
      System.out.print(s);    
  }      
  
}