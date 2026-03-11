let Operation = prompt("Please Enter The Operation:");
let FirstNumber = prompt("Please Enter The First Number:");
let SecondeNumber = prompt("Please Enter The Seconde Number:");
let Result;

FirstNumber = Number(FirstNumber);
SecondeNumber = Number(SecondeNumber);

if(Operation === "+"){
    Result = FirstNumber + SecondeNumber;
}
else if(Operation === "-"){
    Result = FirstNumber - SecondeNumber;
}
else if (Operation === "*"){
    Result = FirstNumber * SecondeNumber;
}
else if (Operation === "/"){
    Result = FirstNumber / SecondeNumber;
}
else {
    Result = "Invalide Operation";
}

/*
switch(Operation){
    case "+":
        Result = FirstNumber + SecondeNumber;
        break;
    case "-":
        Result = FirstNumber - SecondeNumber;
        break;
    case "*":
        Result = FirstNumber * SecondeNumber;
        break;
    case "/":
        Result = FirstNumber / SecondeNumber;
        break;
    default:
        Result = "Invalide Operation";
}
*/



let OutPut = `${FirstNumber} ${Operation} ${SecondeNumber} = ${Result}`;

console.log(OutPut);

document.getElementById("result").innerHTML =OutPut;