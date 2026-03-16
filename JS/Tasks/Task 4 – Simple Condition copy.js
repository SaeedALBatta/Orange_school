let X =prompt("Please Enter First Number?");
let Y =prompt("Please Enter Seconde Number?");
let Result;
X = Number(X);
Y = Number(Y);

if (X > Y){
    Result = "Hello World";
}
else{
    Result = "Goodbye";
}

window.alert(Result);

console.log(Result);

document.getElementById("result").innerText = Result; 