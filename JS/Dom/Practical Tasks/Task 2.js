let card = document.createElement("div");
card.classList.add("containar");

let img = document.createElement("img")
img.setAttribute("src","https://laboiteagrains.com/cdn/shop/files/shutterstock_1840946851.jpg?v=1712688692&width=1920");
img.setAttribute("alt" , "This photo display plant Orange not company");

let title = document.createElement("h1");
title.textContent = "Orange Coding School";

let desc = document.createElement("p");
desc.textContent = "This Desc pla pla pla pla pla pla pla"

card.append(img);
card.append(title);
card.append(desc);

document.body.append(card);