Template.editClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editClassificationPage.helpers
  classificationFormSchema: -> Schema.classification
  classDoc: -> Collections.Classification.Current
