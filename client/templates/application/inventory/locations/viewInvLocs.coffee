Template.viewInvLocsPage.onCreated ->
  # Set Navbar so Resources highlighted
  $('#header1DesktopUL li').removeClass 'active'
  $('#header1DesktopUL li').eq(0).addClass 'active'

Template.viewInvLocsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  temp = Bins.find().fetch()
  dataTree(temp , 'general')

Template.viewInvLocsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewInvLocsPage.helpers
  customTemplate: -> Customisations.viewInvLocs
  invLocDetails: -> Bins.findOne {'id':Session.get('currentID').toString()}
  # Disable create/edit if not connected
  serverConnected: -> (Meteor.status().status == 'connected')

Template.viewInvLocsPage.events
  'click .viewInvLocs .btnNewDB': (event) ->
    Session.set 'currentID', '#'
    FlowRouter.go '/inventory/locations/create-location'
  'click .viewInvLocs .btnNew': (event) ->
    Collections.Bins.Current = Bins.findOne {'id':Session.get('currentID').toString()}
    FlowRouter.go '/inventory/locations/create-location'

  'click .viewInvLocs .btnEdit': (event) ->
    Collections.Bins.Current = Bins.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location selected!'
      return
    FlowRouter.go '/inventory/locations/edit-location'

  'click .viewInvLocs .btnViewLoc': (event) ->
    Collections.Bins.Current = Bins.findOne {'id':Session.get('currentID').toString()}
    if (Session.get('currentID').toString() == '#')
      alert 'No location selected!'
      return
    else
      FlowRouter.go '/inventory/locations/view-location'

  'click .viewInvLocs .btnDeleteLoc': (event) ->
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
                temp = Bins.find().fetch()
                dataTree(temp , 'general')
                toast 'success', result
