
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import services.database.Database;
import services.database.exception.*;
import util.Conversion;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */

public class BookService {
  
  public BookService() { }
  
  public static void insertNewBook(Database db, String title, String description, int pages, float price,
      String publication_date, int stock, String isbn, String language, String publisher)
      throws RecoverableDBException
  {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità */

    sql = sqlBuilder
        .select("isbn")
        .from("book")
        .where("fl_active='S'")
          .and("title=" + Conversion.getDatabaseString(title))
          .and("ISBN=" + Conversion.getDatabaseString(isbn))
          .and("publisher=" + Conversion.getDatabaseString(publisher))
        .done();
	
	
    
    ResultSet resultSet = db.select(sql);
    
    boolean exist = false;
    
    try {
      exist = resultSet.next();
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("BookService: insertNewBook(): Errore sul ResultSet.");
    }
    
    if (exist) {
      throw new RecoverableDBException("BookService: insertNewBook(): Tentativo di inserimento di un libro già esistente.");
    }
    
    /* Inserimento */	
    
    sql = sqlBuilder
			.insertInto("book", "title", "description", 
					"pages", "price", "publication_date", "stock",
					"isbn", "language", "publisher", "timestamp")
			.values(Conversion.getDatabaseString(title),
					Conversion.getDatabaseString(description),
          pages,
					price,
					Conversion.getDatabaseString(publication_date),
					stock,
					Conversion.getDatabaseString(isbn),
					Conversion.getDatabaseString(language),
					Conversion.getDatabaseString(publisher),
					"DEFAULT")
			.done();
    
    db.modify(sql);
  }
}
