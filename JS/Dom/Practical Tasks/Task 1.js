let child  = document.querySelector(".child");
console.log(child.textContent);

let Parent = child.parentElement;
console.log(Parent);

children = Parent.children;
console.log(children);


console.log( Parent.firstElementChild) ;
console.log( Parent.lastElementChild) ;


console.log(child.nextElementSibling) ;
console.log(child.previousElementSibling) ; // null

child = children[1];
console.log(child.previousElementSibling) ; // child 1
