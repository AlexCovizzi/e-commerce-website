package bflows;

import blogics.User;
import blogics.UserService;
import javax.servlet.http.Cookie;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;
import services.session.Session;

public class LoginManagement extends AbstractManagement {
	private Cookie[] cookies;
	
  private String email;
  private String password;
	private String name;
	private String surname;
    
	/* signup.jsp -> signup.jsp : signup */
  public void signup() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    try {
      UserService.insertUser(database, email, name, surname, password, false);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
	
	/* login.jsp -> login.jsp : login */
	public void login() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    try {
      User user = UserService.getUser(database, email, password);
      if(user != null) {
        setCookies(Session.createUserCookie(database, user));
      } else {
        setErrorMessage("Email o password errati.");
      }
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
	
	/* account.jsp -> login.jsp : logout */
	public void logout() {
		cookies = Session.deleteCookie(cookies);
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
	
	public void setCookie(int i, Cookie cookie) {
		cookies[i] = cookie;
	}
	
	public void setCookies(Cookie...cookies) {
		this.cookies = cookies;
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
	
	public Cookie getCookie(int i) {
		return cookies[i];
	}
	
	public Cookie[] getCookies() {
		return cookies;
	}
}
