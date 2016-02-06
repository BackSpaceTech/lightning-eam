Template.duplicateAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateAssetClassificationPage.helpers
  customTemplate: -> Customisations.duplicateAssetClassification
  currentDoc: -> Collections.Classification.Current
