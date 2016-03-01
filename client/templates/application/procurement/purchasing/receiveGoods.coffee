Template.receiveGoodsPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'singlePurchase', Collections.Purchases.Current._id
    self.subscribe 'bins-list'

Template.receiveGoodsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}
  Session.set 'currentID', 0 # Inventory location
  Session.set 'currentDoc', {}  # Requisition doc
  Session.set 'currentDoc2', {}  # Bins doc
  Collections.Items.Current = {}

Template.receiveGoodsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.receiveGoodsPage.helpers
  customTemplate: -> Customisations.receiveGoods
  purchaseItems: ->
    temp = Session.get 'currentDoc'
    if jQuery.isEmptyObject(temp)
      Session.set 'currentDoc', Purchases.findOne {_id: Collections.Purchases.Current._id }
    temp.reqItems
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
        { key: 'goodsReceived', label: ' Received' }
        { key: '', label: 'Update', tmpl: Template.rtAdd }
      ]
    }

Template.receiveGoodsPage.events
  'click .btnAdd': (event) ->
    tempItem = this
    if !tempItem.goodsReceived
      tempItem.goodsReceived = 0
    MaterializeModal.confirm
      bodyTemplate: 'receiveGoodsModal'
      title: 'Receive Goods'
      callback: (error, response) ->
        if (response.submit)
          receivedQty = Number($('#receiveGoodsQty').val())
          if receivedQty
            tempLoc = Bins.findOne {'id':Session.get('currentID').toString()}
            if tempLoc
              doc = Session.get 'currentDoc'
              tempItem.goodsReceived += receivedQty
              for a in [0...doc.reqItems.length]
                if doc.reqItems[a]._id == tempItem._id
                  itemIndex = a
                  break
              if doc.reqItems[itemIndex].orderQty < tempItem.goodsReceived
                toast 'error', 'Goods received exceeds order qty!'
              else if tempItem.goodsReceived < 0
                toast 'error', 'Negative inventory balance!'
              else
                doc.reqItems[itemIndex].goodsReceived = tempItem.goodsReceived
                Meteor.call 'goodsReceived', Collections.Purchases.Current._id, tempItem._id, receivedQty, Session.get('currentID').toString(), (error, result) ->
                  if error
                    toast 'error', error
                  else
                    toast 'success', 'Goods received'
                    Session.set 'currentDoc', Purchases.findOne {_id: Collections.Purchases.Current._id }
                  return
            else
              toast 'error', 'Invalid inventory location'

#------------------- Modal -------------------------------------

Template.receiveGoodsModal.onRendered ->
  temp = Bins.find().fetch()
  dataTree(temp , 'general')

Template.receiveGoodsModal.helpers
  invLocDetails: -> Bins.findOne {'id':Session.get('currentID').toString()}
