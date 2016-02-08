Template.createEquipmentPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createEquipmentPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createEquipmentPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  equipmentFormSchema: -> Schema.equipment
  customTemplate: -> Customisations.createEquipment
  ClassID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.createEquipmentPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Equipment Classification'
      bodyTemplate: "createEquipmentAddEquipmentClass"

Template.createEquipmentAddEquipmentClass.onRendered ->
  tempData = Classification.find(type: 'equipment-classification').fetch()
  dataTree(tempData, 'classification')

Template.createEquipmentAddEquipmentClass.helpers
  classificationDetails: -> Classification.findOne(_id: Session.get('currentClassID').toString())
