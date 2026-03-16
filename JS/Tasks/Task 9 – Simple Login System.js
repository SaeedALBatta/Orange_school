let UserName =prompt("Please Enter User Name?");
let PassWord =prompt("Please Enter PassWord?");

let Status;

if(UserName === "admin" && PassWord === "1234"){
    Status = "Login Successful";
}else 
    Status = "Invalid Username or Password" ;

window.alert(` ${Status}`);
console.log(` ${Status}`);
document.write(` ${Status}`);
