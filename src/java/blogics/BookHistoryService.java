
package blogics;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
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
  
  /* Recupero la lista dei libri nella History di un utente ordinati per visualizzazione */
  public static List<String> getUserBookHistory(Database db, int userId) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    String sql = sqlBuilder
            .select("*")
            .from("BookHistory")
            .where("user_id = "+userId)
            .orderBy("timestamp DESC")
            .done();
    
    ResultSet resultSet = db.select(sql);
    
    List<String> booksIsbn = new ArrayList<>();
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
}
