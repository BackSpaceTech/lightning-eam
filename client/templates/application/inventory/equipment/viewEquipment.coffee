Template.viewEquipmentPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewEquipmentPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewEquipmentPage.helpers
  customTemplate: -> Customisations.viewEquipment
  currentDoc: -> Session.get 'currentDoc'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.viewEquipmentPage.events
  'click .viewEquipment .btnEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No item selected!'
    else
      FlowRouter.go '/items/edit-equipment'
