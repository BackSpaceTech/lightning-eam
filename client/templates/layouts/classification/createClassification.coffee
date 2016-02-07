Template.createClassificationPage.helpers
  parentID: -> Session.get('currentClassID').toString()
  children: -> []
  ClassificationFormSchema: -> Schema.classification
