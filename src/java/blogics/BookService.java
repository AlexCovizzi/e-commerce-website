/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blogics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import services.database.Database;
import services.database.exception.*;
import util.Conversion;
import util.SqlBuilder;

/**
 *
 * @author alemo
 */

public class BookService {
  
  public BookService() { }
  
  public static void insertNewBook(Database db, String title, String description, int pages, float price,
      Date publication_date, int stock, String isbn, String language, String publisher)
      throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException
  {
    String sql = "";
    
    /* Check di unicità */
	/*
    sql +=  " SELECT bookID " +
            "   FROM book " +
            " WHERE " +
            "   FL_ACTIVE='S' and " +
            "   title='" + Conversion.getDatabaseString(title) + "' and " +
            "   ISBN='" + Conversion.getDatabaseString(isbn) + "' and " +
            "   publisher='" +Conversion.getDatabaseString(publisher) + "' "; */
	
	SqlBuilder sqlBuilder = new SqlBuilder();
	
	sql = sqlBuilder
			.select("bookID")
			.from("book")
			.where("fl_active='S'")
				.and("title=" + Conversion.getDatabaseString(title))
				.and("ISBN=" + Conversion.getDatabaseString(isbn))
				.and("publisher=" + Conversion.getDatabaseString(publisher))
			.done();
	
	
    
    ResultSet resultSet = db.select(sql);
    
    boolean exist=false;
    
    try {
      exist=resultSet.next();
      resultSet.close();
    } catch (SQLException e) {
      throw new ResultSetDBException("BookService: insertNewBook(): Errore sul ResultSet.");
    }
    
    if (exist) {
      throw new DuplicatedRecordDBException("BookService: insertNewBook(): Tentativo di inserimento di un libro già esistente.");
    }
    
    /* Generazione bookID */
    // sql = "SELECT MAX(bookID) AS N FROM book";
	
	sql = sqlBuilder
			.select("MAX(bookID)").as("N").from("book")
			.done();
    
    int bookId;
    
    try {
      resultSet=db.select(sql);
      
      if (resultSet.next())
        bookId = resultSet.getInt("N") + 1;
      else
        bookId = 1;
      
      resultSet.close();
      
    } catch (SQLException e) {
      throw new ResultSetDBException("BookService: insertNewBook(): Errore sul ResultSet --> impossibile calcolare bookID.");
    }
    
    /* Inserimento */
	/*
    sql = " INSERT INTO book " +
          "   (bookID, title, description, pages, price, publication_date, stock, isbn, language, publisher ,timestamp_c) " +
          " VALUES (" +
          "   " + bookId + "," +
          "   '" + Conversion.getDatabaseString(title) + "'," +
          "   '" + Conversion.getDatabaseString(description) + "'," +
          "   " + pages + "," +
          "   " + price + "," +
          "   " + publication_date + "," +
          "   " + stock + "," +
          "   '" + Conversion.getDatabaseString(isbn) + "'," +
          "   '" + Conversion.getDatabaseString(language) + "'," +
          "   '" + Conversion.getDatabaseString(publisher) + "'," +
          "   DEFAULT" +
          " );"; */
	
	sql = sqlBuilder
			.insertInto("book", "bookID", "title", "description", 
					"pages", "price", "publication_date", "stock",
					"isbn", "language", "publisher", "timestamp_c")
			.values(String.valueOf(bookId),
					Conversion.getDatabaseString(title),
					Conversion.getDatabaseString(description),
					String.valueOf(pages),
					String.valueOf(price),
					String.valueOf(publication_date),
					String.valueOf(stock),
					Conversion.getDatabaseString(isbn),
					Conversion.getDatabaseString(language),
					Conversion.getDatabaseString(publisher),
					"DEFAULT")
			.done();
    
    db.modify(sql);
  }
}
