Template.deleteInvLocClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteInvLocClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteInvLocClassificationPage.helpers
  customTemplate: -> Customisations.deleteInvLocClassification
  textDoc: -> Classification.findOne({'id':Session.get('currentClassID').toString()}).text
