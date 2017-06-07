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
public class BookHasGenre {
  private String bookIsbn;
  private int genreId;
  
  public BookHasGenre(String bookIsbn, int genreId) {
    this.bookIsbn = bookIsbn;
    this.genreId = genreId;
  }
  
  public BookHasGenre(ResultSet resultSet) {
    try {bookIsbn = resultSet.getString("BOOK_ISBN");} catch (SQLException sqle) {}
    try {genreId = resultSet.getInt("GENRE_ID");} catch (SQLException sqle) {}
  }
  
  /* Getters */
  public String getBookIsbn() {
    return bookIsbn;
  }
  
  public int getGenreId() {
    return genreId;
  }
  
  /* Setters */
  public void setBookIsbn(String bookIsbn) {
    this.bookIsbn = bookIsbn;
  }
  
  public void setGenreId(int genreId) {
    this.genreId = genreId;
  }
}
