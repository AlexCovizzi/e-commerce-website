package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 
 * @author alemo
 */

public class Book {
  
  private String title;
  private String description;
  private int pages;
  private float price;
  private String publication_date;
  private int stock;
  private String isbn;
  private String language;
  private String publisher;
  private float vote;
  private int nVotes;
  
  private List<Author> authors;
  private List<Genre> genres;
  
  public Book(String title, String description, int pages, float price, String publication_date,
      int stock, String isbn, String language, String publisher) 
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
    try {publisher = resultSet.getString("PUBLISHER_NAME");} catch (SQLException sqle) {}
    try {vote = resultSet.getFloat("VOTE");} catch (SQLException sqle) {}
    try {nVotes = resultSet.getInt("N_VOTES");} catch (SQLException sqle) {}
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
  
  public void setAuthors(List<Author> authors) {
	  this.authors = authors;
  }
  public void setGenres(List<Genre> genres) {
	  this.genres = genres;
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
  
  public int getVotePercent() {
    return (int) (vote*100);
  }
  
  public int getNVotes() {
    return nVotes;
  }
  
  public List<Author> getAuthors() {
	  return authors;
  }
  
  public List<Genre> getGenres() {
	  return genres;
  }
  
  @Override
  public String toString() {
	  String string = isbn+", "+title+", "+price+", "+publisher+", ";
	  for(Author author:authors) {
		  string += author.getName()+", ";
	  }
	  for(Genre genre:genres) {
		  string += genre.getName()+", ";
	  }
	  return string;
  }
}
