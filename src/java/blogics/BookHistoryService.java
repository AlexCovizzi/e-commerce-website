
package blogics;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.SqlBuilder;

public class BookHistoryService {
  
  /* Aggiunge il libro specificato alla history dell'utente */
  /* TODO: Mettere un limite nel numero di libri nella history dell'utente */
  public static void addToHistory(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = "";
    
    /* Se l'utente aveva già questo libro nella sua history allora viene solo aggiornato il timestamp */
    if(isBookInHistory(db, userId, bookIsbn)) {
      sql = sqlBuilder
          .update("BookHistory")
          .set("timestamp = DEFAULT")
          .where("user_id = "+userId)
          .and("book_isbn = "+Conversion.getDatabaseString(bookIsbn))
          .done();
    } else {
      sql = sqlBuilder
          .insertInto("BookHistory", "user_id", "book_isbn", "timestamp")
          .values(userId, Conversion.getDatabaseString(bookIsbn), "DEFAULT")
          .done();
    }
    
    db.modify(sql);
  }
  
  /* Recupero la lista dei libri nella History di un utente ordinati per data di visualizzazione */
  public static List<String> getUserBookHistory(Database db, int userId) throws RecoverableDBException {
    List<String> booksIsbn = new ArrayList<>();
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    String sql = sqlBuilder
            .select("*")
            .from("BookHistory")
            .where("user_id = "+userId)
            .orderBy("timestamp DESC")
            .done();
    
    ResultSet resultSet = db.select(sql);
    
    try {
      while(resultSet.next()) {
        String isbn = resultSet.getString("book_isbn");
        booksIsbn.add(isbn);
      }
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException(e, "BookHistoryService", "getUserBookHistory", "Errore sul ResultSet.");
    }
    
    return booksIsbn;
  }
  
  /* Verifico se il libro è già nella history dell'utente */
  private static boolean isBookInHistory(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    String sql = sqlBuilder
        .select("*")
        .from("BookHistory")
        .where("user_id = "+userId)
          .and("book_isbn =" + Conversion.getDatabaseString(bookIsbn))
        .done();
    
    ResultSet resultSet = db.select(sql);
    
    boolean exist = false;
    
    try {
      exist = resultSet.next();
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException(e, "BookHistoryService", "isBookInHistory", "Errore sul ResultSet.");
    }
    
    return exist;
  }
  
  /**
   * Restituisce i 2 generi piu visualizzati dall'utente
   * @return 
   */
  public static List<String> getMostViewedGenres(Database db, int userId) throws RecoverableDBException {
    List<String> genres = new ArrayList<>();
    SqlBuilder sqlBuilder = new SqlBuilder();
    ResultSet resultSet;
    String sqlUser;
    String sqlAll;
    Logger.debug(userId);
    
    sqlUser = sqlBuilder
            .select("H.user_id", "H.book_isbn", "G.g_name", "COUNT(*) AS n")
            .from("BookHistory").as("H")
            .join("BookGenre").as("G").on("G.book_isbn = H.book_isbn")
            .where("H.user_id="+userId)
            .groupBy("G.g_name")
            .orderBy("n DESC")
            .limit(3)
            .done();
    
    sqlAll = sqlBuilder
            .select("user_id", "H.book_isbn", "G.g_name", "COUNT(*) AS n")
            .from("BookHistory").as("H")
            .join("BookGenre").as("G").on("G.book_isbn = H.book_isbn")
            .groupBy("G.g_name")
            .orderBy("n DESC")
            .limit(3)
            .done();
    
    if(userId < 1) resultSet = db.select(sqlAll);
    else resultSet = db.select(sqlUser);
    
    try {
      while(resultSet.next()) {
        String genre = resultSet.getString("g_name");
        genres.add(genre);
      }
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException(e, "BookHistoryService", "getMostViewedGenres", "Errore sul ResultSet.");
    }
    
    // se non ho trovato abbastanza risultati uso la ricerca su tutti gli utenti
    if(genres.isEmpty()) {
      genres = new ArrayList<>();
      
      resultSet = db.select(sqlAll);
    
      try {
        while(resultSet.next()) {
          String genre = resultSet.getString("g_name");
          genres.add(genre);
        }
        resultSet.close();
      } catch (SQLException e) {
        throw new RecoverableDBException(e, "BookHistoryService", "getMostViewedGenres", "Errore sul ResultSet.");
      }
    }
    
    return genres;
  }
  
  /**
   * Restituisce i 2 autori piu visualizzati dall'utente
   * se nessun utente è loggato restituisce i 2 piu visualizzati in generale
   * @return 
   */
  public static List<String> getMostViewedAuthors(Database db, int userId) throws RecoverableDBException {
    List<String> authors = new ArrayList<>();
    SqlBuilder sqlBuilder = new SqlBuilder();
    ResultSet resultSet;
    String sqlUser;
    String sqlAll;
    
    sqlUser = sqlBuilder
              .select("H.user_id", "H.book_isbn", "A.a_name", "COUNT(*) AS n")
              .from("BookHistory").as("H")
              .join("BookAuthor").as("A").on("A.book_isbn = H.book_isbn")
              .where("H.user_id="+userId)
              .groupBy("A.a_name")
              .orderBy("n DESC")
              .limit(3)
              .done();
    
    sqlAll = sqlBuilder
              .select("user_id", "H.book_isbn", "A.a_name", "COUNT(*) AS n")
              .from("BookHistory").as("H")
              .join("BookAuthor").as("A").on("A.book_isbn = H.book_isbn")
              .groupBy("A.a_name")
              .orderBy("n DESC")
              .limit(3)
              .done();
    
    if(userId < 0) resultSet = db.select(sqlAll);
    else resultSet = db.select(sqlUser);
    
    try {
      while(resultSet.next()) {
        String author = resultSet.getString("a_name");
        authors.add(author);
      }
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException(e, "BookHistoryService", "getMostViewedAuthors", "Errore sul ResultSet.");
    }
    
    // se non ho trovato abbastanza risultati uso la ricerca su tutti gli utenti
    if(authors.isEmpty()) {
      authors = new ArrayList<>();
      
      resultSet = db.select(sqlAll);
    
      try {
        while(resultSet.next()) {
          String author = resultSet.getString("a_name");
          authors.add(author);
        }
        resultSet.close();
      } catch (SQLException e) {
        throw new RecoverableDBException(e, "BookHistoryService", "getMostViewedAuthors", "Errore sul ResultSet.");
      }
    }
    
    return authors;
  }
}
