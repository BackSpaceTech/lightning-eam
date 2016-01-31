Template.safetyTemplatesPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.safetyTemplatesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.safetyTemplatesPage.helpers
  customTemplate: -> Customisations.safetyTemplates
  safetyCollection: -> Safetyplans
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'createdByID', label: ' Created by ID' }
        { key: 'text', label: ' Title' }
        { key: 'location', label: 'View/Edit/Delete', tmpl: Template.rtViewEditDelete }
      ]
    }

Template.safetyTemplatesPage.events
  'click .safetyTemplates .btnView': (event) ->
    Collections.Safetyplans.Current = this
    FlowRouter.go '/work/view-safety'
  'click .safetyTemplates .btnEdit': (event) ->
    Collections.Safetyplans.Current = this
    FlowRouter.go '/work/edit-safety'
  'click .safetyTemplates .btnDelete': (event) ->
    Collections.Safetyplans.Current = this
    MaterializeModal.display
      bodyTemplate: 'safetyTemplatesDelete'
      title: 'Delete Safety Template!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteSafety', Collections.Safetyplans.Current._id, (error, result) ->
              if error
                toast 'error', error
              else
                toast 'success', result
              return
        return
