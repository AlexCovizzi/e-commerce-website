package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
          .and("fl_active = 'S'")
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
    
  public static void removeUser(Database database, int userId)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();

    /* Aggiornamento */	
    sql = sqlBuilder
      .update("user")
      .set("fl_active = 'N'")
      .where("id = " + userId)
      .done();

    System.out.println(sql);

    database.modify(sql);
  }
	
  public static int countUsers(Database database)
  throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    int risultato;
    
    sql = sqlBuilder
				.select("count(id)").as("N")
				.from("User")
				.where("fl_active = 'S'")
          .and("is_admin = false")
				.done();
    
    ResultSet resultSet = database.select(sql);
    
    try {
			resultSet.next();
      risultato = resultSet.getInt("N");
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "countUsers", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "countUsers", ex.getMessage());}
		}

		return risultato;
  }
  
  public static List<User> getUsers(Database database, int limit, int offset, boolean isAdmin)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    List<User> users = new ArrayList<>();
    
    sql = sqlBuilder
				.select("id", "name", "surname", "email", "password", "is_admin", "is_blocked")
				.from("User")
				.where("fl_active = 'S'")
          .and("is_admin = " + isAdmin)
        .limit(limit).offset(offset)
				.done();
    
    System.out.println(sql);
    
    ResultSet resultSet = database.select(sql);
    
    try {
			while(resultSet.next()) {
				User user = new User(resultSet);
				users.add(user);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUsers", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("UserService", "getUsers", ex.getMessage());}
		}

		return users;
  }
    
	public static void blockUser(Database database, int userId)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Aggiornamento */	
    sql = sqlBuilder
			.update("user")
      .set("is_blocked = 1")
			.where("id = " + userId)
        .and("fl_active = 'S'")
			.done();
    
    System.out.println(sql);
    
    database.modify(sql);
  }
  
  public static void unblockUser(Database database, int userId)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Aggiornamento */	
    sql = sqlBuilder
			.update("user")
      .set("is_blocked = 0")
			.where("id = " + userId)
        .and("fl_active = 'S'")
			.done();
    
    database.modify(sql);
  }
}
