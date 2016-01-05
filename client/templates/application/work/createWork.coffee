Template.createWorkPage.onRendered ->
  assetTree()
<<<<<<< HEAD
  $('.tooltipped').tooltip {delay: 50}

Template.createWorkPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
=======

>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3

Template.createWorkPage.events



Template.createWorkPage.helpers
  customTemplate: -> Customisations.createWork
  createWorkFormSchema: -> Schema.workorders
