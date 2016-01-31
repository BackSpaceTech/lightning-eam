Meteor.methods
  deleteUser: (doc) ->
    # Delete a user
    Meteor.users.remove doc
    this.unblock()
    return 'Deleted User'
  setRole: (userID, role) ->
    Roles.setUserRoles userID, role
    return 'Set Role'
