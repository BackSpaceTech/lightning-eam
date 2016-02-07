Template.viewEquipmentClassificationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'
  Session.set 'treeviewData', 'equipment-classification'

Template.viewEquipmentClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewEquipmentClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewEquipmentClassificationsPage.helpers
  customTemplate: -> Customisations.viewEquipmentClassifications
  classificationDetails: -> Classification.findOne {_id: Session.get('currentClassID').toString() }
