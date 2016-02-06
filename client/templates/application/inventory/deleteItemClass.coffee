Template.deleteItemClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteItemClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteItemClassificationPage.helpers
  customTemplate: -> Customisations.deleteAssetClassification
  textDoc: -> (Classification.findOne {'id':Session.get('currentID')[0]}).text

Template.deleteItemClassificationPage.events
  'click .deleteAssetClassification .btnDelete': (event) ->
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
