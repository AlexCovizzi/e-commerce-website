/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */
public class GenreService {
  public GenreService() { }
  
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
}
