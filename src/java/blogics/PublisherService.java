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
import util.Pair;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */
public class PublisherService {
  
  public PublisherService() { }
  
  /**
   * Restituisce la lista di tutti gli editori
   * @param database
   * @return 
   */
  public static List<Publisher> getAll(Database database) throws RecoverableDBException {
    List<Publisher> publishers = new ArrayList<>();
    SqlBuilder sqlBuilder = new SqlBuilder();

    String sql = sqlBuilder
        .select("*")
        .from("Publisher")
        .where("fl_active='S'")
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    try {
      while(resultSet.next()) {
        Publisher publisher = new Publisher(resultSet);
        publishers.add(publisher);
      }
    } catch (SQLException e) {
      throw new RecoverableDBException(e, "PublisherService", "getAll", "Errore sul ResultSet.");
    }
    
    return publishers;
  }
  
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
  
  
  /*
    Restituisce i 5 editori con piu occorrenze nella ricerca effettuata
    Serve per scrivere i filtri nella pagina di ricerca
  */
  public static List<Pair<String, Integer>> getSearchPublishers(Database db, String search) throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		ResultSet resultSet;
		List<Pair<String, Integer>> publishers = new ArrayList();
    
    String sql = sqlBuilder
			.select("publisher_name", "COUNT(*) AS n")
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
			throw new RecoverableDBException(ex, "PublisherService", "getSearchPublishers", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("PublisherService", "getSearchPublishers", ex.getMessage());}
		}
    
    
    return publishers;
  }
}
