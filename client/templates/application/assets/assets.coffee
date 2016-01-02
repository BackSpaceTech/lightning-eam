Template.assetsPage.onCreated ->
  # Set Navbar so Assets highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'
