Template.inventoryPage.onCreated ->
  # Set Navbar so Inventory highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(4).addClass 'active'

<<<<<<< HEAD
Template.inventoryPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.inventoryPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.inventoryPage.helpers
  customTemplate: -> Customisations.inventory
