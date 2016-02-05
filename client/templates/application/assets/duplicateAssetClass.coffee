Template.duplicateAssetClassPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateAssetClassPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
  
Template.duplicateAssetClassPage.helpers
  customTemplate: -> Customisations.duplicateAssetClass
  duplicateDoc: ->
    Collections.Class.Current = Class.findOne {'_id':Session.get('currentID').toString()}
    return Collections.Class.Current
  classFormSchema: -> Schema.class
