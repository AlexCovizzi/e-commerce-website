package services.database;

import global.Constants;
import java.sql.Connection;
import java.sql.DriverManager;
import services.database.exception.DBException;
import services.database.exception.UnrecoverableDBException;

public class DBService {
    public DBService() {}

    public static synchronized Database getDataBase() throws UnrecoverableDBException {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Constants.DB_CONNECTION_STRING);               
            return new Database(connection);
        } catch (Exception ex) {
            throw new UnrecoverableDBException(ex, "DBService", "getDataBase", "Impossibile creare la Connessione al DataBase");
        } 
    }
}
