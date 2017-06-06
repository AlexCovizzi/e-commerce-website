/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author alemo
 */
public class BookHasAuthor {
  private String bookIsbn;
  private int authorId;
  
  public BookHasAuthor(String bookIsbn, int authorId) {
    this.bookIsbn = bookIsbn;
    this.authorId = authorId;
  }
  
  public BookHasAuthor(ResultSet resultSet) {
    try {bookIsbn = resultSet.getString("BOOK_ISBN");} catch (SQLException sqle) {}
    try {authorId = resultSet.getInt("AUTHOR_ID");} catch (SQLException sqle) {}
  }
  
  /* Getters */
  public String getBookIsbn() {
    return bookIsbn;
  }
  
  public int getAuthorId() {
    return authorId;
  }
  
  /* Setters */
  public void setBookIsbn(String bookIsbn) {
    this.bookIsbn = bookIsbn;
  }
  
  public void setAuthorId(int authorId) {
    this.authorId = authorId;
  }
}
