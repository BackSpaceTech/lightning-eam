// Subscribe to a subset of the data on the client
Meteor.subscribe('locations');

// Autoform hooks
Meteor.startup(function () {

  var hooksObject = {
    // Called when any submit operation succeeds
    onSuccess: function(formType, result) {
      toastr.success('Database operation completed.');
    },

    // Called when any submit operation fails
    onError: function(formType, error) {
      toastr.error('Database operation failed.'  + " error:", error);
    }
  };
  // Pass `null` to run the hook for all autoforms (global hook)
  AutoForm.addHooks(null, hooksObject);
});
