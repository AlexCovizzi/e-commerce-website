package blogics;

import java.sql.Timestamp;

public class User {
    private int id;
    private String email;
    private String password;
    public Timestamp timestamp;
    
    public User(int id, String email, String password, Timestamp timestamp) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.timestamp = timestamp;
    }
    
    /* Setters */
    public void setId(int id) {
        this.id = id;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
    /* Getters */
    public int getId() {
        return id;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public Timestamp getTimestamp() {
        return timestamp;
    }
}
