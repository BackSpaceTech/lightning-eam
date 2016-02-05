Template.viewAssetClassPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewAssetClassPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetClassPage.helpers
  customTemplate: -> Customisations.viewAssetClass
  viewDoc: ->
    Collections.Class.Current = Class.findOne {'id':Session.get('currentID').toString()}
    return Collections.Class.Current
  assetClassFormSchema: -> Schema.class

Template.viewAssetClassPage.events
  'click .viewAssetClass .btnEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No class selected!'
    else
      FlowRouter.go '/assets/edit-class'
  'click .viewAssetClass .btnCopy': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No class selected!'
    else
      FlowRouter.go '/assets/duplicate-class'
