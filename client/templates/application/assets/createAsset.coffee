Template.createAssetPage.helpers
  parentID: -> Session.get 'currentID'
  locationFormSchema: -> Schema.locations
  customTemplate: -> Customisations.createAsset
