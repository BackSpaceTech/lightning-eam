Template.createItemPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createItemPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createItemPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  itemFormSchema: -> Schema.items
  customTemplate: -> Customisations.createItem
  itemClassID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.createItemPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Item Classification'
      bodyTemplate: "createItemAddItemClass"

Template.createItemAddItemClass.onRendered ->
  tempData = Classification.find(type: 'item-classification').fetch()
  dataTree(tempData, 'classification')

Template.createItemAddItemClass.helpers
  classificationDetails: -> Classification.findOne(_id: Session.get('currentClassID').toString())
