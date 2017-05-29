package bflows;

import blogics.UserService;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import services.database.DBService;
import services.database.Database;
import services.database.exception.DuplicatedRecordDBException;
import services.database.exception.NotFoundDBException;
import services.database.exception.ResultSetDBException;
import services.errorservice.EService;

public class LoginManagement implements Serializable
{
    private String email;
    private String password;
	private String name;
	private String surname;
    
	/* signup.jsp -> login.jsp : signup */
    public void signup() {
        Database database = null;
        try {
			
            database = DBService.getDataBase();
      
            UserService.insertUser(database, email, name, surname, password, false);
            
            database.commit();
        }
				catch (NotFoundDBException ex)
				{ } catch (DuplicatedRecordDBException ex) {
			Logger.getLogger(LoginManagement.class.getName()).log(Level.SEVERE, null, ex);
		} catch (ResultSetDBException ex) {
			Logger.getLogger(LoginManagement.class.getName()).log(Level.SEVERE, null, ex);
		}
				finally
				{
            try
						{
                if(database != null) database.close();
            }
						catch (NotFoundDBException e)
						{
                EService.logAndRecover(e);
            }
        }
    }
	
	/* login.jsp -> login.jsp : login */
	public void login() {
		
	}
	
	/* account.jsp -> login.jsp : logout */
	public void logout() {
		
	}
    
    /* Setters */
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
		
		public void setName(String name)
		{
			this.name = name;
		}
		
		public void setSurname(String surname)
		{
			this.surname = surname;
		}
    
    /* Getters */
    public String getEmail()
		{
        return email;
    }
    
    public String getPassword()
		{
        return password;
    }
		
		public String getName()
		{
			return name;
		}

		public String getSurname()
		{
			return surname;
		}
}
