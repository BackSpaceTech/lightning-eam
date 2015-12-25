Template.viewPeoplePage.onCreated(function(){
  var self = this;
   self.autorun(function() {
     self.subscribe('directory');
   });
});

Template.viewPeoplePage.onRendered(function(){
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
    var tempProfile =[];
    var tempArray = Meteor.users.find().fetch();
    // create array
    for (var a=0;a<tempArray.length;a++){
      tempProfile[a] = {
        firstName : tempArray[a].profile.firstName,
        lastName : tempArray[a].profile.lastName,
        email : tempArray[a].emails[0].address,
        cpyName : tempArray[a].profile.cpyName,
        cpyDiv : tempArray[a].profile.cpyDiv,
      }
    }
    return tempProfile;
  },
  settings: function () {
    return {
      rowsPerPage: 10,
      showFilter: true,
      fields:  [
        { key: 'firstName', label: ' First Name' },
        { key: 'lastName', label: 'Last Name' },
        { key: 'email', label: 'Email' },
        { key: 'cpyName', label: 'Company' },
        { key: 'cpyDiv', label: 'Division' }
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
