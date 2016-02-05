Template.editAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editAssetClassificationPage.helpers
  customTemplate: -> Customisations.editAssetClassification # user customised template if applicable
  currentDoc: ->
    Collections.Classification.Current = Classification.findOne {'_id':Session.get('currentID').toString()}
    return Collections.Classification.Current
  classificationFormSchema: -> Schema.classification
