Template.viewAssetClassificationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewAssetClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'treeviewData', 'asset-classification'
  assetTree()

Template.viewAssetClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetClassificationsPage.helpers
  customTemplate: -> Customisations.viewAssetClassifications
  classificationDetails: -> Classification.findOne {type: Session.get 'treeviewData' }
