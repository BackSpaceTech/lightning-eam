###************************* Inventory *************************************###
Companies.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Purchases.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Schema.companies = new SimpleSchema(
  company_id:
    type: String
    label: 'Company ID'
    optional: true
  createdDate:
    type: Date
    label: 'Created Date'
    optional: true
  classificationID:
    type: String
    label: 'ID'
    optional: true
  type:
    type: String
    label: 'Type'
    defaultValue: 'supplier'
    autoform:
      type: 'select'
      options: ->
        Lists.Companies.Type
  referenceID:
    type: String
    label: 'Reference ID'
    optional: true
  status:
    type: String
    label: 'Status'
    defaultValue: 'active'
    autoform:
      type: 'select'
      options: ->
        Lists.Companies.Status
  text:
    type: String
    label: 'Title'
  description:
    type: String
    label: 'Description'
    optional: true
  name:
    type: String
    label: 'Company Name'
  tradingName:
    type: String
    label: 'Trading Name'
    optional: true
  companyNumber:
    type: String
    label: 'Company registration number'
    optional: true
  taxNumber:
    type: String
    label: 'Tax registration number'
    optional: true
  email:
    type: String
    label: 'Email Address'
    autoform:
      afFieldInput:
        type: "email"
    optional: true
  website:
    type: String
    label: 'Website'
    autoform:
      afFieldInput:
        type: "url"
    optional: true
  phone:
    type: String
    label: 'Phone Number'
  fax:
    type: String
    label: 'Fax Number'
    optional: true
  streetAddress:
    type: String
    label: 'Address'
  streetCity:
    type: String
    label: 'City'
  streetState:
    type: String
    label: 'State'
  streetCountry:
    type: String
    label: 'Country'
  streetZip:
    type: String
    label: 'Zip Post Code'
  postalAddress:
    type: String
    label: 'Postal Address'
  postalCity:
    type: String
    label: 'City'
  postalState:
    type: String
    label: 'State'
  postalCountry:
    type: String
    label: 'Country'
  postalZip:
    type: String
    label: 'Zip Post Code'
)

Schema.reqItems = new SimpleSchema(
  _id:
    type: String
    label: 'Item Sys ID'
  referenceID:
    type: String
    label: 'Reference ID'
    optional: true
  text:
    type: String
    label: 'Title'
  orderQty:
    type: Number
    label: 'Quantity'
  itemPrice:
    type: Number
    label: 'Price'
    decimal: true
  excludesTax:
    type: Boolean
    label: 'Excludes Tax'
  stockUnits:
    type: String
    label: 'Units of Measure'
    autoform:
      type: 'select'
      options: ->
        Lists.Inventory.Units
  comments:
    type: String
    label: 'Comments'
    optional: true
)

Schema.purchaseReqs = new SimpleSchema(
  refID:
    type: String
    label: 'Reference ID'
    optional: true
  billing_ID:
    type: String
    label: 'Billing ID'
  deliveryComments:
    type: String
    label: 'Delivery Comments'
    optional: true
  deliveryBy:
    type: Date
    label: 'Deliver By Date'
    optional: true
  deliveryContact:
    type: String
    label: 'Contact Name'
  deliveryName:
    type: String
    label: 'Delivery Name'
  deliveryPhone:
    type: String
    label: 'Phone'
  deliveryAddress:
    type: String
    label: 'Delivery Address'
  deliveryCity:
    type: String
    label: 'City'
  deliveryState:
    type: String
    label: 'State'
  deliveryCountry:
    type: String
    label: 'Country'
  deliveryZip:
    type: String
    label: 'Zip Post Code'
    optional: true
  supplier_ID:
    type: String
    label: 'Supplier ID'
  workID:
    type: String
    label: 'Work Order ID'
    optional: true
  workDesc:
    type: String
    label: 'Work Order Description'
    optional: true
  assetID:
    type: String
    label: 'Asset ID'
    optional: true
  assetText:
    type: String
    label: 'Asset Name'
    optional: true
  createdDate:
    type: Date
    optional: true
  requiredDate:
    type: Date
    optional: true
  reqItems:
    type: [Schema.reqItems]
    label: 'Items'
  freight:
    type: Number
    label: 'Freight Cost'
    decimal: true
  freightType:
    type: String
    label: 'Freight Method'
    autoform:
      type: 'select'
      options: ->
        Lists.Purchases.Freight
  type:
    type: String
    label: 'Type'
    autoform:
      type: 'select'
      options: ->
        Lists.Purchases.Types
  status:
    type: String
    label: 'Status'
    autoform:
      type: 'select'
      options: ->
        Lists.Purchases.Status
  reqPriority:
    type: String
    label: 'Requested Priority'
    autoform:
      type: 'select'
      options: ->
        Lists.Purchases.Priority
  reqDescription:
    type: String
    label: 'Request Description'
  reqComments:
    type: String
    label: 'Request Comments'
    optional: true
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
  reqByDate:
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
  goodsReceivedBy:
    type: String
    optional: true
  reqReceivedDate:
    type: Date
    optional: true
)
