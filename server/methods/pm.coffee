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
    # Insert a PM into the collection
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

#------------------------ Global Functions -------------------------------------

@activateMeterPM = (assetID, meterID, newReading) ->
  # Find PMs for asset
  console.log 'Running meter PM activation...'
  tempPM = PM.find({
    'pmIntervalType': 1
    'workorderPM.active': true
    'workorderPM.asset_ID': assetID
    'workorderPM.meterID': meterID
    }).fetch()
  if tempPM
    for a in [0...tempPM.length]
      for b in [0...tempPM[a].workorderPM.length]
        temp = tempPM[a].workorderPM[b]
        if (temp.asset_ID==assetID) && (temp.meterID==meterID) # Find the relevant workorder PM details
          if temp.meterReading
            if (newReading - temp.meterReading) >= temp.meterInterval
              tempPM[a].workorderPM[b].meterReading = newReading
              PM.update {'_id': tempPM[a]._id}, {$set: {workorderPM: tempPM[a].workorderPM}}
              generateWorkOrder assetID, tempPM[a]
          else
            tempPM[a].workorderPM[b].meterReading = newReading
            console.log 'Initialised PM meter trigger to: ' + JSON.stringify tempPM[a].workorderPM
            PM.update {'_id': tempPM[a]._id}, {$set: {workorderPM: tempPM[a].workorderPM}}
  console.log 'PM activation completed'

@generateWorkOrder = (assetID, PM) ->
  console.log 'Generating PM Work Order (PM id: '+PM._id+') for asset '+ assetID
  tempAsset = Locations.findOne {'id': assetID}
  workOrder =  {
    type: 'pm'
    status: '5'
    reqPriority: PM.pmPriority
    reqDescription: PM.pmDescription
    asset_ID: assetID
    asset_treePath: tempAsset.treePath
    assetID: tempAsset.assetID
    assetText: tempAsset.text
    reqComments: 'System generated PM'
    reqBy_id: 'System generated PM'
    reqByFirstName: 'System generated PM'
    reqByLastName: 'System generated PM'
    reqDate: new Date()
    text: PM.pmDescription
    priority: PM.pmPriority
    description: PM.pmDescription
    safetyMethod: Safetyplans.findOne({'_id': PM.safetyPlan_ID}).safetyMethod
    workPlan: Workplans.findOne({'_id': PM.workPlan_ID}).workPlan
    woCreatedDate: new Date()
  }
  # Insert work order into the collection
  Workorders.insert workOrder
  this.unblock()
