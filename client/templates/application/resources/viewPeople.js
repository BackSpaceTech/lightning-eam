Template.viewPeoplePage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('directory');
   });
});

Template.viewPeoplePage.helpers({
  userProfiles: function() {
    return Meteor.users.find();
  },
  userEmail: function() {
    return this.emails[0].address;
  },
  userID: function() {
    return this._id;
  },
  userRole: function() {
    return this.roles[0];
  },
  userArray: function () {
    return Meteor.users.find();
  },
  settings: function () {
    return {
      rowsPerPage: 10,
      showFilter: true,
      fields:  [
        { key: 'profile.firstName', label: ' First Name' },
        { key: 'profile.lastName', label: 'Last Name' },
        { key: 'profile.cpyName', label: 'Company' },
        { key: 'profile.cpyDiv', label: 'Division' }
      ]
    }
  }
});

Template.viewPeoplePage.events({
  'click #btnTest': function(e) {
    Meteor.call("setRole", "J4Zjgp3tRNQfbDa96", "admin");
    alert("Done")
  }
});
