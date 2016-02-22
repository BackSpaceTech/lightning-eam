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
