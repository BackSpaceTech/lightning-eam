Template.helpPage.onCreated ->
  # Set Navbar so Help highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(7).addClass 'active'

<<<<<<< HEAD
Template.helpPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.helpPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.helpPage.helpers
  customTemplate: -> Customisations.help
