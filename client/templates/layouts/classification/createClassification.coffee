Template.createClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createClassificationPage.helpers
  parentID: -> Session.get('currentID')[0]
  children: -> []
  ClassificationFormSchema: -> Schema.classification
