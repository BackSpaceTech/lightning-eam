Template.deleteInvLocPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteInvLocPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteInvLocPage.helpers
  customTemplate: -> Customisations.deleteInvLoc
  textDoc: -> Bins.findOne({'id':Session.get('currentID').toString()}).text

Template.deleteInvLocPage.events
  'click .deleteInvLoc .btnDelete': (event) ->
    temp = Items.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete a location that has children!'
    else
      Meteor.call 'deleteInvLoc', Session.get('currentID').toString(), (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
