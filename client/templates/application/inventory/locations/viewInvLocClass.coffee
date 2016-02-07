Template.viewInvLocClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewInvLocClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewInvLocClassificationPage.helpers
  customTemplate: -> Customisations.viewInvLocClassification
  viewDoc: ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentClassID').toString()}
    return Collections.Classification.Current

Template.viewInvLocClassificationPage.events
  'click .viewInvLocClassification .btnEdit': ->
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/locations/edit-classification'
