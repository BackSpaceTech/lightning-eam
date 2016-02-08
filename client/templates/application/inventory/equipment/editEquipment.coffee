Template.editEquipmentPage.onCreated ->
  this.assetClassID = new ReactiveVar

Template.editEquipmentPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editEquipmentPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editEquipmentPage.helpers
  parentID: -> Collections.Equipment.Current.parent
  equipmentFormSchema: -> Schema.equipment
  customTemplate: -> Customisations.editEquipment
  currentDoc: -> Equipment.findOne(Session.get('currentID').toString())
  equipmentClassID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.editEquipmentPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Asset Classification'
      bodyTemplate: "modaleditEquipmentPage"

#------------------- Modal -------------------------------------

Template.modaleditEquipmentPage.onRendered ->
  tempData = Classification.find(type: 'equipment-classification').fetch()
  dataTree(tempData, 'classification')

Template.modaleditEquipmentPage.helpers
  classificationDetails: -> Classification.findOne {_id:Session.get 'currentClassID'}
