Template.createAssetGroupPage.onCreated ->
  this.assetArray = new ReactiveVar []

Template.createAssetGroupPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  dataTree()

Template.createAssetGroupPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.createAssetGroupPage.helpers
  customTemplate: -> Customisations.createAssetGroup
  assetGroupSchema: -> Schema.assetGroup
  assetGroupCreatedBy: -> Meteor.userId()
  assetArray: -> Template.instance().assetArray.get()
  assetArrayDetails: ->
    tempArray=[]
    temp = Template.instance().assetArray.get()
    for a in [0...temp.length]
      tempArray[a] = Locations.findOne {'id':temp[a]}
    return tempArray
  assetDetails: -> Locations.findOne {'id':Session.get('currentID').toString()}
  settings: ->
        return {
          rowsPerPage: 10
          showFilter: true
          fields:  [
            { key: 'assetID', label: ' Asset ID' }
            { key: 'text', label: ' Asset Name' }
            { key: '', label: 'Delete', tmpl: Template.rtDelete }
          ]
        }

Template.createAssetGroupPage.events
  'click .createAssetGroup .btnAdd': (event, template) ->
    temp = template.assetArray.get()
    if temp.indexOf(Session.get('currentID').toString()) == -1
      temp.push Session.get('currentID').toString()
      template.assetArray.set temp
      toast 'success', 'Asset added'
    else
      toast 'error', 'Asset already added'

  'click .createAssetGroup .btnDelete': (event, template) ->
    temp = template.assetArray.get()
    temp.splice(temp.indexOf(this._id), 1)
    template.assetArray.set temp
    toast 'success', 'Asset removed'
