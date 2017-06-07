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
public class GenreService {
  public GenreService() { }
  
  public static int[] getIds(Database database, String[] generi)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    int[] ids = new int[generi.length];
    
    /* Costruisco il vettore contenenti gli di dei generi */
    for(int i = 0; i < generi.length; i++)
    {
      sql = sqlBuilder
          .select("id")
          .from("genre")
          .where("fl_active='S'")
            .and("name = " + Conversion.getDatabaseString(generi[i]))
          .done();

      ResultSet resultSet = database.select(sql);

      try {
        resultSet.next();
        ids[i] = resultSet.getInt("id");
        
        resultSet.close();
      } catch (SQLException e) {
        throw new RecoverableDBException("AuthorService: searchFromName(): Errore sul ResultSet.");
      }
    }
    
    return ids;
  }
}
