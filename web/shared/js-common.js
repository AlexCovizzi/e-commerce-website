
  function submitAddToCartForm(loggedIn) {
    if(loggedIn) document.getElementById("add-to-cart-form").submit();
    else alert("Devi effettuare il login per aggiungere libri al carrello!");
    return;
  }
  function submitAddToWishlistForm(loggedIn) {
    if(loggedIn) document.getElementById("add-to-wishlist-form").submit();
    else alert("Devi effettuare il login per aggiungere libri alla lista desideri!");
    return;
  }