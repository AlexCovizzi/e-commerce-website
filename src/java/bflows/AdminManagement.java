package bflows;

import blogics.Author;
import blogics.AuthorService;
import blogics.Book;
import blogics.BookService;
import blogics.Coupon;
import blogics.CouponService;
import blogics.Genre;
import blogics.GenreService;
import blogics.PublisherService;
import java.io.Serializable;
import java.util.List;
import services.database.*;
import services.database.exception.*;

public class AdminManagement extends AbstractManagement implements Serializable {
	
  private int userId;
  
  /* Servono per i libri */
  private String titolo;
  private String descrizione;
  private String autore[];
  private String isbn = "null";
  private int pagine = -1;
  private String editore;
  private String[] bookGeneri; /* Serve per salvare i generi selezionati del libro */
  private String dataPubbl;
  private String lingua;
  private float prezzo;
  private int stock;
  
  private String[] generi; /* Serve per scrivere i generi salvati nel DB */
  
  /* Servono per i coupon */
  private String codice;
  private int sconto;
  private List<Coupon> coupons;
  
  
  
	/* users.jsp -> users.jsp : block */
	public void blockUser() throws UnrecoverableDBException {
		
	}
	
  
  
	/* admins.jsp -> admins-jsp : remove */
	public void removeAdmin() throws UnrecoverableDBException {
		
	}
	
	/* signup.jsp -> admins.jsp : add */
	public void signupAdmin() throws UnrecoverableDBException {
		
	}
	
  
  
	/* admin-orders.jsp -> admin-orders.jsp : change-state */
	public void changeOrderState() throws UnrecoverableDBException {
		
	}
	
  
  
  /* FATTO */
  /* pagina qualsiasi -> coupons.jsp : view */
	public void visualizzaTabellaCoupon() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Recupero i coupon dal DB */
      this.recuperaCoupons(database);
      
      /* FINITO! */
      database.commit();
    } catch (RecoverableDBException ex) {
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
	/* add-coupon.jsp -> coupons.jsp : add */
	public void addCoupon() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Aggiungo il coupon */
      CouponService.addCoupon(database, codice, sconto);
      
      /* Recupero i coupon dal DB */
      this.recuperaCoupons(database);
      
      /* FINITO! */
      database.commit();
    } catch (RecoverableDBException ex) {
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
	
	/* coupons.jsp -> coupons.jsp : disable */
	public void disableCoupon() throws UnrecoverableDBException {
		
	}
	
  
  
  /* FATTO */
  /* add-book.jsp : view */
  /* azione per view senza isbn */
  public void visualizzaFormAddBook() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      /* Recupero i generi dal DB */
      this.recuperaGeneri(database);
      
      /* FINITO! */
      database.commit();
    } catch (RecoverableDBException ex) {
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
  /* FATTO */
  /* search-jsp/book-page.jsp -> add-book.jsp : view */
	/* manda anche isbn libro come parametro */
	public void recuperaInfo() throws UnrecoverableDBException {
Database database = DBService.getDataBase();
    
    try {
      /* Recupero i generi dal DB */
      this.recuperaGeneri(database);
      
      /* Recuperiamo tutto le info del libro */
      Book libro = BookService.getBookFromIsbn(database, isbn);
      
      titolo = libro.getTitle();
      descrizione = libro.getDescription();
      pagine = libro.getPages();
      editore = libro.getPublisher();
      dataPubbl = libro.getPublicationDate();
      lingua = libro.getLanguage();
      prezzo = libro.getPrice();
      stock = libro.getStock();
      
      /* Per l'autore e i generi funziona un po' diversamente... */
      List<Author> autori = AuthorService.getBookAuthors(database, isbn);
       
      autore = new String[autori.size()];

      for(int i = 0; i < autore.length; i++)
        autore[i] = autori.get(i).getName();
      
      List<Genre> bookHasGenre = GenreService.getBookGenres(database, isbn);
      
      bookGeneri = new String[bookHasGenre.size()];
      for(int i = 0; i < bookGeneri.length; i++)
        bookGeneri[i] = bookHasGenre.get(i).getName();
      
      /* FINITO! */
      database.commit();
    } catch (RecoverableDBException ex) {
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
  
  /* FATTO */
	/* add-book.jsp -> add-book.jsp : add */
	public void addBook() throws UnrecoverableDBException {
    
		Database database = DBService.getDataBase();
    
    try {
      
      this.controlliCampiOpzionali();
      
      /* Recupero i generi dal DB */
      this.recuperaGeneri(database);
      
      /* Controllo l'editore */
      int idEditore = this.controlloEditore(database, editore);
      
      /* Inserisco il libro */
      System.out.println("");
      System.out.println("----- addBook -----");
      System.out.println("Inserimento del libro...");
      BookService.insertNewBook(database, titolo, descrizione, pagine, prezzo, dataPubbl, stock, isbn, lingua, idEditore);
      System.out.println("Libro inserito!");
      
      
      
      /* Controllo gli autori */
      int[] idAutore = this.controlloAutori(database, autore);
      
      /* Inserisco il legame tra libro e autore */
      System.out.println("Scrittura del autore del libro...");
      for(int i = 0; i < idAutore.length; i++)
        AuthorService.insertAuthorOfBook(database, isbn, idAutore[i]);
      
      /* Cerco gli ID dei generi selezionati, poi inserisco i legami tra libro e generi */
      for(int i = 0; i < bookGeneri.length; i++)
        System.out.println(bookGeneri[i]);
      
      System.out.println("");
      
      System.out.println("Cerco gli id dei generi indicati...");
      int[] idGeneri = GenreService.getIds(database, bookGeneri);
      for(int i = 0; i < idGeneri.length; i++)
        System.out.println("Id del bookGeneri " + bookGeneri[i] + ": " + idGeneri[i]);
      
      System.out.println("Scrittura dei generi del libro...");
      for(int i = 0; i < idGeneri.length; i++)
        GenreService.insertGenreOfBook(database, isbn, idGeneri[i]);
      System.out.println("Scritti!");
      
      /* FINITO! */
      database.commit();
      System.out.println("Stato: committed");
      
    } catch (RecoverableDBException ex) {
      System.out.println("Oh, cavolo! Qualcosa è andato storto!");
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
      System.out.println("Chiusura del database... Fatto!");
    }
    
    System.out.println("Abbiamo finito, penso!");
	}
	
  /* FATTO */
	/* add-book.jsp -> add-book.jsp : modify */
	public void modifyBook() throws UnrecoverableDBException {
		
		Database database = DBService.getDataBase();
    
    try {
      
      this.controlliCampiOpzionali();
      
      /* Recupero i generi dal DB */
      this.recuperaGeneri(database);
      
      /* Controllo l'editore */
      int idEditore = this.controlloEditore(database, editore);
      
      /* Aggiorno le info del libro */      
      BookService.updateBook(database, titolo, descrizione, pagine, prezzo, dataPubbl, stock, isbn, lingua, idEditore);
      
      /* Controllo gli autori */
      int[] idAutori = this.controlloAutori(database, autore);
      
      /* Prendo il vettore degli autori vecchi del libro */
      List<Author> vecchiAutori = AuthorService.getBookAuthors(database, isbn);
      
      /* Inserisco il legame tra libro e autore nuovo */
      for(int i = 0; i < idAutori.length; i++) {
        boolean presente = false;
        for(int j = 0; j < vecchiAutori.size(); j++) 
          if(vecchiAutori.get(j).getId() == idAutori[i]) {
            presente = true;
            break;
          }
        
        if(!presente)
          AuthorService.insertAuthorOfBook(database, isbn, idAutori[i]);
      }
      
      /* Tolgo le righe della tabelle book_has_author degli autori non più presenti */
      for(int i = 0; i < vecchiAutori.size(); i++) {
        int idVecchioAutore = vecchiAutori.get(i).getId();
        
        boolean presente = false;
        
        for(int j = 0; j < idAutori.length; j++) 
          if(idVecchioAutore == idAutori[j]) {
            presente = true;
            break;
          }
        
        if(!presente)
          AuthorService.deleteAuthorOfBook(database, isbn, idVecchioAutore);
      }
      
      /* Cerco gli ID dei generi selezionati */ 
      int[] idGeneri = GenreService.getIds(database, bookGeneri);
      
      /* Prendo il vettore degi generi vecchi del libro */
      List<Genre> vecchiGeneri = GenreService.getBookGenres(database, isbn);
      
      /* Inserisco i legami tra libro e generi nuovi */
      for(int i = 0; i < idGeneri.length; i++) {
        boolean presente = false;
        for(int j = 0; j < vecchiGeneri.size(); j++) 
          if(vecchiGeneri.get(j).getId() == idGeneri[i]) {
            presente = true;
            break;
          }
        
        if(!presente)
          GenreService.insertGenreOfBook(database, isbn, idGeneri[i]);
      }
      
      /* Tolgo le righe della tabelle book_has_genre dei generi non più presenti */
      for(int i = 0; i < vecchiGeneri.size(); i++) {
        int idVecchioGenere = vecchiGeneri.get(i).getId();
        
        boolean presente = false;
        
        for(int j = 0; j < idGeneri.length; j++) 
          if(idVecchioGenere == idGeneri[j]) {
            presente = true;
            break;
          }
        
        if(!presente)
          GenreService.deleteGenreOfBook(database, isbn, idVecchioGenere);
      }
      
      /* FINITO! */
      database.commit();
      
    } catch (RecoverableDBException ex) {
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
    
	}
  
  
  
  /* Funzioni utili */
  public boolean checkGenere(String bookGeneri) {
    if(isbn.equals("null"))
      return false;
    
    for(int j = 0; j < this.bookGeneri.length; j++)
      if(this.bookGeneri[j].equals(bookGeneri)) 
        return true;
    
    return false;
  }
  
  public void recuperaGeneri(Database database) throws RecoverableDBException {
    generi = GenreService.getGeneri(database);
  }
  
  public int[] controlloAutori(Database database, String[] autore) throws RecoverableDBException {
    /* Cerco l'ID degli autori */
      int idAutore[] = new int[autore.length];
      for(int i = 0; i < idAutore.length; i++)
        idAutore[i] = AuthorService.searchFromName(database, autore[i]);
      
      /* Se l'autore non esiste, inserisco un nuovo autore con il nome indicato */
      for(int i = 0; i < idAutore.length; i++) {
        if(idAutore[i] == -1) {
          idAutore[i] = AuthorService.insertNewAuthor(database, autore[i]);
        }
      }
      
      return idAutore;
  }
  
  public int controlloEditore(Database database, String editore) throws RecoverableDBException {
    /* Cerco l'ID dell'editore */
    int idEditore = PublisherService.searchFromName(database, editore);
    
    /* Se l'editore non esiste, inserisco un nuovo editore con il nome indicato */
    if(idEditore == -1)
      idEditore = PublisherService.insertNewPublisher(database, editore);

    return idEditore;
  }
  
  public void controlliCampiOpzionali() {
    if(descrizione == null)
      descrizione = "-";
    if(dataPubbl == null)
      dataPubbl = "-";
  }
  
  public void recuperaCoupons(Database database) throws RecoverableDBException {
    coupons = CouponService.getCoupons(database);
  }
  
  
  
  /* Getters */
  public int getUserId() {
    return userId;
  }
  
  public String getTitolo() {
    return titolo;
  }
  
  public String getDescrizione() {
    return descrizione;
  }
  
  public String[] getAutore() {
    return autore;
  }
  
  public String getAutore(int index) {
    return this.autore[index];
  }
  
  public String getIsbn() {
    return isbn;
  }
  
  public int getPagine() {
    return pagine;
  }
  
  public String getEditore() {
    return editore;
  }
  
  public String[] getBookGeneri() {
    return bookGeneri;
  }
  
  public String getBookGeneri(int index) {
    return this.bookGeneri[index];
  }
  
  public String getDataPubbl() {
    return dataPubbl;
  }
  
  public String getLingua() {
    return lingua;
  }
  
  public float getPrezzo() {
    return prezzo;
  }
  
  public int getStock() {
    return stock;
  }
  
  public String[] getGeneri() {
    return generi;
  }
  
  public String getGeneri(int index) {
    return this.generi[index];
  }
  
  public String getCodice() {
    return codice;
  }
  
  public int getSconto() {
    return sconto;
  }
  
  public List<Coupon> getCoupons() {
    return coupons;
  }
  
  
  
  /* Setters */
  public void setUserId(int userId) {
    this.userId = userId;
  }
  
  public void setTitolo(String titolo) {
    this.titolo = titolo;
  }
  
  public void setDescrizione(String descrizione) {
    this.descrizione = descrizione;
  }
  
  public void setAutore(String[] autore) {
    this.autore = autore;
  }
  
  public void setAutore(int index, String autore) {
    this.autore[index] = autore;
  }
  
  public void setIsbn(String isbn) {
    this.isbn = isbn;
  }
  
  public void setPagine(int pagine) {
    this.pagine = pagine;
  }
  
  public void setEditore(String editore) {
    this.editore = editore;
  }
  
  public void setBookGeneri(String[] bookGeneri) {
    this.bookGeneri = bookGeneri;
  }

  public void setBookGeneri(int index, String bookGeneri) {
    this.bookGeneri[index] = bookGeneri;
  }
  
  public void setDataPubbl(String dataPubbl) {
    this.dataPubbl = dataPubbl;
  }
  
  public void setLingua(String lingua) {
    this.lingua = lingua;
  }
  
  public void setPrezzo(float prezzo) {
    this.prezzo = prezzo;
  }
  
  public void setStock(int stock) {
    this.stock = stock;
  }
  
  public void setGeneri(String[] generi) {
    this.generi = generi;
  }
  
  public void setGeneri(int index, String generi) {
    this.generi[index] = generi;
  }
  
  public void setCodice(String codice) {
    this.codice = codice;
  }
  
  public void setSconto(int sconto) {
    this.sconto = sconto;
  }
  
  public void setCoupons(List<Coupon> coupons) {
    this.coupons = coupons;
  }
}
