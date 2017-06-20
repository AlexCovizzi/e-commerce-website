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
public class PublisherService {
  
  public PublisherService() { }
  
  public static int insertNewPublisher(Database database, String nome)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità */
    sql = sqlBuilder
        .select("id")
        .from("publisher")
        .where("fl_active='S'")
          .and("name = " + Conversion.getDatabaseString(nome))
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    boolean exist = false;
    
    try {
      exist = resultSet.next();
      resultSet.close();
    } catch(SQLException e) {
      throw new RecoverableDBException("PublisherService: insertNewPublisher(): Errore sul ResultSet.");
    }
    
    /* Inserisco il nuovo autore */
    /* Calcolo l'ID */
    
    sql = sqlBuilder
			.select("MAX(id)").as("N")
      .from("publisher")
			.done();
    
		int id = 1;
		
		try {
			resultSet = database.select(sql);
			
			if (resultSet.next())
				id = resultSet.getInt("N") + 1;
			
			resultSet.close();
		} catch (SQLException ex) {
			throw new RecoverableDBException("PublisherService: insertNewPublisher(): Impossibile calcolare id autore.");
		}
    
    sql = sqlBuilder
			.insertInto("publisher", "id", "name")
			.values(
					id,
					Conversion.getDatabaseString(nome))
			.done();
    
    database.modify(sql);
    
    return id;
  }
  
  public static int searchFromName(Database database, String nome)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    int id;
    
    /* Recupero l'id dell'editore dal suo nome */
    sql = sqlBuilder
        .select("id")
        .from("publisher")
        .where("fl_active='S'")
          .and("name = " + Conversion.getDatabaseString(nome))
        .done();

    ResultSet resultSet = database.select(sql);
    
    boolean exist = false;
    
    try {
      exist = resultSet.next();
      
      if(exist) {
        /* L'editore esiste e ritorno il suo ID */
        id = resultSet.getInt("id");
        resultSet.close();
        return id;
      } else {
        /* L'editore non esiste e ritorno -1 */
        resultSet.close();
        return -1;
      }
    } catch (SQLException e) {
      throw new RecoverableDBException("PublisherService: getIdFromName(): Errore sul ResultSet.");
    }
  }
}
