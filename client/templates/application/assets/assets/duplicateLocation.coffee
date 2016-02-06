Template.duplicateLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID')[0])

Template.duplicateLocationPage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateLocationPage.helpers
  customTemplate: -> Customisations.duplicateLocation
  duplicateDoc: ->
    Collections.Locations.Current = Locations.findOne {'_id':Session.get('currentID')[0]}
    return Collections.Locations.Current
  locationFormSchema: -> Schema.locations
