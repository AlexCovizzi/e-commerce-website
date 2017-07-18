var nAuthors = 1;
      var nPublishers = 1;
      var nGenres = 1;
      function addInput(key, n) {
        n++;
        
        authorsDiv = document.getElementById(key+"-div");
        
        authorInputGroup = document.createElement("div");
        authorInputGroup.setAttribute("id", key+"-form-group-"+n);
        authorInputGroup.setAttribute("class", "input-group");
        authorInputGroup.setAttribute("style", "padding-top:4px;");
        
        authorInput = document.createElement("input");
        authorInput.setAttribute("type", "text");
        authorInput.setAttribute("name", key);
        authorInput.setAttribute("class", "form-control");
        authorInput.setAttribute("id", "search-"+key+"-"+n);
        authorInput.setAttribute("list", key+"-list");
        
        authorInputGroup.appendChild(authorInput);
        authorsDiv.appendChild(authorInputGroup);
        
        var spanInputGroupBtn = document.createElement("span");
        spanInputGroupBtn.setAttribute("class", "input-group-btn");
        
        removeInput = document.createElement("button");
        removeInput.setAttribute("type", "button");
        removeInput.setAttribute("class", "btn btn-danger");
        removeInput.textContent = "X";
        removeInput.onclick = function() { document.getElementById(key+"-form-group-"+n).remove(); }
        
        spanInputGroupBtn.appendChild(removeInput);
        authorInputGroup.appendChild(spanInputGroupBtn);
      }
