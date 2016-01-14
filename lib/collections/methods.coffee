if (Meteor.isServer)
  Meteor.methods {
    createLoc: (doc) ->
      # Add date stamp
      doc.createdDate = new Date()
      # Insert a location / asset into the collection
      Locations.insert doc , (error,id) ->
        if(id)
          tempPath = []
          # Get the parent asset's tree path
          if (doc.parent!='#')
            temp = Locations.findOne {'_id':doc.parent}
            if(temp)
              tempPath = temp.treePath
          # Add current doc _id
          tempPath.push(id)
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
      # Add date stamp to request
      doc.reqDate = new Date()
      # Insert a work order into the collection
      Workorders.insert doc
      this.unblock()
    updateWO:(doc, ID) ->
      tempWO = Workorders.findOne('_id':ID)
      if doc.$set.status > tempWO.status # Status has been progressed
        # Add date stamp to upate
        switch doc.$set.status
          when '3'
            doc.$set.reqApprovedDate = new Date()
            console.log 'Updated Request approved date'
          when '4'
            doc.$set.woCreatedDate = new Date()
          when '5'
            doc.$set.woApprovedDate = new Date()
          when '6'
            doc.$set.woPlannedDate = new Date()
          when '8'
            doc.$set.woInProgDate = new Date()
          when '9'
            doc.$set.woCompletedDate = new Date()
          when '10'
            doc.$set.woFinancialsDate = new Date()
          when '11'
            doc.$set.woReviewedDate = new Date()
          when '12'
            doc.$set.woClosedDate = new Date()
      # Insert a work order into the collection
      Workorders.update({ _id: ID }, doc)
      this.unblock()
    deleteWO: (docID) ->
      Workorders.remove {'_id': docID}
      this.unblock()
    }
