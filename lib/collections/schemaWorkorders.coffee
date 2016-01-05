###************************* Workorders *******************************###
Workorders.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Schema.safety = new SimpleSchema(
  createdBy:
    type: String
  activity:
    type: String
    label: 'Activity'
  hazards:
    type: String
    label: 'Hazards'
  controls:
    type: String
    label: 'Risk control measures'
  responsible:
    type: String
    label: 'Who is responsible?'
)

Schema.tasks = new SimpleSchema(
  id:
    type: String
    label: 'Sequence ID'
  text:
    type: String
    label: 'Instructions'
  estimatedHrs:
    type: Number
    label: 'Instructions'
  actualHrs:
    type: Number
    label: 'Instructions'
  completedByID:
    type: [String]
    label: 'Instructions'
    autoform:
      type: 'select-multiple'
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
)

Schema.workorders = new SimpleSchema(
  reqBy_id:
    type: String
  reqByFirstName:
    type: String
  reqByLastName:
    type: String
  reqDate:
    type: Date
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
  woApprovedBy_id:
    type: String
    optional: true
  woApprovedByFirstName:
    type: String
    optional: true
  woApprovedByLastName:
    type: String
    optional: true
  woApprovedDate:
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
  refID:
    type: String
    label: 'Reference ID'
    optional: true
  text:
    type: String
    label: 'Title'
  type:
    type: String
    label: 'Type'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Types
  status:
    type: String
    label: 'Type'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Status
  reqPriority:
    type: String
    label: 'Priority'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Priority
  priority:
    type: String
    label: 'Priority'
    autoform:
      type: 'select'
      options: ->
        Lists.Workorders.Priority
  reqDescription:
    type: String
    label: 'Description'
  description:
    type: String
    label: 'Description'
    optional: true
  safetyMethod:
    type: [Schema.safety]
    label: 'Safety Plan'
    optional: true
  workPlan:
    type: [Schema.tasks]
    label: 'Work Plan'
)
