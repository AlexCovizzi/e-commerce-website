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
import util.Pair;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;
import util.Logger;


public class SearchManagement extends AbstractManagement {
  
  private int totResults = 0;
	private String search = "";
  private String ord = "az";
  private String[] authors;
  private String[] publishers;
  private String[] genres;
  private int page = 1;
  
  private List<Pair<String, Integer>> genreFilters;
  private List<Pair<String, Integer>> authorFilters;
  private List<Pair<String, Integer>> publisherFilters;
  
	private List<Book> books;
	
	/* search.jsp -> search.jsp : view */
	public void view() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      totResults = BookService.getTotalResults(database, search);
      
      books = BookService.getBookList(database, search, authors, publishers, genres, new String[]{""}, new String[]{""}, getSqlOrder(ord), page, 25);

      for(Book book : books) {
        List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, book.getIsbn());

        book.setAuthors(bAuthors);
        book.setGenres(bGenres);
      }
      
      genreFilters = BookService.getFilterGenres(database, search);
      authorFilters = BookService.getFilterAuthors(database, search);
      publisherFilters = BookService.getFilterPublishers(database, search);

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
  public void setSearch(String search) {
    this.search = search;
  }
  
  public void setOrd(String ord) {
    this.ord = ord;
  }
  
  public void setTotResults(int totResults) {
    this.totResults = totResults;
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
  public String getSearch() {
    return search;
  }
  
  public String getOrd() {
    return ord;
  }
  
  public int getTotResults() {
    return totResults;
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
  
  public List<Pair<String, Integer>> getGenreFilters() {
    return genreFilters;
  }
  
  public List<Pair<String, Integer>> getAuthorFilters() {
    return authorFilters;
  }
  
  public List<Pair<String, Integer>> getPublisherFilters() {
    return publisherFilters;
  }
  
  public boolean hasGenre(String genre) {
    if(genres == null) return false;
    for(String g : genres) {
      if(g.equals(genre)) return true;
    }
    return false;
  }
  
  public boolean hasAuthor(String author) {
    if(authors == null) return false;
    for(String a : authors) {
      if(a.equals(author)) return true;
    }
    return false;
  }
  
  public boolean hasPublisher(String publisher) {
    if(publishers == null) return false;
    for(String p : publishers) {
      if(p.equals(publisher)) return true;
    }
    return false;
  }
  
  
  /* metodi utility */
  private String getSqlOrder(String ord) {
    switch (ord) {
      case "az": return "title ASC";
      case "last": return "timestamp ASC";
      case "best": return "vote DESC";
      case "aprice": return "price ASC";
      case "dprice": return "price DESC";
      default: return "title ASC";
    }
  }
}