function submitReviewForm(action, isbn) {
    document.getElementById("action-input").value = action;
    document.getElementById("isbn-input").value = isbn;

    if(document.getElementById("thumb-up-"+isbn).checked === true) {
      document.getElementById("thumbUp-input").value = true;
    } else if(document.getElementById("thumb-down-"+isbn).checked === true) {
      document.getElementById("thumbUp-input").value = false;
    }

    document.getElementById("comment-input").value = document.getElementById("comment-"+isbn).textContent;;

    document.getElementById("review-form").submit();
    
    return;
}

