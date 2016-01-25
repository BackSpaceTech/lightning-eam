# Subscribe to a subset of the data on the client
Meteor.subscribe 'locations'
# Subscribe to subset persisted in GroundDB
Meteor.subscribe 'my-work', Meteor.userId()
Ground.Collection Workorders

Meteor.startup ->
  # Initialise Autoform
  hooksObject = {
    # Called when any submit operation succeeds
    onSuccess: (formType, result) -> toastr.success 'Database operation completed.'
    # Called when any submit operation fails
    onError: (formType, error) ->
      if (formType == "method")
        toastr.error(error.details)
      else
        toastr.error(error)
    }
  AutoForm.addHooks(null, hooksObject);

  # Initialise Navbar dropdown
  $('.dropdown-button').dropdown {hover:false}
