package bflows;

import java.io.Serializable;

public class AccountManagement extends AbstractManagement implements Serializable {
	
  private int orderId;
  
	/* wishlist.jsp -> wishlist.jsp : remove */
	public void removeFromWishlist() {
		
	}
	
	/* wishlist.jsp -> wishlist.jsp : add */
	public void addToCart() {
		
	}
	
	/* order-details.jsp/orders.jsp : cancel */
	public void cancelOrder() {
		
	}
	
	/* cart.jsp -> cart.jsp : remove */
	public void removeFromCart() {
		
	}
	
	/* cart.jsp -> cart.jsp : modify */
	public void modifyQuantity() {
		
	}
  
  
  /* Getters */
  public int getOrderId() {
    return orderId;
  }
  
  /* Setters */
  public void setOrderCode(int orderId) {
    this.orderId = orderId;
  }
}
