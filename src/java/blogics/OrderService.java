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
  
  public static int countOrders(Database database, int orderUser)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    int risultato;
    
    sqlBuilder = sqlBuilder
				.select("count(id)").as("N")
				.from("OrderView");
    
    if(orderUser >= 0)
      sqlBuilder = sqlBuilder.where("user_id = " + orderUser);
    
    sql = sqlBuilder.done();
   
    System.out.println(sql);
    
    ResultSet resultSet = database.select(sql);

    try {
			resultSet.next();
      risultato = resultSet.getInt("N");
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "OrderService", "countOrders", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("OrderService", "countOrders", ex.getMessage());}
		}

		return risultato;
  }
  
  public static List<Order> getOrders(Database database, int orderUser, int limit, int offset)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    List<Order> orders = new ArrayList<>();
    
    sqlBuilder = sqlBuilder
				.select("*")
				.from("OrderView");
    
    if(orderUser >= 0)
      sqlBuilder = sqlBuilder.where("user_id = " + orderUser);
    
    sql = sqlBuilder
        .limit(limit).offset(offset)
        .done();
   
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
  
  public static void changeState(Database database, int id, String state)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    sql = sqlBuilder
        .update("orders")
        .set("state = " + Conversion.getDatabaseString(state))
        .where("id = " + id)
        .done();
    
    System.out.println("---------------------------------------");
    System.out.println(sql);
    System.out.println("---------------------------------------");
    
    database.modify(sql);
  }
  
  public static int insertOrder(Database database, int userId, float totalPrice, float shippingCost,
      String state, String couponCode, String receiver, String add1, String add2, String city, 
      String province, String country, String cap)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    ResultSet resultSet;
    
    /* Calcolo l'ID dell'ordine */
    sql = sqlBuilder
			.select("MAX(id)").as("N")
      .from("orders")
			.done();
    
		int id = 1;
		
		try {
			resultSet = database.select(sql);
			
			if (resultSet.next())
				id = resultSet.getInt("N") + 1;
			
			resultSet.close();
		} catch (SQLException ex) {
			throw new RecoverableDBException("OrderService: insertOrder(): Impossibile calcolare id ordine.");
		}
    
    /* Inserisco l'ordine nel database */
    sql = sqlBuilder
			.insertInto("orders",
          "id", "user_id", "created", "tot_price", "shipping_cost", "state", "coupon_code",
          "receiver_name", "add1", "add2", "city", "province", "country", "cap", "timestamp", "fl_active")
			.values(
					id,
          userId,
          "DEFAULT",
          totalPrice,
          shippingCost,
          Conversion.getDatabaseString(state),
          Conversion.getDatabaseString(couponCode),
          Conversion.getDatabaseString(receiver),
          Conversion.getDatabaseString(add1),
          Conversion.getDatabaseString(add2),
          Conversion.getDatabaseString(city),
          Conversion.getDatabaseString(province),
          Conversion.getDatabaseString(country),
          Conversion.getDatabaseString(cap),
          "DEFAULT",
          Conversion.getDatabaseString("S")
          )
			.done();
    
    database.modify(sql);
    
    return id;
  }
  
  public static void addBookToOrder(Database database, int orderId, String bookIsbn, int quantity)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    ResultSet resultSet;
    
    /* Inserisco il legame tra libro e ordine */
    sql = sqlBuilder
			.insertInto("order_has_book",
          "book_isbn", "order_id", "quantity")
			.values(
          Conversion.getDatabaseString(bookIsbn),
          orderId,
          quantity
          )
			.done();
    
    database.modify(sql);
  }
}
