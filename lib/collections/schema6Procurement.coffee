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
    optional: true
  fax:
    type: String
    label: 'Fax Number'
    optional: true
  streetAddress:
    type: String
    label: 'Address'
    optional: true
  streetCity:
    type: String
    label: 'City'
    optional: true
  streetState:
    type: String
    label: 'State'
    optional: true
  streetCountry:
    type: String
    label: 'Country'
    optional: true
  streetZip:
    type: String
    label: 'Zip Post Code'
    optional: true
  postalAddress:
    type: String
    label: 'Postal Address'
    optional: true
  postalCity:
    type: String
    label: 'City'
    optional: true
  postalState:
    type: String
    label: 'State'
    optional: true
  postalCountry:
    type: String
    label: 'Country'
    optional: true
  postalZip:
    type: String
    label: 'Zip Post Code'
    optional: true
)

Schema.reqItems = new SimpleSchema(
  itemID:
    type: String
    label: 'Item Sys ID'
  referenceID:
    type: String
    label: 'Reference ID'
    optional: true
  text:
    type: String
    label: 'Title'
  qty:
    type: Number
    label: 'Quantity'
  comments:
    type: String
    label: 'Comments'
)

schemaPurchaseReqs = {
  refID:
    type: String
    label: 'Reference ID'
    optional: true
  workID:
    type: String
    label: 'Work Request/Order ID'
    optional: true
  assetID:
    type: String
    label: 'Asset ID'
    optional: true
  createdDate:
    type: Date
  requiredDate:
    type: Date
    optional: true
  reqItems:
    type: [Schema.reqItems]
    label: 'Items'
    optional: true
  freightCost:
    type: Number
    label: 'Freight Cost'
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
}
