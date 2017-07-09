/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.Pair;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */
public class GenreService {
  public GenreService() { }
  
  /**
   * Restituisce la lista di tutti i generi
   * @param database
   * @return 
   */
  public static List<Genre> getAll(Database database) throws RecoverableDBException {
    List<Genre> genres = new ArrayList<>();
    SqlBuilder sqlBuilder = new SqlBuilder();

    String sql = sqlBuilder
        .select("*")
        .from("Genre")
        .where("fl_active='S'")
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    try {
      while(resultSet.next()) {
        Genre genre = new Genre(resultSet);
        genres.add(genre);
      }
    } catch (SQLException e) {
      throw new RecoverableDBException(e, "GenreService", "getAll", "Errore sul ResultSet.");
    }
    
    return genres;
  }
  
  public static int[] getIds(Database database, String[] generi)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    int[] ids = new int[generi.length];
    
    System.out.println("----- GenreService: getIds -----");
    /* Costruisco il vettore contenenti gli di dei generi */
    for(int i = 0; i < generi.length; i++)
    {
      System.out.println("Genere " + i + ": " + generi[i]);
      sql = sqlBuilder
          .select("*")
          .from("genre")
          .where("fl_active='S'")
            .and("name = " + Conversion.getDatabaseString(generi[i]))
          .done();

      ResultSet resultSet = database.select(sql);
      System.out.println("Select eseguita");
      
      try {
        resultSet.next();
        System.out.println("Il resultSet ha un elemento: " + resultSet);
        //Genre genre = new Genre(resultSet);
        //ids[i] = genre.getId();
        ids[i] = resultSet.getInt("id");
        
        System.out.println("Generi " + i + " inserito! Ho trovato l'id = " + ids[i]);
        
        resultSet.close();
      } catch (SQLException e) {
        System.out.println("----- GenreService: getIds - ERRORE -----");
        throw new RecoverableDBException("GenreService: getIds(): Errore sul ResultSet.");
      }
    }
    System.out.println("----- GenreService: getIds - FINE -----");
    return ids;
  }
  
  public static String[] getGeneri(Database database)
      throws RecoverableDBException{
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    Vector<String> generi = new Vector<String>();
    String genere;
    
    sql = sqlBuilder
        .select("name")
        .from("genre")
        .where("fl_active='S'")
        .done();

    ResultSet resultSet = database.select(sql);

    try {
      while (resultSet.next()) {
        genere = resultSet.getString("name");
        generi.add(genere);
      }
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("GenreService: getGeneri(): Errore sul ResultSet.");
    }
    
    String[] risultato = new String[generi.size()];
    generi.copyInto(risultato);
    
    return risultato;
  }
  
  public static String getGenreFromId(Database database, int id)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    sql = sqlBuilder
        .select("name")
        .from("genre")
        .where("fl_active = 'S'")
          .and("id = " + id)
        .done();
    
    String nome = null;
    ResultSet resultSet = database.select(sql);
    
     try {
      if(resultSet.next())
        nome = resultSet.getString("name");
      
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("GenreService: getGenreFromId(): Errore sul ResultSet.");
    }
    
    return nome;
  }
  
  /**
   * Restituisce tutti i generi del libro specificato
   * @param db
   * @param isbn
   * @return
   * @throws RecoverableDBException 
   */
	public static List<Genre> getBookGenres(Database db, String isbn) throws RecoverableDBException {
		SqlBuilder sqlBuilder = new SqlBuilder();
		List<Genre> genres = new ArrayList<>();

		String sql = sqlBuilder
				.select("id", "name")
				.from("Genre")
				.join("Book_has_Genre").on("book_isbn = "+isbn)
				.where("id = genre_id").and("fl_active = 'S'")
				.done();

		ResultSet resultSet = db.select(sql);

		try {
			while(resultSet.next()) {
				Genre genre = new Genre(resultSet);
				genres.add(genre);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "GenreService", "getBookGenres", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("GenreService", "getBookGenres", ex.getMessage());}
		}

		return genres;
	}
  
  public static void insertGenreOfBook(Database database, String bookIsbn, int genere)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità non necessario: questa funzione è sempre chiamata dopo BookService.insertNewBook()
       che si occupa di fare un check sull'unicità: quindi se il libro non è presente, non può essere presente
       nemmeno una riga in quest tabella corrisponedente a tale libro! */	
    
    /* Inserisco una riga nella tabella per ogni genere selzionato */
    sql = sqlBuilder
        .insertInto("Book_has_genre", "book_isbn", "genre_id")
        .values(
            Conversion.getDatabaseString(bookIsbn),
            genere)
        .done();

    database.modify(sql);
  }
  
  public static void deleteGenreOfBook(Database database, String isbn, int idGenere)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    sql = sqlBuilder
        .delete("")
        .from("book_has_genre")
        .where("book_isbn = " + Conversion.getDatabaseString(isbn))
          .and("genre_id = " + idGenere)
        .done();
    
    database.modify(sql);
  }
  
  /*
    Restituisce i 5 generi con piu occorrenze nella ricerca effettuata
    Serve per scrivere i filtri nella pagina di ricerca
  */
  public static List<Pair<String, Integer>> getSearchGenres(Database db, String search) throws RecoverableDBException {
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
			throw new RecoverableDBException(ex, "GenreService", "getSearchGenre", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("GenreService", "getSearchGenre", ex.getMessage());}
		}
    
    return genres;
  }
}
