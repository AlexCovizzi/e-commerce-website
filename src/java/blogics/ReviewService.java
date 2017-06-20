
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
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
		
		return reviews;
  }
}
