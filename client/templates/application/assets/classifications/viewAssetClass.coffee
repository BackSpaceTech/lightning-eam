Template.viewAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetClassificationPage.helpers
  customTemplate: -> Customisations.viewAssetClassification
  viewDoc: ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentClassID').toString()}
    return Collections.Classification.Current

Template.viewAssetClassificationPage.events
  'click .viewAssetClassification .btnEdit': ->
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/edit-classification'
  'click .viewAssetClassification .btnCopy': ->
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/duplicate-classification'
