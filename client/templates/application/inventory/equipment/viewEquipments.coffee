Template.viewEquipmentsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewEquipmentsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  temp = Equipment.find().fetch()
  dataTree(temp , 'general')

Template.viewEquipmentsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewEquipmentsPage.helpers
  customTemplate: -> Customisations.viewEquipments
  equipmentDetails: -> Equipment.findOne {id: Session.get('currentID').toString()}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected')

Template.viewEquipmentsPage.events
  'click .viewEquipments .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/equipment/create-equipment'

  'click .viewEquipments .btnNew': (event) ->
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/equipment/create-equipment'

  'click .viewEquipments .btnEdit': (event) ->
    Collections.Equipment.Current = Equipment.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No equipment selected!'
    else
      FlowRouter.go '/inventory/equipment/edit-equipment'

  'click .viewEquipments .btnView': (event) ->
    Collections.Equipment.Current = Equipment.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No equipment selected!'
    else
      FlowRouter.go '/inventory/equipment/view-equipment'

  'click .viewEquipments .btnDelete': (event) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No equipment selected!'
    else
      FlowRouter.go '/inventory/equipment/delete-equipment'
