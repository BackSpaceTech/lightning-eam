Template.editCompanyClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editCompanyClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editCompanyClassificationPage.helpers
  customTemplate: -> Customisations.editCompanyClassification # user customised template if applicable
