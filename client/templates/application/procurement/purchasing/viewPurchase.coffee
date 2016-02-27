Template.viewPurchasePage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'currentDoc', {}  # Requisition doc

Template.viewPurchasePage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewPurchasePage.helpers
  customTemplate: -> Customisations.viewPurchase
  frmTitle: ->
    if Collections.Purchases.Current.status == '1'
      return 'View Purchase Requisition'
    else
      return 'View Purchase Order'
  editDoc: ->
    temp = Session.get 'currentDoc'
    if jQuery.isEmptyObject(temp)
      Session.set 'currentDoc', Purchases.findOne {_id: Collections.Purchases.Current._id }
    temp
  purchaseItems: -> Session.get('currentDoc').reqItems
  settings: -> ## Purchase Items
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: '_id', hidden: true  }
        { key: 'itemID', hidden: true  }
        { key: 'type', hidden: true  }
        { key: 'referenceID', label: ' Reference ID' }
        { key: 'text', label: ' Title' }
        { key: 'orderQty', label: ' Qty' }
        { key: 'stockUnits', hidden: true  }
        { key: 'itemPrice', label: ' Price' }
        { key: 'excludesTax', label: ' Ex Tax', tmpl: Template.rtBoolean }
        { key: 'comments', label: ' Comments' }
        { key: '', label: 'Delete', tmpl: Template.rtDelete }
      ]
    }
