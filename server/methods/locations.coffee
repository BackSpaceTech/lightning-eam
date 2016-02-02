Meteor.methods
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
        return 'Created'
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
    return 'Deleted'
  createMeter: (doc, meter) ->
    # Check if meter array already exists
    if (doc.meters)
      Locations.update(doc._id, { $push: { meters: meter }})
    else
      Locations.update(doc._id, { $set: { meters: [meter]} })
    this.unblock()
    return 'Created Meter'
  updateMeter: (docID, meterIndex, reading) ->
    meters = Locations.findOne({'_id': docID}).meters
    meters[meterIndex].reading = reading
    Locations.update(docID, { $set: { meters: meters} })
    activateMeterPM docID, meters[meterIndex].id, reading
    this.unblock()
    return 'Updated Meter'
  deleteMeter: (docID, meterIndex) ->
    meters = Locations.findOne({'_id': docID}).meters
    meters.splice(meterIndex,1)
    Locations.update(docID, { $set: { meters: meters} })
    this.unblock()
    return 'Deleted Meter'
