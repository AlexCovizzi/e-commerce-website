
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import services.database.Database;
import services.database.exception.*;
import util.Conversion;
import util.Logger;
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
  
	public static List<Book> getBookList(Database db, String isbn, String title, String[] authors,
			String[] publishers, String[] genres, String[] priceRange, String[] voteRange,
			String order, int page, int booksPerPage) throws RecoverableDBException {
		
		SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		ResultSet resultSet;
		List<Book> bookList = new ArrayList();
		
		/*
		sqlBuilder
			.select("*")
			.from("Book").as("B")
			.join("Book_has_Author").as("B_A").on("B_A.book_isbn = B.isbn")
			.join("Author").as("A").on("A.id = B_A.author_id")
			.join("Book_has_Genre").as("B_G").on("B_G.book_isbn = B.isbn")
			.join("Genre").as("G").on("G.id = B_G.genre_id")
			.where("B.fl_active = 'S'");
		*/
		sqlBuilder
			.select("title").from("BookView")
			.where("isbn LIKE '%"+isbn+"%'")
			.and("title LIKE '%"+title+"%'");
		
		String authorsCondition = "";
		authorsCondition += " a_name LIKE '%"+authors[0]+"%'";
		for(int i=1; i<authors.length; i++) {
			authorsCondition += " OR a_name LIKE '%"+authors[i]+"%'";
		}
		
		String publishersCondition = "";
		publishersCondition += " publisher LIKE '%"+publishers[0]+"%'";
		for(int i=1; i<publishers.length; i++) {
			authorsCondition += " OR publisher LIKE '%"+publishers[i]+"%'";
		}
		
		String genresCondition = "";
		genresCondition += " g_name LIKE '%"+genres[0]+"%'";
		for(int i=1; i<genres.length; i++) {
			genresCondition += " OR g_name LIKE '%"+genres[i]+"%'";
		}
		
		// TODO: manca il price range, il vote range e l'ordine
		
		sqlBuilder
			.and(authorsCondition)
			.and(publishersCondition)
			.and(genresCondition);
		
		sqlBuilder
			.limit(booksPerPage, booksPerPage*page-booksPerPage);
		
		sql = sqlBuilder.done();
		
		Logger.debug("UserService", "getUser", sql);
		
		resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
				Book book = new Book(resultSet);
				bookList.add(book);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
		
		return bookList;
	}
}
