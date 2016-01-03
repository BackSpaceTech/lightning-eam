Template.viewPeoplePage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'directory'

Template.viewPeoplePage.helpers
  userProfiles: -> Meteor.users.find()
  userEmail: -> this.emails[0].address
  userID: -> this._id
  userRole: -> this.roles[0]
  userArray: -> Meteor.users.find()
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'profile.firstName', label: ' First Name' }
        { key: 'profile.lastName', label: 'Last Name' }
        { key: 'profile.cpyName', label: 'Company' }
        { key: 'profile.cpyDiv', label: 'Division' }
        { key: 'emails.0.address', label: 'Email' }
        { key: 'roles.0', label: 'Role' }
        { key: 'location', label: 'Edit/Delete', tmpl: Template.editPerson }
      ]
    }

Template.viewPeoplePage.events
  'click .btnEach': (e) ->
    Collections.Users.Current = this
    FlowRouter.go '/resources/edit-people'
  'click .btnEach2': (e)  ->
    Collections.Users.Current = this
    FlowRouter.go '/resources/credentials'
  'click .btnEach3': (e) ->
    deleteUser
  'click .btnDelete': (e) ->
    Collections.Users.Current = this
    $('#viewPeoplePageModal').openModal()
  'click .btnConfirm': (e) ->
    temp = Collections.Users.Current
    Meteor.call 'deleteUser', temp._id
    FlowRouter.go '/resources'
