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
