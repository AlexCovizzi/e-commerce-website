
package blogics;

import bflows.SearchManagement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Pair;
import services.database.Database;
import services.database.exception.*;
import util.Conversion;
import util.Logger;
import util.SqlBuilder;
import util.Triplet;

/**
 *
 * @author alemo
 */

public class BookService {
  
  public BookService() { }
  
  public static void insertNewBook(Database db, String cover, String title, String description, int pages, float price,
      String publication_date, int stock, String isbn, String language, int publisher)
      throws RecoverableDBException
  {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità */
    System.out.println("Check di unicità");
    sql = sqlBuilder
        .select("isbn")
        .from("book")
        .where("fl_active='S'")
          .and("title=" + Conversion.getDatabaseString(title))
          .and("ISBN=" + Conversion.getDatabaseString(isbn))
          .and("publisher_id=" + publisher)
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
    System.out.println("Inserimento del libro...");
    sql = sqlBuilder
			.insertInto("book", "coverURI", "title", "description", 
					"pages", "price", "publication_date", "stock",
					"isbn", "language", "publisher_id", "timestamp")
			.values(Conversion.getDatabaseString(cover),
          Conversion.getDatabaseString(title),
					Conversion.getDatabaseString(description),
          pages,
					price,
					Conversion.getDatabaseString(publication_date),
					stock,
					Conversion.getDatabaseString(isbn),
					Conversion.getDatabaseString(language),
					publisher,
					"DEFAULT")
			.done();
    
    System.out.println(sql);
    
    db.modify(sql);
  }
  
  public static void updateBook(Database database, String cover, String title, String description, int pages, float price,
      String publication_date, int stock, String isbn, String language, int publisher)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità non necessario: l'isbn è fisso */
    /* Aggiornamento */	
    sql = sqlBuilder
			.update("book")
      .set(
          "coverURI = " + Conversion.getDatabaseString(cover),
          "title = " + Conversion.getDatabaseString(title),
          "description = " + Conversion.getDatabaseString(description), 
					"pages = " + pages,
          "price = " + price,
          "publication_date = " + Conversion.getDatabaseString(publication_date),
          "stock = " + stock,
          "language = " + Conversion.getDatabaseString(language),
          "publisher_id = " + publisher)
			.where("isbn = " + Conversion.getDatabaseString(isbn))
        .and("fl_active = 'S'")
			.done();
    
    database.modify(sql);
    System.out.println("Libro modificato!");
  }
  
  public static Book getBookFromIsbn(Database database, String isbn)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    sql = sqlBuilder
        .selectDistinct("*")
        .from("BookView")
        .where("isbn = "+Conversion.getDatabaseString(isbn))
        .done();
    
    Book book = null;
    ResultSet resultSet = database.select(sql);
    
     try {
      if(resultSet.next()) {
        book = new Book(resultSet);
      }
      
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("BookService: getBookFromIsbn(): Errore sul ResultSet.");
    }
    
    return book;
  }
  
	public static List<Book> getBookList(Database db, String search, String[] authors,
			String[] publishers, String[] genres, int priceMin, int priceMax,
			String ord, int page, int booksPerPage) throws RecoverableDBException {
		
		ResultSet resultSet;
		List<Book> bookList = new ArrayList();
		
    SqlBuilder sqlBuilder = getBookSearchQuery(search, authors, publishers, genres, priceMin, priceMax);
    
		sqlBuilder
      .orderBy(ord)
			.limit(booksPerPage, booksPerPage*page-booksPerPage);
		
		String sql = sqlBuilder.done();
		
		resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
				Book book = new Book(resultSet);
				bookList.add(book);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "BookService", "getBookList", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("BookService", "getBookList", ex.getMessage());}
		}
		
		return bookList;
	}
  
  public static int getTotalResults(Database db, String search, String[] authors, String[] publishers, String[] genres, int priceMin, int priceMax) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
    int totResults = 0;
    
    String innerSql = getBookSearchQuery(search, authors, publishers, genres, priceMin, priceMax).toString();
    
    String sql = sqlBuilder
			.select("COUNT(*) AS n")
      .from("("+innerSql+") AS inner_sql")
      .done();
    
    resultSet = db.select(sql);
    
		try {
			if (resultSet.next()) {
        totResults = resultSet.getInt("n");
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "BookService", "getTotalResults", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("BookService", "getTotalResults", ex.getMessage());}
		}
    
    return totResults;
  }
  
  /* Restituisce il numero di occorrenze in base al range di prezzo */
  public static int[] getFilterPrices(Database db, String search, int[][] priceRangeOptions) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		int[] prices = new int[priceRangeOptions[0].length];
    
    sqlBuilder
			.select("T.price_range", "COUNT(*) AS n");
    
    String q = "(SELECT CASE ";
    for(int i=0; i<priceRangeOptions[0].length; i++) {
      int min = priceRangeOptions[0][i]; if(min < 0) min = 0;
      int max = priceRangeOptions[1][i]; if(max < 0) max = 999999;
      q += "WHEN price BETWEEN "+min+" AND "+ max+" THEN "+i+" ";
    }
    q += "END AS price_range FROM (SELECT price FROM BookView WHERE title LIKE '%"+search+"%' OR isbn = '"+search+"') B) AS T";
    
    sqlBuilder.from(q)
      .command("GROUP BY").params("T.price_range");
    
    resultSet = db.select(sqlBuilder.done());
    
		try {
			while (resultSet.next()) {
        int priceRange = resultSet.getInt("price_range");
        int n = resultSet.getInt("n");
        prices[priceRange] = n;
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "BookService", "getFilterPrices", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("BookService", "getFilterPrices", ex.getMessage());}
		}
    
    return prices;
  }
  
  public static int[] getFilterVotes(Database db, String search, float[][] voteRangeOptions) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		int[] votes = new int[voteRangeOptions.length];
    
    sqlBuilder
			.select("T.vote_range", "COUNT(*) AS n");
    
    String q = "(SELECT CASE ";
    for(int i=0; i<voteRangeOptions.length; i++) {
      q += "WHEN vote BETWEEN "+voteRangeOptions[i][0]+" AND "+ voteRangeOptions[i][1]+" THEN "+i+" ";
    }
    q += "END AS vote_range FROM (SELECT vote FROM BookView WHERE title LIKE '%"+search+"%' OR isbn = '"+search+"') B) AS T";
    
    sqlBuilder.from(q)
      .command("GROUP BY").params("T.vote_range");
    
    resultSet = db.select(sqlBuilder.done());
    
		try {
			while (resultSet.next()) {
        int voteRange = resultSet.getInt("vote_range");
        int n = resultSet.getInt("n");
        votes[voteRange] = n;
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "BookService", "getFilterVotes", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("BookService", "getFilterVotes", ex.getMessage());}
		}
    
    return votes;
  }
  
  /* Query di ricerca completa (ricerca base + filtri) */
  private static SqlBuilder getBookSearchQuery(String search, String[] authors, String[] publishers, String[] genres, int priceMin, int priceMax) {
    SqlBuilder sqlBuilder = new SqlBuilder();
    
		sqlBuilder
			.selectDistinct("isbn", "title", "price", "publisher_name", "publication_date", "stock", "vote", "n_votes", "coverUri")
			.from("BookView")
      .join("BookAuthor").as("B_A").on("B_A.book_isbn = isbn")
      .join("BookGenre").as("B_G").on("B_G.book_isbn = isbn")
			.where("title LIKE '%"+search+"%' OR isbn = '"+search+"'");
		
    if(authors != null) {
      String authorsCondition = "";
      authorsCondition += " a_name = "+Conversion.getDatabaseString(authors[0]);
      for(int i=1; i<authors.length; i++) {
        authorsCondition += " OR a_name = "+Conversion.getDatabaseString(authors[i]);
      }
      sqlBuilder.and(authorsCondition);
    }
		
    if(publishers != null) {
      String publishersCondition = "";
      publishersCondition += " publisher_name = "+Conversion.getDatabaseString(publishers[0]);
      for(int i=1; i<publishers.length; i++) {
        publishersCondition += " OR publisher_name = "+Conversion.getDatabaseString(publishers[i]);
      }
      sqlBuilder.and(publishersCondition);
    }
		
    if(genres != null) {
      String genresCondition = "";
      genresCondition += " g_name = "+Conversion.getDatabaseString(genres[0]);
      for(int i=1; i<genres.length; i++) {
        genresCondition += " OR g_name = "+Conversion.getDatabaseString(genres[i]);
      }
      sqlBuilder.and(genresCondition);
    }
    
    if(priceMin == -1) priceMin = 0;
    if(priceMax == -1) priceMax = 999999;
    String priceCondition = " price BETWEEN "+priceMin+ " AND " + priceMax;
    sqlBuilder.and(priceCondition);
    
    return sqlBuilder;
  }
  
  public static boolean substractToStock(Database database, String isbn, int quantitaComprata)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    ResultSet resultSet;
    
    /* Controllo che la quantità sia minore dello stock */
    sql = sqlBuilder
        .select("stock")
        .from("book")
        .where("fl_active='S'")
          .and("ISBN=" + Conversion.getDatabaseString(isbn))
        .done();
    
    resultSet = database.select(sql);
    try {
			if (resultSet.next()) {
        int stock = resultSet.getInt("stock");
        
        if(quantitaComprata > stock)
          return false;
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "BookService", "substractToStock", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("BookService", "substractToStock", ex.getMessage());}
		}
    
    /* Aggiornamento */	
    sql = sqlBuilder
			.update("book")
      .set("stock = stock - " + quantitaComprata)
			.where("isbn = " + Conversion.getDatabaseString(isbn))
        .and("fl_active = 'S'")
			.done();
    
    database.modify(sql);
    
    return true;
  }
  
  public static void removeBook(Database database, String isbn)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità non necessario: l'isbn è fisso */
    /* Aggiornamento */	
    sql = sqlBuilder
			.update("book")
      .set("fl_active = 'N'")
			.where("isbn = " + Conversion.getDatabaseString(isbn))
			.done();
    
    database.modify(sql);
  }
}
