Template.viewPeoplePage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'directory'

<<<<<<< HEAD
Template.viewPeoplePage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.viewPeoplePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewPeoplePage.helpers
  customTemplate: -> Customisations.viewPeople
=======
Template.viewPeoplePage.helpers
customTemplate: -> Customisations.viewPeople
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
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
<<<<<<< HEAD
        { key: 'location', label: 'Edit/Secure/Delete', tmpl: Template.editPerson }
=======
        { key: 'location', label: 'Edit/Delete', tmpl: Template.editPerson }
>>>>>>> f29d492fcbbde9cd0cf1b67eda297da492857da3
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
