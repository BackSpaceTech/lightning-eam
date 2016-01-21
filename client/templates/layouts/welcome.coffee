Template.welcomePage.onCreated ->
  # Clear Navbar highlighting
  $("#header1DesktopUL li").removeClass "active"

Template.welcomePage.helpers
  customTemplate: -> Customisations.welcome
