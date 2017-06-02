package bflows;

import blogics.UserService;
import java.io.Serializable;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;

public class LoginManagement implements Serializable {
	private String errorMessage;
	
    private String email;
    private String password;
	private String name;
	private String surname;
    
	/* signup.jsp -> login.jsp : signup */
    public void signup() throws UnrecoverableDBException {
        Database database = DBService.getDataBase();
        try {
            UserService.insertUser(database, email, name, surname, password, false);
            database.commit();
        } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.toString());
		} finally {
            database.close();
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
		
	public void setName(String name) {
		this.name = name;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
    
    /* Getters */
    public String getEmail() {
        return email;
    }
    
    public String getPassword() {
        return password;
    }
		
	public String getName() {
		return name;
	}

	public String getSurname() {
		return surname;
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}
}
