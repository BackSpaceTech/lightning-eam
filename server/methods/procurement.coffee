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
