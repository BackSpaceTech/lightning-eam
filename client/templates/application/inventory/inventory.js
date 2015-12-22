Template.inventoryPage.onCreated(function(){
  // Set Navbar so Inventory highlighted
  $("#header1DesktopUL li").removeClass("active");
  $("#header1DesktopUL li").eq(4).addClass("active");
});
