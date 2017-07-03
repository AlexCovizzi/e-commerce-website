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
public class CouponService {
  public CouponService() { }
  
  public static int countCoupons(Database database)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    int risultato;
    
    sql = sqlBuilder
				.select("count(code)").as("N")
				.from("Coupon")
				.where("fl_active = 'S'")
				.done();
    
    ResultSet resultSet = database.select(sql);
    
    try {
			resultSet.next();
      risultato = resultSet.getInt("N");
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "CouponService", "getCoupons", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("CouponService", "getCoupons", ex.getMessage());}
		}

		return risultato;
  }
  
  public static List<Coupon> getCoupons(Database database, int limit, int offset)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    List<Coupon> coupons = new ArrayList<>();
    
    sql = sqlBuilder
				.select("code", "valid", "discount")
				.from("Coupon")
				.where("fl_active = 'S'")
        .limit(limit).offset(offset)
				.done();
    
    ResultSet resultSet = database.select(sql);
    
    try {
			while(resultSet.next()) {
				Coupon coupon = new Coupon(resultSet);
				coupons.add(coupon);
			}
		} catch (SQLException ex) {
			throw new RecoverableDBException(ex, "CouponService", "getCoupons", "Errore nel ResultSet");
		} finally {
			try { resultSet.close(); }
			catch (SQLException ex) { Logger.error("CouponService", "getCoupons", ex.getMessage());}
		}

		return coupons;
  }
  
  public static void addCoupon(Database database, String codice, int sconto)
      throws RecoverableDBException {
    String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Check di unicità */
    sql = sqlBuilder
        .select("code")
        .from("coupon")
        .where("fl_active='S'")
          .and("code = " + Conversion.getDatabaseString(codice))
        .done();
    
    ResultSet resultSet = database.select(sql);
    
    boolean exist = false;
    
    try {
      exist = resultSet.next();
      resultSet.close();
    } catch(SQLException e) {
      throw new RecoverableDBException("CouponService: addCoupon(): Errore sul ResultSet.");
    }
    
    /* Inserisco il coupon */
    sql = sqlBuilder
				.insertInto("coupon", "code", "valid", "discount", "fl_active")
        .values(Conversion.getDatabaseString(codice), true, sconto, Conversion.getDatabaseString("S"))
				.done();
    
    database.modify(sql);
  }
  
   public static void disable(Database database, String codice)
      throws RecoverableDBException {
     String sql = "";
    SqlBuilder sqlBuilder = new SqlBuilder();
    
    /* Inserisco il coupon */
    sql = sqlBuilder
				.update("coupon")
        .set("fl_active = \'N\'")
        .where("code = " + Conversion.getDatabaseString(codice))
				.done();
    
    database.modify(sql);
   }
}
