Template.resourcesPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(3).addClass 'active'

Template.resourcesPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.resourcesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.resourcesPage.helpers
  customTemplate: -> Customisations.resources
