Template.deleteAssetClassPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteAssetClassPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteAssetClassPage.helpers
  customTemplate: -> Customisations.deleteAssetClass
  textDoc: -> (Class.findOne {'id':Session.get('currentID').toString()}).text

Template.deleteAssetClassPage.events
  'click .deleteAssetClass .btnDelete': (event) ->
    temp = Class.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete a class that has children!'
    else
      Meteor.call 'deleteClass', Session.get('currentID').toString(), (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
