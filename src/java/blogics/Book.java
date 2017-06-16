package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 * 
 * @author alemo
 */

public class Book {
  
  private String title;
  private String description;
  private int pages;
  private float price;
  private String publication_date; /* Ricordare di mettere come Stringa la data anche del DB */
  private int stock;
  private String isbn;
  private String language;
  private String publisher;
  private Timestamp timestamp;
  private String active;
  
  public Book(String title, String description, int pages, float price, String publication_date,
      int stock, String isbn, String language, String publisher, Timestamp timestamp)
  {
    this.title = title;
    this.description = description;
    this.pages = pages;
    this.price = price;
    this.publication_date = publication_date;
    this.stock = stock;
    this.isbn = isbn;
    this.language = language;
    this.publisher = publisher;
    this.timestamp = timestamp;
  }
  
  public Book(ResultSet resultSet) {
    
    try {title = resultSet.getString("TITLE");} catch (SQLException sqle) {}
    try {description = resultSet.getString("DESCRIPTION");} catch (SQLException sqle) {}
    try {pages = resultSet.getInt("PAGES");} catch (SQLException sqle) {}
    try {price = resultSet.getFloat("PRICE");} catch (SQLException sqle) {}
    try {publication_date = resultSet.getString("PUBLICATION_DATE");} catch (SQLException sqle) {}
    try {stock = resultSet.getInt("STOCK");} catch (SQLException sqle) {}
    try {isbn = resultSet.getString("ISBN");} catch (SQLException sqle) {}
    try {language = resultSet.getString("LANGUAGE");} catch (SQLException sqle) {}
    try {publisher = resultSet.getString("PUBLISHER");} catch (SQLException sqle) {}
    try {active = resultSet.getString("FL_ACTIVE");} catch (SQLException sqle) {}
    try {timestamp=resultSet.getTimestamp("TIMESTAMP");} catch (SQLException sqle) {}
    
  }
  
  /* Setters */  
  public void setTitle(String title)
  {
    this.title = title;
  }
  
  public void setDescription(String description)
  {
    this.description = description;
  }
  
  public void setPages(int pages)
  {
    this.pages = pages;
  }
  
  public void setPrice(int price)
  {
    this.price = price;
  }
  
  public void setPublicationDate(String publication_date)
  {
    this.publication_date = publication_date;
  }
  
  public void setStock(int stock)
  {
    this.stock = stock;
  }
  
  public void setIsbn(String isbn)
  {
    this.isbn = isbn;
  }
  
  public void setLanguage(String language)
  {
    this.language = language;
  }
  
  public void setPublisher(String publisher)
  {
    this.publisher = publisher;
  }
  
  public void setTimestamp(Timestamp timestamp)
  {
    this.timestamp = timestamp;
  }
  
  /* Getters */  
  public String getTitle()
  {
    return title;
  }
  
  public String getDescription()
  {
    return description;
  }
  
  public int getPages()
  {
    return pages;
  }
  
  public float getPrice()
  {
    return price;
  }
  
  public String getPublicationDate()
  {
    return publication_date;
  }
  
  public int getStock()
  {
    return stock;
  }
  
  public String getIsbn()
  {
    return isbn;
  }
  
  public String getLanguage()
  {
    return language;
  }
  
  public String getPublisher()
  {
    return publisher;
  }
  
  public Timestamp getTimestamp()
  {
    return timestamp;
  }
  
  @Override
  public String toString() {
	  return isbn+", "+title+", "+price+", "+publisher;
  }
}
