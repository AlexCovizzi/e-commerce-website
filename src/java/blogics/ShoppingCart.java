
package blogics;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import util.Logger;
import util.Pair;

public class ShoppingCart {
  private List<Pair<Book, Integer>> books;
  private float total = 0; // prezzo totale
  private int n = 0; // numero libri
  
  public ShoppingCart() {
    books = new ArrayList<>();
  }
  
  public int size() {
    return books.size();
  }
  
  public boolean isEmpty() {
    return books.isEmpty();
  }
  
  /* Setters */
  public void setBooks(Pair<Book, Integer>...pairs) {
    books.addAll(Arrays.asList(pairs));
    for(int i=0; i<size(); i++) {
      n += getQuantity(i);
      total += getBook(i).getPrice()*getQuantity(i);
    }
  }
  
  public void setBooks(List<Pair<Book, Integer>> books) {
    this.books = books;
    for(int i=0; i<size(); i++) {
      n += getQuantity(i);
      total += getBook(i).getPrice()*getQuantity(i);
    }
  }
  
  public void addBook(Book book, int quantity) {
    Pair pair = new Pair(book, quantity);
    books.add(pair);
    n += quantity;
    total += book.getPrice()*quantity;
  }
  
  /* Getters */
  public Book getBook(int i) {
    return books.get(i).getFirst();
  }
  
  public int getQuantity(int i) {
    return books.get(i).getSecond();
  }
  
  public float getTotal() {
    return total;
  }
  
  public int getN() {
    return n;
  }
  
  public boolean isEverythingInStock() {
    for(int i=0; i<size(); i++) {
      if(getQuantity(i) > getBook(i).getStock()) return false;
    }
    return true;
  }
}
