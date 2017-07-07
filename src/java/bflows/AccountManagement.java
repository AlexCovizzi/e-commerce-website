package bflows;

import blogics.Author;
import blogics.AuthorService;
import blogics.Book;
import blogics.BookService;
import blogics.Genre;
import blogics.GenreService;
import blogics.ShoppingCart;
import blogics.ShoppingCartService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;
import services.session.Session;
import util.Pair;

public class AccountManagement extends AbstractManagement implements Serializable {
	
  private Cookie[] cookies;
  
  private int orderId;
  
  /**
   * Pagina: cart.jsp
   */
  /* action: view */
  private ShoppingCart cart = new ShoppingCart();
  private float total = 0;
  
  /* action: add/remove/modify */
  // Parametri
  private String isbn; // Specifica il libro da inserire/rimuovere/modificare
  private String title; // Specifica il titolo del libro da inserire/rimuovere modificare
  private int quantity;
  
  
  /**
   * Pagina: cart.jsp
   * Recupera la lista dei libri nel carrello con la loro quantità
   * e li mette in <b>ShoppingCart</b>
   */
  public void cartView() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      // Recupero la lista dei libri nel carrello e la loro quantità
      List<Pair<String, Integer>> booksIsbn;
      booksIsbn = ShoppingCartService.getBooks(database, Session.getUserId(cookies));
      
      // Recupero le info di ogni libro nella lista
      for(Pair<String, Integer> pair : booksIsbn) {
        Book book = BookService.getBookFromIsbn(database, pair.getFirst());
        
        List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
        List<Genre> bGenres = GenreService.getBookGenres(database, book.getIsbn());

        book.setAuthors(bAuthors);
        book.setGenres(bGenres);
        
        cart.addBook(book, pair.getSecond());
      }
      
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
	/* wishlist.jsp/search.jsp/book-page.jsp -> cart.jsp : add */
  /**
   * Aggiunge il libro specificato dal parametro isbn nel carrello
   * @throws services.database.exception.UnrecoverableDBException
   */
	public void addToCart() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      ShoppingCartService.addToCart(database, Session.getUserId(cookies), isbn);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
	
	/* cart.jsp -> cart.jsp : remove */
  /**
   * Pagina: cart.jsp
   * Rimuove il libro dal carrello
   * @throws UnrecoverableDBException 
   */
	public void removeFromCart() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      ShoppingCartService.removeFromCart(database, Session.getUserId(cookies), isbn);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
	
	/* cart.jsp -> cart.jsp : modify */
  /**
   * Pagina: cart.jsp
   * Modifica la quantità din un libro nel carrello
   */
	public void modifyQuantity() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      ShoppingCartService.modifyBookQuantity(database, Session.getUserId(cookies), isbn, quantity);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
	/* wishlist.jsp -> wishlist.jsp : remove */
	public void removeFromWishlist() {
		
	}
	
	
	/* order-details.jsp/orders.jsp : cancel */
	public void cancelOrder() {
		
	}
  
  /* Setters */
  public void setCookies(Cookie[] cookies) {
    this.cookies = cookies;
  }
  
  public void setOrderCode(int orderId) {
    this.orderId = orderId;
  }
  
  public void setIsbn(String isbn) {
    this.isbn = isbn;
  }
  
  public void setTitle(String title) {
    this.title = title;
  }
  
  
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  
  /* Getters */
  public int getOrderId() {
    return orderId;
  }
  
  public Cookie[] getCookies() {
    return cookies;
  }
  
  public ShoppingCart getShoppingCart() {
    return cart;
  }
  
  public String getIsbn() {
    return isbn;
  }
  
  public String getTitle() {
    return title;
  }
  
  public int getQuantity() {
    return quantity;
  }
}
