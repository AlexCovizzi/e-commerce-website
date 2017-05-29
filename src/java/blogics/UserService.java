package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import services.database.Database;
import services.database.exception.DuplicatedRecordDBException;
import services.database.exception.NotFoundDBException;
import services.database.exception.ResultSetDBException;
import util.Conversion;
import util.SqlBuilder;

public class UserService {
    
    public static User getUser(Database db, int id) {
        return null;
    }
    
    public static void insertUser(Database db, String email, String name, String surname, String password, boolean admin)
			throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {
		
		SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		ResultSet resultSet;
		
		// Controllo che non ci siano altri utenti con la stessa email
		sql = sqlBuilder
				.select("email")
				.from("User")
				.where("email =" + Conversion.getDatabaseString(email))
					.and("fl_active = 'S'")
				.done();
    
		boolean exist = false;
		
		try {
			resultSet = db.select(sql);
			exist = resultSet.next();
			resultSet.close();
		} catch (SQLException e) {
			throw new ResultSetDBException("UserService: insertUser(): Errore sul ResultSet.");
		}

		if (exist) {
			throw new DuplicatedRecordDBException("UserService: insertUser(): Tentativo di inserimento di un utente con email già esistente.");
		}
		
		// Genero l'id del nuovo utente
		sql = sqlBuilder
			.select("MAX(id)").as("N").from("User")
			.done();
    
		int id = 1;
		
		try {
			resultSet = db.select(sql);
			
			if (resultSet.next())
				id = resultSet.getInt("N") + 1;
			
			resultSet.close();
		} catch (SQLException e) {
			throw new ResultSetDBException("UserService: insertUser(): Errore sul ResultSet --> impossibile calcolare id utente.");
		}
		
		// Inserisco il nuovo utente
		sql = sqlBuilder
				.insertInto("User", "id", "email", "name", "surname", "password", "is_admin")
				.values(id,
					Conversion.getDatabaseString(email),
					Conversion.getDatabaseString(name),
					Conversion.getDatabaseString(surname),
					Conversion.getDatabaseString(password),
					admin)
				.done();
		
        db.modify(sql);
    }
    
    public static void modifyUserEmail(Database db, int userId, String email) {
        
    }
    
    public static void modifyUserPassword(Database db, int userId, String password) {
        
    }
    
    public static void removeUser(Database db, int userId) {
        
    }
}
