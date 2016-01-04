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
  id:
    type: String
    label: 'ID'
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
    optional: true
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





  criticality:
    type: Number
    label: 'Criticality'
    autoform:
      type: 'select'
      options: ->
        Lists.Locations.Criticality
  classification:
    type: String
    label: 'Classification'
    optional: true
    autoform:
      type: 'select'
      options: ->
        Lists.Locations.Classification
  status:
    type: String
    label: 'Status'
    defaultValue: 'inservice'
    autoform:
      type: 'select'
      options: ->
        Lists.Locations.Status
  rotable:
    type: Boolean
    label: 'Rotable Asset'
    defaultValue: false
  rotableID:
    type: Boolean
    label: 'Rotable ID'
    optional: true
  barcodeID:
    type: String
    label: 'Barcode ID'
    optional: true
  referenceID:
    type: String
    label: 'Reference ID'
    optional: true
  address:
    type: String
    label: 'Address'
    optional: true
  state:
    type: String
    label: 'State'
    optional: true
  zip:
    type: String
    label: 'Zip Code'
    optional: true
  country:
    type: String
    label: 'Country'
    optional: true
  urlTechData:
    type: String
    label: 'Tech Data URL'
    optional: true
  urlOpData:
    type: String
    label: 'Ops Data URL'
    optional: true
  urlPhoto:
    type: String
    label: 'Photo URL'
    optional: true
  serialNumber:
    type: String
    label: 'Serial Number'
    optional: true
  modelNumber:
    type: String
    label: 'Model Number'
    optional: true
  manufacturer:
    type: String
    label: 'Manufacturer'
    optional: true
  manufPhone:
    type: String
    label: 'Manuf. Phone'
    optional: true
  manufAddress:
    type: String
    label: 'Manuf. Address'
    optional: true
  manufState:
    type: String
    label: 'Manuf. State'
    optional: true
  manufZip:
    type: String
    label: 'Manuf. Zip'
    optional: true
  manufDate:
    type: Date
    label: ' '
    optional: true
  installDate:
    type: Date
    label: ' '
    optional: true)
