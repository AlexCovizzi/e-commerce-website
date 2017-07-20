/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bflows;

import blogics.Author;
import blogics.AuthorService;
import blogics.Book;
import blogics.BookHistoryService;
import blogics.BookService;
import blogics.Genre;
import blogics.GenreService;
import blogics.OrderService;
import blogics.Publisher;
import blogics.PublisherService;
import blogics.Review;
import blogics.ReviewService;
import blogics.ShoppingCartService;
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


public class SearchManagement extends AbstractManagement {
  /* Risultati che vengono visualizzati per pagina (metterlo come parametro?) */
  public static final int RESULTS_PER_PAGE = 25;
  
  /* Opzioni per ordinare i risultati della ricerca e corrispondenti valori per la query sql */
  public static final String[] ORDER_OPTIONS = {"Ultimi arrivi", "Ultimi pubblicati", "A-Z", "Voto", "Prezzo: crescente", "Prezzo: decrescente"};
  public static final String[] ORDER_VALUES = {"timestamp DESC", "publication_date DESC", "title ASC", "vote DESC", "price ASC", "price DESC"};
  
  /* Opzioni di filtraggio per prezzo e corrispondente range */
  public static final String[] PRICE_RANGE_OPTIONS = {"Meno di 5", "5 - 10", "10 - 20", "20 - 50", "Piu di 50"};
  public static final int[][] PRICE_RANGE_VALUES = { {0, 5,  10, 20, 50},
                                                     {5, 10, 20, 50, -1} };
  
  public static final int[] VOTE_VALUES = {90, 75, 60, 45, 30};
  
  /* Serve per le azioni che richiedono che l'utente sia loggato */
  private Cookie[] cookies;
  
  /**
   * Pagina: homepage.jsp
   */
  private List<Book> suggestedBooks;
  private List<Book> mostSoldBooks;
  private List<Book> lastPublishedBooks; 
  
  /**
   * Pagina: search.jsp
   */
  // parametri per la ricerca
	private String search = ""; // Parametro per la ricerca base(senza filtri)
  private int ord = 0; // Indica come ordinare i risultati della ricerca (vedi ORDER_OPTIONS)
  private String[] authors;
  private String[] publishers;
  private String[] genres;
  private int priceMin = -1, priceMax = -1; // -1 equivale a campo input vuoto
  private int vote = -1;
  private String lang = "all";
  private boolean disp = false;
  private int page = 1;
  // opzioni dei filtri
  private List<Pair<String, Integer>> genreFilters; // Generi con piu occorrenze nella ricerca base (senza filtri)
  private List<Pair<String, Integer>> authorFilters; // Autori con piu occorrenze nella ricerca base (senza filtri)
  private List<Pair<String, Integer>> publisherFilters; // Editori con piu occorrenze nella ricerca base (senza filtri)
  private int[] priceFilters; // Numero di libri con un certo range di prezzo nella ricerca base
  private int[] voteFilters; // Numero di libri con un certo range di voti nella ricerca base
  // risultati della ricerca
  private int totResults = 0; // Numero totale di risultati della ricerca (con filtri)
	private List<Book> books;
  
  /**
   * Pagina: book-page.jsp
   */
  // parametri
  private String isbn;
  // libro e sue recensioni
  private Book book;
  private List<Review> bookReviews; // Recensioni del libro (book)
  private Review userBookReview; // Recensione del libro (book) fatta dall'utente loggato
  // parametri inserimento recensione
  private boolean thumbUp;
  private String comment;
  private int userId;
  
  /**
   * Pagina: advanced-search.jsp
   */
  private List<Author> allAuthors;
  private List<Publisher> allPublishers;
  private List<Genre> allGenres;
  
	
  public void homepageView() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      List<String> mostViewedGenres;
      List<String> mostViewedAuthors;
      
      mostViewedGenres = BookHistoryService.getMostViewedGenres(database, Session.getUserId(cookies));
      mostViewedAuthors = BookHistoryService.getMostViewedAuthors(database, Session.getUserId(cookies));
      
      String[] mostViewedGenresArr = new String[mostViewedGenres.size()];
      mostViewedGenresArr = mostViewedGenres.toArray(mostViewedGenresArr);
      
      for(String gr:mostViewedGenresArr) {
        Logger.debug(gr);
      }
      
      suggestedBooks = new ArrayList<>();
      suggestedBooks = BookService.getBookList(database, search, authors, publishers, mostViewedGenresArr, priceMin, priceMax, vote, lang, disp, ORDER_VALUES[2], 1, 9);
      for(Book b : suggestedBooks) {
        List<Author> bAuthors = AuthorService.getBookAuthors(database, b.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, b.getIsbn());

        b.setAuthors(bAuthors);
        b.setGenres(bGenres);
      }
      
      mostSoldBooks = new ArrayList<>();
      List<String> mostSoldBooksIsbn = OrderService.getMostSoldBooks(database, 9);
      for(String bIsbn : mostSoldBooksIsbn) {
        Book b = BookService.getBookFromIsbn(database, bIsbn);
        List<Author> bAuthors = AuthorService.getBookAuthors(database, b.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, b.getIsbn());

        b.setAuthors(bAuthors);
        b.setGenres(bGenres);
        
        mostSoldBooks.add(b);
      }
      
      lastPublishedBooks = new ArrayList<>();
      lastPublishedBooks = BookService.getBookList(database, search, authors, publishers, genres, priceMin, priceMax, vote, lang, disp, ORDER_VALUES[0], 1, 9);
      for(Book b : lastPublishedBooks) {
        List<Author> bAuthors = AuthorService.getBookAuthors(database, b.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, b.getIsbn());

        b.setAuthors(bAuthors);
        b.setGenres(bGenres);
      }
      
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
  
	/* search.jsp -> search.jsp : view */
  /**
   * Recupera la lista dei libri che soddisfano la ricerca base e i filtri
   * Recupera il numero totale dei risultati della ricerca
   * Recupera informazioni sui libri cercati per compilare il menu di filtraggio a sx
   * TODO: Recupera la history dell'utente e compila una lista di libri consigliati
   * @throws UnrecoverableDBException 
   */
	public void searchView() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      
      /* Recupero i libri che soddisfano la ricerca e le loro info (autori, generi) */
      books = BookService.getBookList(database, search, authors, publishers, genres, priceMin, priceMax, vote, lang, disp, ORDER_VALUES[ord], page, RESULTS_PER_PAGE);
      for(Book b : books) {
        List<Author> bAuthors = AuthorService.getBookAuthors(database, b.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, b.getIsbn());

        b.setAuthors(bAuthors);
        b.setGenres(bGenres);
      }
      
      /* Recupero il numero totale dei risultati della ricerca */
      totResults = BookService.getTotalResults(database, search, authors, publishers, genres, priceMin, priceMax, vote, lang, disp);
      
      /* 
        recupero info varie sulla ricerca
        mi servono per "compilare" il menu a sx nella pagina search.jsp 
      */
      authorFilters = AuthorService.getSearchAuthors(database, search, authors);
      publisherFilters = PublisherService.getSearchPublishers(database, search, publishers);
      genreFilters = GenreService.getSearchGenres(database, search, genres);
      priceFilters = BookService.getFilterPrices(database, search, PRICE_RANGE_VALUES);
      voteFilters = BookService.getFilterVotes(database, search, VOTE_VALUES);

      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
  /**
   * Recupera la lista di tutti gli autori, di tutti gli editori, di tutti i generi
   * 
   * @throws UnrecoverableDBException 
   */
	public void advancedSearchView() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      allAuthors = AuthorService.getAll(database);
      allPublishers = PublisherService.getAll(database);
      allGenres = GenreService.getAll(database);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
  /* search.jsp -> search.jsp : view */
  /**
   * Recupera il libro specificato dal parametro <b>isbn</b>
   * Recupera le recensioni del libro specificato
   * Recupera la recensione dell'utente se è loggato
   * TODO: Recupera la history dell'utente e compila una lista di libri consigliati
   * @throws UnrecoverableDBException 
   */
  public void bookView() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      book = BookService.getBookFromIsbn(database, isbn);
      
      if(book != null) {
        /* Recupero dal db tutte le informazioni e le recensioni del libro */
        List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, book.getIsbn());

        book.setAuthors(bAuthors);
        book.setGenres(bGenres);

        bookReviews = ReviewService.getBookReviews(database, book.getIsbn());
        userBookReview = ReviewService.getUserBookReview(database, Session.getUserId(cookies), book.getIsbn());

        /* Aggiungo il libro alla history dell'utente se è loggato */
        if(Session.isUserLoggedIn(cookies)) {
          BookHistoryService.addToHistory(database, Session.getUserId(cookies), isbn);
        }
        
        String[] bGenresArr = new String[bGenres.size()];
        for(int i=0; i<bGenres.size(); i++) bGenresArr[i] = bGenres.get(i).getName();
        
        suggestedBooks = new ArrayList<>();
        suggestedBooks.addAll(BookService.getBookList(database, search, authors, publishers, bGenresArr, priceMin, priceMax, vote, lang, disp, ORDER_VALUES[2], 1, 9));
        
        for(Book b : suggestedBooks) {
          List<Author> sAuthors = AuthorService.getBookAuthors(database, b.getIsbn());
          List<Genre> sGenres = GenreService.getBookGenres(database, b.getIsbn());

          b.setAuthors(sAuthors);
          b.setGenres(sGenres);
        }
      }
      
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
  /* book-page.jsp -> book-page.jsp : review */
  /**
   * Inserisce una nuova recensione dell'utente loggato sul libro specificato dal parametro <b>isbn</b>
   * @throws UnrecoverableDBException 
   */
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
  
  /* book-page.jsp -> book-page.jsp : edit_review */
  /**
   * Modifica la recensione dell'utente loggato sul libro specificato dal parametro <b>isbn</b>
   * @throws UnrecoverableDBException 
   */
  public void bookEditReview() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      ReviewService.editReview(database, Session.getUserId(cookies), isbn, thumbUp, comment);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
  /* book-page.jsp -> book-page.jsp : remove_review */
  /**
   * Rimuove la recensione dell'utente loggato sul libro specificato dal parametro <b>isbn</b>
   * @throws UnrecoverableDBException 
   */
  public void bookRemoveReview() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      if(!Session.isUserAdmin(cookies))
        ReviewService.removeReview(database, Session.getUserId(cookies), isbn);
      else
        ReviewService.removeReview(database, userId, isbn);
      
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
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
  
  public void setVote(int vote) {
    this.vote = vote;
  }
  
  public void setLang(String lang) {
    this.lang = lang;
  }
  
  public void setDisp(boolean disp) {
    this.disp = disp;
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

  public void setUserId(int userId) {
    this.userId = userId;
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
  
  public int getVote() {
    return vote;
  }
  
  public String getLang() {
    return lang;
  }
  
  public boolean getDisp() {
    return disp;
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
  
  public List<Book> getSuggestedBooks() {
    return suggestedBooks;
  }
  
  public List<Book> getMostSoldBooks() {
    return mostSoldBooks;
  }
  
  public List<Book> getLastPublishedBooks() {
    return lastPublishedBooks;
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
  
  public List<Author> getAllAuthors() {
    return allAuthors;
  }
  
  public List<Publisher> getAllPublishers() {
    return allPublishers;
  }
  
  public List<Genre> getAllGenres() {
    return allGenres;
  }

  public int getUserId() {
    return userId;
  }
  
  public boolean hasPrice(int i) { return true;}
  public boolean hasVote(int i) { return true;}
 
}