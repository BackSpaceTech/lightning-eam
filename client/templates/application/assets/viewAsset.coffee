<<<<<<< HEAD
Template.viewAssetPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.viewAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.viewAssetPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current;

Template.viewAssetPage.events
  'click #btnViewAssetPageEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'
  'click #btnViewAssetPageCopy': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'
