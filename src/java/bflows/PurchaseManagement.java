package bflows;

import blogics.Book;
import blogics.BookService;
import blogics.Coupon;
import blogics.CouponService;
import blogics.ShoppingCart;
import blogics.ShoppingCartService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;
import util.Pair;

public class PurchaseManagement extends AbstractManagement implements Serializable {
	
  private int userId;
  
  private String indirizzo;
  private String numeroCivico;
  private String citta;
  private String provincia;
  private String stato;
  private String cap;
  private String destinatario;
  
  private String codiceCarta;
  private String titolareCarta;
  private String meseScadenza;
  private String annoScadenza;
  private String codiceSicurezza;
  
  private String codiceCoupon;
  private Coupon coupon;
  
  private float prezzoTotale = 0;
  
  private ShoppingCart libri;
  
  
  
	/* address.jsp , order-payment.jsp , order-summary.jsp */
	
  /* order-address.jsp / order-payment.jsp -> order-summary.jsp: view */
  public void visualizzaRiepilogo() throws UnrecoverableDBException{
    Database database = DBService.getDataBase();
    
    try {
      /* Recupero i libri presenti nel carrello */
      this.recuperaLibri(database);
      
      /* FINITO! */
      database.commit();
    } catch (RecoverableDBException ex) {
      database.rollBack();
      setErrorMessage(ex.getMsg());
		} finally {
      database.close();
    }
  }
  
	/* order-summary.jsp -> order-summary.jsp : confirm */
	public void confermaOrdine() throws UnrecoverableDBException{
		Database database = DBService.getDataBase();
    
    try {
      /* Recupero i libri presenti nel carrello */
      this.recuperaLibri(database);
      
      if(codiceCoupon != null) {
        /* Verifico se il coupon è presente */
        coupon = CouponService.isValidCoupon(database, codiceCoupon);

        if(coupon.isValid()) {
          float sconto = coupon.getDiscount();
          prezzoTotale = (1 - sconto / 100) * prezzoTotale;

          /* Arrotondo alla seconda cifra */
          prezzoTotale = ((float)((int)(prezzoTotale*100)))/100;
          
          this.registraOrdine(database);
        }
      } else {
        this.registraOrdine(database);
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
	
	/* order-summary.jsp -> order-summary.jsp : verify */
	public void verificaCoupon() throws UnrecoverableDBException{
		Database database = DBService.getDataBase();
    
    try {
      /* Recupero i libri presenti nel carrello */
      this.recuperaLibri(database);
      
      if(codiceCoupon != null) {
        /* Verifico se il coupon è presente */
        coupon = CouponService.isValidCoupon(database, codiceCoupon);

        if(coupon.isValid()) {
          float sconto = coupon.getDiscount();
          prezzoTotale = (1 - sconto / 100) * prezzoTotale;

          /* Arrotondo alla seconda cifra */
          prezzoTotale = ((float)((int)(prezzoTotale*100)))/100;
        }
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
  public void recuperaLibri(Database database)
      throws RecoverableDBException {
    List<Pair<String, Integer>> risultato = ShoppingCartService.getBooks(database, userId);
    
    libri = new ShoppingCart();
    
    for(int i = 0; i < risultato.size(); i++) {
      Book libro = BookService.getBookFromIsbn(database, risultato.get(i).getFirst());
      libri.addBook(libro, risultato.get(i).getSecond());
      
      prezzoTotale += libro.getPrice() * risultato.get(i).getSecond();
    }
  }
  
  public void registraOrdine(Database database)
      throws RecoverableDBException {
    OrderService.insertOrder(database, userId, prezzoTotale, "In preparazione", codiceCoupon, destinatario, indirizzo, numeroCivico, citta, provincia, stato, cap);
  }
  
  
  
  /* Getters */
  public int getUserId() {
    return userId;
  }

  public String getIndirizzo() {
    return indirizzo;
  }

  public String getNumeroCivico() {
    return numeroCivico;
  }

  public String getCitta() {
    return citta;
  }

  public String getProvincia() {
    return provincia;
  }

  public String getStato() {
    return stato;
  }

  public String getCap() {
    return cap;
  }

  public String getDestinatario() {
    return destinatario;
  }

  public String getCodiceCarta() {
    return codiceCarta;
  }

  public String getTitolareCarta() {
    return titolareCarta;
  }

  public String getMeseScadenza() {
    return meseScadenza;
  }

  public String getAnnoScadenza() {
    return annoScadenza;
  }

  public String getCodiceSicurezza() {
    return codiceSicurezza;
  }

  public String getCodiceCoupon() {
    return codiceCoupon;
  }

  public ShoppingCart getLibri() {
    return libri;
  }

  public Coupon getCoupon() {
    return coupon;
  }

  public float getPrezzoTotale() {
    return prezzoTotale;
  }
  
  
  
  
  /* Setters */
  public void setUserId(int userId) {
    this.userId = userId;
  }

  public void setIndirizzo(String indirizzo) {
    this.indirizzo = indirizzo;
  }

  public void setNumeroCivico(String numeroCivico) {
    this.numeroCivico = numeroCivico;
  }

  public void setCitta(String citta) {
    this.citta = citta;
  }

  public void setProvincia(String provincia) {
    this.provincia = provincia;
  }

  public void setStato(String stato) {
    this.stato = stato;
  }

  public void setCap(String cap) {
    this.cap = cap;
  }

  public void setDestinatario(String destinatario) {
    this.destinatario = destinatario;
  }

  public void setCodiceCarta(String codiceCarta) {
    this.codiceCarta = codiceCarta;
  }

  public void setTitolareCarta(String titolareCarta) {
    this.titolareCarta = titolareCarta;
  }

  public void setMeseScadenza(String meseScadenza) {
    this.meseScadenza = meseScadenza;
  }

  public void setAnnoScadenza(String annoScadenza) {
    this.annoScadenza = annoScadenza;
  }

  public void setCodiceSicurezza(String codiceSicurezza) {
    this.codiceSicurezza = codiceSicurezza;
  }

  public void setCodiceCoupon(String codiceCoupon) {
    this.codiceCoupon = codiceCoupon;
  }

  public void setLibri(ShoppingCart libri) {
    this.libri = libri;
  }

  public void setCoupon(Coupon coupon) {
    this.coupon = coupon;
  }

  public void setPrezzoTotale(float prezzoTotale) {
    this.prezzoTotale = prezzoTotale;
  }
  
}
