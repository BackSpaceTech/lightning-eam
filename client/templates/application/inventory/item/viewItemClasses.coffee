Template.viewItemClassificationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'
  Session.set 'treeviewData', 'item-classification'

Template.viewItemClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewItemClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewItemClassificationsPage.helpers
  customTemplate: -> Customisations.viewItemClassifications
  classificationDetails: -> Classification.findOne {_id: Session.get('currentClassID').toString() }
