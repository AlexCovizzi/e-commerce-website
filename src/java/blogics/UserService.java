package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.SqlBuilder;

public class UserService {
    
  public static User getUser(Database db, String email, String password)
	throws RecoverableDBException {
		
    SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		User user = null;
		
		sql = sqlBuilder
				.select("*")
				.from("User")
				.where("email = "+Conversion.getDatabaseString(email))
          .and("password = "+Conversion.getDatabaseString(password))
          .and("fl_active = 'S'")
				.done();
    
		try {
      try (ResultSet resultSet = db.select(sql)) {
        if (resultSet.next()) {
          user = new User(resultSet);
        }
      }
		} catch (SQLException | RecoverableDBException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore: Impossibile trovare l'utente");
		}
		
		return user;
  }
    
  public static void insertUser(Database db, String email, String name, String surname, String password, boolean admin)
	throws RecoverableDBException {
		
		SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		
		// Controllo che non ci siano altri utenti con la stessa email
		sql = sqlBuilder
				.select("email")
				.from("User")
				.where("email =" + Conversion.getDatabaseString(email))
					.and("fl_active = 'S'")
				.done();
    
		boolean exist = false;
		
		try {
      try (ResultSet resultSet = db.select(sql)) {
        exist = resultSet.next();
      }
		} catch (SQLException | RecoverableDBException ex) {
			throw new RecoverableDBException(ex, "UserService", "insertUser", "Errore: Impossibile ricercare nel database se ci sono utenti con la stessa mail");
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
      try (ResultSet resultSet = db.select(sql)) {
        if (resultSet.next()) id = resultSet.getInt("N") + 1;
      }
		} catch (SQLException | RecoverableDBException ex) {
			throw new RecoverableDBException(ex, "UserService", "insertUser", "Errore: Impossibile calcolare id utente.");
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
		
    try {
      db.modify(sql);
    } catch(RecoverableDBException ex) {
      throw new RecoverableDBException(ex, "UserService", "insertUser", "Errore nella registrazione del nuovo utente");
    }
  }
    
  public static void removeUser(Database database, int userId)
      throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();

    /* Aggiornamento */	
    String sql = sqlBuilder
      .update("user")
      .set("fl_active = 'N'")
      .where("id = " + userId)
      .done();
    
    try {
      database.modify(sql);
    } catch(RecoverableDBException ex) {
      throw new RecoverableDBException(ex, "UserService", "removUser", "Errore nella rimozione dell'utente "+userId);
    }
  }
	
  public static int countUsers(Database database)
  throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    int risultato = 0;
    
    String sql = sqlBuilder
				.select("count(id)").as("N")
				.from("User")
				.where("fl_active = 'S'")
          .and("is_admin = false")
				.done();
    
    
    try {
      try (ResultSet resultSet = database.select(sql)) {
        if(resultSet.next()) {
          risultato = resultSet.getInt("N");
        }
      }
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "UserService", "countUsers", "Errore nel ResultSet");
		}

		return risultato;
  }
  
  public static List<User> getUsers(Database database, int limit, int offset, boolean isAdmin)
      throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    List<User> users = new ArrayList<>();
    
    String sql = sqlBuilder
				.select("id", "name", "surname", "email", "password", "is_admin", "is_blocked")
				.from("User")
				.where("fl_active = 'S'")
          .and("is_admin = " + isAdmin)
        .orderBy("surname, name")
        .limit(limit).offset(offset)
				.done();
    
    try {
      try (ResultSet resultSet = database.select(sql)) {
        while(resultSet.next()) {
          User user = new User(resultSet);
          users.add(user);
        }
      }
		} catch (SQLException | RecoverableDBException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUsers", "Errore: Impossibile recuperare gli utenti dal database");
		}

		return users;
  }
    
	public static void blockUser(Database database, int userId)
      throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Aggiornamento */	
    String sql = sqlBuilder
			.update("user")
      .set("is_blocked = 1")
			.where("id = " + userId)
        .and("fl_active = 'S'")
			.done();
    
    try {
      database.modify(sql);
    } catch(RecoverableDBException ex) {
      throw new RecoverableDBException(ex, "UserService", "blockUser", "Errore: Impossibile bloccare l'utente: "+userId);
    }
  }
  
  public static void unblockUser(Database database, int userId)
      throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Aggiornamento */	
    String sql = sqlBuilder
			.update("user")
      .set("is_blocked = 0")
			.where("id = " + userId)
        .and("fl_active = 'S'")
			.done();
    
    try {
      database.modify(sql);
    } catch(RecoverableDBException ex) {
      throw new RecoverableDBException(ex, "UserService", "blockUser", "Errore: Impossibile Sbloccare l'utente: "+userId);
    }
  }
  
  public static User getUser(Database database, int userId)
      throws RecoverableDBException {
    SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		User user = null;
		
		sql = sqlBuilder
				.select("*")
				.from("User")
				.where("id = " + userId)
          .and("fl_active = 'S'")
				.done();
    
		try {
      try (ResultSet resultSet = database.select(sql)) {
        if (resultSet.next()) {
          user = new User(resultSet);
        }
      }
		} catch (SQLException | RecoverableDBException ex) {
			throw new RecoverableDBException(ex, "UserService", "getUser", "Errore: Impossibile trovare l'utente");
		}
		
		return user;
  }
  
  public static void modifyInfo(Database database, int userId, String name, String surname, String email, String password)
      throws RecoverableDBException {
		
		SqlBuilder sqlBuilder = new SqlBuilder();
		String sql;
		
		// Controllo che non ci siano altri utenti con la stessa email
		sql = sqlBuilder
				.select("email")
				.from("User")
				.where("email =" + Conversion.getDatabaseString(email))
          .and("id != " + userId)
					.and("fl_active = 'S'")
				.done();
    
		boolean exist = false;
		
		try {
      try (ResultSet resultSet = database.select(sql)) {
        exist = resultSet.next();
      }
		} catch (SQLException | RecoverableDBException ex) {
			throw new RecoverableDBException(ex, "UserService", "modifyInfo", "Errore: Impossibile ricercare nel database se ci sono utenti con la stessa mail");
		}

		if (exist) {
			throw new RecoverableDBException("Esiste già un utente con questa mail");
		}
		
		// Modifico le informazioni
		sql = sqlBuilder
				.update("User")
        .set("name = " + Conversion.getDatabaseString(name),
            "surname = " + Conversion.getDatabaseString(surname),
            "email = " + Conversion.getDatabaseString(email),
            "password = " + Conversion.getDatabaseString(password))
        .where("id = " + userId)
				.done();
		
    try {
      database.modify(sql);
    } catch(RecoverableDBException ex) {
      throw new RecoverableDBException(ex, "UserService", "modifyUser", "Errore nell'aggiornamento delle informazioni");
    }
  }
}
