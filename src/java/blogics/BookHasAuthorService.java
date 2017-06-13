
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
public class BookHasAuthorService {
  
  public BookHasAuthorService() { }
  
  public static void insertAuthorOfBook(Database database, String isbn, int idAutore)
  throws RecoverableDBException
  {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità non necessario: questa funzione è sempre chiamata dopo BookService.insertNewBook()
       che si occupa di fare un check sull'unicità: quindi se il libro non è presente, non può essere presente
       nemmeno una riga in quest tabella corrisponedente a tale libro! */	

    /* Inserimento */
    sql = sqlBuilder
			.insertInto("Book_has_author", "book_isbn", "author_id")
			.values(
					Conversion.getDatabaseString(isbn),
					idAutore)
			.done();
    
    database.modify(sql);
  }
  
  public static BookHasAuthor[] getAuthorsFromIsbn(Database database, String isbn)
  throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    sql = sqlBuilder
        .select("*")
        .from("book_has_author")
        .where("book_isbn = " + Conversion.getDatabaseString(isbn))
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    Vector<BookHasAuthor> autoriVector = new Vector<BookHasAuthor>();
    BookHasAuthor elemento;
    
     try {
      while (resultSet.next()) {
        elemento = new BookHasAuthor(resultSet);
        autoriVector.add(elemento);
      }
      resultSet.close();
    } catch (SQLException e) {
      throw new RecoverableDBException("BookHasAuthorService: getAuthorsFromIsbn(): Errore sul ResultSet.");
    }
    
    BookHasAuthor[] risultato = new BookHasAuthor[autoriVector.size()];
    autoriVector.copyInto(risultato);
    
    return risultato;
  }
}
