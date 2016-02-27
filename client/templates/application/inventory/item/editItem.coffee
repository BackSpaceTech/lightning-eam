Template.editItemPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editItemPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editItemPage.helpers
  parentID: -> Collections.Items.Current.parent
  itemFormSchema: -> Schema.items
  customTemplate: -> Customisations.editItem
  currentDoc: -> Session.get 'currentDoc'
  itemClassID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.editItemPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Asset Classification'
      bodyTemplate: "modaleditItemPage"

#------------------- Modal -------------------------------------

Template.modaleditItemPage.onRendered ->
  tempData = Classification.find(type: 'item-classification').fetch()
  dataTree(tempData, 'classification')

Template.modaleditItemPage.helpers
  classificationDetails: -> Classification.findOne {_id:Session.get 'currentClassID'}
