
package blogics;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import util.Pair;

public class ShoppingCart {
  private List<Pair<Book, Integer>> books;
  
  public ShoppingCart() {
    books = new ArrayList<>();
  }
  
  public int size() {
    return books.size();
  }
  
  /* Setters */
  public void setBooks(Pair<Book, Integer>...pairs) {
    books.addAll(Arrays.asList(pairs));
  }
  
  public void setBooks(List<Pair<Book, Integer>> books) {
    this.books = books;
  }
  
  public void addBook(Book book, int quantity) {
    Pair pair = new Pair(book, quantity);
    books.add(pair);
  }
  
  /* Getters */
  public Book getBook(int i) {
    return books.get(i).getFirst();
  }
  
  public int getQuantity(int i) {
    return books.get(i).getSecond();
  }
}
