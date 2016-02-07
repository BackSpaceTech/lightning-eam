Template.deleteEquipmentClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteEquipmentClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteEquipmentClassificationPage.helpers
  customTemplate: -> Customisations.deleteEquipmentClassification
  textDoc: -> Classification.findOne({'id':Session.get('currentClassID').toString()}).text
