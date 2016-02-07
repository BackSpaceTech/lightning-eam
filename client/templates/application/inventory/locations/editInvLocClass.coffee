Template.editInvLocClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editInvLocClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editInvLocClassificationPage.helpers
  customTemplate: -> Customisations.editInvLocClassification # user customised template if applicable
