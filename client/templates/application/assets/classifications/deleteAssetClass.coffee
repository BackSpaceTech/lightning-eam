Template.deleteAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteAssetClassificationPage.helpers
  customTemplate: -> Customisations.deleteAssetClassification
  textDoc: -> Classification.findOne({'id':Session.get('currentClassID').toString()}).text
