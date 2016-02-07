Template.deleteItemClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteItemClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteItemClassificationPage.helpers
  customTemplate: -> Customisations.deleteItemClassification
  textDoc: -> Classification.findOne({'id':Session.get('currentClassID').toString()}).text
