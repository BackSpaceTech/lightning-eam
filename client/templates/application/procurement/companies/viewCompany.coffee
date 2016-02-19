Template.viewCompanyPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewCompanyPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewCompanyPage.helpers
  customTemplate: -> Customisations.viewCompany
  currentDoc: -> Session.get 'currentDoc'
  txtClassificationID: -> Classification.findOne(_id: Session.get('currentDoc').classificationID ).text

Template.viewCompanyPage.events
  'click .viewCompany .btnEdit': ->
    if (Session.get('currentID').toString() == '#')
      alert 'No item selected!'
    else
      FlowRouter.go '/items/edit-item'
