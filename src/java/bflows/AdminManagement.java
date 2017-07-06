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
import blogics.PublisherService;
import blogics.ReviewService;
import blogics.User;
import blogics.UserService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import services.database.*;
import services.database.exception.*;

public class AdminManagement extends AbstractManagement implements Serializable {
	
  private int userId;
  
  /* Servono per i libri */
  private String copertina;
  private String titolo;
  private String descrizione;
  private String[] autore;
  private String isbn;
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
  
  /* Servono per gli ordini */
  private List<Order> orders;
  private int orderId;
  private int orderUser = -1;
  private String orderState;
  
  /* Servono per gli utenti */
  private List<User> users;
  private List<Integer> numeroOrdini;
  private List<Integer> numeroRecensioni;
  private int listUserId;
  
  /* Servono per gli amministratori */
  private String name;
  private String surname;
  private String email;
  private String password;
  
  /* Dividere i risultati in diverse pagine */
  public static int risultatiPerPagina = 25;
  private int numeroPagine = -1;
  private int pagina = 1;
  private int offset = 0;
  
  
  
  /* FATTO */
	/* admin.jsp -> users.jsp : view */
	public void visualizzaTabellaUtenti() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Recupero gli utenti dal DB */
      this.recuperaUtenti(database, false);
      
      /* Conto gli ordini */
      this.contaOrdiniPerUtente(database);
      
      /* Conto le recensioni */
      this.contaRecensioniPerUtente(database);
      
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
  /* users.jsp -> users.jsp : block */
	public void bloccaUtente() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Blocco l'utente */
      System.out.println(listUserId);
      UserService.blockUser(database, listUserId);
      
      /* Recupero gli utenti dal DB */
      this.recuperaUtenti(database, false);
      
      /* Conto gli ordini */
      this.contaOrdiniPerUtente(database);
      
      /* Conto le recensioni */
      this.contaRecensioniPerUtente(database);
      
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
  /* users.jsp -> users.jsp : unblock */
	public void sbloccaUtente() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Blocco l'utente */
      UserService.unblockUser(database, listUserId);
      
      /* Recupero gli utenti dal DB */
      this.recuperaUtenti(database, false);
      
      /* Conto gli ordini */
      this.contaOrdiniPerUtente(database);
      
      /* Conto le recensioni */
      this.contaRecensioniPerUtente(database);
      
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
  /* admin.jsp -> admin-users.jsp : view */
	public void visualizzaTabellaAdmin() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Recupero gli utenti amministratori dal DB */
      this.recuperaUtenti(database, true);
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
	/* admins.jsp -> admins-jsp : remove */
	public void rimuoviAdmin() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Rimuovo l'amministratore indicato */
      UserService.removeUser(database, listUserId);
      
      /* Recupero gli utenti amministratori dal DB */
      this.recuperaUtenti(database, true);
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
	/* signup.jsp -> admins.jsp : add */
	public void aggiungiAdmin() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Aggiungo un amministratore con i dati indicati */
      UserService.insertUser(database, email, name, surname, password, true);
      
      /* Recupero gli utenti amministratori dal DB */
      this.recuperaUtenti(database, true);
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
  /* admin.jsp -> admin-orders.jsp : view */
  public void visualizzaTabellaOrdini() throws UnrecoverableDBException {
    Database database = DBService.getDataBase();
    
    try {
      /* Recupero gli ordini dal DB */
      this.recuperaOrders(database);
      
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
	/* admin-orders.jsp -> admin-orders.jsp : change */
	public void cambiaStatoOrdine() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Cambio lo stato dell'ordine passato */
      OrderService.changeState(database, orderId, orderState);
      
      /* Recupero gli ordini dal DB */
      this.recuperaOrders(database);
      
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
  
  /* FATTO */
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
	
  /* FATTO */
	/* coupons.jsp -> coupons.jsp : disable */
	public void disableCoupon() throws UnrecoverableDBException {
		Database database = DBService.getDataBase();
    
    try {
      /* Setto il flag del coupon a "N" */
      CouponService.disable(database, codice);
      
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
      
      copertina = libro.getCover();
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
      
      /* Recupero i generi dal DB */
      this.recuperaGeneri(database);
      
      /* Controllo l'editore */
      int idEditore = this.controlloEditore(database, editore);
      
      /* Inserisco il libro */
      System.out.println("");
      System.out.println("----- addBook -----");
      System.out.println(dataPubbl);
      System.out.println("Inserimento del libro...");
      BookService.insertNewBook(database, copertina, titolo, descrizione, pagine, prezzo, /*Date.valueOf(*/dataPubbl/*)*/, stock, isbn, lingua, idEditore);
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
    
    this.controlliCampiOpzionali();
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
      BookService.updateBook(database, copertina, titolo, descrizione, pagine, prezzo, dataPubbl, stock, isbn, lingua, idEditore);
      
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
    
    this.controlliCampiOpzionali();
	}
  
  
  
  /* Funzioni utili */
  public boolean checkGenere(String bookGeneri) {
    if(isbn == null)
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
    if(copertina == null)
      copertina = "-";
  }
  
  public void recuperaCoupons(Database database) throws RecoverableDBException {
    /* Conto le pagine solo se non le ho già contate prima */
    if(numeroPagine < 0) {
      int numeroRisultati = CouponService.countCoupons(database);
      numeroPagine = numeroRisultati / risultatiPerPagina;
      if(numeroPagine > 0 && (numeroRisultati % risultatiPerPagina) != 0)
        numeroPagine++;
    }
    
    coupons = CouponService.getCoupons(database, risultatiPerPagina, offset);
  }
  
  public void recuperaOrders(Database database) throws RecoverableDBException {
    /* Conto le pagine solo se non le ho già contate prima */
    if(numeroPagine < 0) {
      int numeroRisultati = OrderService.countOrders(database, orderUser);
      numeroPagine = numeroRisultati / risultatiPerPagina;
      if(numeroPagine > 0 && (numeroRisultati % risultatiPerPagina) != 0)
        numeroPagine++;
    }
    
    orders = OrderService.getOrders(database, orderUser, risultatiPerPagina, offset);
  }
  
  public void recuperaUtenti(Database database, boolean isAdmin) throws RecoverableDBException {
    /* Conto le pagine solo se non le ho già contate prima */
    if(numeroPagine < 0) {
      int numeroRisultati = UserService.countUsers(database);
      numeroPagine = numeroRisultati / risultatiPerPagina;
      if(numeroPagine > 0 && (numeroRisultati % risultatiPerPagina) != 0)
        numeroPagine++;
    }
    
    users = UserService.getUsers(database, risultatiPerPagina, offset, isAdmin);
  }
  
  public void contaOrdiniPerUtente(Database database) throws RecoverableDBException {
    numeroOrdini = new ArrayList();
    for(int i = 0; i < users.size(); i++) {
      int numeroDiOrdini = OrderService.countOrders(database, users.get(i).getId());
      numeroOrdini.add(numeroDiOrdini);
    }
  }
  
  public void contaRecensioniPerUtente(Database database) throws RecoverableDBException {
    numeroRecensioni = new ArrayList();
    for(int i = 0; i < users.size(); i++) {
      int numeroDiRecensioni = ReviewService.countVotes(database, users.get(i).getId());
      numeroRecensioni.add(numeroDiRecensioni);
    }
  }
  
  
  
  /* Getters */
  public int getUserId() {
    return userId;
  }
  
  public String getCopertina() {
    return copertina;
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
  
  public List<Order> getOrders() {
    return orders;
  }
  
  public int getOrderId() {
    return orderId;
  }
  
  public int getOrderUser() {
    return orderUser;
  }
  
  public String getOrderState() {
    return orderState;
  }
  
  public int getPagina() {
    return pagina;
  }

  public int getOffset() {
    return offset;
  }
  
  public int getNumeroPagine() {
    return numeroPagine;
  }

  public List<User> getUsers() {
    return users;
  }

  public List<Integer> getNumeroOrdini() {
    return numeroOrdini;
  }

  public List<Integer> getNumeroRecensioni() {
    return numeroRecensioni;
  }

  public int getListUserId() {
    return listUserId;
  }

  public String getName() {
    return name;
  }

  public String getSurname() {
    return surname;
  }

  public String getEmail() {
    return email;
  }

  public String getPassword() {
    return password;
  }
  
  
  
  /* Setters */
  public void setUserId(int userId) {
    this.userId = userId;
  }
  
  public void setCopertina(String copertina) {
    this.copertina = copertina;
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
  
  public void setOrders(List<Order> orders) {
    this.orders = orders;
  }
  
  public void setOrderCode(int orderId) {
    this.orderId = orderId;
  }

  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }
  
  public void setOrderUser(int orderUser) {
    this.orderUser = orderUser;
  }
  
  public void setOrderState(String orderState) {
    this.orderState = orderState;
  }
  
  public void setOffset(int offset) {
    this.offset = offset;
  }
  
  public void setPagina(int pagina) {
    this.pagina = pagina;
  }

  public void setNumeroPagine(int numeroPagine) {
    this.numeroPagine = numeroPagine;
  }

  public void setUsers(List<User> users) {
    this.users = users;
  }

  public void setNumeroOrdini(List<Integer> numeroOrdini) {
    this.numeroOrdini = numeroOrdini;
  }

  public void setNumeroRecensioni(List<Integer> numeroRecensioni) {
    this.numeroRecensioni = numeroRecensioni;
  }

  public void setListUserId(int listUserId) {
    this.listUserId = listUserId;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setSurname(String surname) {
    this.surname = surname;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setPassword(String password) {
    this.password = password;
  }
  
}
