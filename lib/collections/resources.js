Meteor.methods({
  setRole: function(userID,role) {
    Roles.setUserRoles(userID, role);
  }
});
