/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import util.Conversion;
import util.Logger;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */
public class OrderService {
  public OrderService() { }
  
  public static List<Order> getOrders(Database database, int orderUser)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    List<Order> orders = new ArrayList<>();
    
    sqlBuilder = sqlBuilder
				.select("*")
				.from("OrderView");
    
    if(orderUser >= 0)
      sqlBuilder = sqlBuilder.where("user_id = " + orderUser);
    
    sql = sqlBuilder.done();
   
    System.out.println(sql);
    
    ResultSet resultSet = database.select(sql);
    
    try {
			while(resultSet.next()) {
				Order order = new Order(resultSet);
				orders.add(order);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "OrderService", "getOrders", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("OrderService", "getOrders", ex.getMessage());}
		}

		return orders;
  }
}
