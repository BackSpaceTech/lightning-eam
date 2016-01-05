Template.editLocationPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.editLocationPage.helpers
  customTemplate: -> Customisations.editLoaction
  currentDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current
  asset: -> (Collections.Locations.Current.type == 'asset')
  locationFormSchema: -> Schema.locations
