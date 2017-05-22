package blogics;

import services.database.Database;
import services.database.exception.NotFoundDBException;
import util.Conversion;

public class UserService {
    
    public static User getUser(Database db, int userId) {
        return null;
    }
    
    public static void insertUser(Database db, String email, String name, String surname, String password) throws NotFoundDBException {
        util.Debug.println(db);
        String sql =    "INSERT INTO user " +
                        "(userID, email, name, surname,  password, timestamp_c) " +
                        "VALUES (" +
                        "NULL,"+
                        "'"+Conversion.getDatabaseString(email)+"',"+
												"'"+Conversion.getDatabaseString(name)+"',"+
												"'"+Conversion.getDatabaseString(surname)+"',"+
                        "'"+Conversion.getDatabaseString(password)+"',"+
                        "DEFAULT"+
                        ");";
        db.modify(sql);
    }
    
    public static void modifyUserEmail(Database db, int userId, String email) {
        
    }
    
    public static void modifyUserPassword(Database db, int userId, String password) {
        
    }
    
    public static void removeUser(Database db, int userId) {
        
    }
}
