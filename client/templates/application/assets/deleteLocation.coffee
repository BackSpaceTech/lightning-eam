Template.deleteLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}

Template.deleteLocationPage.helpers
  deleteDoc: -> Collections.Locations.Current

Template.deleteLocationPage.events
  'click button': (e) ->
    temp = Locations.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete an asset or location that has children!'
    else
      temp = Collections.Locations.Current
      Meteor.call 'deleteLoc', temp._id
    FlowRouter.go '/assets'
