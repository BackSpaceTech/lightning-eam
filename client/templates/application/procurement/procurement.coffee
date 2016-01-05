Template.procurementPage.onCreated ->
  # Set Navbar so Procurement highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(5).addClass 'active'

<<<<<<< HEAD
Template.procurementPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.procurementPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.procurementPage.helpers
  customTemplate: -> Customisations.procurement
