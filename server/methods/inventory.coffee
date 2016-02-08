Meteor.methods
  createItem: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert an item into the collection
    Items.insert doc , (error,id) ->
      if(id)
        tempPath = []
        # Get the parent item's tree path
        if (doc.parent!='#')
          temp = Items.findOne {'_id':doc.parent}
          if(temp)
            tempPath = temp.treePath
        # Add current doc _id
        tempPath.push(id)
        Items.update id, { $set: { treePath: tempPath }}
        Items.update id, { $set: { id: id }}
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
    Items.remove doc
    this.unblock()
    return 'Deleted'
  createEquipment: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert an equipment into the collection
    Equipment.insert doc , (error,id) ->
      if(id)
        tempPath = []
        # Get the parent equipment's tree path
        if (doc.parent!='#')
          temp = Equipment.findOne {'_id':doc.parent}
          if(temp)
            tempPath = temp.treePath
        # Add current doc _id
        tempPath.push(id)
        Equipment.update id, { $set: { treePath: tempPath }}
        Equipment.update id, { $set: { id: id }}
        return 'Created'
      else
        console.log(error)
        return error
  deleteEquipment: (doc) ->
    # Update the parent equipment's children list
    if (doc.parent!='#')
      temp = Equipment.findOne {'id':doc.parent}
      if (temp)
        Equipment.update(temp._id, { $pull: { children: doc.id }})
    # Delete an equipment from the collection
    Equipment.remove doc
    this.unblock()
    return 'Deleted'
