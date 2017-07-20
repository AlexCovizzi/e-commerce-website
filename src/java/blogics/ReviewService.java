
package blogics;

import bflows.SearchManagement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.SqlBuilder;

public class ReviewService {
  
  public static void insertReview(Database db, int userId, String isbn, boolean thumbUp, String comment)
          throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql;
    
    sql = sqlBuilder
			.insertInto("Vote", "user_id", "book_isbn", "thumb_up", "comment")
			.values(
					userId,
					Conversion.getDatabaseString(isbn),
          thumbUp,
          Conversion.getDatabaseString(comment))
			.done();
    
    db.modify(sql);
  }
  
  public static void editReview(Database db, int userId, String isbn, boolean thumbUp, String comment)
          throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql;
    
    sql = sqlBuilder
			.update("Vote")
      .set("thumb_up = "+thumbUp, "comment = "+Conversion.getDatabaseString(comment), "timestamp_c = DEFAULT")
      .where("user_id = "+userId)
        .and("book_isbn = "+Conversion.getDatabaseString(isbn))
      .done();
    
    db.modify(sql);
  }
  
  public static void removeReview(Database db, int userId, String isbn)
          throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    String sql;
    
    sql = sqlBuilder
			.delete().from("Vote")
      .where("user_id = "+userId)
        .and("book_isbn = "+Conversion.getDatabaseString(isbn))
      .done();
    
    System.out.println(sql);
    
    db.modify(sql);
  }
  
  /**
   * Restituisce tutte le recensioni di un libro che hanno un commento non vuoto
   * @param db
   * @param bookIsbn
   * @return
   * @throws RecoverableDBException 
   */
  public static List<Review> getBookReviews(Database db, String bookIsbn) throws RecoverableDBException {
    List<Review> reviews = new ArrayList<>();
    SqlBuilder sqlBuilder = new SqlBuilder();
		
		String sql = sqlBuilder
            .select("*")
            .from("Vote V")
            .join("User U").on("U.id = user_id").and("U.fl_active = 'S'")
            .where("V.book_isbn ="+Conversion.getDatabaseString(bookIsbn))
              .and("V.comment IS NOT NULL")
              .and("V.fl_active = 'S'")
            .orderBy("V.timestamp_c DESC")
            .done();
              
		
		ResultSet resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
				Review review = new Review(resultSet);
				reviews.add(review);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "ReviewService", "getBookReviews", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("ReviewService", "getBookReviews", ex.getMessage());}
		}
		
		return reviews;
  }
  
  /**
   * Restituisce la recensione dell'utente per il libro specificato
   * 
   * @param db
   * @param userId
   * @param bookIsbn
   * @return La review dell'utente (può essere null)
   * @throws RecoverableDBException 
   */
  public static Review getUserBookReview(Database db, int userId, String bookIsbn) throws RecoverableDBException {
    Review review = null;
    SqlBuilder sqlBuilder = new SqlBuilder();
		
		String sql = sqlBuilder
            .select("*")
            .from("Vote V")
            .where("V.book_isbn ="+Conversion.getDatabaseString(bookIsbn))
              .and("V.user_id = "+userId)
            .done();
		
		ResultSet resultSet = db.select(sql);
    
		try {
			if (resultSet.next()) {
				review = new Review(resultSet);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "ReviewService", "getUserBookReview", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("ReviewService", "getUserBookReview", ex.getMessage());}
		}
		
		return review;
  }
  
  public static int countVotes(Database database, int userId, boolean contaVuote)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    int risultato;
    
    sqlBuilder = sqlBuilder
				.select("count(*)").as("N")
				.from("Vote");
    
    /* Conta il numero di recensioni di un utente */
    if(userId > 0 && contaVuote)
      sqlBuilder = sqlBuilder
          .where("user_id = " + userId);
    /* Conta il numero di recensioni totali con commenti non vuoti */
    else if(userId > 0 && !contaVuote)
      sqlBuilder = sqlBuilder
          .where("user_id = " + userId)
            .and("comment != 'null'");
    else if(userId < 0 && !contaVuote)
      sqlBuilder = sqlBuilder
          .where("comment != 'null'");
    
    sql = sqlBuilder.done();
    
    System.out.println(sql);
    
    ResultSet resultSet = database.select(sql);

    try {
			resultSet.next();
      risultato = resultSet.getInt("N");
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "VoteService", "countVotes", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("VoteService", "countVotes", ex.getMessage());}
		}
    
		return risultato;
  }
  
  public static List<Review> getReviews(Database database, int userId, int limit, int offset)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    List<Review> recensioni = new ArrayList<>();
    
    sqlBuilder = sqlBuilder
				.select("*")
				.from("VoteView")
        .where("comment IS NOT NULL");
    
    if(userId > 0)
      sqlBuilder = sqlBuilder
          .and("user_id = " + userId);
        
    sql = sqlBuilder
        .orderBy("surname, name")
        .limit(limit).offset(offset)
        .done();
    
    System.out.println(sql);
    
    ResultSet resultSet = database.select(sql);
    
    try {
			while(resultSet.next()) {
				Review recensione = new Review(resultSet);
				recensioni.add(recensione);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "ReviewService", "getReviews", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("ReviewService", "getReviews", ex.getMessage());}
		}

		return recensioni;
  }
}
