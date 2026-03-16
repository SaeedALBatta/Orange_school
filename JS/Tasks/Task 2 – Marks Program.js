let Mark = 86;
switch (true) {
    case (Mark < 50) :
        document.write("FAIL");
        break;
    case (Mark <= 59) :
        document.write("D");
        break;
    case (Mark <= 69 ) :
        document.write("C");
        break;
    case (Mark <= 79) :
        document.write("B");
        break;
    case (Mark <= 89) :
        document.write("A");
        break;
    case (Mark <= 100 ) :
        document.write("A+");
        break;
}