Template.pmPage.onCreated ->
  # Set Navbar so PM highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(2).addClass 'active'

<<<<<<< HEAD
Template.pmPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.pmPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.pmPage.helpers
  customTemplate: -> Customisations.pm
