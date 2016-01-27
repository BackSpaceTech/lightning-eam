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
    # Insert a work order into the collection
    PM.insert doc
    this.unblock()
  deletePM: (docID) ->
    PM.remove {'_id': docID}
    this.unblock()
  updatePM: (doc, ID) ->
    PM.update {'_id': ID}, doc
    this.unblock()
  cronPM: (doc) ->
    console.log 'Cron task created: '+JSON.stringify doc
    # Check if cron task exists
