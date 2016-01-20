Template.editSafetyTemplatePage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleSafetymethod', Collections.Safetyplans.Current._id

Template.editSafetyTemplatePage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editSafetyTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editSafetyTemplatePage.helpers
  customTemplate: -> Customisations.viewSafetyTemplate
  viewDoc: -> Safetyplans.findOne '_id': Collections.Safetyplans.Current._id
