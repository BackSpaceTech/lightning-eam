Template.editAssetClassPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editAssetClassPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editAssetClassPage.helpers
  customTemplate: -> Customisations.editAssetClass # user customised template if applicable
  currentDoc: ->
    Collections.Class.Current = Class.findOne {'_id':Session.get('currentID').toString()}
    return Collections.Class.Current
  classFormSchema: -> Schema.class
