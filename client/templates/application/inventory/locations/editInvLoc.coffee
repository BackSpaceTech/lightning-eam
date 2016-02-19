Template.editInvLocPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'currentClassID', Collections.Bins.Current.classificationID

Template.editInvLocPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editInvLocPage.helpers
  parentID: -> Session.get('currentID').toString()
  formSchema: -> Schema.bins
  customTemplate: -> Customisations.createInvLoc
  currentDoc: -> Collections.Bins.Current
  classID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(_id: Session.get('currentClassID').toString()).text

Template.editInvLocPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Inventory Location Classification'
      bodyTemplate: "modaleditInvLocPage"

#------------------- Modal -------------------------------------

Template.modaleditInvLocPage.onRendered ->
  tempData = Classification.find(type: 'invloc-classification').fetch()
  dataTree(tempData, 'classification')

Template.modaleditInvLocPage.helpers
  classificationDetails: -> Classification.findOne {_id: Session.get('currentClassID').toString()}
