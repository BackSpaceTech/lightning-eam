Meteor.methods
  createAssetGroup: (doc) ->
    Assetgroups.insert doc
    this.unblock()
    return 'Created Asset Group'
  deleteAssetGroup: (docID) ->
    Assetgroups.remove {'_id': docID}
    this.unblock()
    return 'Deleted Asset Group'
  createPM: (doc) ->
    # Add date stamp to request
    doc.createdDate = new Date()
    # Create workorderPM fields from asset group
    temp = Assetgroups.findOne({'_id': doc.assetGroup_ID}).asset_IDs
    doc.workorderPM = []
    for a in [0...temp.length]
      doc.workorderPM[a] = {
        asset_ID: temp[a]
        assetName: Locations.findOne({'_id': temp[a]}).text
        active: false
      }
    # Insert a work order into the collection
    PM.insert doc
    this.unblock()
    return 'Created PM'
  updatePM: (doc, ID) ->
    PM.update {'_id': ID}, doc
    console.log "Udated PM: "+ID
    this.unblock()
    return 'Updated PM'
  deletePM: (docID) ->
    PM.remove {'_id': docID}
    this.unblock()
    return 'Deleted PM'
