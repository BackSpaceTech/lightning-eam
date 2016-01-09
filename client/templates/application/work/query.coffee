Template.workQueryPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'workorders',Collections.Workorders.workQuery

Template.workQueryPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.workQueryPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.workQueryPage.helpers
  numDocs: ->
    temp = Counts.get 'workorders-count'
    if temp > 1000
      FlowRouter.go '/work'
      toastr.error 'Your query exceeds 1000 docs. ('+temp+')'
    else
      return temp
  workArray: -> Workorders.find()
  customTemplate: -> Customisations.viewPeople
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'refID', label: 'Reference ID' }
        { key: 'reqByFirstName', label: ' First Name' }
        { key: 'reqByLastName', label: 'Last Name' }
        { key: 'reqDate', label: 'Date Requested' }
        { key: 'assetID', label: 'Asset ID' }
        { key: 'assetText', label: 'Asset' }
        { key: 'reqDescription', label: 'Request' }
        { key: 'description', label: 'Description' }
        { key: 'reqPriority', label: 'Priority', tmpl: Template.editWO }
        { key: 'status', label: 'Status' }
      ]
    }

Template.workQueryPage.events
  'click .btnView': (e) ->
    Collections.Workorders.Current = this
