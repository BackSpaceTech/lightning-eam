###************************* Permissions *******************************###
Workorders.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Safetyplans.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Workplans.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

#****************************** Work Team ********************************

Schema.workTeam = new SimpleSchema(
  userID:
    type: String
    label: 'User Sys ID'
    autoform:
      type: 'hidden'
  firstName:
    type: String
    label: 'First Name'
  lastName:
    type: String
    label: 'Last Name'
)

#****************************** Safety Methods ********************************

schemaSafetyMethod = {
  id:
    type: String
    label: 'Sequence ID'
  activity:
    type: String
    label: 'Activity'
    autoform: {
      rows: 5
    }
  hazards:
    type: String
    label: 'Hazards'
    autoform: {
      rows: 5
    }
  controls:
    type: String
    label: 'Risk control measures'
    autoform: {
      rows: 5
    }
  responsible:
    type: String
    label: 'Who is responsible?'
}
Schema.safetyMethod = new SimpleSchema schemaSafetyMethod

schemaSafetyPlan = {
  completed:
    type: String
    label: 'Completed Time'
}

schemaSafetyPlan = Object.assign schemaSafetyPlan, schemaSafetyMethod
Schema.safetyPlan = new SimpleSchema schemaSafetyPlan

Schema.safetyMethodTemplate = new SimpleSchema(
  text:
    type: String
    label: 'Title'
  createdByID:
    type: String
  safetyMethod:
    type: [Schema.safetyMethod]
    label: 'Safety Plan'
)

#****************************** Work Plans ********************************

schemaTasks = {
  id:
    type: String
    label: 'Sequence ID'
  activity:
    type: String
    label: 'Activity'
  text:
    type: String
    label: 'Instructions'
    autoform: {
      rows: 5
    }
  estimatedTime:
    type: Number
    label: 'Est mins'
  trade:
    type: String
    label: 'Trade'
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.Trades
  tradeLevel:
    type: String
    label: 'Trade Level'
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.TradeLevels
  profession:
    type: String
    label: 'Profession'
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.Professions
    optional: true
  professionLevel:
    type: String
    label: 'Profession Level'
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.ProfessionLevels
    optional: true
  certification:
    type: String
    label: 'Certification'
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.Certifications
    optional: true
}

Schema.tasks = new SimpleSchema schemaTasks

schemaWorkPlan = {
  completed:
    type: String
    label: 'Completed Time'
}

schemaWorkPlan = Object.assign schemaWorkPlan, schemaTasks
Schema.workPlan = new SimpleSchema schemaWorkPlan

Schema.workPlanTemplate = new SimpleSchema(
  text:
    type: String
    label: 'Title'
  createdByID:
    type: String
  workPlan:
    type: [Schema.tasks]
    label: 'Work Plan'
)

Workplans.attachSchema Schema.workPlanTemplate


#****************************** Work Requests / Orders ************************

schemaRequests = {
  refID:
    type: String
    label: 'Reference ID'
    optional: true
  type:
    type: String
    label: 'Type'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Types
  status:
    type: String
    label: 'Status'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Status
  reqPriority:
    type: String
    label: 'Requested Priority'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Priority
  reqDescription:
    type: String
    label: 'Request Description'
  asset_ID:
    type: String
    label: 'Asset SysID'
  asset_treePath:
    type: [String]
  assetID:
    type: String
    label: 'Asset ID'
    optional: true
  assetText:
    type: String
    label: 'Asset Name'
  cancelledReason:
    type: String
    label: 'Cancellation Reason'
    optional: true
  reqComments:
    type: String
    label: 'Request Comments'
    optional: true
  reqBy_id:
    type: String
  reqByFirstName:
    type: String
  reqByLastName:
    type: String
  reqDate:
    type: Date
    optional: true
  reqApprovedBy_id:
    type: String
    optional: true
  reqApprovedByFirstName:
    type: String
    optional: true
  reqApprovedByLastName:
    type: String
    optional: true
  reqApprovedDate:
    type: Date
    optional: true
}

Schema.requests = new SimpleSchema schemaRequests

schemaRequestsApproved = {
  text:
    type: String
    label: 'Title'
  priority:
    type: String
    label: 'Priority'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Priority
  description:
    type: String
    label: 'Description'
  safetyMethod:
    type: [Schema.safetyMethod]
    label: 'Safety Plan'
    optional: true
  workPlan:
    type: [Schema.tasks]
    label: 'Work Plan'
    optional: true
  workTeam:
    type: [Schema.workTeam]
    label: 'Work Team'
    optional: true
  woApprovedBy_id:
    type: String
    optional: true
  woApprovedByFirstName:
    type: String
    optional: true
  woApprovedByLastName:
    type: String
    optional: true
  woCreatedDate:
    type: Date
    optional: true
  woApprovedDate:
    type: Date
    optional: true
  woPlannedDate:
    type: Date
    optional: true
  woInProgDate:
    type: Date
    optional: true
  woCompletedDate:
    type: Date
    optional: true
  woFinancialsDate:
    type: Date
    optional: true
  woReviewedDate:
    type: Date
    optional: true
  woClosedDate:
    type: Date
    optional: true
}

schemaRequestsApproved = Object.assign schemaRequestsApproved, schemaRequests
Schema.requestsApproved = new SimpleSchema schemaRequestsApproved

schemaWorkorders ={
  startTime:
    type: Date
  safetyMethod:
    type: [Schema.safetyPlan]
    label: 'Safety Plan'
  workPlan:
    type: [Schema.workPlan]
    label: 'Work Plan'
  feedback:
    type: String
  fault:
    type: String
    label: 'Fault'
  cause:
    type: String
    label: 'Cause'
  remedy:
    type: String
    label: 'Remedy'
}

schemaWorkorders = Object.assign schemaWorkorders, schemaRequestsApproved
Schema.workorders = new SimpleSchema schemaWorkorders
