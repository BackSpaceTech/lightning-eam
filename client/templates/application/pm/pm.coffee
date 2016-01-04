Template.pmPage.onCreated ->
  # Set Navbar so PM highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(2).addClass 'active'

Template.pmPage.helpers
  customTemplate: -> Customisations.Index.pm
