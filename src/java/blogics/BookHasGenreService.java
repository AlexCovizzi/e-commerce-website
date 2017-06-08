/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */
public class BookHasGenreService {
  
  public BookHasGenreService() { }
  
  public static void insertGenresOfBook(Database database, String bookIsbn, int[] generi)
      throws RecoverableDBException {
    
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità non necessario: questa funzione è sempre chiamata dopo BookService.insertNewBook()
       che si occupa di fare un check sull'unicità: quindi se il libro non è presente, non può essere presente
       nemmeno una riga in quest tabella corrisponedente a tale libro! */	
    
    /* Inserisco una riga nella tabella per ogni genere selzionato */
    for(int i = 0; i < generi.length; i++) {
      sql = sqlBuilder
          .insertInto("Book_has_genre", "book_isbn", "genre_id")
          .values(
              Conversion.getDatabaseString(bookIsbn),
              generi[i])
          .done();
      
      database.modify(sql);
    }
  }
}
