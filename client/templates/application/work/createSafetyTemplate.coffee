Template.createSafetyTemplatePage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.createSafetyTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createSafetyTemplatePage.helpers
  customTemplate: -> Customisations.createSafetyTemplate
  createdID: -> Meteor.userId()
  createSafetyTemplateSchema: -> Schema.safetyMethodTemplate
