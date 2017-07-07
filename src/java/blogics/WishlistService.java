
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

public class WishlistService {
  
  /* Aggiunge il libro nella wishlist dell'utente */
  /* Resituisce true se l'operzione ha successo, false se fallisce (es. c'è gia quel libro nella wishlist */
  public static boolean addToWishlist(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    
    if(isBookInWishlist(db, userId, bookIsbn)) return false;
    
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = sqlBuilder
            .insertInto("wishlist_book", "user_id", "book_isbn")
            .values(userId, Conversion.getDatabaseString(bookIsbn))
            .done();
    
    db.modify(sql);
   
    return true;
  }
  
  /* Rimuove il libro dalla wishlist */
  public static void removeFromWishlist(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = sqlBuilder
			.delete().from("wishlist_book")
      .where("user_id = "+userId)
      .and("book_isbn = "+Conversion.getDatabaseString(bookIsbn))
      .done();
    
    db.modify(sql);
  }
  
  /* Recupera la lista degli isbn dei libri nella lista desideri dell'utente */
  public static List<String> getBooks(Database db, int userId) throws RecoverableDBException {
    List<String> books = new ArrayList<>();
    
    SqlBuilder sqlBuilder = new SqlBuilder();
		
		String sql = sqlBuilder
            .select("*")
            .from("wishlist_book")
            .where("user_id = "+userId)
            .done();
              
		
		ResultSet resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
        String isbn = resultSet.getString("book_isbn");
        books.add(isbn);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "WishlistService", "getBooks", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("WishlistService", "getBooks", ex.getMessage());}
		}
    
    return books;
  }
  
  private static boolean isBookInWishlist(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    boolean exist = false;
    
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql = sqlBuilder
            .select("*")
            .from("wishlist_book")
            .where("user_id = "+userId)
            .and("book_isbn = "+Conversion.getDatabaseString(bookIsbn))
            .done();
    
    ResultSet resultSet = db.select(sql);
    try {
      exist = resultSet.next();
      resultSet.close();
    } catch(SQLException e) {
      throw new RecoverableDBException(e, "WishlistService", "isBookInWishlist", "Errore sul ResultSet.");
    }
    
    return exist;
  }
}
