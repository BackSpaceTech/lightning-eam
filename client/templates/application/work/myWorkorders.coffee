Template.myWorkordersPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.myWorkordersPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.myWorkordersPage.helpers
  myWork: -> Workorders.find {}
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
        { key: 'assetID', label: 'Asset ID' }
        { key: 'assetText', label: 'Asset' }
        { key: 'text', label: 'Title' }
        { key: 'location', label: 'Start/View/Edit', tmpl: Template.startWO }
        { key: 'status', label: 'Status' }
      ]
    }

Template.myWorkordersPage.events
  'click .myWorkorders .btnStart': (e) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/work/my-workorder'
  'click .myWorkorders .btnView': (e) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/work/view-workorder'
  'click .myWorkorders .btnEdit': (e) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/work/edit-workorder'

Template.startWO.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.startWO.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
