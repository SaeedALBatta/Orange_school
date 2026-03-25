let child = document.getElementById("oldText");
let parent = document.getElementById("container");

let newelement = document.createElement("p");
newelement.textContent = "new update text";

newelement.classList.add("new_class");
newelement.classList.add("highlight");

newelement.classList.remove("text");

newelement.classList.toggle("Active");

parent.replaceChild(newelement, child);