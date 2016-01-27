Template.viewLocationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewLocationsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}
  assetTree()

Template.viewLocationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewLocationsPage.helpers
  customTemplate: -> Customisations.viewLocations
  assetDetails: -> Locations.findOne {'id':Session.get('currentID').toString()}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected');

Template.viewLocationsPage.events
  'click .viewLocations .btnNewDB': (e) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/assets/create-location'

  'click .viewLocations .btnNewLoc': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    temp = Collections.Locations.Current
    if (!temp) # No locations
      FlowRouter.go '/assets/create-location'
    else if (temp.type == 'asset')
      alert 'You cannot create a location with an asset as parent.'
    else
      FlowRouter.go '/assets/create-location'

  'click .viewLocations .btnNewAss': (e) ->
    FlowRouter.go '/assets/create-asset'

  'click .viewLocations .btnEdit': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'

  'click .viewLocations .btnCopy': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type  == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'

  'click .viewLocations .btnViewLoc': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/view-asset'
      else
        FlowRouter.go '/assets/view-location'

  'click .viewLocations .btnDeleteLoc': (e) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      FlowRouter.go '/assets/delete-location'

  'click .viewLocations .btnCreateMeter': (e) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      FlowRouter.go '/assets/create-meter'
