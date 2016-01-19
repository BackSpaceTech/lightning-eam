Template.createWorkTemplatePage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.createWorkTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createWorkTemplatePage.helpers
  customTemplate: -> Customisations.createWorkTemplate
  createWorkTemplateSchema: -> Schema.workPlanTemplate
  createdID: -> Meteor.userId()
