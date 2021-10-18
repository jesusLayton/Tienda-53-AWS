/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
function openNav() {
  document.getElementById("mySidebar").style.width = "280px";
  document.getElementById("main").style.padding = "80px 2px 2px 300px";
  document.getElementById("header").style.width = "calc(100% - 280px)";
  document.getElementById("logo").style.display = "grid";
  document.getElementById("openbtn").style.display = "none";
}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.padding = "80px 2px 2px 20px";
  document.getElementById("header").style.width = "100%";
  document.getElementById("logo").style.display = "none";
  document.getElementById("openbtn").style.display = "grid";
}