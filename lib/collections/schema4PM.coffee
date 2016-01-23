###************************* Permissions *******************************###
PM.allow
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
  asset_ID:
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
  assetGroupText:
    type: String
    label: 'Asset Group Name'
  safetyMethod:
    type: [Schema.safetyMethod]
    label: 'Safety Plan'
    optional: true
  workPlan:
    type: [Schema.tasks]
    label: 'Work Plan'
    optional: true
  pmInterval:
    type: Number
    label: 'PM Interval'
  pmIntervalUnits:
    type: String
    label: 'Interval Units'
    autoform:
      type: 'select'
      options: ->
        Lists.PM.IntervalUnits    
  pmIntervalType:
    type: Boolean
    label: 'Fixed Date'
  workorder:
    type: [Schema.workorderPM]
    label: 'Work Order'
    optional: true
  createdBy_id:
    type: String
  createdByFirstName:
    type: String
  createdByLastName:
    type: String
  createdDate:
    type: Date
  approvedBy_id:
    type: String
    optional: true
  approvedByFirstName:
    type: String
    optional: true
  approvedByLastName:
    type: String
    optional: true
  approvedDate:
    type: Date
    optional: true
)
