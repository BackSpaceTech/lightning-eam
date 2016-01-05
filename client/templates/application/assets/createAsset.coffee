Template.createAssetPage.helpers
  parentID: -> Session.get 'currentID'
  locationFormSchema: -> Schema.locations
  customTemplate: -> Customisations.createAsset

Template.createAssetPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.createAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
