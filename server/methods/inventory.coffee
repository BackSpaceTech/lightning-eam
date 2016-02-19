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
