/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bflows;

import java.util.*;
import java.io.Serializable;
import java.sql.*;
import javax.sql.*;

/**
 *
 * @author zambrima
 */
public class QueryBean implements Serializable {

  private String[] utenti;

  public QueryBean() {
  }

  public void executeQuery() {

    Connection connection=null;
    Vector vutenti=new Vector();
    
    try {

      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(
              "jdbc:mysql://localhost/rubrica?user=rubrica&password=rubrica");
      connection.setAutoCommit(false);
      Statement st = connection.createStatement();
      
      String sql="select * from autenti";
      
      ResultSet rs=st.executeQuery(sql);

      int i=0;
      while (rs.next()) {
        vutenti.add(rs.getString("CD_USER")+rs.getString("NOME")+rs.getString("COGNOME"));
        i++;
      }

      rs.close();
      connection.commit();
      
      utenti=new String[vutenti.size()];
      vutenti.copyInto(utenti);
      
    } catch (Throwable t) {
      if (connection!=null) try { connection.rollback(); } catch (Throwable t1) {}
      t.printStackTrace();
    }
  }

  /**
   * Get the value of utenti
   *
   * @return the value of utenti
   */
  public String[] getUtenti() {
    return utenti;
  }

  /**
   * Set the value of utenti
   *
   * @param utenti new value of utenti
   */
  public void setUtenti(String[] utenti) {
    this.utenti = utenti;
  }

  /**
   * Get the value of utenti at specified index
   *
   * @param index
   * @return the value of utenti at specified index
   */
  public String getUtenti(int index) {
    return this.utenti[index];
  }

  /**
   * Set the value of utenti at specified index.
   *
   * @param index
   * @param newUtenti new value of utenti at specified index
   */
  public void setUtenti(int index, String newUtenti) {
    this.utenti[index] = newUtenti;
  }
}