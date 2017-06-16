/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bflows;

import blogics.Author;
import blogics.AuthorService;
import blogics.Book;
import blogics.BookService;
import blogics.Genre;
import blogics.GenreService;
import blogics.UserService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;
import util.Logger;


public class SearchManagement extends AbstractManagement {
	
	private List<Book> books;
	
	/* search.jsp -> search.jsp : view */
	public void view() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    try {
      books = BookService.getBookList(database, "", "", new String[]{""}, new String[]{"mondadori","deagostini"}, new String[]{""}, new String[]{""}, new String[]{""}, "", 1, 25);

      for(Book book : books) {
        List<Author> authors = AuthorService.getBookAuthors(database, book.getIsbn());
        List<Genre> genres = GenreService.getBookGenres(database, book.getIsbn());

        book.setAuthors(authors);
        book.setGenres(genres);
      }

      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
	
	/* search.jsp/book-page.jsp : add-to-cart */
	public void addToCart() {
		
	}
	
	/* search.jsp/book-page.jsp : add-to-wishlist */
	public void addToWishlist() {
		
	}
	
	/* book-page.jsp : vote */
	public void vote() {
		
	}
	
	public void addToHistory() {
		
	}
  
  public List<Book> getBooks() {
    return books;
  }
}