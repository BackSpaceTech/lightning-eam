Template.helpPage.onCreated ->
  # Set Navbar so Help highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(7).addClass 'active'

Template.helpPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.helpPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.helpPage.helpers
  customTemplate: -> Customisations.help
