Template.assetsPage.onCreated ->
  # Set Navbar so Assets highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.assetsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.assetsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.assetsPage.helpers
  customTemplate: -> Customisations.assets
