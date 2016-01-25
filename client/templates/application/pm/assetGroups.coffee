Template.assetGroupsPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.assetGroupsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.assetGroupsPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'assetGroups'

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
        { key: '', label: 'View/Edit/Delete', tmpl: Template.editWork }
      ]
    }

Template.assetGroupsPage.events
  'click .btnView': (e) ->
    Collections.Assetgroups.Current = this
    Session.set 'currentDoc', this
    FlowRouter.go '/pm/view-group'
  'click .btnEdit': (e) ->
    Collections.Assetgroups.Current = this
    Session.set 'currentDoc', this
    FlowRouter.go '/pm/edit-group'
  'click .btnDelete': (e) ->
    Collections.Assetgroups.Current = this
    MaterializeModal.display
      bodyTemplate: 'assetGroupsDelete'
      title: 'Delete Work Template!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteAssetGroup', Collections.Assetgroups.Current._id
        return

Template.editAssetGroup.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editAssetGroup.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
