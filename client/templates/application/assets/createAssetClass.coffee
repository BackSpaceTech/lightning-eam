Template.createAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createAssetClassificationPage.helpers
  assetClassificationFormSchema: -> Schema.classification
  customTemplate: -> Customisations.createAssetClassification

#--------------------------- Classification Template --------------------------#

Template.createClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createClassificationPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  assetClassificationFormSchema: -> Schema.classification
