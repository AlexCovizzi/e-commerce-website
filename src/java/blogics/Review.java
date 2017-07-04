
package blogics;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Review {
  private String bookIsbn;
  private int userId;
  private String userName;
  private String userSurname;
  private boolean thumbUp;
  private String comment;
  private Date timestamp;

  public Review(String bookIsbn, int userId, String userName, String userSurname, boolean thumbUp, String comment, Date timestamp) {
    this.bookIsbn = bookIsbn;
    this.userId = userId;
    this.userName = userName;
    this.userSurname = userSurname;
    this.thumbUp = thumbUp;
    this.comment = comment;
    this.timestamp = timestamp;
  }
  
  public Review(ResultSet resultSet) {
    try {bookIsbn = resultSet.getString("book_isbn");} catch (SQLException sqle) {}
    try {userId = resultSet.getInt("user_id");} catch (SQLException sqle) {}
    try {userName = resultSet.getString("name");} catch (SQLException sqle) {}
    try {userSurname = resultSet.getString("surname");} catch (SQLException sqle) {}
    try {thumbUp = resultSet.getBoolean("thumb_up");} catch (SQLException sqle) {}
    try {comment = resultSet.getString("comment");} catch (SQLException sqle) {}
    try {timestamp = resultSet.getDate("timestamp_c");} catch (SQLException sqle) {}
  }
  
  public String getBookIsbn() {
    return bookIsbn;
  }
  
  public int getUserId() {
    return userId;
  }
  
  public String getUserName() {
    return userName;
  }
  
  public String getUserSurname() {
    return userSurname;
  }
  
  public boolean isThumbUp() {
    return thumbUp;
  }
  
  public String getComment() {
    return comment;
  }
  
  public Date getTimestamp() {
    return timestamp;
  }

  @Override
  public String toString() {
    return "review: "+thumbUp+", "+comment; //To change body of generated methods, choose Tools | Templates.
  }
  
  
}
