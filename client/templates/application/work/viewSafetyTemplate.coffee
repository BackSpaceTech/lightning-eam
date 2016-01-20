Template.viewSafetyTemplatePage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleSafetymethod', Collections.Safetyplans.Current._id

Template.viewSafetyTemplatePage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewSafetyTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewSafetyTemplatePage.helpers
  customTemplate: -> Customisations.viewSafetyTemplate
  viewDoc: -> Safetyplans.findOne '_id': Collections.Safetyplans.Current._id
