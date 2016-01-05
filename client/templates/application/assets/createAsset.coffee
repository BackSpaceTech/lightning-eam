Template.createAssetPage.helpers
  parentID: -> Session.get 'currentID'
  locationFormSchema: -> Schema.locations
  customTemplate: -> Customisations.createAsset
<<<<<<< HEAD

Template.createAssetPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.createAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
