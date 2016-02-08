Template.viewItemsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewItemsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewItemsPage.helpers
  customTemplate: -> Customisations.viewItems
  rtCollection: -> Items
  settings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'supplier_id', label: ' Supplier ID' }
      { key: 'itemID', label: ' Item ID' }
      { key: 'type', label: ' Type' }
      { key: 'referenceID', label: ' Reference ID' }
      { key: 'text', label: ' Title' }
      { key: 'description', label: ' Description' }
      { key: '', label: 'View/Edit/Delete', tmpl: Template.rtViewEditDelete }
    ]
  }

Template.viewItemsPage.events
  'click .viewItems .btnView': (event) ->
    Session.set 'currentDoc', Items.findOne {_id: this._id}
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/items/view-item'

  'click .viewItems .btnEdit': (event) ->
    Session.set 'currentDoc', Items.findOne {_id: this._id}
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/items/edit-item'

  'click .viewItems .btnDelete': (event) ->
    Collections.Items.CurrentID = this._id
    MaterializeModal.display
      bodyTemplate: 'viewItemsDelete'
      title: 'Delete Item!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteItem',  Collections.Items.CurrentID, (error, result) ->
              if error
                toast 'error', error
              else
                toast 'success', result
              return
        return
