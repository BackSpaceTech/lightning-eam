Template.viewPMPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singlePM', Session.get('currentDoc')._id.toString()
    self.subscribe 'assetGroups'
    self.subscribe 'safetyplans'
    self.subscribe 'workplans'

Template.viewPMPage.onRendered ->
  Session.set 'temp', true

Template.viewPMPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewPMPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewPMPage.helpers
  customTemplate: -> Customisations.viewAsset
  pmSchema: -> Schema.pm
  viewDoc: ->
    Collections.PM.Current = PM.findOne ({ _id: Session.get('currentDoc')._id.toString() })
    console.log JSON.stringify Collections.PM.Current
    Collections.PM.Current
  settings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'pmDescription', label: ' Title' }
    ]
  }
  assetGrpDetails: -> Collections.PM.Current.assetGroupDetails
  assetGrpList: -> Collections.PM.Current.assetGroupDetails.assetList
  agSettings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: 'assetID', label: ' Asset ID' }
      { key: 'text', label: ' Title' }
    ]
  }
  safetyMthdDetails: -> Collections.PM.Current.safetyPlanDetails
  safetyMthdList: -> Collections.PM.Current.safetyPlanDetails.safetyMethod
  smSettings: -> {
    rowsPerPage: 10
    showFilter: false
    fields:  [
      { key: 'id', label: ' Sequence ID' }
      { key: 'activity', label: ' Activity' }
      { key: 'hazards', label: ' Hazards' }
      { key: 'controls', label: ' Controls' }
      { key: 'responsible', label: ' Responsible' }
    ]
  }
  workPlanDetails: -> Collections.PM.Current.workPlanDetails
  workPlanList: -> Collections.PM.Current.workPlanDetails.workPlan
  wpSettings: -> {
    rowsPerPage: 10
    showFilter: false
    fields:  [
      { key: 'id', label: ' Sequence ID' }
      { key: 'activity', label: ' Activity' }
      { key: 'text', label: ' Title' }
      { key: 'estimatedTime', label: ' Est Time' }            
      { key: 'trade', label: ' Trade' }
      { key: 'tradeLevel', label: ' Trade Level' }
    ]
  }
