
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
          .and("ISBN=" + Conversion.getDatabaseString(isbn))
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
      throw new RecoverableDBException(new SQLException(), "BookService", "insertNewBook()", "Tentativo di inserimento di un libro già esistente. Torna indetro e modifica l'ISBN.");
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
  
  /**
   * Restituisce tutti i libri che soddisfano la ricerca (base + filtri)
   * inoltre permette di specificare come ordinare i risultati, e quanti mostrarne
   * 
   * @throws RecoverableDBException 
   */
	public static List<Book> getBookList(Database db, String search, String[] authors,
			String[] publishers, String[] genres, int priceMin, int priceMax, int vote, String lang, boolean disp,
			String ord, int page, int booksPerPage) throws RecoverableDBException {
		
		ResultSet resultSet;
		List<Book> bookList = new ArrayList();
		
    SqlBuilder sqlBuilder = getBookSearchQuery(search, authors, publishers, genres, priceMin, priceMax, vote, lang, disp);
    
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
  
  /**
   * Restituisce il numero totale dei risultati della ricerca (base + filtri)
   * Serve per la divisione in pagine
   * 
   * @throws RecoverableDBException 
   */
  public static int getTotalResults(Database db, String search, String[] authors, String[] publishers, String[] genres, int priceMin, int priceMax, int vote, String lang, boolean disp) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
    int totResults = 0;
    
    String innerSql = getBookSearchQuery(search, authors, publishers, genres, priceMin, priceMax, vote, lang, disp).toString();
    
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
  
  /* Restituisce il numero di risultati della ricerca in base al range di prezzo */
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
  
  public static int[] getFilterVotes(Database db, String search, int[] voteFilters) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		int[] votes = new int[voteFilters.length];
    
    sqlBuilder
			.select("T.vote_range", "COUNT(*) AS n");
    
    String q = "(SELECT CASE";
    for(int i=0; i<voteFilters.length; i++) {
      float min = voteFilters[i]*0.01f;
      if(min < 0) min = 0;
      q += " WHEN vote >= "+min+" THEN "+i+" ";
    }
    q += "END AS vote_range FROM (SELECT vote FROM BookView WHERE title LIKE '%"+search+"%' OR isbn = '"+search+"') B) AS T";
    
    sqlBuilder.from(q)
      .command("GROUP BY").params("T.vote_range");
    
    resultSet = db.select(sqlBuilder.done());
    
		try {
			while (resultSet.next()) {
        int voteRange = resultSet.getInt("vote_range");
        Logger.debug(voteRange);
        int n = resultSet.getInt("n");
        votes[voteRange] = n;
        if(voteRange > 0) votes[voteRange] += votes[voteRange-1];
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "BookService", "getFilterVotes", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("BookService", "getFilterVotes", ex.getMessage());}
		}
    
    return votes;
  }
  
  /**
   * Query di ricerca completa (ricerca base + filtri)
   * 
   * @return 
   */
  private static SqlBuilder getBookSearchQuery(String search, String[] authors, String[] publishers, String[] genres, int priceMin, int priceMax, int vote, String lang, boolean disp) {
    SqlBuilder sqlBuilder = new SqlBuilder();
    
		sqlBuilder
			.selectDistinct("isbn", "title", "price", "language", "publisher_name", "publication_date", "stock", "vote", "n_votes", "coverUri")
			.from("BookView")
      .join("BookAuthor").as("B_A").on("B_A.book_isbn = isbn")
      .join("BookGenre").as("B_G").on("B_G.book_isbn = isbn")
			.where("title LIKE '%"+search+"%' OR isbn = '"+search+"'");
		
    if(authors != null) {
      if(authors.length==1 && authors[0].equals("")) {
      } else {
        String authorsCondition = "";
        authorsCondition += " a_name = "+Conversion.getDatabaseString(authors[0]);
        for(int i=1; i<authors.length; i++) {
          authorsCondition += " OR a_name = "+Conversion.getDatabaseString(authors[i]);
        }
        sqlBuilder.and(authorsCondition);
      }
    }
		
    if(publishers != null) {
      if(publishers.length==1 && publishers[0].equals("")) {
      } else {
        String publishersCondition = "";
        publishersCondition += " publisher_name = "+Conversion.getDatabaseString(publishers[0]);
        for(int i=1; i<publishers.length; i++) {
          publishersCondition += " OR publisher_name = "+Conversion.getDatabaseString(publishers[i]);
        }
        sqlBuilder.and(publishersCondition);
      }
    }
		
    if(genres != null) {
      if(genres.length==1 && genres[0].equals("")) {
      } else {
        String genresCondition = "";
        genresCondition += " g_name = "+Conversion.getDatabaseString(genres[0]);
        for(int i=1; i<genres.length; i++) {
          genresCondition += " OR g_name = "+Conversion.getDatabaseString(genres[i]);
        }
        sqlBuilder.and(genresCondition);
      }
    }
    
    if(priceMin == -1) priceMin = 0;
    if(priceMax == -1) priceMax = 999999;
    String priceCondition = " price BETWEEN "+priceMin+ " AND " + priceMax;
    sqlBuilder.and(priceCondition);
    
    if(vote >= 0) {
      if(vote > 100) vote = 100;
      float vMin = vote*0.01f;
      String voteCondition = " vote >= "+vMin;
      sqlBuilder.and(voteCondition);
    }
    
    if(!lang.equals("all")) {
      String langCondition = " language ";
      if(lang.equals("it")) {
        langCondition += "= 'italiano'";
      } else if(lang.equals("st")) {
        langCondition += "!= 'italiano'";
      }
      sqlBuilder.and(langCondition);
    }
    
    if(disp) {
      sqlBuilder.and("stock > 0");
    }
    
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
