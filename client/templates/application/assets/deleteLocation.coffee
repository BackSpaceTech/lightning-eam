Template.deleteLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.deleteLocationPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.deleteLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteLocationPage.helpers
  customTemplate: -> Customisations.deleteLocation
  deleteDoc: ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    return Collections.Locations.Current
  textDoc: -> Collections.Locations.Current.text

Template.deleteLocationPage.events
  'click .btnDelete': (e) ->
    temp = Locations.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete an asset or location that has children!'
    else
      temp = Collections.Locations.Current
      Meteor.call 'deleteLoc', temp._id
    FlowRouter.go '/assets'
