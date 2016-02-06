Template.duplicateClassificationPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateClassificationPage.helpers
  classificationFormSchema: -> Schema.classification
