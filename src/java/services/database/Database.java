package services.database;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import services.database.exception.NotFoundDBException;

public class Database {
    private Connection connection;
    private Statement statement;
    
    public Database(Connection connection) throws NotFoundDBException {
        try{
            this.connection=connection;
            if (this.connection==null)
                throw new NotFoundDBException("DataBase: DataBase(): Impossibile Aprire la Connessione Logica");

            this.connection.setAutoCommit(false);
            statement=this.connection.createStatement();

        } catch (Exception ex) {
            ByteArrayOutputStream stackTrace=new ByteArrayOutputStream();
            ex.printStackTrace(new PrintWriter(stackTrace,true));
            throw new NotFoundDBException("DataBase: DataBase(): Impossibile Aprire la Connessione col DataBase: \n"+stackTrace);
        }
    }
  
    public ResultSet select(String sql) throws NotFoundDBException {
        ResultSet resultSet;

        try {
            resultSet=statement.executeQuery(sql);
            return resultSet;
        } catch (SQLException ex) {
            throw new NotFoundDBException("DataBase: select(): Impossibile eseguire la query sul DB. Eccezione: "+ex+ "\n " + sql ,this);
        }
    }
  
    public int modify(String sql) throws NotFoundDBException {
        int recordsNumber;
        try {
            recordsNumber=statement.executeUpdate(sql);
        } catch (SQLException ex){
            throw new NotFoundDBException("DataBase: modify(): Impossibile eseguire la update sul DB. Eccezione: "+ex+ "\n " + sql,this);
        }

        return recordsNumber;
    }
  
    public void commit() throws NotFoundDBException {
        try{
            connection.commit();
            statement.close();
            statement=connection.createStatement();
            return;
        } catch (SQLException ex){
            throw new NotFoundDBException("DataBase: commit(): Impossibile eseguire la commit sul DB. Eccezione: "+ex,this);
        }
    }
  
    public void rollBack() {
        try{
            connection.rollback();
            statement.close();
            statement=connection.createStatement();
            return;
        } catch (SQLException ex){
            new NotFoundDBException("DataBase: rollback(): Impossibile eseguire il RollBack sul DB. Eccezione: "+ex);
        }
    }
  
    public void close() throws NotFoundDBException {
        try{
            connection.close();
        } catch (SQLException ex){
            throw new NotFoundDBException("DataBase: close(): Impossibile chiudere il DB. Eccezione: "+ex);
        }
    }
  
    protected void finalize() throws Throwable {
        this.close();
    }
}
