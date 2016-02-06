Template.viewItemClassification.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewItemClassification.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewItemClassification.helpers
  customTemplate: -> Customisations.viewAssetClassification
  viewDoc: ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    return Collections.Classification.Current
  assetClassificationFormSchema: -> Schema.classification

Template.viewItemClassification.events
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
