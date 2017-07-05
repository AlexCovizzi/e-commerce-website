package bflows;

import java.io.Serializable;

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
  
  
  
	/* address.jsp , order-payment.jsp , order-summary.jsp */
	
	/* order-summary.jsp -> order-summary.jsp : confirm */
	public void confirm() {
		
	}
	
	/* order-summary.jsp -> order-address.jsp : modify */
	public void modifyAddress() {
		
	}
	
	/* order-summary.jsp -> order-payment.jsp : view */
	public void modifyPayment() {
		
	}
	
	/* order-summary.jsp -> order-summary.jsp : verify */
	public void verifyCoupon() {
		
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
  
}
