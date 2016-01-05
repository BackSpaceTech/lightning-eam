Template.assetsPage.onCreated ->
  # Set Navbar so Assets highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

<<<<<<< HEAD
Template.assetsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.assetsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.assetsPage.helpers
  customTemplate: -> Customisations.assets
