Template.pmPage.onCreated ->
  # Set Navbar so PM highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(2).addClass 'active'

Template.pmPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.pmPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.pmPage.helpers
  customTemplate: -> Customisations.pm
