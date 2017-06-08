package bflows;

import blogics.AuthorService;
import blogics.BookHasAuthorService;
import blogics.BookHasGenreService;
import blogics.BookService;
import blogics.GenreService;
import java.io.Serializable;
import services.database.*;
import services.database.exception.*;

public class AdminManagement extends AbstractManagement implements Serializable {
	
  private int userId;
  private String titolo;
  private String descrizione;
  private String autore;
  private String isbn = "null";
  private int pagine = -1;
  private String editore;
  private String[] genere;
  private String dataPubbl;
  private String lingua;
  private float prezzo;
  private int stock;
  
	/* users.jsp -> users.jsp : block */
	public void blockUser() {
		
	}
	
	/* admins.jsp -> admins-jsp : remove */
	public void removeAdmin() {
		
	}
	
	/* signup.jsp -> admins.jsp : add */
	public void signupAdmin() {
		
	}
	
	/* admin-orders.jsp -> admin-orders.jsp : change-state */
	public void changeOrderState() {
		
	}
	
	/* add-coupon.jsp -> coupons.jsp : add */
	public void addCoupon() {
		
	}
	
	/* coupons.jsp -> coupons.jsp : disable */
	public void disableCoupon() {
		
	}
	
  /* search-jsp/book-page.jsp -> add-book.jsp : view */
	/* manda anche isbn libro come parametro */
	public void recuperaInfo() {
		
	}
  
	/* add-book.jsp -> add-book.jsp : add */
	public void addBook() throws UnrecoverableDBException {
    
		Database database = DBService.getDataBase();
    
    try {
      
      /* Inserisco il libro */
      
      BookService.insertNewBook(database, titolo, descrizione, pagine, prezzo, dataPubbl, stock, isbn, lingua, editore);
      
      /* Cerco l'ID dell'autore */
      int idAutore = AuthorService.searchFromName(database, autore);
      
      /* Se l'autore non esiste, inserisco un nuovo autore con il nome indicato */
      if(idAutore == -1)
        idAutore = AuthorService.insertNewAuthor(database, autore);
      
      /* Inserisco il legame tra libro e autore */
      BookHasAuthorService.insertAuthorOfBook(database, isbn, idAutore);
      
      /* Cerco gli ID dei generi selezionati, poi inserisco i legami tra libro e generi */
      int[] idGeneri = GenreService.getIds(database, genere);
      
      BookHasGenreService.insertGenresOfBook(database, isbn, idGeneri);
      
      /* FINITO! */
      database.commit();
      
    } catch (RecoverableDBException ex) {
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
	}
	
	
	
	
	/* add-book.jsp -> add-book.jsp : modify */
	public void modifyBook() {
		
	}
  
  public boolean checkGenere(String genere) {
    if(isbn.equals("null"))
      return false;
    
    for(int j = 0; j < this.genere.length; j++)
      if(this.genere[j].equals(genere)) 
        return true;
    
    return false;
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
  
  public String getAutore() {
    return autore;
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
  
  public String[] getGenere() {
    return genere;
  }
  
  public String getGenere(int index) {
    return this.genere[index];
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
  
  public void setAutore(String autore) {
    this.autore = autore;
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
  
  public void setGenere(String[] genere) {
    this.genere = genere;
  }

  public void setGenere(int index, String genere) {
    this.genere[index] = genere;
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
}
