# Subscribe to a subset of the data on the client
Meteor.subscribe 'locations'
# Subscribe to subset persisted in GroundDB
Ground.Collection Workorders

Meteor.startup ->
  # Initialise Autoform
  hooksObject = {
    # Called when any submit operation succeeds
    onSuccess: (formType, result) -> toast 'success', 'Database operation completed.'
    # Called when any submit operation fails
    onError: (formType, error) ->
      if (formType == "method")
        toast 'error', error.details
      else
        toast 'error', error
    }
  AutoForm.addHooks(null, hooksObject);

  # Initialise Navbar dropdown
  $('.dropdown-button').dropdown {hover:false}

  #Initialise sessions
  Session.set 'currentDoc', {}
  Session.set 'currentID', '#'
