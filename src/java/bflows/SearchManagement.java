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
import blogics.PublisherService;
import blogics.Review;
import blogics.ReviewService;
import blogics.UserService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import util.Pair;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;
import services.session.Session;
import util.Logger;
import util.Triplet;


public class SearchManagement extends AbstractManagement {
  public static final int RESULTS_PER_PAGE = 3;
  /* 
    Array che descrivono rispettivamente le opzione di ordine della ricerca libri,
    le opzioni di filtraggio per costo, le opzioni di filtraggio per voto
  */
  public static final String[] ORDER_OPTIONS = {"A-Z", "Ultimi pubblicati", "Voto", "Prezzo: crescente", "Prezzo: decrescente"};
  public static final String[] ORDER_VALUES = {"title ASC", "publication_date ASC", "vote DESC", "price ASC", "price DESC"};
  
  public static final String[] PRICE_RANGE_OPTIONS = {"Meno di 5", "5 - 10", "10 - 20", "20 - 50", "Piu di 50"};
  public static final int[][] PRICE_RANGE_VALUES = { {0, 5,  10, 20, 50},
                                                     {5, 10, 20, 50, -1} };
  
  Cookie[] cookies;
  
  /* Pagina: Search */
  // parametri
	private String search = ""; 
  private int ord = 0;
  private String isbn;
  private String[] authors;
  private String[] publishers;
  private String[] genres;
  private int priceMin = -1, priceMax = -1;
  private int page = 1;
  // opzioni dei filtri
  private List<Pair<String, Integer>> genreFilters;
  private List<Pair<String, Integer>> authorFilters;
  private List<Pair<String, Integer>> publisherFilters;
  private int[] priceFilters;
  private int[] voteFilters;
  // risultati della ricerca
  private int totResults = 0;
	private List<Book> books;
  
  /* Pagina: Book */
  private Book book;
  private List<Review> bookReviews;
  private Review userBookReview;
  // inserimento recensione
  private boolean thumbUp;
  private String comment;
  
	
	/* search.jsp -> search.jsp : view */
	public void searchView() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      
      books = BookService.getBookList(database, search, authors, publishers, genres, priceMin, priceMax, ORDER_VALUES[ord], page, RESULTS_PER_PAGE);
      
      totResults = BookService.getTotalResults(database, search, authors, publishers, genres, priceMin, priceMax);

      for(Book b : books) {
        List<Author> bAuthors = AuthorService.getBookAuthors(database, b.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, b.getIsbn());

        b.setAuthors(bAuthors);
        b.setGenres(bGenres);
      }
      
      // mi servono per "compilare" il menu a sx nella pagina search.jsp
      genreFilters = GenreService.getSearchGenres(database, search);
      authorFilters = AuthorService.getSearchAuthors(database, search);
      publisherFilters = PublisherService.getSearchPublishers(database, search);
      priceFilters = BookService.getFilterPrices(database, search, PRICE_RANGE_VALUES);

      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
  /* search.jsp -> search.jsp : view */
  public void bookView() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      book = BookService.getBookFromIsbn(database, isbn);
      /* Se nessun libro viene trovato con questo isbn concludi il metodo */
      if(book == null) return;
      
      List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
      List<Genre> bGenres = GenreService.getBookGenres(database, book.getIsbn());

      book.setAuthors(bAuthors);
      book.setGenres(bGenres);
      
      bookReviews = ReviewService.getBookReviews(database, book.getIsbn());
      userBookReview = ReviewService.getUserBookReview(database, Session.getUserId(cookies), book.getIsbn());
      Logger.debug(userBookReview);

      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
  /* search.jsp -> search.jsp : review */
  public void bookReview() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      ReviewService.insertReview(database, Session.getUserId(cookies), isbn, thumbUp, comment);
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
	
	/* b-page.jsp : vote */
	public void vote() {
		
	}
	
	public void addToHistory() {
		
	}
  
  public List<Book> getBooks() {
    return books;
  }
  
  /* Setters */
  public void setCookies(Cookie[] cookies) {
    this.cookies = cookies;
  }
  
  public void setSearch(String search) {
    this.search = search;
  }
  
  public void setOrd(int ord) {
    this.ord = ord;
  }
  
  public void setTotResults(int totResults) {
    this.totResults = totResults;
  }
  
  public void setIsbn(String isbn) {
    this.isbn = isbn;
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
  
  public void setPriceMin(int priceMin) {
    this.priceMin = priceMin;
  }
  
  public void setPriceMax(int priceMax) {
    this.priceMax = priceMax;
  }
  
  public void setPage(int page) {
    this.page = page;
  }
  
  public void setThumbUp(boolean thumbUp) {
    this.thumbUp = thumbUp;
  }
  
  public void setComment(String comment) {
    this.comment = comment;
  }
  
  /* Getters */
  public Cookie[] getCookies() {
    return cookies;
  }
  
  public String getSearch() {
    return search;
  }
  
  public int getOrd() {
    return ord;
  }
  
  public int getTotResults() {
    return totResults;
  }
  
  public String getIsbn() {
    return isbn;
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
  
  public int getPriceMin() {
    return priceMin;
  }
  
  public int getPriceMax() {
    return priceMax;
  }
  
  public int getPage() {
    return page;
  }
  
  public boolean getThumbUp() {
    return thumbUp;
  }
  
  public String getComment() {
    return comment;
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
  
  public int[] getPriceFilters() {
    return priceFilters;
  }
  
  public int[] getVoteFilters() {
    return voteFilters;
  }
  
  public Book getBook() {
    return book;
  }
  
  public List<Review> getBookReviews() {
    return bookReviews;
  }
  
  public Review getUserBookReview() {
    return userBookReview;
  }
  
  /* Metodi utility */
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
  
  public boolean hasPrice(int i) { return true;}
  public boolean hasVote(int i) { return true;}
 
}