Template.viewAssetClassificationsPage.onCreated ->
  # Set Navbar so Assets highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'
  Session.set 'treeviewData', 'asset-classification'

Template.viewAssetClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewAssetClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetClassificationsPage.helpers
  customTemplate: -> Customisations.viewAssetClassifications
  classificationDetails: -> Classification.findOne {_id: Session.get('currentClassID').toString() }
