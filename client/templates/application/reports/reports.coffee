Template.reportsPage.onCreated ->
  # Set Navbar so Reports highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(6).addClass 'active'
