###************************* Classification *********************************###
Classification.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Schema.classification = new SimpleSchema(
  id: #Copy of _id used by treeView
    type: String
    label: 'Sys ID'
    optional: true
  createdDate:
    type: Date
    label: 'Created Date'
    optional: true
  classificationID:
    type: String
    label: 'ID'
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
            label: 'Asset Classification'
            value: 'asset-classification'
          }
          {
            label: 'Item Classification'
            value: 'item-classification'
          }
          {
            label: 'Equipment Classification'
            value: 'equipment-classification'
          }
          {
            label: 'Inventory Location Classification'
            value: 'invloc-classification'
          }
        ]
  description:
    type: String
    label: 'Description'
    optional: true
)
