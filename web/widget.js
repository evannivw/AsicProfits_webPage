let data = ["Ram", "Shyam", "Sita", "Gita"];

  let list = document.getElementById("minersList");
  data.forEach((item) => {
    let li = document.createElement("div");
    li.classList.add("card2")
    //li.innerText = item;
    list.appendChild(li);
  });