Template.editItemClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editItemClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editItemClassificationPage.helpers
  customTemplate: -> Customisations.editItemClassification # user customised template if applicable
