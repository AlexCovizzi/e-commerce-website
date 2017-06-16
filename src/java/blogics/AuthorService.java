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
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */
public class AuthorService {
  
  public AuthorService() { }
  
  public static int searchFromName(Database database, String nome)
    throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    /* Cerco l'autore con il nome passato come parametro */
    sql = sqlBuilder
        .select("id, name")
        .from("author")
        .where("fl_active='S'")
          .and("name = " + Conversion.getDatabaseString(nome))
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    boolean exist = false;
    
    try {
      exist = resultSet.next();
      
      if(exist) {
        /* L'autore esiste e ritorno il suo ID */
        Author author = new Author(resultSet);
        resultSet.close();
        return author.getId();
      } else {
        /* L'autore non esiste e ritorno -1 */
        resultSet.close();
        return -1;
      }
    } catch (SQLException e) {
      throw new RecoverableDBException("AuthorService: searchFromName(): Errore sul ResultSet.");
    }
  }
  
  public static int insertNewAuthor(Database database, String nome)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità */
    sql = sqlBuilder
        .select("id")
        .from("author")
        .where("fl_active='S'")
          .and("name = " + Conversion.getDatabaseString(nome))
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    boolean exist = false;
    
    try {
      exist = resultSet.next();
      resultSet.close();
    } catch(SQLException e) {
      throw new RecoverableDBException("AuthorService: insertNewAuthor(): Errore sul ResultSet.");
    }
    
    /* Inserisco il nuovo autore */
    /* Calcolo l'ID */
    
    sql = sqlBuilder
			.select("MAX(id)").as("N")
      .from("author")
			.done();
    
		int id = 1;
		
		try {
			resultSet = database.select(sql);
			
			if (resultSet.next())
				id = resultSet.getInt("N") + 1;
			
			resultSet.close();
		} catch (SQLException ex) {
			throw new RecoverableDBException("AuthorService: insertNewAuthor(): Impossibile calcolare id autore.");
		}
    
    sql = sqlBuilder
			.insertInto("author", "id", "name")
			.values(
					id,
					Conversion.getDatabaseString(nome))
			.done();
    
    database.modify(sql);
    
    return id;
  }

  public static String getAuthorFromId(Database database, int id)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    sql = sqlBuilder
        .select("name")
        .from("author")
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
      throw new RecoverableDBException("AuthorService: getAuthorFromId(): Errore sul ResultSet.");
    }
    
    return nome;
  }
  
	public static List<Author> getBookAuthors(Database db, String isbn) throws RecoverableDBException {
		SqlBuilder sqlBuilder = new SqlBuilder();
		List<Author> authors = new ArrayList<>();
		
		String sql = sqlBuilder
				.select("id", "name")
				.from("Author")
				.join("Book_has_Author").on("book_isbn = "+isbn)
				.where("id = author_id").and("fl_active = 'S'")
				.done();
		
		ResultSet resultSet = db.select(sql);

		try {
			while(resultSet.next()) {
				Author author = new Author(resultSet);
				authors.add(author);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "AuthorService", "getBookAuthors", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("AuthorService", "getBookAuthors", ex.getMessage());}
		}
		
		return authors;
	}
}
