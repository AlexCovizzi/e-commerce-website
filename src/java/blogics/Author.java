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
public class Author {
  private int id;
  private String name;
  
  public Author(int id, String name) {
    this.id = id;
    this.name = name;
  }
  
  public Author(ResultSet resultSet) {
    try {id = resultSet.getInt("ID");} catch (SQLException sqle) {}
    try {name = resultSet.getString("NAME");} catch (SQLException sqle) {}
  }
  
  /* Getters */
  public int getId() {
    return id;
  }
  
  public String getName() {
    return name;
  }
  
  /* Setters */
  public void setId(int id) {
    this.id = id;
  }
  
  public void setName(String name) {
    this.name = name;
  }
}
