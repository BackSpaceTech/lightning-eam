if (Meteor.isServer)
  Meteor.methods {
    createLoc: (doc) ->
      # Check if id already exists
      exists = Locations.findOne {"id": doc.id}
      if(exists)
         throw new Meteor.Error "id-already-used", "The ID is already used, please select a new ID."
       else
         # Insert a location / asset into the collection
         Locations.insert doc
         this.unblock()
    deleteLoc: (doc) ->
      # Delete a location / asset from the collection
      Locations.remove doc
      this.unblock()
    deleteUser: (doc) ->
      # Delete a location / asset from the collection
      Meteor.users.remove doc
      this.unblock()
    createMeter: (doc, meter) ->
      # Check if meter array already exists
      if (doc.meters)
         Locations.update(doc._id, { $push: { meters: meter}})
       else
         Locations.update(doc._id, { $set: { meters: [meter]} })
       this.unblock()
    updateMeter: (doc, meter) ->
      Locations.update(doc._id, { $set: { meters: meter} })
      this.unblock()
    setRole: (userID, role) ->
      Roles.setUserRoles userID, role
    }
