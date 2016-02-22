Template.createCompanyPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createCompanyPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createCompanyPage.helpers
  formSchema: -> Schema.companies
  customTemplate: -> Customisations.createCompany
  classID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.createCompanyPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Company Classification'
      bodyTemplate: "createCompanyModal"

Template.createCompanyModal.onRendered ->
  tempData = Classification.find(type: 'company-classification').fetch()
  dataTree(tempData, 'classification')

Template.createCompanyModal.helpers
  classificationDetails: -> Classification.findOne(_id: Session.get('currentClassID').toString())
