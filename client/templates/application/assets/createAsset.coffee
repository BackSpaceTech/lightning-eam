Template.createAssetPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.createAssetPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createAssetPage.helpers
  parentID: -> Session.get('currentID').toString()
  children: -> []
  locationFormSchema: -> Schema.locations
  customTemplate: -> Customisations.createAsset
  classificationID: -> Session.get 'currentID'
  txtClassificationID: -> Classification.findOne(Session.get('currentID').toString()).text

Template.createAssetPage.events
  'click .firstRow .btnAdd': (event) ->
    MaterializeModal.display({
      bodyTemplate: "createAssetAddAssetClass"
    })

Template.createAssetAddAssetClass.onRendered ->
  Session.set 'treeviewData', 'Classification'
  assetTree()

Template.createAssetAddAssetClass.helpers
  classificationDetails: -> Classification.find().fetch()

Template.createAssetAddAssetClass.events
  'click .btnAdd': (event) ->
    MaterializeModal.close()
