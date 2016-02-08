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
  assetClassID: -> Session.get 'currentClassID'
  txtClassificationID: -> Classification.findOne(Session.get('currentClassID').toString()).text

Template.createAssetPage.events
  'click .firstRow .btnAdd': (event, template) ->
    MaterializeModal.confirm
      title: 'Select Asset Classification'
      bodyTemplate: "createAssetAddAssetClass"

Template.createAssetAddAssetClass.onRendered ->
  tempData = Classification.find(type: 'asset-classification').fetch()
  dataTree(tempData, 'classification')

Template.createAssetAddAssetClass.helpers
  classificationDetails: -> Classification.findOne(_id: Session.get('currentClassID').toString())
