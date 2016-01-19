Template.createSafetyTemplatePage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.createSafetyTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createSafetyTemplatePage.helpers
  customTemplate: -> Customisations.createSafetyTemplate
  createSafetyTemplateSchema: -> Schema.safetyMethodTemplate
  createdID: -> Meteor.userId()
