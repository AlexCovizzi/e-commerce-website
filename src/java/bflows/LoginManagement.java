package bflows;

import blogics.UserService;
import java.io.Serializable;
import java.time.LocalDate;
import services.database.DBService;
import services.database.Database;
import services.database.exception.NotFoundDBException;
import services.errorservice.EService;

public class LoginManagement implements Serializable
{
    private String email;
    private String password;
	private String name;
	private String surname;
    
	/* signup.jsp : signup */
    public void signup() {
        Database database = null;
        try {
			
            database = DBService.getDataBase();
      
            UserService.insertUser(database, email, name, surname, password);
            
            database.commit();
        }
				catch (NotFoundDBException ex)
				{ }
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
	
	/* login.jsp : login */
	public void login() {
		
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
