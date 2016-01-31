Template.assetGroupsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.assetGroupsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.assetGroupsPage.helpers
  customTemplate: -> Customisations.assetGroups
  assetGroupsCollection: -> Assetgroups
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: '_id', label: ' System ID' }
        { key: 'groupCreatedBy', label: ' Created By' }
        { key: 'groupText', label: ' Title' }
        { key: '', label: 'View/Edit/Delete', tmpl: Template.rtViewEditDelete }
      ]
    }

Template.assetGroupsPage.events
  'click .assetGroups .btnView': (event) ->
    Collections.Assetgroups.Current = this
    Session.set 'currentDoc', this
    FlowRouter.go '/pm/view-group'
  'click .assetGroups .btnEdit': (event) ->
    Collections.Assetgroups.Current = this
    Session.set 'currentDoc', this
    FlowRouter.go '/pm/edit-group'
  'click .assetGroups .btnDelete': (event) ->
    Collections.Assetgroups.Current = this
    MaterializeModal.display
      bodyTemplate: 'assetGroupsDelete'
      title: 'Delete Asset Group!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteAssetGroup', Collections.Assetgroups.Current._id, (error, result) ->
              if error
                Materialize.toast("Error", 3000, "red")
              else
                Materialize.toast("Deleted Asset Group", 3000, "green")
              return
        return
