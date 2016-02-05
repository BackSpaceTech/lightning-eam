Template.viewAssetClassesPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewAssetClassesPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'treeviewData', 'Class'
  assetTree()

Template.viewAssetClassesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewAssetClassesPage.helpers
  customTemplate: -> Customisations.viewAssetClasses
  classDetails: -> Class.findOne {'id':Session.get('currentID').toString()}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected');

Template.viewAssetClassesPage.events
  'click .viewAssetClasses .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/assets/create-class'
  'click .viewAssetClasses .btnNewAss': (event) ->
    FlowRouter.go '/assets/create-class'
  'click .viewAssetClasses .btnEdit': (event) ->
    Collections.Class.Current = Class.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No class selected!'
    else
      FlowRouter.go '/assets/edit-class'
  'click .viewAssetClasses .btnCopy': (event) ->
    Collections.Class.Current = Class.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No class selected!'
    else
      FlowRouter.go '/assets/duplicate-class'

  'click .viewAssetClasses .btnViewLoc': (event) ->
    Collections.Class.Current = Class.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No class selected!'
    else
      FlowRouter.go '/assets/view-class'

  'click .viewAssetClasses .btnDeleteLoc': (event) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No class selected!'
    else
      FlowRouter.go '/assets/delete-class'
