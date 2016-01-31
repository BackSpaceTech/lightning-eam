Template.editWorkTemplatePage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleWorkplan', Collections.Workplans.Current._id

Template.editWorkTemplatePage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.editWorkTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editWorkTemplatePage.helpers
  customTemplate: -> Customisations.editWorkTemplate
  viewDoc: -> Workplans.findOne '_id': Collections.Workplans.Current._id
