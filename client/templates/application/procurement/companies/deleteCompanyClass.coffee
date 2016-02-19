Template.deleteCompanyClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteCompanyClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteCompanyClassificationPage.helpers
  customTemplate: -> Customisations.deleteCompanyClassification
  textDoc: -> Classification.findOne({'id':Session.get('currentClassID').toString()}).text
