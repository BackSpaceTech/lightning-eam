Template.viewItemClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewItemClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewItemClassificationPage.helpers
  customTemplate: -> Customisations.viewItemClassification
  viewDoc: ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentClassID').toString()}
    return Collections.Classification.Current

Template.viewItemClassificationPage.events
  'click .viewItemClassification .btnEdit': ->
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/item/edit-classification'
