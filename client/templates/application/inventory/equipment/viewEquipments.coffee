Template.viewEquipmentsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewEquipmentsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewEquipmentsPage.helpers
  customTemplate: -> Customisations.viewEquipments
  rtCollection: -> Equipment
  settings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'supplier_id', label: ' Supplier ID' }
      { key: 'equipmentID', label: ' Equipment ID' }
      { key: 'type', label: ' Type' }
      { key: 'referenceID', label: ' Reference ID' }
      { key: 'text', label: ' Title' }
      { key: 'description', label: ' Description' }
      { key: '', label: 'View/Edit/Delete', tmpl: Template.rtViewEditDelete }
    ]
  }

Template.viewEquipmentsPage.events
  'click .viewEquipments .btnView': (event) ->
    Session.set 'currentDoc', Equipment.findOne {_id: this._id}
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/Equipment/view-equipment'

  'click .viewEquipments .btnEdit': (event) ->
    Session.set 'currentDoc', Equipment.findOne {_id: this._id}
    Session.set 'currentClassID', ''
    FlowRouter.go '/inventory/equipment/edit-equipment'

  'click .viewEquipments .btnDelete': (event) ->
    Collections.Equipment.CurrentID = this._id
    MaterializeModal.display
      bodyTemplate: 'viewEquipmentsDelete'
      title: 'Delete equipment!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteEquipment',  Collections.Equipment.CurrentID, (error, result) ->
              if error
                toast 'error', error
              else
                toast 'success', result
              return
        return
