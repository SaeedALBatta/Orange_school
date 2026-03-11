let Age =prompt("Please Enter Your Age?");

Age = Number(Age);
let Status;

if(Age < 13){
    Status = "Child";
}else if (Age < 19){
    Status = "Teenager";
}
else if (Age < 59){
    Status = "Adult";
}
else if (Age >= 60){
    Status = "Senior";
}

window.alert(`You are an ${Status}`);
console.log(`You are an ${Status}`);
document.write(`You are an ${Status}`);
