Template.viewItemsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewItemsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  temp = Items.find().fetch()
  dataTree(temp , 'general')

Template.viewItemsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewItemsPage.helpers
  customTemplate: -> Customisations.viewItems
  itemDetails: -> Items.findOne {'_id':Session.get('currentID').toString()}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected')

Template.viewItemsPage.events
  'click .viewItems .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/items/create-item'

  'click .viewItems .btnNew': (event) ->
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/items/create-item'

  'click .viewItems .btnEdit': (event) ->
    Collections.Items.Current = Items.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No item selected!'
    else
      FlowRouter.go '/inventory/items/edit-item'

  'click .viewItems .btnView': (event) ->
    Collections.Items.Current = Items.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No item selected!'
    else
      FlowRouter.go '/inventory/items/view-item'

  'click .viewItems .btnDelete': (event) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No item or item selected!'
    else
      FlowRouter.go '/inventory/items/delete-item'
