Template.viewLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

<<<<<<< HEAD
Template.viewLocationPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

=======
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
Template.viewLocationPage.helpers
  customTemplate: -> Customisations.viewLocation
  viewDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current

Template.viewLocationPage.events
  'click #btnViewLocationPageEdit': ->
    if (Session.get('currentID').toString()== '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'
  'click #btnViewLocationPageCopy': ->
    if (Session.get('currentID').toString()== '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'
