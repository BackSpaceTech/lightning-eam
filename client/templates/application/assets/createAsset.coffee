Template.createAssetPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  locationFormSchema: -> Schema.locations
  customTemplate: -> Customisations.createAsset

Template.createAssetPage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.createAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
