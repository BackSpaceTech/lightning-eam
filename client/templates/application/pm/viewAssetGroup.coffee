Template.viewAssetGroupPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleAssetGroup', Session.get('currentDoc')._id.toString()

Template.viewAssetGroupPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewAssetGroupPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetGroupPage.helpers
  customTemplate: -> Customisations.viewAssetGroup
  groupText: -> Assetgroups.findOne({_id: Session.get('currentDoc')._id.toString()}).groupText
  assetArray: ->
    temp = Assetgroups.findOne({_id: Session.get('currentDoc')._id.toString()}).asset_IDs
    tempArray=[]
    for a in [0...temp.length]
      tempArray[a] = Locations.findOne {'id':temp[a]}
    tempArray

  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'assetID', label: ' Asset ID' }
        { key: 'text', label: ' Asset Name' }
      ]
    }
