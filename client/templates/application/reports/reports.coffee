Template.reportsPage.onCreated ->
  # Set Navbar so Reports highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(6).addClass 'active'

<<<<<<< HEAD
Template.reportsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.reportsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.reportsPage.helpers
  customTemplate: -> Customisations.reports
