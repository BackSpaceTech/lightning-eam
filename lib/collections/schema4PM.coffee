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
  workorder_ID:
    type: String
    label: 'System ID'
  completed:
    type: Boolean
    label: 'PM WO Status'
  DateRaised:
    type: Date
    label: 'Date Raised'
  DateDue:
    type: Date
    label: 'Date Due'
  DateCompleted:
    type: Date
    label: 'Date Completed'
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
  active:
    type: Boolean
    label: 'Active'
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
  pmInterval:
    type: Number
    label: 'PM Interval'
    min: 1
  pmIntervalUnits:
    type: String
    label: 'Interval Units'
    defaultValue: '0'
    autoform:
      type: 'select'
      options: ->
        Lists.PM.IntervalUnits
  pmIntervalType:
    type: Number
    label: 'Interval Type'
    autoform:
      type: 'select'
      options: ->
        Lists.PM.IntervalTypes
  workorder:
    type: [Schema.workorderPM]
    label: 'Work Order'
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
