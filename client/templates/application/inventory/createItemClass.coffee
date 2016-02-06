Template.createItemClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createItemClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createItemClassificationPage.helpers
  ItemClassificationFormSchema: -> Schema.classification
  customTemplate: -> Customisations.createItemClassification

#--------------------------- Classification Template --------------------------#

Template.createClassificationPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createClassificationPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createClassificationPage.helpers
  parentID: -> Session.get('currentID')[0]
  children: -> []
  ItemClassificationFormSchema: -> Schema.classification
