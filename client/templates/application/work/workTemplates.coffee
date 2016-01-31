Template.workTemplatesPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.workTemplatesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.workTemplatesPage.helpers
  customTemplate: -> Customisations.workTemplates
  workCollection: -> Workplans
  settings: ->
    return {
      rowsPerPage: 10
      showFilter: true
      fields:  [
        { key: 'createdByID', label: ' Created by ID' }
        { key: 'text', label: ' Title' }
        { key: 'location', label: 'View/Edit/Delete', tmpl: Template.editWork }
      ]
    }

Template.workTemplatesPage.events
  'click .workTemplates .btnView': (event) ->
    Collections.Workplans.Current = this
    FlowRouter.go '/work/view-work'
  'click .workTemplates .btnEdit': (event) ->
    Collections.Workplans.Current = this
    FlowRouter.go '/work/edit-work'
  'click .workTemplates .btnDelete': (event) ->
    Collections.Workplans.Current = this
    MaterializeModal.display
      bodyTemplate: 'workTemplatesDelete'
      title: 'Delete Work Template!'
      submitLabel: 'Delete'
      closeLabel: 'Cancel'
      callback: (error, response) ->
        if error
          console.error error
        else
          if response.submit
            Meteor.call 'deleteWork', Collections.Workplans.Current._id, (error, result) ->
              if error
                Materialize.toast("Error", 3000, "red")
              else
                Materialize.toast("Deleted", 3000, "teal")
              return
        return

Template.editWork.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editWork.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
