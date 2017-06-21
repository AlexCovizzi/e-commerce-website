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
import blogics.Review;
import blogics.ReviewService;
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
import util.Triplet;


public class SearchManagement extends AbstractManagement {
  /* 
    Array che descrivono rispettivamente le opzione di ordine della ricerca libri,
    le opzioni di filtraggio per costo, le opzioni di filtraggio per voto
  */
  public static final String[] ORDER_OPTIONS = {"A-Z", "Ultimi arrivi", "Voto", "Prezzo: crescente", "Prezzo: decrescente"};
  public static final Triplet[] PRICE_RANGE_OPTIONS = {new Triplet("< 5,00", 0, 4.99), new Triplet("5,00 - 7,49", 5, 7.49), new Triplet("7,50 - 9,99", 7.5, 9.99), new Triplet("10,00 - 14,99", 10, 14.99), new Triplet("15,00 - 29,99", 15, 29.99), new Triplet("> 30,00", 30, 999999)};
  public static final Triplet[] VOTE_RANGE_OPTIONS = {new Triplet("> 90%", 0.9, 1.0), new Triplet("75% - 90%", 0.75, 0.89999), new Triplet("60% - 75%", 0.6, 0.749999), new Triplet("40% - 60%", 0.4, 0.59999), new Triplet("< 40%", 0, 0.39999)};
  
  /* Pagina: Search */
  // parametri
	private String search = "";
  private int ord = 0;
  private String isbn;
  private String[] authors;
  private String[] publishers;
  private String[] genres;
  private int[] prices;
  private int[] votes;
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
  
	
	/* search.jsp -> search.jsp : view */
	public void searchView() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      books = BookService.getBookList(database, search, authors, publishers, genres, prices, votes, getSqlOrder(ord), page, 25);

      for(Book b : books) {
        List<Author> bAuthors = AuthorService.getBookAuthors(database, b.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, b.getIsbn());

        b.setAuthors(bAuthors);
        b.setGenres(bGenres);
      }
      
      // mi servono per "compilare" il menu a sx nella pagina search.jsp
      genreFilters = BookService.getFilterGenres(database, search);
      authorFilters = BookService.getFilterAuthors(database, search);
      publisherFilters = BookService.getFilterPublishers(database, search);
      priceFilters = BookService.getFilterPrices(database, search, PRICE_RANGE_OPTIONS);
      voteFilters = BookService.getFilterVotes(database, search, VOTE_RANGE_OPTIONS);

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
      Book book = BookService.getBookFromIsbn(database, isbn);
      
      List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
      List<Genre> bGenres = GenreService.getBookGenres(database, book.getIsbn());

      book.setAuthors(bAuthors);
      book.setGenres(bGenres);
      
      books = new ArrayList<>();
      books.add(book);
      
      bookReviews = ReviewService.getBookReviews(database, book.getIsbn());

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
  
  public void setPrices(int[] prices) {
    this.prices = prices;
  }
  
  public void setVotes(int[] votes) {
    this.votes = votes;
  }
  
  public void setPage(int page) {
    this.page = page;
  }
  
  /* Getters */
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
  
  public int[] getPrices() {
    return prices;
  }
  
  public int[] getVotes() {
    return votes;
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
  
  public int[] getPriceFilters() {
    return priceFilters;
  }
  
  public int[] getVoteFilters() {
    return voteFilters;
  }
  
  public List<Review> getBookReviews() {
    return bookReviews;
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
  
  public boolean hasPrice(int price) {
    if(prices == null) return false;
    for(int p : prices) {
      if(p == price) return true;
    }
    return false;
  }
  
  public boolean hasVote(int vote) {
    if(votes == null) return false;
    for(int v : votes) {
      if(v == vote) return true;
    }
    return false;
  }
  
  
  /* metodi utility */
  
  private String getSqlOrder(int ord) {
    switch (ord) {
      case 0: return "title ASC";
      case 1: return "publication_date ASC";
      case 2: return "vote DESC";
      case 3: return "price ASC";
      case 4: return "price DESC";
      default: return "title ASC";
    }
  }
}