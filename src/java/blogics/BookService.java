
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
  
  public static void insertNewBook(Database db, String title, String description, int pages, float price,
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
			.insertInto("book", "title", "description", 
					"pages", "price", "publication_date", "stock",
					"isbn", "language", "publisher_id", "timestamp")
			.values(Conversion.getDatabaseString(title),
					Conversion.getDatabaseString(description),
          pages,
					price,
					publication_date,
					stock,
					Conversion.getDatabaseString(isbn),
					Conversion.getDatabaseString(language),
					publisher,
					"DEFAULT")
			.done();
    
    db.modify(sql);
  }
  
  public static void updateBook(Database database, String title, String description, int pages, float price,
      String publication_date, int stock, String isbn, String language, int publisher)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità non necessario: l'isbn è fisso */
    /* Aggiornamento */	
    sql = sqlBuilder
			.update("book")
      .set(
          "title = " + Conversion.getDatabaseString(title),
          "description = " + Conversion.getDatabaseString(description), 
					"pages = " + pages,
          "price = " + price,
          "publication_date = " + publication_date,
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
      if(resultSet.next())
        book = new Book(resultSet);
      
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("BookService: getBookFromIsbn(): Errore sul ResultSet.");
    }
    
    return book;
  }
  
	public static List<Book> getBookList(Database db, String search, String[] authors,
			String[] publishers, String[] genres, int[] prices, int[] votes,
			String ord, int page, int booksPerPage) throws RecoverableDBException {
		
		SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		ResultSet resultSet;
		List<Book> bookList = new ArrayList();
		
		sqlBuilder
			.selectDistinct("isbn", "title", "price", "publisher_name", "stock", "vote", "n_votes", "coverUri", "timestamp")
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
      publishersCondition += " publisher = "+Conversion.getDatabaseString(publishers[0]);
      for(int i=1; i<publishers.length; i++) {
        publishersCondition += " OR publisher = "+Conversion.getDatabaseString(publishers[i]);
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
    
    if(prices != null) {
      String pricesCondition = "";
      pricesCondition += " price BETWEEN "+SearchManagement.PRICE_RANGE_OPTIONS[prices[0]].getSecond()+ " AND " + SearchManagement.PRICE_RANGE_OPTIONS[prices[0]].getThird();
      for(int i=1; i<prices.length; i++) {
        pricesCondition += " OR price BETWEEN "+SearchManagement.PRICE_RANGE_OPTIONS[prices[i]].getSecond()+ " AND " + SearchManagement.PRICE_RANGE_OPTIONS[prices[i]].getThird();
      }
      sqlBuilder.and(pricesCondition);
    }
    
    if(votes != null) {
      String votesCondition = "";
      votesCondition += " vote BETWEEN "+SearchManagement.VOTE_RANGE_OPTIONS[votes[0]].getSecond()+ " AND " + SearchManagement.VOTE_RANGE_OPTIONS[votes[0]].getThird();
      for(int i=1; i<votes.length; i++) {
        votesCondition += " OR vote BETWEEN "+SearchManagement.VOTE_RANGE_OPTIONS[votes[i]].getSecond()+ " AND " + SearchManagement.VOTE_RANGE_OPTIONS[votes[i]].getThird();
      }
      sqlBuilder.and(votesCondition);
    }
		
		sqlBuilder
      .orderBy(ord)
			.limit(booksPerPage, booksPerPage*page-booksPerPage);
		
		sql = sqlBuilder.done();
		
		Logger.debug("BookService", "getUser", sql);
		
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
  
  public static int getTotalResults(Database db, String search) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
    int totResults = 0;
    
    String sql = sqlBuilder
			.selectDistinct("isbn")
			.from("BookView")
      .join("BookAuthor").as("B_A").on("B_A.book_isbn = isbn")
      .join("BookGenre").as("B_G").on("B_G.book_isbn = isbn")
			.where("title LIKE '%"+search+"%' OR isbn = '"+search+"'")
      .done();
    
    resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
        totResults += 1;
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
    
    return totResults;
  }
  
  public static List<Pair<String, Integer>> getFilterGenres(Database db, String search) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		List<Pair<String, Integer>> genres = new ArrayList();
    
    String sql = sqlBuilder
			.select("g_name", "COUNT(*) AS n")
			.from("BookView")
      .join("BookGenre").on("book_isbn = isbn")
			.where("title LIKE '%"+search+"%' OR isbn = '"+search+"'")
      .command("GROUP BY").params("g_name")
      .command("ORDER BY").params("n").command("DESC")
      .limit(5)
      .done();
    
    resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
        String genre = resultSet.getString("g_name");
        int n = resultSet.getInt("n");
        Pair<String, Integer> gen = new Pair(genre, n);
				genres.add(gen);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
    
    return genres;
  }
  
  public static List<Pair<String, Integer>> getFilterAuthors(Database db, String search) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		List<Pair<String, Integer>> authors = new ArrayList();
    
    String sql = sqlBuilder
			.select("a_name", "COUNT(*) AS n")
			.from("BookView")
      .join("BookAuthor").on("book_isbn = isbn")
			.where("title LIKE '%"+search+"%' OR isbn = '"+search+"'")
      .command("GROUP BY").params("a_name")
      .command("ORDER BY").params("n").command("DESC")
      .limit(5)
      .done();
    
    resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
        String author = resultSet.getString("a_name");
        int n = resultSet.getInt("n");
        Pair<String, Integer> aut = new Pair(author, n);
				authors.add(aut);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
    
    return authors;
  }
  
  public static List<Pair<String, Integer>> getFilterPublishers(Database db, String search) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		List<Pair<String, Integer>> publishers = new ArrayList();
    
    String sql = sqlBuilder
			.select("publisher", "COUNT(*) AS n")
			.from("BookView")
			.where("title LIKE '%"+search+"%' OR isbn = '"+search+"'")
      .command("GROUP BY").params("publisher_name")
      .command("ORDER BY").params("n").command("DESC")
      .limit(5)
      .done();
    
    resultSet = db.select(sql);
    
		try {
			while (resultSet.next()) {
        String publisher = resultSet.getString("publisher_name");
        int n = resultSet.getInt("n");
        Pair<String, Integer> pub = new Pair(publisher, n);
				publishers.add(pub);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
    
    
    return publishers;
  }
  
  public static int[] getFilterPrices(Database db, String search, Triplet<String, Float, Float>[] priceOptions) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		int[] prices = new int[SearchManagement.PRICE_RANGE_OPTIONS.length];
    
    sqlBuilder
			.select("T.price_range", "COUNT(*) AS n");
    
    String q = "(SELECT CASE ";
    for(int i=0; i<priceOptions.length; i++) {
      Triplet option = priceOptions[i];
      q += "WHEN price BETWEEN "+option.getSecond()+" AND "+ option.getThird()+" THEN "+i+" ";
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
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
    
    return prices;
  }
  
  public static int[] getFilterVotes(Database db, String search, Triplet<String, Float, Float>[] voteOptions) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		int[] votes = new int[SearchManagement.PRICE_RANGE_OPTIONS.length];
    
    sqlBuilder
			.select("T.vote_range", "COUNT(*) AS n");
    
    String q = "(SELECT CASE ";
    for(int i=0; i<voteOptions.length; i++) {
      Triplet option = voteOptions[i];
      q += "WHEN vote BETWEEN "+option.getSecond()+" AND "+ option.getThird()+" THEN "+i+" ";
    }
    q += "END AS vote_range FROM (SELECT vote FROM BookView WHERE title LIKE '%"+search+"%' OR isbn = '"+search+"') B) AS T";
    
    sqlBuilder.from(q)
      .command("GROUP BY").params("T.vote_range");
    
    resultSet = db.select(sqlBuilder.done());
    
		try {
			while (resultSet.next()) {
        int priceRange = resultSet.getInt("vote_range");
        int n = resultSet.getInt("n");
        votes[priceRange] = n;
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
    
    return votes;
  }
}
