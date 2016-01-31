Template.duplicateAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.duplicateAssetPage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateAssetPage.helpers
  customTemplate: -> Customisations.duplicateAsset
  duplicateDoc: ->
    Collections.Locations.Current = Locations.findOne {'_id':Session.get('currentID').toString()}
    return Collections.Locations.Current
  locationFormSchema: -> Schema.locations
