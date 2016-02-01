Template.viewPMsPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.viewPMsPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.viewPMsPage.helpers
  customTemplate: -> Customisations.viewPMs
  collectionPM: -> PM
  settings: -> {
    rowsPerPage: 10
    showFilter: true
    fields:  [
      { key: '_id', label: ' System ID' }
      { key: 'userDetails.profile.firstName', label: ' First Name ' }
      { key: 'userDetails.profile.lastName', label: ' Last Name' }
      { key: 'assetGroupDetails.groupText', label: ' Asset Group' }
      { key: 'pmDescription', label: ' PM Description' }
      { key: '', label: 'View/Edit/Delete', tmpl: Template.rtViewEditDelete }
      { key: '', label: 'Activate', tmpl: Template.viewPMsActivate }
    ]
  }

Template.viewPMsPage.events
  'click .viewPMs .btnView': (event) ->
    Session.set 'currentDoc', PM.findOne {_id: this._id}
    FlowRouter.go '/pm/view-pm'

  'click .viewPMs .btnEdit': (event) ->
    Session.set 'currentDoc', PM.findOne {_id: this._id}
    FlowRouter.go '/pm/edit-pm'

  'click .viewPMs .btnDelete': (event) ->
    Collections.PM.CurrentID = this._id
    MaterializeModal.display
      bodyTemplate: 'viewPMsDelete'
      title: 'Delete PM!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deletePM',  Collections.PM.CurrentID, (error, result) ->
              if error
                toast 'error', error
              else
                toast 'success', result
              return
        return

  'click .viewPMs .btnStart': (event) ->
    Collections.PM.Current = PM.findOne {_id: this._id}
    Session.set 'currentDoc', Collections.PM.Current
    FlowRouter.go '/pm/activate-pm'
