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
        { key: '_id', hidden: true }
        { key: 'createdDate', label: ' Date Raised' }
        { key: 'status', label: ' Status' }
        { key: 'refID', label: ' Reference ID' }
        { key: 'billingDetails.text', label: ' Bill to' }
        { key: 'supplierDetails.text', label: ' Supplier' }
        { key: 'assetID', label: ' Asset ID' }
        { key: 'assetText', label: ' Asset' }
        { key: 'workID', label: ' Work Order ID' }
        { key: '', label: 'View/Edit/Delete', tmpl: Template.rtViewEditDelete }
      ]
    }

Template.viewPurchasesPage.events
  'click .viewPurchases .btnView': (event) ->
    Collections.Purchases.Current = this
    FlowRouter.go '/procurement/purchase/view-purchase'
  'click .viewPurchases .btnEdit': (event) ->
    Collections.Purchases.Current = this
    FlowRouter.go '/procurement/purchase/edit-purchase'
  'click .viewPurchases .btnDelete': (event) ->
    temp = this._id
    MaterializeModal.confirm
      title: 'Delete Document'
      label: 'Warning - Permanent Delete'
      message: 'You are about permanently delete a document. This cannot be reversed and may affect other documents that reference it.'
      callback: (error, response) ->
        if (response.submit)
          Meteor.call 'deletePurchase', temp, (error, result) ->
            if error
              toast 'error', error
            else
              toast 'success', result

Template.startWO.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.startWO.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
