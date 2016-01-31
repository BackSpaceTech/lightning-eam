@pmActivation = (doc, ID) ->
  console.log 'PM Activation started...' + JSON.stringify(doc)
  tempCron = {}
  for a in [0...doc.workorderPM.length]
    if doc.pmIntervalType == 0 # Calendar interval type
      # Create cron tasks
      tempCron =
        cronType: 'pm'
        pmID: doc._id
        assetID: doc.workorderPM[a].asset_ID
        pmIntervalType: doc.pmIntervalType
        pmInterval: doc.pmInterval
        pmIntervalUnits: doc.pmIntervalUnits
        pmLead: doc.pmLead
        pmLeadUnits: doc.pmLeadUnits
      if doc.workorderPM[a].dueDate
        tempCron.dueDate = doc.workorderPM[a].dueDate
      else
        tempCron.dueDate = new Date()
      createCronTask tempCron
  return

@createCronTask = (doc) ->
  temp = Crontasks.findOne {}
