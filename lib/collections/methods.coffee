if (Meteor.isServer)
  Meteor.methods {
    createLoc: (doc) ->
      # Check if id already exists
      exists = Locations.findOne {"id": doc.id}
      if(exists)
        console.log("id-already-used", "The ID is already used, please select a new ID.")
        throw new Meteor.Error "id-already-used", "The ID is already used, please select a new ID."
      else
         # Update the parent asset's children list
         if (doc.parent!='#')
           temp = Locations.findOne {'id':doc.parent}
           if (temp)
             Locations.update(temp._id, { $push: { children: doc.id }})
         # Insert a location / asset into the collection
         Locations.insert doc
         this.unblock()
    deleteLoc: (doc) ->
      # Update the parent asset's children list
      if (doc.parent!='#')
        temp = Locations.findOne {'id':doc.parent}
        if (temp)
          Locations.update(temp._id, { $pull: { children: doc.id }})
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
    createWO: (doc) ->
       # Insert a work order into the collection
       Workorders.insert doc
       this.unblock()
    }
