Template.deleteClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteClassificationPage.events
  'click .deleteClassification .btnDelete': (event) ->
    temp = Classification.findOne {'parent':Session.get('currentID')[0]}
    if temp
      alert 'You cannot delete a classification that has children!'
    else
      Meteor.call 'deleteClassification', Session.get('currentID')[0], (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
