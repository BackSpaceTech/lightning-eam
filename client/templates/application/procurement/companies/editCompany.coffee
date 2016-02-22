Template.editCompanyPage.onCreated ->
  this.assetClassID = new ReactiveVar

Template.editCompanyPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editCompanyPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editCompanyPage.helpers
  formSchema: -> Schema.companies
  customTemplate: -> Customisations.editCompany
  currentDoc: -> Session.get 'currentDoc'
  classID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.editCompanyPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Asset Classification'
      bodyTemplate: "modaleditCompanyPage"

#------------------- Modal -------------------------------------

Template.modaleditCompanyPage.onRendered ->
  tempData = Classification.find(type: 'company-classification').fetch()
  dataTree(tempData, 'classification')

Template.modaleditCompanyPage.helpers
  classificationDetails: -> Classification.findOne {_id:Session.get 'currentClassID'}
