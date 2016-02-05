Template.duplicateAssetPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleLocation', (Session.get('currentID').toString())

Template.duplicateAssetPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.duplicateAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.duplicateAssetPage.helpers
  customTemplate: -> Customisations.duplicateAsset
  duplicateDoc: ->
    Collections.Locations.Current = Locations.findOne {'_id':Session.get('currentID').toString()}
    return Collections.Locations.Current
  locationFormSchema: -> Schema.locations
  classificationID: -> Session.get 'currentID'
  txtClassificationID: -> Classification.findOne(Session.get('currentID').toString()).text

Template.duplicateAssetPage.events
  'click .firstRow .btnAdd': (event) ->
    MaterializeModal.display({
      bodyTemplate: "duplicateAssetAddAssetClass"
    })

Template.duplicateAssetAddAssetClass.onRendered ->
  Session.set 'treeviewData', 'Classification'
  assetTree()

Template.duplicateAssetAddAssetClass.helpers
  classificationDetails: -> Classification.find().fetch()

Template.duplicateAssetAddAssetClass.events
  'click .btnAdd': (event) ->
    MaterializeModal.close()
