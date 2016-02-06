Template.viewAssetClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewAssetClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetClassificationPage.helpers
  customTemplate: -> Customisations.viewAssetClassification
  viewDoc: ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    return Collections.Classification.Current

Template.viewAssetClassificationPage.events
  'click .viewAssetClassification .btnEdit': ->
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/edit-classification'
  'click .viewAssetClassification .btnCopy': ->
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/duplicate-classification'
