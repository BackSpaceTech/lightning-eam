Meteor.users.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true
Schema.UserProfile = new SimpleSchema(
  firstName:
    type: String
    regEx: /^[a-zA-Z-]{2,25}$/
    optional: true
  lastName:
    type: String
    regEx: /^[a-zA-Z]{2,25}$/
    optional: true
  cpyPosition:
    type: String
    label: 'Position'
    optional: true
  cpyName:
    type: String
    label: 'Company'
    optional: true
  cpyDiv:
    type: String
    label: 'Division'
    optional: true
  phone:
    type: Number
    label: 'Phone Number'
    optional: true
  mobile:
    type: Number
    label: 'Mobile Number'
    optional: true
  birthday:
    type: Date
    optional: true
  website:
    type: String
    regEx: SimpleSchema.RegEx.Url
    optional: true
  bio:
    type: String
    optional: true)
Schema.users = new SimpleSchema(
  createdAt: type: Date
  profile:
    type: Schema.UserProfile
    optional: true
  emails:
    type: [ Object ]
    optional: true
  'emails.$.address':
    type: String
    regEx: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,15})$/
  'emails.$.verified': type: Boolean
  trades:
    type: [ Object ]
    label: 'Trade Qualifications'
    optional: true
  'trades.$.trade':
    type: String
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.Trades
  'trades.$.level':
    type: String
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.TradeLevels
  'trades.$.expires':
    type: Date
    optional: true
  'trades.$.docLink':
    type: String
    regEx: /(^(?:[\w]\:|\\)(\\[a-zA-Z_\-\s0-9\.]+)+\.(txt|gif|pdf|doc|docx|xls|xlsx)$)|(^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$)/
    optional: true
  professions:
    type: [ Object ]
    label: 'Academic'
    optional: true
  'professions.$.profession':
    type: String
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.Professions
  'professions.$.level':
    type: String
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.ProfessionLevels
  'professions.$.expires':
    type: Date
    optional: true
  'professions.$.docLink':
    type: String
    regEx: /(^(?:[\w]\:|\\)(\\[a-zA-Z_\-\s0-9\.]+)+\.(txt|gif|jpg|pdf|doc|docx|xls|xlsx)$)|(^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$)/
    optional: true
  certifications:
    type: [ Object ]
    label: 'Certifications'
    optional: true
  'certifications.$.certification':
    type: String
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.Certifications
  'certifications.$.expires':
    type: Date
    optional: true
  'certifications.$.docLink':
    type: String
    regEx: /(^(?:[\w]\:|\\)(\\[a-zA-Z_\-\s0-9\.]+)+\.(txt|gif|pdf|doc|docx|xls|xlsx)$)|(^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$)/
    optional: true
  databases:
    type: [ String ]
    label: 'Database Access'
    autoform:
      type: 'select-multiple'
      options: ->
        temp1 = Locations.find({ type: 'database' }, fields:
          _id: true
          text: true).fetch()
        temp2 = []
        if temp1.length != 0
          a = 0
          while a < temp1.length
            temp2[a] =
              label: temp1[a].text
              value: temp1[a]._id
            a++
        return temp2
    optional: true
  roles:
    type: [ String ]
    label: 'Role'
    autoform:
      type: 'select'
      options: ->
        Lists.Resources.Roles
    optional: true
  services:
    type: Object
    optional: true
    blackbox: true)
Meteor.users.attachSchema Schema.users
