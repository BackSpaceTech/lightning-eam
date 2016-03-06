Meteor.methods
  createAssetGroup: (doc) ->
    this.unblock()
    Assetgroups.insert doc
    return 'Created Asset Group'
  deleteAssetGroup: (docID) ->
    this.unblock()
    Assetgroups.remove {'_id': docID}
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
    return 'Created PM'
  updatePM: (doc, ID) ->
    this.unblock()
    PM.update {'_id': ID}, doc
    console.log "Udated PM: "+ID
    return 'Updated PM'
  activatePM: (doc, ID, timeBased) ->
    console.log 'Doc: '+JSON.stringify doc
    console.log 'ID: '+JSON.stringify ID
    console.log 'timeBased: '+JSON.stringify timeBased
    PM.update {'_id': ID}, doc
    if timeBased
      tempPM = PM.findOne { '_id': ID }
      if tempPM
        console.log 'Found PM'
        console.log 'tempPM.workorderPM.length: '+JSON.stringify tempPM.workorderPM.length
        for a in [0...tempPM.workorderPM.length]
          console.log 'a= '+a
          console.log 'tempPM.workorderPM[a].asset_ID: '+tempPM.workorderPM[a].asset_ID
          tempCron = Crontasks.findOne {'pmID': ID, 'assetID': tempPM.workorderPM[a].asset_ID}
          if !tempCron
            console.log 'Cron Task not found'
            if (tempPM.workorderPM[a].active)
              activateTimePM ID, tempPM.workorderPM[a]
          else
            console.log 'Cron Task found'
            console.log 'tempPM.workorderPM[a].active: '+JSON.stringify tempPM.workorderPM[a].active
            console.log 'tempPM.workorderPM[a].pmExpression: '+JSON.stringify tempPM.workorderPM[a].pmExpression
            console.log 'tempCron.pmExpression: '+JSON.stringify tempCron.pmExpression
            if (!tempPM.workorderPM[a].active) || (tempPM.workorderPM[a].pmExpression != tempCron.pmExpression)
              console.log 'Removed Cron Task'
              SyncedCron.remove tempCron._id # Remove cron task
              Crontasks.remove { '_id' : tempCron._id }
            if (tempPM.workorderPM[a].active) && (tempPM.workorderPM[a].pmExpression != tempCron.pmExpression)
              console.log 'Created Cron Task'
              activateTimePM ID, tempPM.workorderPM[a] #
    console.log 'Updated PM'
    return 'Updated PM'
  deletePM: (docID) ->
    this.unblock()
    PM.remove {'_id': docID}
    return 'Deleted PM'

#------------------------ Global Functions -------------------------------------

@activateTimePM = (pmID, workorderPM) ->
  cronTaskID = Crontasks.insert { # Record cron job
   pmID: pmID
   assetID: workorderPM.asset_ID
   cronJob: workorderPM.cronJob
   pmExpression: workorderPM.pmExpression
  }
  SyncedCron.add # Create cron job
    name: cronTaskID
    schedule: (parser) ->
      # parser is a later.parse object
      if workorderPM.cronJob == '0'
        return parser.text workorderPM.pmExpression
      else if workorderPM.cronJob == '1'
        return parser.cron workorderPM.pmExpression
    job: ->
      # Create PM work order
      generateWorkOrder workorderPM.asset_ID, pmID
  console.log 'Activating time based PM: '+JSON.stringify doc
  console.log 'Current server time is: '+ new Date()

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

@generateWorkOrder = (assetID, pmID) ->
  console.log 'System: triggered PM Work Order (PM id: '+pmID+') for Asset '+ assetID+'...'
  tempAsset = Locations.findOne {'_id': assetID}
  if !tempAsset
    console.log 'System: Could not find Asset'
    return
  tempPM = PM.findOne {'_id': pmID}
  if !tempPM
    console.log 'System: Could not find PM'
    return
  sPlan = Safetyplans.findOne {'_id': tempPM.safetyPlan_ID}
  if !sPlan
    console.log 'System: Could not find safety plan for PM'
    return
  wPlan = Workplans.findOne {'_id': tempPM.workPlan_ID}
  if !wPlan
    console.log 'System: Could not find work plan for PM'
    return
  workOrder =  {
    type: 'pm'
    status: '5'
    reqPriority: tempPM.pmPriority
    reqDescription: tempPM.pmDescription
    asset_ID: assetID
    asset_treePath: tempAsset.treePath
    assetID: tempAsset.assetID
    assetText: tempAsset.text
    reqComments: 'System generated PM'
    reqBy_id: 'System generated PM'
    reqByFirstName: 'System generated PM'
    reqByLastName: 'System generated PM'
    reqDate: new Date()
    text: tempPM.pmDescription
    priority: tempPM.pmPriority
    description: tempPM.pmDescription
    safetyMethod: sPlan.safetyMethod
    workPlan: wPlan.workPlan
    woCreatedDate: new Date()
  }
  # Insert work order into the collection
  Workorders.insert workOrder
  console.log 'Triggered PM Work Order (PM id: '+pmID+') for Asset '+ assetID
