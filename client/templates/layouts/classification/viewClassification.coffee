Template.viewClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewClassificationPage.helpers
  ClassificationFormSchema: -> Schema.classification
