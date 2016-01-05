Template.workPage.onCreated ->
  # Set Navbar so Work highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(1).addClass 'active'

Template.workPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.workPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.workPage.helpers
  customTemplate: -> Customisations.work
