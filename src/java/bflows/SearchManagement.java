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
	private String isbn = "";
  private String title = "";
  private String[] authors = {""};
  private String[] publishers = {""};
  private String[] genres = {""};
  private int page = 1;
  
  private List<String> genreFilters;
  private List<String> authorFilters;
  private List<String> publisherFilters;
  
	private List<Book> books;
	
	/* search.jsp -> search.jsp : view */
	public void view() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    try {
      books = BookService.getBookList(database, isbn, title, authors, publishers, genres, new String[]{""}, new String[]{""}, "", page, 25);

      for(Book book : books) {
        List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, book.getIsbn());

        book.setAuthors(bAuthors);
        book.setGenres(bGenres);
      }
      
      genreFilters = BookService.getFilterGenres(database, title, isbn);
      authorFilters = BookService.getFilterAuthors(database, title, isbn);
      publisherFilters = BookService.getFilterPublishers(database, title, isbn);

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
  
  /* Setters */
  public void setIsbn(String isbn) {
    this.isbn = isbn;
  }
  
  public void setTitle(String title) {
    this.title = title;
  }
  
  public void setAuthors(String[] authors) {
    this.authors = authors;
  }
  
  public void setPublishers(String[] publishers) {
    this.publishers = publishers;
  }
  
  public void setGenres(String[] genres) {
    this.genres = genres;
  }
  
  public void setPage(int page) {
    this.page = page;
  }
  
  /* Getters */
  public String getIsbn() {
    return isbn;
  }
  
  public String getTitle() {
    return title;
  }
  
  public String[] getAuthors() {
    return authors;
  }
  
  public String[] getPublishers() {
    return publishers;
  }
  
  public String[] getGenres() {
    return genres;
  }
  
  public int getPage() {
    return page;
  }
  
  public List<String> getGenreFilters() {
    return genreFilters;
  }
  
  public List<String> getAuthorFilters() {
    return authorFilters;
  }
  
  public List<String> getPublisherFilters() {
    return publisherFilters;
  }
  
  public boolean hasGenre(String genre) {
    for(String g : genres) {
      if(g.equals(genre)) return true;
    }
    return false;
  }
  
  public boolean hasAuthor(String author) {
    for(String a : authors) {
      if(a.equals(author)) return true;
    }
    return false;
  }
  
  public boolean hasPublisher(String publisher) {
    for(String p : publishers) {
      if(p.equals(publisher)) return true;
    }
    return false;
  }
}