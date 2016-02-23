Template.viewPurchasesPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewPurchasesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewPurchasesPage.helpers
  purchases: -> Purchases.find {}
  spinner: ->
    MaterializeModal.loading
  nospinner: ->
    MaterializeModal.close
  numDocs: ->
    temp = Counts.get 'workorders-count'
    if temp > 1000
      FlowRouter.go '/work'
      toast 'error', ('Your query exceeds 1000 docs. ('+temp+')')
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
        { key: '', label: 'View/Edit', tmpl: Template.rtViewEditDelete }
        { key: 'status', label: 'Status' }
      ]
    }

Template.viewPurchasesPage.events
  'click .viewPurchases .btnView': (event) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/procurement/purchase/view-purchase'
  'click .viewPurchases .btnEdit': (event) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/procurement/purchase/edit-purchase'
  'click .viewPurchases .btnDelete': (event) ->
    Collections.Workorders.Current = this
    FlowRouter.go '/procurement/purchase/delete-purchase'

Template.startWO.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.startWO.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
