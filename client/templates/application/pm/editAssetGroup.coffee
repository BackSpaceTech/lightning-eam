Template.editAssetGroupPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singleAssetGroup', Session.get('currentDoc')._id.toString()
  this.assetArray = new ReactiveVar []

Template.editAssetGroupPage.onRendered ->
  assetTree()
  $('.tooltipped').tooltip {delay: 50}

Template.editAssetGroupPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editAssetGroupPage.helpers
  customTemplate: -> Customisations.editAssetGroup
  assetGroupSchema: -> Schema.assetGroup
  viewDoc: -> Assetgroups.findOne({_id: Session.get('currentDoc')._id.toString()})
  agText: -> Assetgroups.findOne({_id: Session.get('currentDoc')._id.toString()}).groupText
  assetArray: ->
    temp = Assetgroups.findOne({_id: Session.get('currentDoc')._id.toString()}).asset_IDs
    tempArray=[]
    for a in [0...temp.length]
      tempArray[a] = Locations.findOne {'id':temp[a]}
    tempArray
  assetArrayDetails: ->
    Assetgroups.findOne({_id: Session.get('currentDoc')._id.toString()}).assetList
  assetDetails: -> Locations.findOne {'id':Session.get('currentID').toString()}
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'assetID', label: ' Asset ID' }
        { key: 'text', label: ' Asset Name' }
      ]
    }

Template.editAssetGroupPage.events
  'click .btnAdd': (event, template) ->
    temp = Assetgroups.findOne {_id: Session.get('currentDoc')._id.toString()}
    console.log JSON.stringify temp.assetList()
    temp = template.assetArray.get()
    if temp.indexOf(Session.get('currentID').toString()) == -1
      temp.push Session.get('currentID').toString()
      template.assetArray.set temp
      toastr.success("Asset added")
    else
      toastr.error("Asset already added")

  'click .btnDelete': (event, template) ->
    temp = template.assetArray.get()
    temp.splice(temp.indexOf(this._id), 1)
    template.assetArray.set temp
    toastr.success("Asset removed")
