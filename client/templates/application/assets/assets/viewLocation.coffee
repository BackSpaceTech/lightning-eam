Template.viewLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID')[0])

Template.viewLocationPage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.viewLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewLocationPage.helpers
  customTemplate: -> Customisations.viewLocation
  locationsFormSchema: -> Schema.locations
  viewDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID')[0]}
    return Collections.Locations.Current

Template.viewLocationPage.events
  'click .viewLocation .btnEdit': ->
    if (Session.get('currentID')[0]== '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'
  'click .viewLocation .btnCopy': ->
    if (Session.get('currentID')[0]== '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'
