Template.myWorkordersPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.myWorkordersPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.myWorkordersPage.helpers
  spinner: ->
    MaterializeModal.loading
  nospinner: ->
    MaterializeModal.close
  numDocs: ->
    temp = Counts.get 'workorders-count'
    if temp > 1000
      FlowRouter.go '/work'
      toastr.error 'Your query exceeds 1000 docs. ('+temp+')'
    else
      return temp
  customTemplate: -> Customisations.viewPeople
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: '_id', label: 'System ID' }
        { key: 'refID', label: 'Reference ID' }
        { key: 'reqByFirstName', label: ' First Name' }
        { key: 'reqByLastName', label: 'Last Name' }
        { key: 'reqDate', label: 'Date Requested' }
        { key: 'assetID', label: 'Asset ID' }
        { key: 'assetText', label: 'Asset' }
        { key: 'reqDescription', label: 'Request' }
        { key: 'description', label: 'Description' }
        { key: 'location', label: 'View/Edit/Delete', tmpl: Template.editWO }
        { key: 'status', label: 'Status' }
      ]
    }

Template.myWorkordersPage.events
  'click .btnView': (e) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/work/view-workorder'
  'click .btnEdit': (e) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/work/edit-workorder'
  'click .btnDelete': (e) ->
    Collections.Workorders.Current = this
    MaterializeModal.display
      bodyTemplate: 'workQueryDelete'
      title: 'Delete Work Record!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteWO', Collections.Workorders.Current._id
        return

Template.doWO.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.doWO.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
