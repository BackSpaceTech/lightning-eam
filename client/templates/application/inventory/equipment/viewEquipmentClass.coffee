Template.viewEquipmentClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewEquipmentClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewEquipmentClassificationPage.helpers
  customTemplate: -> Customisations.viewEquipmentClassification
  viewDoc: ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentClassID').toString()}
    return Collections.Classification.Current

Template.viewEquipmentClassificationPage.events
  'click .viewEquipmentClassification .btnEdit': ->
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/equipment/edit-classification'
