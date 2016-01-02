Template.editAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())
  Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}

Template.editAssetPage.helpers
  currentDoc: -> Collections.Locations.Current
  locationFormSchema: -> Schema.locationFormSchema
