Meteor.subscribe('locations');

Meteor.startup(function () {

  var hooksObject = {
    // Called when any submit operation succeeds
    onSuccess: function(formType, result) {
      Materialize.toast('Database operation successful', 4000) // 4000 is the duration of the toast
    },

    // Called when any submit operation fails
    onError: function(formType, error) {
      Materialize.toast('Error! Database operation successful.', 4000) // 4000 is the duration of the toast
    }
  };

  // Pass `null` to run the hook for all autoforms (global hook)
  AutoForm.addHooks(null, hooksObject);
    
});
