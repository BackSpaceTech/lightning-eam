Template.workPage.onCreated ->
  # Set Navbar so Work highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(1).addClass 'active'

<<<<<<< HEAD
Template.workPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.workPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.workPage.helpers
  customTemplate: -> Customisations.work
