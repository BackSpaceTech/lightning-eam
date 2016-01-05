Template.duplicateAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

<<<<<<< HEAD
Template.duplicateAssetPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.duplicateAssetPage.helpers
  customTemplate: -> Customisations.duplicateAsset
  duplicateDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current
  locationFormSchema: -> Schema.locations
