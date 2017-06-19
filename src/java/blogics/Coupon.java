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
public class Coupon {
  
  private String code;
  private boolean valid;
  private int discount;
  
  public Coupon(String code, boolean valid, int discount) {
    this.code = code;
    this.valid = valid;
    this.discount = discount;
  }
  
  public Coupon(ResultSet resultSet) {
    try {code = resultSet.getString("CODE");} catch (SQLException sqle) {}
    try {valid = resultSet.getBoolean("VALID");} catch (SQLException sqle) {}
    try {discount = resultSet.getInt("DISCOUNT");} catch (SQLException sqle) {}
  }


  /* Getters */
  public String getCode() {
    return code;
  }
  
  public boolean isValid() {
    return valid;
  }
  
  public int getDiscount() {
    return discount;
  }

  /* Setters */
  public void setCode(String code) {
    this.code = code;
  }
  
  public void setValid(boolean valid) {
    this.valid = valid;
  }
  
  public void setDiscount(int discount) {
    this.discount = discount;
  }

}
