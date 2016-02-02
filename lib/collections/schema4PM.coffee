###************************* Permissions *******************************###
PM.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Assetgroups.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

#********************************* PM *******************************

Schema.workorderPM = new SimpleSchema (
  asset_ID:
    type: String
    label: 'Asset SysID'
  assetTree:
    type: [String]
    label: 'Asset SysID'
  assetName:
    type: String
    label: 'Asset SysID'
  active:
    type: Boolean
    label: 'Activated'
  cronJob:
    type: Boolean
    label: 'Cron Expression type'
  pmExpression:
    type: String
    label: 'Scheduling Expression'
  meterInterval:
    type: Number
    label: 'Meter Interval'
  meterID:
    type: String
    label: 'Meter ID'
  meterReading:
    type: Number
    label: 'Last Meter Reading'
  workorder_ID:
    type: [String]
    label: 'System ID'
    optional: true
)

Schema.assetGroup = new SimpleSchema (
  groupText:
    type: String
    label: 'Asset Group Name'
  groupCreatedBy:
    type: String
  asset_IDs:
    type: [String]
    label: 'Asset SysID'
)

Schema.pm = new SimpleSchema (
  refID:
    type: String
    label: 'Reference ID'
    optional: true
  pmPriority:
    type: String
    label: 'PM Priority'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Priority
  pmDescription:
    type: String
    label: 'PM Description'
  assetGroup_ID:
    type: String
    label: 'Asset Group ID'
  safetyPlan_ID:
    type: String
    label: 'Safety Plan'
  workPlan_ID:
    type: String
    label: 'Work Plan'
  pmIntervalType:
    type: Number
    label: 'Interval Type'
    autoform:
      type: 'select'
      options: ->
        Lists.PM.IntervalTypes
  workorderPM:
    type: [Schema.workorderPM]
    label: 'Work History'
    optional: true
  createdBy_id:
    type: String
  createdDate:
    type: Date
    optional: true
  approvedBy_id:
    type: String
    optional: true
  approvedDate:
    type: Date
    optional: true
)
