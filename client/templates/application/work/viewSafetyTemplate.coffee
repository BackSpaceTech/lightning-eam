Template.viewSafetyTemplatePage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleSafetymethod', Collections.Safetyplans.Current._id

Template.viewSafetyTemplatePage.onRendered ->
  $(".dropdown-button").dropdown()  
  $('.tooltipped').tooltip {delay: 50}

Template.viewSafetyTemplatePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewSafetyTemplatePage.helpers
  customTemplate: -> Customisations.viewSafetyTemplate
  viewDoc: -> Safetyplans.findOne '_id': Collections.Safetyplans.Current._id
  schemaSafetyplans: -> Schema.safetyMethodTemplate
  collectionSafetyplans: -> Safetyplans
  settings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: 'id', label: ' Sequence ID' }
      { key: 'activity', label: ' Activity' }
      { key: 'hazards', label: ' Hazards' }
      { key: 'controls', label: ' Controls' }
      { key: 'responsible', label: ' Responsible' }
    ]
  }

Template.viewSafetyTemplatePage.events
  'click .btnEdit': (event) ->
    FlowRouter.go '/work/edit-safety'
