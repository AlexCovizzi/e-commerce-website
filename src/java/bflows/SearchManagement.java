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
  public static final String[] PRICE_RANGE_OPTIONS = {"< 5,00", "5,00 - 7,49", "7,50 - 9,99", "10,00 - 14,99", "15,00 - 29,99", "> 30,00"};
  public static final String[] VOTE_RANGE_OPTIONS = {"> 90%", "75% - 90%", "60% - 75%", "40% - 60%", "< 40%"};
  
  public static final float[][] PRICE_RANGE_VALUES = { {0.00f, 5.00f, 7.50f, 10.00f, 15.00f, 30.00f},
                                                        {4.99f, 7.49f, 9.99f, 14.99f, 29.99f, 9999} };
  public static final float[][] VOTE_RANGE_VALUES =  { {0.9f, 0.75f,   0.6f,     0.4f,    0},
                                                        {1.0f, 0.8999f, 0.74999f, 0.5999f, 0.3999f} };
  
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
      float[][] priceRanges = null;
      float[][] voteRanges = null;
      
      if(prices != null) {
        priceRanges = new float[prices.length][2];
        for(int i=0; i<priceRanges.length; i++) {
          priceRanges[i][0] = PRICE_RANGE_VALUES[prices[i]][0];
          priceRanges[i][1] = PRICE_RANGE_VALUES[prices[i]][1];
        }
      }
      if(votes != null) {
        voteRanges = new float[votes.length][2];
        for(int i=0; i<voteRanges.length; i++) {
          voteRanges[i][0] = VOTE_RANGE_VALUES[votes[i]][0];
          voteRanges[i][1] = VOTE_RANGE_VALUES[votes[i]][1];
        }
      }
      
      books = BookService.getBookList(database, search, authors, publishers, genres, priceRanges, voteRanges, getSqlOrder(ord), page, 25);

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
      priceFilters = BookService.getFilterPrices(database, search, PRICE_RANGE_VALUES);
      voteFilters = BookService.getFilterVotes(database, search, VOTE_RANGE_VALUES);

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