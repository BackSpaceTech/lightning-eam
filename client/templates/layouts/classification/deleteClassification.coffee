Template.deleteClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteClassificationPage.events
  'click .deleteClassification .btnDelete': (event) ->
    temp = Classification.findOne {parent:Session.get('currentClassID').toString()}
    if temp
      alert 'You cannot delete a classification that has children!'
    else
      docDelete = Classification.findOne {_id:Session.get('currentClassID').toString()}
      Meteor.call 'deleteClassification', docDelete, (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
