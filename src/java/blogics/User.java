package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class User {
    private int id;
	private String name;
	private String surname;
    private String email;
    private String password;
	private boolean admin;
	private boolean blocked;
    public Timestamp timestamp;
    
    public User(int id, String name, String surname, String email, String password,
			boolean admin, boolean blocked) {
        this.id = id;
		this.name = name;
		this.surname = surname;
        this.email = email;
        this.password = password;
		this.admin = admin;
		this.blocked = blocked;
    }
	
	public User(ResultSet resultSet) {
		try { id = resultSet.getInt("id"); } catch (SQLException sqle) {}
		try { name = resultSet.getString("name"); } catch (SQLException sqle) {}
		try { surname = resultSet.getString("surname"); } catch (SQLException sqle) {}
		try { email = resultSet.getString("email"); } catch (SQLException sqle) {}
		try { password = resultSet.getString("password"); } catch (SQLException sqle) {}
		try { admin = resultSet.getBoolean("is_admin"); } catch (SQLException sqle) {}
		try { blocked = resultSet.getBoolean("is_blocked"); } catch (SQLException sqle) {}
    }
    
    /* Setters */
    public void setId(int id) {
        this.id = id;
    }
		
	public void setName(String name) {
        this.name = name;
    }
		
	public void setSurname(String surname) {
        this.surname = surname;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
	
    public void setPassword(String password) {
        this.password = password;
    }
	
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	public void setBlocked(boolean blocked) {
		this.blocked = blocked;
	}
    
    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
    /* Getters */
    public int getId() {
        return id;
    }
		
	public String getName() {
        return name;
    }
		
	public String getSurname() {
        return surname;
    }
    
    public String getEmail() {
        return email;
    }
	
    public String getPassword() {
        return password;
    }
	
	public boolean isAdmin() {
		return admin;
	}
	
	public boolean isBlocked() {
		return blocked;
	}
    
    public Timestamp getTimestamp() {
        return timestamp;
    }
}
