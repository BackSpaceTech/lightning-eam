Template.deleteLocationPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID')[0])

Template.deleteLocationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteLocationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteLocationPage.helpers
  customTemplate: -> Customisations.deleteLocation
  textDoc: -> (Locations.findOne {'id':Session.get('currentID')[0]}).text

Template.deleteLocationPage.events
  'click .deleteLocation .btnDelete': (event) ->
    temp = Locations.findOne {'parent':Session.get('currentID')[0]}
    if temp
      alert 'You cannot delete an asset or location that has children!'
    else
      Meteor.call 'deleteLoc', Session.get('currentID')[0], (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
