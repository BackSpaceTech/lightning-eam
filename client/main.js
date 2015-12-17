Meteor.subscribe('locations');

Meteor.startup(function () {

  var hooksObject = {
    // Called when any submit operation succeeds
    onSuccess: function(formType, result) {
      toastr.success('Database operation completed.');
    },

    // Called when any submit operation fails
    onError: function(formType, error) {
      toastr.error('Database operation failed.');
    }
  };

  // Pass `null` to run the hook for all autoforms (global hook)
  AutoForm.addHooks(null, hooksObject);

});
