Template.createAssetClassPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createAssetClassPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createAssetClassPage.helpers
  assetClassFormSchema: -> Schema.class
  customTemplate: -> Customisations.createAssetClass

#--------------------------- Class Template -----------------------------------#

Template.createClassPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createClassPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createClassPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  assetClassFormSchema: -> Schema.class
