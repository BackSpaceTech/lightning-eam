Template.editItemClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editItemClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editItemClassificationPage.helpers
  customTemplate: -> Customisations.editAssetClassification # user customised template if applicable
  currentDoc: ->
    Collections.Classification.Current = Classification.findOne {'_id':Session.get('currentID')[0]}
    return Collections.Classification.Current
  classificationFormSchema: -> Schema.classification
