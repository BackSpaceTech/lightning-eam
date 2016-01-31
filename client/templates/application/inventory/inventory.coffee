Template.inventoryPage.onCreated ->
  # Set Navbar so Inventory highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(4).addClass 'active'

Template.inventoryPage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.inventoryPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.inventoryPage.helpers
  customTemplate: -> Customisations.inventory
