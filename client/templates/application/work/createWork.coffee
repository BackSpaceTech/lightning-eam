Template.createWorkPage.onRendered ->
  assetTree()


Template.createWorkPage.events



Template.createWorkPage.helpers
  customTemplate: -> Customisations.createWork
  createWorkFormSchema: -> Schema.workorders
