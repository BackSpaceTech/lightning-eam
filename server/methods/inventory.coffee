Meteor.methods
  createItem: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert an item into the collection
    Items.insert doc , (error,id) ->
      if(id)
        return 'Created'
      else
        console.log(error)
        return error
  deleteItem: (doc) ->
    # Update the parent item's children list
    if (doc.parent!='#')
      temp = Items.findOne {'id':doc.parent}
      if (temp)
        Items.update(temp._id, { $pull: { children: doc.id }})
    # Delete an item from the collection
    this.unblock()
    Items.remove doc
    return 'Deleted'
  createEquipment: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert an equipment into the collection
    this.unblock()
    Equipment.insert doc , (error,id) ->
      if(id)
        return 'Created'
      else
        console.log(error)
        return error
  deleteEquipment: (doc) ->
    # Delete an equipment from the collection
    Equipment.remove doc, (error,id) ->
      if(id)
        return 'Deleted'
      else
        console.log(error)
        return error
  createInvLoc: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert an item into the collection
    Bins.insert doc , (error,id) ->
      if(id)
        tempPath = []
        # Get the parent item's tree path
        if (doc.parent!='#')
          temp = Bins.findOne {'_id':doc.parent}
          if(temp)
            tempPath = temp.treePath
        # Add current doc _id
        tempPath.push(id)
        Bins.update id, { $set: { treePath: tempPath }}
        Bins.update id, { $set: { id: id }}
        return 'Created'
      else
        console.log(error)
        return error
  deleteInvLoc: (doc) ->
    # Update the parent item's children list
    if (doc.parent!='#')
      temp = Bins.findOne {'id':doc.parent}
      if (temp)
        Bins.update(temp._id, { $pull: { children: doc.id }})
    # Delete an item from the collection
    this.unblock()
    Bins.remove doc
    return 'Deleted'
  updateInvLocation: (invLoc, itemID, qty, reorder, orderQty) ->
    # Update inventory bin location
    stockQty = {
      item_id: itemID
      itemText: Items.findOne({_id: itemID }).text
      stockLevel: qty
    }
    if reorder
      stockQty.reorderLevel = Number(reorder)
    if orderQty
      stockQty.orderQuantity = Number(orderQty)
    Bins.update { _id: invLoc, 'stock.item_id': itemID }, { $set: { 'stock.$' : stockQty } }, (error,result) ->
      if(result)
        return 'Goods received'
      else
        console.log(error)
        return error
  moveStock: (itemID, invLoc, newLoc, qty) ->
    # Add stock to new bin location
    # Check if items already in location
    temp = Bins.findOne { _id: newLoc, 'stock.item_id': itemID }
    if temp
      Bins.update { _id: newLoc, 'stock.item_id': itemID }, { $inc: { 'stock.$.stockLevel' : qty } }
    else
      stockQty = {
        item_id: itemID
        itemText: Items.findOne({_id: itemID }).text
        stockLevel: qty
      }
      temp2 = Bins.findOne { _id: newLoc }
      # Check if any items in new bin location
      if !temp2.stock
        Bins.update { _id: newLoc }, { $set: { 'stock' : [stockQty] } }
      else
        Bins.update { _id: newLoc }, { $push: { 'stock' : stockQty } }
    # Decrease previous bin location
    Bins.update { _id: invLoc, 'stock.item_id': itemID }, { $inc: { 'stock.$.stockLevel' : -qty } }, (error,result) ->
      if(result)
        # Remove if no stock left
        Bins.update { _id: invLoc }, { $pull: { stock: { stockLevel: 0 }}}
        return 'Stock Moved'
      else
        console.log(error)
        return error
