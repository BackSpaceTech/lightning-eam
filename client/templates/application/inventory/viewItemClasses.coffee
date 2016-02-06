Template.viewItemClassificationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewItemClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'treeviewData', 'ItemClassification'
  assetTree()

Template.viewItemClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewItemClassificationsPage.helpers
  customTemplate: -> Customisations.viewItemClassifications
  classificationDetails: -> Classification.findOne {'id':Session.get('currentID')[0]}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected');

Template.viewItemClassificationsPage.events
  'click .viewItemClassifications .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/inventory/create-classification'
  'click .viewItemClassifications .btnNewAss': (event) ->
    FlowRouter.go '/inventory/create-classification'
  'click .viewItemClassifications .btnEdit': (event) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/edit-classification'
  'click .viewItemClassifications .btnCopy': (event) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/duplicate-classification'

  'click .viewItemClassifications .btnViewLoc': (event) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID')[0]}
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/view-classification'

  'click .viewItemClassifications .btnDeleteLoc': (event) ->
    if (Session.get('currentID')[0] == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/inventory/delete-classification'
