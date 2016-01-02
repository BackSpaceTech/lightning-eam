Template.duplicateLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())
  Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}

Template.duplicateLocationPage.helpers
  duplicateDoc: -> Collections.Locations.Current
  locationFormSchema: -> Schema.locations
