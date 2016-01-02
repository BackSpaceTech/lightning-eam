Template.viewLocationsPage.events
  'click #btnViewLocationsPageNewDB': (e) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/assets/create-location'

  'click #btnViewLocationsPageNewDB2': (e) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/assets/create-location'

  'click #btnViewLocationsPageNewLoc': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    temp = Collections.Locations.Current
    if (!temp) # No locations
      FlowRouter.go '/assets/create-location'
    else if (temp.type == 'asset')
      alert 'You cannot create a location with an asset as parent.'
    else
      FlowRouter.go '/assets/create-location'

  'click #btnViewLocationsPageNewLoc2': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    temp = Collections.Locations.Current
    if (!temp) # No locations
      FlowRouter.go '/assets/create-location'
    else if (Collections.Locations.Current.type == 'asset')
      alert 'You cannot create a location with an asset as parent.'
    else
      FlowRouter.go '/assets/create-location'

  'click #btnViewLocationsPageNewAss': (e) ->
    FlowRouter.go '/assets/create-asset'

  'click #btnViewLocationsPageNewAss2': (e) ->
    FlowRouter.go '/assets/create-asset'

  'click #btnViewLocationsPageEdit': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'

  'click #btnViewLocationsPageEdit2': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/edit-asset'
      else
        FlowRouter.go '/assets/edit-location'

  'click #btnViewLocationsPageCopy': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type  == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'

  'click #btnViewLocationsPageCopy2': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString()== '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/duplicate-asset'
      else
        FlowRouter.go '/assets/duplicate-location'

  'click #btnViewLocationsPageViewLoc': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/view-asset'
      else
        FlowRouter.go '/assets/view-location'

  'click #btnViewLocationsPageViewLoc2': (e) ->
    Collections.Locations.Current = Locations.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      if (Collections.Locations.Current.type == 'asset')
        FlowRouter.go '/assets/view-asset'
      else
        FlowRouter.go '/assets/view-location'

  'click #btnViewLocationsPageDeleteLoc': (e) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      FlowRouter.go '/assets/delete-location'

  'click #btnViewLocationsPageCreateMeter': (e) ->
    if (Session.get('currentID').toString() == '#')
      alert 'No location or asset selected!'
    else
      FlowRouter.go '/assets/create-meter'


Template.viewLocationsPage.helpers
  locationID: ->
    temp = Session.get 'currentID'
    temp2 = Locations.find({id:String(temp)}).fetch();
    return (temp + ' - ' + temp2[0].text)

  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected');
