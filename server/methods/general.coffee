Meteor.methods
  createClass: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert a Class into the collection
    Class.insert doc , (error,id) ->
      if(id)
        tempPath = []
        # Get the parent Class tree path
        if (doc.parent!='#')
          temp = Class.findOne {'_id':doc.parent}
          if(temp)
            tempPath = temp.treePath
        # Add current doc _id
        tempPath.push(id)
        Class.update id, { $set: { treePath: tempPath }}
        Class.update id, { $set: { id: id }}
        return 'Created'
      else
        console.log(error)
        return error
  deleteClass: (doc) ->
    # Update the parent Class children list
    if (doc.parent!='#')
      temp = Class.findOne {'id':doc.parent}
      if (temp)
        Class.update(temp._id, { $pull: { children: doc.id }})
    # Delete a Class from the collection
    Class.remove doc
    this.unblock()
    return 'Deleted'
