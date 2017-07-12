package services.database;

import com.sun.media.jfxmedia.logging.Logger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;
import sun.util.logging.PlatformLogger;

public class Database {
    private Connection connection;
    private Statement statement;
    
    public Database(Connection connection) throws UnrecoverableDBException {
        this.connection = connection;
		
        try{
            this.connection.setAutoCommit(false);
            statement = this.connection.createStatement();
        } catch (SQLException ex) {
            throw new UnrecoverableDBException(ex, "Database", "Database", "Impossibile Aprire la Connessione col DataBase");
        }
    }
	
    public ResultSet select(String sql) throws RecoverableDBException {
        try {
            ResultSet resultSet = statement.executeQuery(sql);
            return resultSet;
        } catch (SQLException ex) {
            throw new RecoverableDBException(ex, "Database", "select", "Si è verificato un' errore nell'esecuzione della query: \n"+sql);
        }
    }
  
    public int modify(String sql) throws RecoverableDBException {
        int recordsNumber;
        try {
            recordsNumber=statement.executeUpdate(sql);
        } catch (SQLException ex){
            throw new RecoverableDBException(ex, "Database", "modify", "Si è verificato un' errore nell'esecuzione della update: \n"+sql);
        }

        return recordsNumber;
    }
  
    public void commit() throws RecoverableDBException {
        try{
            connection.commit();
            statement.close();
            statement = connection.createStatement();
        } catch (SQLException ex){
            throw new RecoverableDBException(ex, "Database", "commit", "Si è verificato un' errore nell'esecuzione del commit");
        }
    }
  
    public void rollBack() throws UnrecoverableDBException {
        try{
            connection.rollback();
        } catch (SQLException ex){
            throw new UnrecoverableDBException(ex, "Database", "rollBack", "Impossibile eseguire il RollBack sul DB. Eccezione: "+ex);
        }
    }
  
    public void close() throws UnrecoverableDBException {
        try{
			statement.close();
            connection.close();
        } catch (SQLException ex){
            throw new UnrecoverableDBException(ex, "Database", "close", "Impossibile chiudere il DB. Eccezione: "+ex);
        }
    }
  
    protected void finalize() throws Throwable {
        this.close();
    }
}
