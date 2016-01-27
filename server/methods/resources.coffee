Meteor.methods
  deleteUser: (doc) ->
    # Delete a user
    Meteor.users.remove doc
    this.unblock()
  setRole: (userID, role) ->
    Roles.setUserRoles userID, role
