Template.createInvLocPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createInvLocPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createInvLocPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  formSchema: -> Schema.bins
  customTemplate: -> Customisations.createInvLoc
  classID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.createInvLocPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Inventory Location Classification'
      bodyTemplate: "createInvLocModal"

Template.createInvLocModal.onRendered ->
  tempData = Classification.find(type: 'invloc-classification').fetch()
  dataTree(tempData, 'classification')

Template.createInvLocModal.helpers
  classificationDetails: -> Classification.findOne(_id: Session.get('currentClassID').toString())
