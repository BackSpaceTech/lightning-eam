Meteor.methods
  createWO: (doc) ->
    # Add date stamp to request
    doc.reqDate = new Date()
    # Insert a work order into the collection
    Workorders.insert doc
    this.unblock()
    return 'Created'
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
    return 'Updated'
  deleteWO: (docID) ->
    Workorders.remove {'_id': docID}
    this.unblock()
    return 'Deleted'
  setWorkQuery: (query) ->
    Collections.Workorders.workQuery = query
    return 'Querying database...'
  createWorkTemplate: (doc) ->
    Workplans.insert doc
    this.unblock()
    return 'Created Work Template'
  createSafetyTemplate: (doc) ->
    Safetyplans.insert doc
    this.unblock()
    return 'Created Safety Method'
  deleteSafety: (docID) ->
    Safetyplans.remove {'_id': docID}
    this.unblock()
    return 'Deleted Safety Method'
  deleteWork: (docID) ->
    Workplans.remove {'_id': docID}
    this.unblock()
    return 'Deleted Work Template'
