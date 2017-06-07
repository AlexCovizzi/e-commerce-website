/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
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
        .select("*")
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
			throw new RecoverableDBException(ex, "AuthorService", "insertNewAuthor", "Impossibile calcolare id autore.");
		}
    
    sql = sqlBuilder
			.insertInto("author")
			.values(
					String.valueOf(id),
					Conversion.getDatabaseString(nome),
					Conversion.getDatabaseString("S"))
			.done();
    
    database.modify(sql);
    
    return id;
  }
}
