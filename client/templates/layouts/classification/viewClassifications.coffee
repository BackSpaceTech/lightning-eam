Template.viewClassificationsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
  temp = Session.get 'treeviewData'
  if temp
    tempData = Classification.find( { type:temp } ).fetch()
  dataTree(tempData , 'classification')

Template.viewClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewClassificationsPage.helpers
  serverConnected: -> (Meteor.status().status == 'connected');
  getClassificationType: ->
    switch Session.get('treeviewData')
      when 'asset-classification' then return 'Asset'
      when 'item-classification' then return 'Item'
      when 'equipment-classification' then return 'Equipment'
      when 'invloc-classification' then return 'Inventory Location'


Template.viewClassificationsPage.events
  'click .btnNewDB': (event) ->
    Session.set 'currentClassID', '#'
    FlowRouter.go '/'+this.type+'/create-classification'
  'click .btnNewAss': (event, template) ->
    FlowRouter.go '/'+this.type+'/create-classification'
  'click .btnEdit': (event) ->
    Collections.Classification.Current = Classification.findOne {'_id':Session.get('currentClassID').toString()}
    if (Session.get('currentClassID') == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/'+this.type+'/edit-classification'

  'click .btnViewLoc': (event, template) ->
    Collections.Classification.Current = Classification.findOne {'_id':Session.get('currentClassID').toString()}
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/'+this.type+'/view-classification'

  'click .btnDeleteLoc': (event, template) ->
    if (Session.get('currentClassID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/'+this.type+'/delete-classification'
