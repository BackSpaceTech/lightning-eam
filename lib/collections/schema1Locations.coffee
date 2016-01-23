###************************* Locations & Assets *******************************###
Locations.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Schema.locations = new SimpleSchema(
  id: #Copy of _id used by treeView
    type: String
    label: 'Sys ID'
    optional: true
  createdDate:
    type: Date
    label: 'Created Date'
    optional: true
  assetID:
    type: String
    label: 'ID'
    optional: true
  referenceID:
    type: String
    label: 'Reference ID'
    optional: true
  text:
    type: String
    label: 'Title'
  parent:
    type: String
    label: 'Parent Sys ID'
    defaultValue: '#'
  treePath:
    type: [String]
    label: 'Tree Path'
    optional: true
  type:
    type: String
    label: 'Type'
    autoform:
      type: 'select'
      options: ->
        [
          {
            label: 'Database'
            value: 'database'
          }
          {
            label: 'Location'
            value: 'location'
          }
          {
            label: 'Asset'
            value: 'asset'
          }
        ]
  description:
    type: String
    label: 'Description'
    optional: true
  lat1:
    type: Number
    label: 'Lat1'
    optional: true
  long1:
    type: Number
    label: 'Long1'
    optional: true
  lat2:
    type: Number
    label: 'Lat2'
    optional: true
  long2:
    type: Number
    label: 'Long2'
    optional: true
  linear:
    type: Boolean
    label: 'Linear Asset'
    defaultValue: false
  safety:
    type: String
    label: 'Safety Instructions'
    optional: true
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
    autoform:
      type: 'pickadate'
    optional: true
  installDate:
    type: Date
    label: ' '
    autoform:
      type: 'pickadate'
    optional: true)
