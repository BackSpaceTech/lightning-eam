// Initialize collapse button
Template.layout.onRendered(function () {
  $('.button-collapse').sideNav({
      //edge: 'left', // Choose the horizontal origin
      closeOnClick: true // Closes side-nav on <a> clicks
    }
  );
});

Template.header1.helpers({
  serverConnected: function() {
    return (Meteor.status().status === "connected");
  },
  userSignedIn: function() {
    if (Meteor.userId()){
      return true;
    }
    else{
      return false;
    }
  }
});

Template.header1.events({
  'click #btnheader1Logout': function(e) {
    AccountsTemplates.logout();
    return
  }
});
