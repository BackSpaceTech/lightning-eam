Template.createWorkTemplatePage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.createWorkTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createWorkTemplatePage.helpers
  customTemplate: -> Customisations.createWorkTemplate
  createdID: -> Meteor.userId()
  createWorkTemplateSchema: -> Schema.workPlanTemplate
