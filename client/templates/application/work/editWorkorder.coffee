Template.editWorkorderPage.onRendered ->
  if !Collections.Workorders.Current.workTeam
    Collections.Workorders.Current.workTeam = []
  Session.set 'currentDoc', Collections.Workorders.Current

Template.editWorkorderPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editWorkorderPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.editWorkorderPage.helpers
  customTemplate: -> Customisations.viewAsset
  viewDoc: -> Session.get 'currentDoc'
  workorder: -> Collections.Workorders.Current.status > 2
  workorderFormSchema: -> Schema.workorders
  statusRequest: -> Collections.Workorders.Current.status

Template.editRequestForm.helpers
  requestOptions: ->
    return {
      0: 'Request Cancelled'
      1: 'Request Started'
      2: 'Request Returned'
      3: 'Request Accepted'
    }

Template.editWorkorderForm.helpers
  workOptions: ->
    return {
      4: 'Work Order Created'
      5: 'Work Order Approved'
      6: 'Work Order Planned'
      7: 'Work Order Scheduled'
      8: 'Work Order In Progress'
      9: 'Work Order Completed'
      10: 'Work Order Financials'
      11: 'Work Order Reviewed'
      12: 'Work Order Closed'
    }
  faultOptions: -> Lists.Workorders.Fault
  causeOptions: -> Lists.Workorders.Cause
  remedyOptions: -> Lists.Workorders.Remedy
  teamMembers: -> (Session.get 'currentDoc').workTeam

Template.editWorkorderForm.events
  'click .btnAdd': (e) ->
    MaterializeModal.display {
      bodyTemplate: 'editWorkorderFormAddUser'
      title: 'Add Team Member'
    }
  'click .autoform-remove-item': (e) ->
    temp = this.current.userID.substring(this.current.userID.indexOf('.') + 1, this.current.userID.lastIndexOf('.'))
    Collections.Workorders.Current.workTeam.splice(temp,1)
    Session.set 'currentDoc', Collections.Workorders.Current

Template.editWorkorderFormAddUser.helpers
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'profile.firstName', label: ' First Name' }
        { key: 'profile.lastName', label: 'Last Name' }
        { key: 'profile.cpyName', label: 'Company' }
        { key: 'profile.cpyDiv', label: 'Division' }
        { key: 'location', label: 'Add Team Member', tmpl: Template.editWorkorderModalAddUser }
      ]
    }

Template.editWorkorderFormAddUser.events
  'click .btnEach': (e) ->
    temp = {
      userID: this._id
      firstName: this.profile.firstName
      lastName: this.profile.lastName
    }
    # Check if not already added
    added = $.grep Collections.Workorders.Current.workTeam, (a) ->
      return a.userID == temp.userID
    if added.length>0
      MaterializeModal.alert title: "Error", message: "User already in team."
      return
    if Collections.Workorders.Current.workTeam&&Collections.Workorders.Current.workTeam.length!=0
      Collections.Workorders.Current.workTeam.push(temp)
    else
      Collections.Workorders.Current.workTeam = []
      Collections.Workorders.Current.workTeam[0] = temp
    Session.set 'currentDoc', Collections.Workorders.Current
    console.log JSON.stringify Session.get('currentDoc')
    MaterializeModal.close()
