// Subscribe to a subset of the data on the client
Meteor.subscribe('locations');

// Autoform hooks
Meteor.startup(function () {

  // Initialise Autoform
  var hooksObject = {
    // Called when any submit operation succeeds
    onSuccess: function(formType, result) {
      toastr.success('Database operation completed.');
    },
    // Called when any submit operation fails
    onError: function(formType, error) {
      if (formType=="method"){
        toastr.error(error.details);
      }
      else{
        toastr.error(error);
      }
    }
  };
  AutoForm.addHooks(null, hooksObject);

  // Initialise Navbar dropdown
  $(".dropdown-button").dropdown();

  // Initialise sAlert
  sAlert.config({
          effect: '',
          position: 'top-right',
          timeout: 5000,
          html: false,
          onRouteClose: true,
          stack: true,
          offset: 0,
          beep: false,
          onClose: _.noop //
      });
});
