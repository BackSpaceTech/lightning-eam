###************************* Class *****************************************###
Class.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Schema.class = new SimpleSchema(
  id: #Copy of _id used by treeView
    type: String
    label: 'Sys ID'
    optional: true
  createdDate:
    type: Date
    label: 'Created Date'
    optional: true
  classID:
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
            label: 'Asset Class'
            value: 'asset-class'
          }
          {
            label: 'Company Class'
            value: 'company-class'
          }
        ]
  description:
    type: String
    label: 'Description'
    optional: true
)
