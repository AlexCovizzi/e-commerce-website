
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.Pair;
import util.SqlBuilder;

public class ShoppingCartService {
  
  /* Aggiunge il libro nel carrello dell'utente in quantità singola */
  /* Resituisce true se l'operzione ha successo, false se fallisce (es. c'è gia quel libro nel carrello */
  public static boolean addToCart(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    
    if(isBookInCart(db, userId, bookIsbn)) return false;
    
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = sqlBuilder
            .insertInto("ShoppingCart_book", "user_id", "book_isbn", "quantity")
            .values(userId, Conversion.getDatabaseString(bookIsbn), 1)
            .done();
    
    db.modify(sql);
   
    return true;
  }
  
  /* Modifica la quantita del libro nel carrello */
  public static boolean modifyBookQuantity(Database db, int userId, String bookIsbn, int quantity) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = sqlBuilder
          .update("ShoppingCart_book")
          .set("quantity = "+quantity)
          .where("user_id = "+userId)
          .and("book_isbn = "+Conversion.getDatabaseString(bookIsbn))
          .done();
    
    db.modify(sql);
    
    return true;
  }
  
  /* Rimuove il libro dal carrello */
  public static void removeFromCart(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = sqlBuilder
			.delete().from("ShoppingCart_book")
      .where("user_id = "+userId)
      .and("book_isbn = "+Conversion.getDatabaseString(bookIsbn))
      .done();
    
    db.modify(sql);
  }
  
  /* Recupera la lista delle coppie isbn-quantità dei libri nel carrello */
  public static List<Pair<String, Integer>> getBooks(Database db, int userId) throws RecoverableDBException {
    List<Pair<String, Integer>> books = new ArrayList<>();
    
    SqlBuilder sqlBuilder = new SqlBuilder();
		
		String sql = sqlBuilder
            .select("*")
            .from("ShoppingCart_book")
            .where("user_id = "+userId)
            .done();
              
		
		ResultSet resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
        String isbn = resultSet.getString("book_isbn");
        int quantity = resultSet.getInt("quantity");
        Pair<String, Integer> pair = new Pair(isbn, quantity);
        books.add(pair);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "ShoppingCartService", "getBooks", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("ShoppingCartService", "getBooks", ex.getMessage());}
		}
    
    return books;
  }
  
  private static boolean isBookInCart(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    boolean exist = false;
    
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = sqlBuilder
            .select("*")
            .from("ShoppingCart_book")
            .where("user_id = "+userId)
            .and("book_isbn = "+Conversion.getDatabaseString(bookIsbn))
            .done();
    
    ResultSet resultSet = db.select(sql);
    try {
      exist = resultSet.next();
      resultSet.close();
    } catch(SQLException e) {
      throw new RecoverableDBException(e, "ShoppingCartService", "isBookInCart", "Errore sul ResultSet.");
    }
    
    return exist;
  }
}
