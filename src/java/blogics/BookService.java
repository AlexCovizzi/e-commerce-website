
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
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
  
  public static Book getBookFromIsbn(Database database, String isbn)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    sql = sqlBuilder
        .select("*")
        .from("book")
        .where("fl_active = 'S'")
          .and("ISBN = " + Conversion.getDatabaseString(isbn))
        .done();
    
    Book libro = null;
    ResultSet resultSet = database.select(sql);
    
     try {
      if(resultSet.next())
        libro = new Book(resultSet);
      
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("BookService: getBookFromIsbn(): Errore sul ResultSet.");
    }
    
    return libro;
  }
  
  public static void updateBook(Database database, String title, String description, int pages, float price,
      String publication_date, int stock, String isbn, String language, String publisher)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità non necessario: l'isbn è fisso */
    /* Aggiornamento */	
    System.out.println("Ciao! Sono una linea di prova!");
    sql = sqlBuilder
			.update("book")
      .set(
          "title = " + Conversion.getDatabaseString(title),
          "description = " + Conversion.getDatabaseString(description), 
					"pages = " + pages,
          "price = " + price,
          "publication_date = " + Conversion.getDatabaseString(publication_date),
          "stock = " + stock,
          "language = " + Conversion.getDatabaseString(language),
          "publisher = " + Conversion.getDatabaseString(publisher))
			.where("isbn = " + Conversion.getDatabaseString(isbn))
        .and("fl_active = 'S'")
			.done();
    
    database.modify(sql);
    System.out.println("Libro modificato!");
  }
}
