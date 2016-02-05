Template.viewAssetClassificationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewAssetClassificationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'treeviewData', 'Classification'
  assetTree()

Template.viewAssetClassificationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetClassificationsPage.helpers
  customTemplate: -> Customisations.viewAssetClassifications
  classificationDetails: -> Classification.findOne {'id':Session.get('currentID').toString()}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected');

Template.viewAssetClassificationsPage.events
  'click .viewAssetClassifications .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/assets/create-classification'
  'click .viewAssetClassifications .btnNewAss': (event) ->
    FlowRouter.go '/assets/create-classification'
  'click .viewAssetClassifications .btnEdit': (event) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/edit-classification'
  'click .viewAssetClassifications .btnCopy': (event) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/duplicate-classification'

  'click .viewAssetClassifications .btnViewLoc': (event) ->
    Collections.Classification.Current = Classification.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/view-classification'

  'click .viewAssetClassifications .btnDeleteLoc': (event) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No classification selected!'
    else
      FlowRouter.go '/assets/delete-classification'
