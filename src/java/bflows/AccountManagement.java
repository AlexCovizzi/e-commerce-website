package bflows;

import blogics.Author;
import blogics.AuthorService;
import blogics.Book;
import blogics.BookService;
import blogics.Coupon;
import blogics.CouponService;
import blogics.Genre;
import blogics.GenreService;
import blogics.Order;
import blogics.OrderService;
import blogics.ShoppingCart;
import blogics.ShoppingCartService;
import blogics.WishlistService;
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
  
  // Parametri
  private String isbn; // Specifica il libro da inserire/rimuovere/modificare
  private String title; // Specifica il titolo del libro da inserire/rimuovere/modificare
  private int quantity;
  private String show = "current";
  
  private ShoppingCart cart = new ShoppingCart();
  private List<Book> wishlist = new ArrayList<>();
  private List<Order> orders = new ArrayList<>();
  
  
  /**
   * Pagina: cart.jsp
   * Recupera la lista dei libri nel carrello con la loro quantità
   * e li mette in <b>ShoppingCart</b>
   * @throws services.database.exception.UnrecoverableDBException
   */
  public void cartView() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      cartViewReusable(database);
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
      cartViewReusable(database);
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
      cartViewReusable(database);
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
   * @throws services.database.exception.UnrecoverableDBException
   */
	public void modifyQuantity() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      ShoppingCartService.modifyBookQuantity(database, Session.getUserId(cookies), isbn, quantity);
      cartViewReusable(database);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
  /**
   * Pagina: wishlist.jsp
   * Recupera i libri nella wishlist dell'utente
   * @throws services.database.exception.UnrecoverableDBException
   */
  public void wishlistView() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      wishlistViewReusable(database);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
	/* search.jsp/book-page.jsp -> wishlist.jsp : add */
  /**
   * Pagina: wishlist.jsp
   * Aggiunge il libro specificato dall'isbn alla lista desideri
   * @throws services.database.exception.UnrecoverableDBException
   */
	public void addToWishlist() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      WishlistService.addToWishlist(database, Session.getUserId(cookies), isbn);
      wishlistViewReusable(database);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
	/* wishlist.jsp -> wishlist.jsp : remove */
  /**
   * Pagina: wishlist.jsp
   * Rimuove dalla lista desideri il libro specificato
   * @throws UnrecoverableDBException 
   */
	public void removeFromWishlist() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      WishlistService.removeFromWishlist(database, Session.getUserId(cookies), isbn);
      wishlistViewReusable(database);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
  /**
   * Pagina: orders.jsp
   * Recupera gli ordini effettuati dell'utente (in corso e passati)
   * @throws services.database.exception.UnrecoverableDBException
   */
  public void ordersView() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      ordersViewReusable(database);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
	
	/* order-details.jsp/orders.jsp : cancel */
  /**
   * Cancella l'ordine specificato (l'ordine viene messo in stato "cancellato"
   * Attenzione: un ordine puo essere cancellato solo se è in stato "In preparazione"
   * 
   * @return Se l'operazione ha successo
   * @throws services.database.exception.UnrecoverableDBException
   */
	public void cancelOrder() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      OrderService.changeState(database, orderId, "Cancellato");
      ordersViewReusable(database);
      database.commit();
    } catch (RecoverableDBException ex) {
			database.rollBack();
			setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
  
  /**
   * Recupera la lista dei libri nel carrello con la loro quantità
   * e li mette in <b>ShoppingCart</b>
   * è il metodo base per visualizzare il carrello dell'utente
   * 
   * @param database
   * @throws RecoverableDBException 
   */
  private void cartViewReusable(Database database) throws RecoverableDBException {
    // Recupero la lista dei libri nel carrello e la loro quantità
    List<Pair<String, Integer>> booksIsbn;
    booksIsbn = ShoppingCartService.getBooks(database, Session.getUserId(cookies));

    // Recupero le info di ogni libro nella lista
    for(Pair<String, Integer> pair : booksIsbn) {
      Book book = BookService.getBookFromIsbn(database, pair.getFirst());

      List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
      book.setAuthors(bAuthors);

      cart.addBook(book, pair.getSecond());
    }
  }
  
  /**
   * Recupera i libri nella wishlist dell'utente
   * @throws services.database.exception.UnrecoverableDBException
   */
  private void wishlistViewReusable(Database database) throws RecoverableDBException {
    // Recupero la lista dei libri nel carrello e la loro quantità
    List<String> booksIsbn;
    booksIsbn = WishlistService.getBooks(database, Session.getUserId(cookies));

    // Recupero le info di ogni libro nella lista
    for(String bookIsbn : booksIsbn) {
      Book book = BookService.getBookFromIsbn(database, bookIsbn);

      List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
      book.setAuthors(bAuthors);

      wishlist.add(book);
    }
  }
  
  /**
   * Recupera gli ordini effettuati dell'utente (in corso e passati)
   * @throws services.database.exception.UnrecoverableDBException
   */
  private void ordersViewReusable(Database database) throws RecoverableDBException {
    String[] states;
    if(show.equals("current")) {
      states = new String[] {"In preparazione", "In spedizione", "In magazzino", "In consegna"};
    } else if(show.equals("all")) {
      states = new String[] {"In preparazione", "In spedizione", "In magazzino", "In consegna", "Consegnato", "Cancellato"};
    } else {
      states = new String[] {show};
    }
    orders = OrderService.getOrders(database, Session.getUserId(cookies), states);
    for(Order order : orders) {
      if(order.getCouponCode() != null) {
        Coupon coupon = CouponService.getCoupon(database, order.getCouponCode());
        order.setDiscount(coupon.getDiscount());
      }

      // Recupero la lista dei libri nell'ordine e la loro quantità
      List<Pair<String, Integer>> booksIsbn;
      booksIsbn = OrderService.getOrderBooks(database, order.getId());

      // Recupero le info di ogni libro nella lista
      for(Pair<String, Integer> pair : booksIsbn) {
        Book book = BookService.getBookFromIsbn(database, pair.getFirst());

        List<Author> bAuthors = AuthorService.getBookAuthors(database, book.getIsbn());
        book.setAuthors(bAuthors);

        order.addBook(book, pair.getSecond());
      }
    }
  }
  
  /* Setters */
  public void setCookies(Cookie[] cookies) {
    this.cookies = cookies;
  }
  
  public void setOrderId(int orderId) {
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
  
  public void setShow(String show) {
    this.show = show;
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
  
  public List<Book> getWishlist() {
    return wishlist;
  }
  
  public List<Order> getOrders() {
    return orders;
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
  
  public String getShow() {
    return show;
  }
}
