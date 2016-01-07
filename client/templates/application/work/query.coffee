Template.workQueryPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'workorders',Collections.Workorders.workQuery

Template.workQueryPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.workQueryPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.workQueryPage.helpers
  workArray: -> Workorders.find()
  customTemplate: -> Customisations.viewPeople
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
        { key: 'reqByFirstName', label: ' First Name' }
        { key: 'reqByLastName', label: 'Last Name' }
        { key: 'reqDate', label: 'Date Requested' }
        { key: 'assetID', label: 'Asset ID' }
        { key: 'assetText', label: 'Asset' }
        { key: 'reqDescription', label: 'Description' }
        { key: 'reqPriority', label: 'Priority', tmpl: Template.editWO }
        { key: 'status', label: 'Status' }
      ]
    }

Template.workQueryPage.events
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
