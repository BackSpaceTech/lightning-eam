if (Meteor.isServer)
  Meteor.methods {
    createLoc: (doc) ->
      # Insert a location / asset into the collection
      Locations.insert doc , (error,id) ->
        if(id)
          console.log "Doc: ", JSON.stringify doc
          tempPath = []
          # Get the parent asset's tree path
          if (doc.parent!='#')
            temp = Locations.findOne {'_id':doc.parent}
            if(temp)
              tempPath = temp.treePath
          # Add current doc _id
          tempPath.push(id)
          console.log "Updating Tree path: ", JSON.stringify tempPath
          Locations.update id, { $set: { treePath: tempPath }}
          Locations.update id, { $set: { id: id }}
        else
          console.log(error)
          return error
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
        Locations.update(doc._id, { $push: { meters: meter }})
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
