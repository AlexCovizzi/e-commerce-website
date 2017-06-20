/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author alemo
 */
public class Publisher {
  private String name;
  private int id;
  
  public Publisher(int id, String name) {
    this.id = id;
    this.name = name;
  }
  
  public Publisher(ResultSet resultSet) {
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
