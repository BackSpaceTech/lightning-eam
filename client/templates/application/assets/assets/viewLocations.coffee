Template.viewLocationsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewLocationsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  dataTree(Locations.find().fetch() , 'general')

Template.viewLocationsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewLocationsPage.helpers
  customTemplate: -> Customisations.viewLocations
  assetDetails: -> Locations.findOne {'id':Session.get('currentID').toString()}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected');

Template.viewLocationsPage.events
  'click .viewLocations .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/assets/create-location'

  'click .viewLocations .btnNewLoc': (event) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    temp = Collections.Locations.Current
    if (!temp) # No locations
      FlowRouter.go '/assets/create-location'
    else if (temp.type == 'asset')
      alert 'You cannot create a location with an asset as parent.'
    else
      FlowRouter.go '/assets/create-location'

  'click .viewLocations .btnNewAss': (event) ->
    FlowRouter.go '/assets/create-asset'

  'click .viewLocations .btnEdit': (event) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'

  'click .viewLocations .btnViewLoc': (event) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/view-asset'
      else
        FlowRouter.go '/assets/view-location'

  'click .viewLocations .btnDeleteLoc': (event) ->
    temp = Session.get('currentID').toString()
    if (temp == '#')
      alert 'No location or asset selected!'
    else
      MaterializeModal.confirm
        title: 'Delete Location'
        label: 'Warning - Permanent Delete'
        message: 'Warning this will permanently delete the document. This will also affect any other documents that refer to it.'
        callback: (error, response) ->
          if (response.submit)
            Meteor.call 'deleteLoc', temp, (error, result) ->
              if error
                toast 'error', error
              else
                $('.tree_view').jstree(true).destroy()
                dataTree(Locations.find().fetch() , 'general')
                toast 'success', result

  'click .viewLocations .btnCreateMeter': (event) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      FlowRouter.go '/assets/create-meter'
