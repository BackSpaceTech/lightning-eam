Template.duplicateAssetPage.onCreated ->
  this.assetClassID = new ReactiveVar

Template.duplicateAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID')[0])

Template.duplicateAssetPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateAssetPage.helpers
  customTemplate: -> Customisations.editAsset # user customised template if applicable
  currentDoc: ->
    Collections.Locations.Current = Locations.findOne {'_id':Session.get('currentID')[0]}
    return Collections.Locations.Current
  asset: -> (Collections.Locations.Current.type == 'asset')
  locationFormSchema: -> Schema.locations
  assetClassID: -> Session.get 'currentClass'
  txtClassificationID: -> Classification.findOne({_id: Session.get('currentClass')[0]}).text

Template.duplicateAssetPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Asset Classification'
      bodyTemplate: "modalDuplicateAssetPage"

#------------------- Modal -------------------------------------

Template.modalDuplicateAssetPage.onRendered ->
  temp = Classification.find().fetch()
  console.log 'Tree data sent: '+JSON.stringify temp
  assetTree(temp , 'classification')

Template.modalDuplicateAssetPage.helpers
  classificationDetails: -> Classification.findOne {_id:Session.get 'currentClass'}
