package services.database;

import global.Constants;
import java.sql.Connection;
import java.sql.DriverManager;
import services.database.exception.NotFoundDBException;

public class DBService {
    public DBService() {}

    public static synchronized Database getDataBase() throws NotFoundDBException {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Constants.DB_CONNECTION_STRING);               
            return new Database(connection);
        } catch (Exception e) {
            throw new NotFoundDBException("DBService: Impossibile creare la Connessione al DataBase: " + e);
        }
    }
}
