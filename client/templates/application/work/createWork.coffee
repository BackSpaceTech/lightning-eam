Template.createWorkPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}

Template.createWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createWorkPage.events



Template.createWorkPage.helpers
  customTemplate: -> Customisations.createWork
  createWorkFormSchema: -> Schema.workorders
