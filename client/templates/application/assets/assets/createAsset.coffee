Template.createAssetPage.onCreated ->
  this.assetClassID = new ReactiveVar

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
  assetClassID: -> Template.instance().assetClassID.get()
  txtClassificationID: ->
    temp = Classification.findOne(Template.instance().assetClassID.get().toString())
    if temp
      return temp.text

Template.createAssetPage.events
  'click .firstRow .btnAdd': (event, template) ->
    Collections.Locations.CurrentID = Session.get 'currentID' # Save parent asset ID
    MaterializeModal.confirm
      title: 'Select Asset Classification'
      bodyTemplate: "createAssetAddAssetClass"
      callback: (error, response) ->
        if response.submit
          console.log "Session.get 'currentID': "+Session.get 'currentID'
          template.assetClassID.set(Session.get 'currentID') # Save selected classification ID
          Session.set 'currentID', Collections.Locations.CurrentID
          console.log "Session.get 'currentID': "+Session.get 'currentID'
        else
          Session.set 'currentID', Collections.Locations.CurrentID
        return

Template.createAssetAddAssetClass.onRendered ->
  Session.set 'treeviewData', 'asset-classification'
  assetTree()

Template.createAssetAddAssetClass.helpers
  classificationDetails: -> Classification.find().fetch()
