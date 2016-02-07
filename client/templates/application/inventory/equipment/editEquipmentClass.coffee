Template.editEquipmentClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editEquipmentClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editEquipmentClassificationPage.helpers
  customTemplate: -> Customisations.editEquipmentClassification # user customised template if applicable
