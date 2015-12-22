Template.aboutPage.onCreated(function(){
  // Set Navbar so About highlighted
  $("#header1DesktopUL li").removeClass("active");
  $("#header1DesktopUL li").eq(8).addClass("active");
});
