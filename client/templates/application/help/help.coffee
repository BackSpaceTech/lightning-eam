Template.helpPage.onCreated ->
  # Set Navbar so Help highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(7).addClass 'active'
