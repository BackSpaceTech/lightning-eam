Meteor.methods
  createCompany: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert an company into the collection
    Companies.insert doc , (error,id) ->
      if(id)
        return 'Created'
      else
        console.log(error)
        return error
  deleteCompany: (doc) ->
    # Delete a company from the collection
    this.unblock()
    Companies.remove doc
    return 'Deleted'
  createPurchase: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert an Purchase into the collection
    Purchases.insert doc , (error,id) ->
      if(id)
        return 'Created'
      else
        console.log(error)
        return error
  deletePurchase: (doc) ->
    # Delete a Purchase from the collection
    this.unblock()
    Purchases.remove doc
    return 'Deleted'
  goodsReceived: (docID, itemID, qty, invLoc) ->
    # Update purchase order
    Purchases.update { _id: docID, 'reqItems._id': itemID }, { $inc: { 'reqItems.$.goodsReceived' : qty } }
    # Update inventory bin location
    # Check if items already in location
    temp = Bins.findOne { _id: invLoc, 'stock.item_id': itemID }
    if temp
      Bins.update { _id: invLoc, 'stock.item_id': itemID }, { $inc: { 'stock.$.stockLevel' : qty } }, (error,result) ->
        if(result)
          return 'Goods received'
        else
          console.log(error)
          return error
    else
      stockQty = {
        item_id: itemID
        itemText: Items.findOne({_id: itemID }).text
        stockLevel: qty
      }
      Bins.update { _id: invLoc }, { $push: { 'stock' : stockQty } }, (error,result) ->
        if(result)
          return 'Goods received'
        else
          console.log(error)
          return error
