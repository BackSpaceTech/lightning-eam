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

Template.inventoryPage.events
  'click .btnViewItemsClassifications': (event) ->
    FlowRouter.go '/inventory/item/view-classifications'
  'click .btnViewEquipmentClassifications': (event) ->
    FlowRouter.go '/inventory/equipment/view-classifications'
  'click .btnViewLocationClassifications': (event) ->
    FlowRouter.go '/inventory/locations/view-classifications'
  'click .btnViewItems': (event) ->
    FlowRouter.go '/inventory/items/view-items'
  'click .btnViewEquipment': (event) ->
    FlowRouter.go '/inventory/equipment/view-equipments'
  'click .btnViewLocations': (event) ->
    FlowRouter.go '/inventory/locations/view-locations'
