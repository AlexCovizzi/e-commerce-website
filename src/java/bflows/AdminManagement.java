package bflows;

import java.io.Serializable;

public class AdminManagement extends AbstractManagement implements Serializable {
	
  private int userId;
  private String titolo;
  private String autore;
  private String isbn = "null";
  private int pagine;
  private String editore;
  private String[] genere;
  private String dataPubbl;
  private String lingua;
  private float prezzo;
  
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
	
  /* book-page.jsp / search.jsp -> add-book.jsp : view */
	public void recuperaInfo() {
		
	}
  
	/* add-book.jsp -> add-book.jsp : add */
	public void addBook() {
		
	}
	
	/* search-jsp/book-page.jsp -> add-book.jsp : view */
	/* manda anche isbn libro come parametro */
	
	
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
  
  /* Setters */
  public void setUserId(int userId) {
    this.userId = userId;
  }
  
  public void setTitolo(String titolo) {
    this.titolo = titolo;
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
  
}
