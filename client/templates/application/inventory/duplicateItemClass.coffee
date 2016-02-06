Template.duplicateItemClassification.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateItemClassification.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateItemClassification.helpers
  customTemplate: -> Customisations.duplicateAssetClassification
  duplicateDoc: ->
    Collections.Classification.Current = Classification.findOne {'_id':Session.get('currentID')[0]}
    return Collections.Classification.Current
  classificationFormSchema: -> Schema.classification
