
let data = ["Ram", "Shyam", "Sita", "Gita"];

  let list = document.getElementById("minersList");
  data.forEach((item) => {
    let li = document.createElement("div");
    li.classList.add("minerCard")
    li.innerHTML += '<div align = "center"><IMG align="center" src="http://foo.com/animage.gif" class = "minerImage"><p align = "left" style="color:white;" class="titleText">Miner name</p><p align="left" style="color:#858587;" class="modelText">Miner model</p></div><br>'
    /*let inner = document.createElement("div")
    inner.classList.add("minerImage")
    inner.innerHTML = "Name of the miner"
    li.appendChild(inner)*/
    list.appendChild(li);
  });
