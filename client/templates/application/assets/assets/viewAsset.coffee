Template.viewAssetPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.viewAssetPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: ->
    console.log 'currentID: '+Session.get('currentID')
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    console.log 'Collections.Locations.Current: '+ JSON.stringify Collections.Locations.Current
    Collections.Locations.Current
  locationsFormSchema: -> Schema.locations
  assetClassification: -> Collections.Locations.Current.assetClassification.text

Template.viewAssetPage.events
  'click .viewAsset .btnEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'
  'click .viewAsset .btnCopy': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'
