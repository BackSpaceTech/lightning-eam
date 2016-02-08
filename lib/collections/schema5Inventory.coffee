###************************* Inventory *************************************###
Bins.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Items.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Equipment.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Schema.items = new SimpleSchema(
  id: #Copy of _id used by treeView
    type: String
    label: 'Sys ID'
    optional: true
  supplier_id:
    type: String
    label: 'Supplier Sys ID'
    optional: true
  createdDate:
    type: Date
    label: 'Created Date'
    optional: true
  itemID:
    type: String
    label: 'ID'
    optional: true
  classificationID:
    type: String
    label: 'ID'
    optional: true
  type:
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
  description:
    type: String
    label: 'Description'
  parent:
    type: String
    label: 'Parent Sys ID'
    defaultValue: '#'
  treePath:
    type: [String]
    label: 'Tree Path'
    optional: true
  stockUnits:
    type: String
    label: 'Units of Measure'
    autoform:
      type: 'select'
      options: ->
        Lists.Inventory.Units
  status:
    type: String
    label: 'Status'
    defaultValue: 'active'
    autoform:
      type: 'select'
      options: ->
        Lists.Inventory.Status
)

Schema.stockHolding = new SimpleSchema(
  item_id:
    type: String
    label: 'Item Sys ID'
  itemText:
    type: String
    label: 'Item Decsription'
  stockLevel:
    type: Number
    label: 'Item Sys ID'
  reorderLevel:
    type: Number
    label: 'Item Sys ID'
  orderQuantity:
    type: Number
    label: 'Item Sys ID'
)

Schema.bins = new SimpleSchema(
  id: #Copy of _id used by treeView
    type: String
    label: 'Sys ID'
    optional: true
  createdDate:
    type: Date
    label: 'Created Date'
    optional: true
  binID:
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
  stock:
    type: [Schema.stockHolding]
    label: 'Stock Holding'
    optional: true
)

Schema.equipment = new SimpleSchema(
  id: #Copy of _id used by treeView
    type: String
    label: 'Sys ID'
    optional: true
  supplier_id:
    type: String
    label: 'Supplier Sys ID'
    optional: true
  createdDate:
    type: Date
    label: 'Created Date'
    optional: true
  equipmentID:
    type: String
    label: 'ID'
    optional: true
  classificationID:
    type: String
    label: 'ID'
    optional: true
  type:
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
  description:
    type: String
    label: 'Description'
  parent:
    type: String
    label: 'Parent Sys ID'
    defaultValue: '#'
  treePath:
    type: [String]
    label: 'Tree Path'
    optional: true
  stockUnits:
    type: String
    label: 'Units of Measure'
    autoform:
      type: 'select'
      options: ->
        Lists.Inventory.Units
  status:
    type: String
    label: 'Status'
    defaultValue: 'active'
    autoform:
      type: 'select'
      options: ->
        Lists.Inventory.Status
)
