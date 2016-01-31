Meteor.methods
  createAssetGroup: (doc) ->
    Assetgroups.insert doc
    this.unblock()
  deleteAssetGroup: (docID) ->
    Assetgroups.remove {'_id': docID}
    this.unblock()
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
  updatePM: (doc, ID) ->
    PM.update {'_id': ID}, doc
    console.log "Udated PM: "+ID
    this.unblock()
  deletePM: (docID) ->
    PM.remove {'_id': docID}
    this.unblock()
