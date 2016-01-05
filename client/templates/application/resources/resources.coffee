Template.resourcesPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(3).addClass 'active'

<<<<<<< HEAD
Template.resourcesPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.resourcesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.resourcesPage.helpers
  customTemplate: -> Customisations.resources
