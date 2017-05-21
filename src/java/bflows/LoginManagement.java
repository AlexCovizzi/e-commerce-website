package bflows;

import blogics.UserService;
import java.io.Serializable;
import services.database.DBService;
import services.database.Database;
import services.database.exception.NotFoundDBException;
import services.errorservice.EService;

public class LoginManagement implements Serializable {
    
    private String email;
    private String password;
    
    public void signup() {
        Database database = null;
    
        try {
            database = DBService.getDataBase();
      
            UserService.insertUser(database, email, password);
            
            database.commit();
            
        } catch (NotFoundDBException ex) {
            
        } finally {
            try {
                if(database != null) database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }
    }
    
    /* Setters */
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    /* Getters */
    public String getEmail() {
        return email;
    }
    
    public String getPassword() {
        return password;
    }
}
