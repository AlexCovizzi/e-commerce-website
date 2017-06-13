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
  
  public static BookHasGenre[] getGenresFromIsbn(Database database, String isbn)
  throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    sql = sqlBuilder
        .select("*")
        .from("book_has_genre")
        .where("book_isbn = " + Conversion.getDatabaseString(isbn))
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    Vector<BookHasGenre> generiVector = new Vector<BookHasGenre>();
    BookHasGenre elemento;
    
     try {
      while (resultSet.next()) {
        elemento = new BookHasGenre(resultSet);
        generiVector.add(elemento);
      }
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("BookHasGenreService: getAuthorsFromIsbn(): Errore sul ResultSet.");
    }
    
    BookHasGenre[] risultato = new BookHasGenre[generiVector.size()];
    generiVector.copyInto(risultato);
    
    return risultato;
  }
}
