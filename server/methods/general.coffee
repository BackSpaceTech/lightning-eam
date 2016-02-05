Meteor.methods
  createClassification: (doc) ->
    # Add date stamp
    doc.createdDate = new Date()
    # Insert a Classification into the collection
    Classification.insert doc , (error,id) ->
      if(id)
        tempPath = []
        # Get the parent Class tree path
        if (doc.parent!='#')
          temp = Classification.findOne {'_id':doc.parent}
          if(temp)
            tempPath = temp.treePath
        # Add current doc _id
        tempPath.push(id)
        Classification.update id, { $set: { treePath: tempPath }}
        Classification.update id, { $set: { id: id }}
        return 'Created'
      else
        console.log(error)
        return error
  deleteClassification: (doc) ->
    # Update the parent Classification children list
    if (doc.parent!='#')
      temp = Classification.findOne {'id':doc.parent}
      if (temp)
        Classification.update(temp._id, { $pull: { children: doc.id }})
    # Delete a Classification from the collection
    Classification.remove doc
    this.unblock()
    return 'Deleted'
