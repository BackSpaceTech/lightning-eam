Template.workQueryPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.workQueryPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.workQueryPage.helpers
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

Template.workQueryPage.events
  'click .workQuery .btnView': (event) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/work/view-workorder'
  'click .workQuery .btnEdit': (event) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/work/edit-workorder'
  'click .workQuery .btnDelete': (event) ->
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
            Meteor.call 'deleteWO', Collections.Workorders.Current._id, (error, result) ->
              if error
                Materialize.toast("Error", 3000, "red")
              else
                Materialize.toast("Deleted", 3000, "green")
              return
        return

Template.editWO.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editWO.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
