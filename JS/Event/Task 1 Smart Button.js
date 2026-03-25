let btn = document.getElementById("btn");

btn.addEventListener("click" , function(){
    btn.classList.toggle("active");
    if (btn.classList.contains("active")){
        btn.textContent = "Clicked!";
    } else{
        btn.textContent = "Click Me"
    }
});