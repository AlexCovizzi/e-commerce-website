
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
			.insertInto("Book_has_author")
			.values(
					Conversion.getDatabaseString(isbn),
					String.valueOf(idAutore))
			.done();
    
    database.modify(sql);
  }
}
