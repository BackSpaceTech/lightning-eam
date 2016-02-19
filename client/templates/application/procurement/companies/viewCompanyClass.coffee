Template.viewCompanyClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewCompanyClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewCompanyClassificationPage.helpers
  customTemplate: -> Customisations.viewCompanyClassification
  viewDoc: ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentClassID').toString()}
    return Collections.Classification.Current

Template.viewCompanyClassificationPage.events
  'click .viewCompanyClassification .btnEdit': ->
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/item/edit-classification'
