Template.duplicateAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateAssetClassificationPage.helpers
  customTemplate: -> Customisations.duplicateAssetClassification
  duplicateDoc: ->
    Collections.Classification.Current = Classification.findOne {'_id':Session.get('currentID').toString()}
    return Collections.Classification.Current
  classificationFormSchema: -> Schema.classification
