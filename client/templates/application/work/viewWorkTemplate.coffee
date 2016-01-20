Template.viewWorkTemplatePage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleWorkplan', Collections.Workplans.Current._id

Template.viewWorkTemplatePage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewWorkTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewWorkTemplatePage.helpers
  customTemplate: -> Customisations.viewWorkTemplate
  viewDoc: -> Workplans.findOne '_id': Collections.Workplans.Current._id
