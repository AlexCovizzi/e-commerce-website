package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import services.database.Database;
import services.database.exception.DBException;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.SqlBuilder;

public class UserService {
    
    public static User getUser(Database db, String email, String password)
	throws RecoverableDBException {
		
        SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		ResultSet resultSet;
		User user = null;
		
		sql = sqlBuilder
				.select("*")
				.from("User")
				.where("email = "+Conversion.getDatabaseString(email))
				.and("password = "+Conversion.getDatabaseString(password))
				.done();
		Logger.debug("UserService", "getUser", sql);
		
		resultSet = db.select(sql);
    
		try {
			if (resultSet.next()) {
				user = new User(resultSet);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUser", ex.getMessage());}
		}
		
		return user;
    }
    
    public static void insertUser(Database db, String email, String name, String surname, String password, boolean admin)
	throws RecoverableDBException {
		
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
		
		resultSet = db.select(sql);
		
		try {
			exist = resultSet.next();
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "insertUser", "Impossibile ricercare nel database se ci sono utenti con la stessa mail");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "insertUser", ex.getMessage());}
		}

		if (exist) {
			throw new RecoverableDBException("Esiste già un utente con questa mail");
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
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "insertUser", "Impossibile calcolare id utente.");
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
	
	public static void blockUser(Database db, int userId) {
        
    }
}
