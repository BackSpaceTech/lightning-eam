Template.editAssetPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
  
Template.editAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.editAssetPage.helpers
  customTemplate: -> Customisations.editAsset
  currentDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current
  asset: -> (Collections.Locations.Current.type == 'asset')
  locationFormSchema: -> Schema.locations
