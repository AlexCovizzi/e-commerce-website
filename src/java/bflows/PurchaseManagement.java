package bflows;

import blogics.Book;
import blogics.BookService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import services.database.DBService;
import services.database.Database;
import services.database.exception.RecoverableDBException;
import services.database.exception.UnrecoverableDBException;

public class PurchaseManagement extends AbstractManagement implements Serializable {
	
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
  private boolean valido;
  
  private List<Book> libri = new ArrayList();
  private List<Integer> quantita = new ArrayList();
  
  
  
	/* address.jsp , order-payment.jsp , order-summary.jsp */
	
  /* order-address.jsp / order-payment.jsp -> order-summary.jsp: view */
  public void visualizzaRiepilogo() throws UnrecoverableDBException{
    Database database = DBService.getDataBase();
    
    try {
      /* Recupero le quantità dei libri nel carrello */
      this.recuperaQuantità(database);
      
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
		
	}
	
	/* order-summary.jsp -> order-summary.jsp : verify */
	public void verificaCoupon() throws UnrecoverableDBException{
		
	}
  
  
  
  /* Funzioni utili */
  public void recuperaQuantità(Database database)
      throws RecoverableDBException {
    BookService.
  }
  
  
  
  /* Getters */
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

  public List<Book> getLibri() {
    return libri;
  }

  public List<Integer> getQuantita() {
    return quantita;
  }

  public boolean isValido() {
    return valido;
  }
  
  
  
  
  /* Setters */
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

  public void setLibri(List<Book> libri) {
    this.libri = libri;
  }

  public void setQuantita(List<Integer> quantita) {
    this.quantita = quantita;
  }

  public void setValido(boolean valido) {
    this.valido = valido;
  }
  
}
