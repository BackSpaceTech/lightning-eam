Template.editAssetPage.onCreated ->
  this.assetClassID = new ReactiveVar

Template.editAssetPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.editAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', Session.get('currentID').toString()

Template.editAssetPage.helpers
  customTemplate: -> Customisations.editAsset # user customised template if applicable
  currentDoc: ->
    Collections.Locations.Current = Locations.findOne {'_id':Session.get('currentID').toString()}
    return Collections.Locations.Current
  asset: -> (Collections.Locations.Current.type == 'asset')
  locationFormSchema: -> Schema.locations
  assetClassID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne({_id: Session.get('currentClassID').toString()}).text

Template.editAssetPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Asset Classification'
      bodyTemplate: "modalEditAssetPage"

#------------------- Modal -------------------------------------

Template.modalEditAssetPage.onRendered ->
  temp = Classification.find().fetch()
  console.log 'Tree data sent: '+JSON.stringify temp
  assetTree(temp , 'classification')

Template.modalEditAssetPage.helpers
  classificationDetails: -> Classification.findOne {_id:Session.get 'currentClassID'}
