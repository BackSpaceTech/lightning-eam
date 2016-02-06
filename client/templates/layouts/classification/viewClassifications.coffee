Template.viewClassificationsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
  if this.type = 'assets'
    Session.set 'treeviewData', 'asset-classification'
  assetTree()

Template.viewClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewClassificationsPage.helpers
  serverConnected: -> (Meteor.status().status == 'connected');

Template.viewAssetClassificationsPage.events
  'click .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/'+this.type+'/create-classification'
  'click .btnNewAss': (event, template) ->
    FlowRouter.go '/'+this.type+'/create-classification'
  'click .btnEdit': (event) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/'+this.type+'/edit-classification'
  'click .btnCopy': (event, template) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/'+this.type+'/duplicate-classification'

  'click .btnViewLoc': (event, template) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/'+this.type+'/view-classification'

  'click .btnDeleteLoc': (event, template) ->
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/'+this.type+'/delete-classification'
