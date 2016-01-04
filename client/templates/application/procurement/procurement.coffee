Template.procurementPage.onCreated ->
  # Set Navbar so Procurement highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(5).addClass 'active'

Template.procurementPage.helpers
  customTemplate: -> Customisations.Index.procurement
