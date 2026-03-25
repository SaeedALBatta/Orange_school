let input = document.getElementById("input");
let preview = document.getElementById("preview");

input.addEventListener("input" , function(event){
    preview.textContent= event.target.value;
});