/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Pair;

/**
 *
 * @author alemo
 */
public class Order {
  
  private List<Pair<Book, Integer>> books = new ArrayList<>();
  
  private int id;
  private int userId;
  private String userName;
  private String userSurname;
  private Date created;
  private float totPrice;
  private float shippingCost;
  private String state;
  private String couponCode;
  private int discount;
  private String receiver;
  private String add1;
  private String add2;
  private String city;
  private String province;
  private String country;
  private String cap;
  
  public Order(int id, int userId, String userName, String userSurname, Date created, float totPrice, float shippingCost,
    String state, String couponCode, String receiver, String add1, String add2, String city, String province,
    String country, String cap) {
    this.id = id;
    this.userId = userId;
    this.userName = userName;
    this.userSurname = userSurname;
    this.created = created;
    this.totPrice = totPrice;
    this.shippingCost = shippingCost;
    this.state = state;
    this.couponCode = couponCode;
    this.receiver = receiver;
    this.add1 = add1;
    this.add2 = add2;
    this.city = city;
    this.province = province;
    this.country = country;
    this.cap = cap;
  }
  
  public Order(ResultSet resultSet) {
    try {id = resultSet.getInt("ID");} catch (SQLException sqle) {}
    try {userId = resultSet.getInt("USER_ID");} catch (SQLException sqle) {}
    try {userName = resultSet.getString("USER_NAME");} catch (SQLException sqle) {}
    try {userSurname = resultSet.getString("USER_SURNAME");} catch (SQLException sqle) {}
    try {created = resultSet.getDate("CREATED");} catch (SQLException sqle) {}
    try {totPrice = resultSet.getFloat("TOT_PRICE");} catch (SQLException sqle) {}
    try {shippingCost = resultSet.getFloat("SHIPPING_COST");} catch (SQLException sqle) {}
    try {state = resultSet.getString("STATE");} catch (SQLException sqle) {}
    try {couponCode = resultSet.getString("COUPON_CODE");} catch (SQLException sqle) {}
    try {discount = resultSet.getInt("COUPON_DISCOUNT");} catch (SQLException sqle) {}
    try {receiver = resultSet.getString("RECEIVER_NAME");} catch (SQLException sqle) {}
    try {add1 = resultSet.getString("ADD1");} catch (SQLException sqle) {}
    try {add2 = resultSet.getString("ADD2");} catch (SQLException sqle) {}
    try {city = resultSet.getString("CITY");} catch (SQLException sqle) {}
    try {province = resultSet.getString("PROVINCE");} catch (SQLException sqle) {}
    try {country = resultSet.getString("COUNTRY");} catch (SQLException sqle) {}
    try {cap = resultSet.getString("CAP");} catch (SQLException sqle) {}
  }
  
  /* Getters */
  public Book getBook(int i) {
    return books.get(i).getFirst();
  }
  
  public int getQuantity(int i) {
    return books.get(i).getSecond();
  }
  
  public int size() {
    return books.size();
  }
  
  public int getId() {
    return id;
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
  
  public Date getCreated() {
    return created;
  }
  
  public float getTotPrice() {
    return totPrice;
  }
  
  public float getShippingCost() {
    return shippingCost;
  }
  
  public String getState() {
    return state;
  }
  
  public String getCouponCode() {
    return couponCode;
  }
  
  public int getDiscount() {
    return discount;
  }
  
  public String getReceiver() {
    return receiver;
  }
  
  public String getAdd1() {
    return add1;
  }
  
  public String getAdd2() {
    return add2;
  }
  
  public String getCity() {
    return city;
  }
  
  public String getProvince() {
    return province;
  }
  
  public String getCountry() {
    return country;
  }
  
  public String getCap() {
    return cap;
  }
  
  /* Setters */
  public void addBooks(List<Pair<Book, Integer>> books) {
    this.books = books;
  }
  
  public void addBook(Book book, int quantity) {
    books.add(new Pair(book, quantity));
  }
  
  public void setId(int id) {
    this.id = id;
  }
  
  public void setUserId(int userId) {
    this.userId = userId;
  }
  
  public void setUserName(String userName) {
    this.userName = userName;
  }
  
  public void setUserSurname(String userSurname) {
    this.userSurname = userSurname;
  }
  
  public void setCreated(Date created) {
    this.created = created;
  }
  
  public void setTotPrice(float totPrice) {
    this.totPrice = totPrice;
  }
  
  public void setShippingCost(float shippingCost) {
    this.shippingCost = shippingCost;
  }
  
  public void setState(String state) {
    this.state = state;
  }
  
  public void setCouponCode(String couponCode) {
    this.couponCode = couponCode;
  }
  
  public void setDiscount(int discount) {
    this.discount = discount;
  }
  
  public void setReceiver(String receiver) {
    this.receiver = receiver;
  }
  
  public void setAdd1(String add1) {
    this.add1 = add1;
  }
  
  public void setAdd2(String add2) {
    this.add2 = add2;
  }
  
  public void setCity(String city) {
    this.city = city;
  }
  
  public void setProvince(String province) {
    this.province = province;
  }
  
  public void setCountry(String country) {
    this.country = country;
  }
  
  public void setCap(String cap) {
    this.cap = cap;
  }
}
