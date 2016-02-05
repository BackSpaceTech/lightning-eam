Template.deleteAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteAssetClassificationPage.helpers
  customTemplate: -> Customisations.deleteAssetClassification
  textDoc: -> (Classification.findOne {'id':Session.get('currentID').toString()}).text

Template.deleteAssetClassificationPage.events
  'click .deleteAssetClassification .btnDelete': (event) ->
    temp = Classification.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete a classification that has children!'
    else
      Meteor.call 'deleteClassification', Session.get('currentID').toString(), (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
