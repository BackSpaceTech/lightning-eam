Template.insertAssetForm.helpers
  parentID: -> Session.get 'currentID'
  locationFormSchema: -> Schema.locations
