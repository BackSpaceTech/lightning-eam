Template.procurementPage.onCreated ->
  # Set Navbar so Procurement highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(5).addClass 'active'

Template.procurementPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.procurementPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.procurementPage.helpers
  customTemplate: -> Customisations.procurement
