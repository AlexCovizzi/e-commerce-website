 
package global;

public class Constants {
        
  /* Constants for language codes */
  public static final String CD_LANGUAGE_ITALIAN = "ITA";
  public static final String CD_LANGUAGE_ENGLISH = "ENG";
  
  /* Constants for Debug */
  public static final boolean DEBUG = true;
  public static final boolean WARNING = true;
  public static final boolean ERROR = true;
  
  public static final String DEFAULT_COVER = "http://thebooksblender.altervista.org/wp-content/uploads/2015/08/copertina-non-disponibile.jpg";
  
  
  /** Constants for db connection */
  public static final String DB_USER_NAME         = "root";
  public static final String DB_PASSWORD          = "";
  public static final String DB_CONNECTION_STRING = "jdbc:mysql://localhost/mydb?user="+DB_USER_NAME+"&password="+DB_PASSWORD;
    
  /* Constants for log files*/
  public final static String LOG_DIR = "D:\\logs\\";
  public final static String FRONTEND_ERROR_LOG_FILE = LOG_DIR + "frontenderror.log";
  public final static String FATAL_LOG_FILE = LOG_DIR + "fatalerror.log";
  public final static String GENERAL_LOG_FILE = LOG_DIR + "generalerror.log";  
  public final static String GENERAL_EXCEPTION_LOG_FILE = LOG_DIR + "generalexception.log";
  public final static String WARNING_LOG_FILE = LOG_DIR + "warning.log";  
  public final static String DATABASE_SERVICE_LOG_FILE = LOG_DIR + "databaseservice.log";
      
  
}
