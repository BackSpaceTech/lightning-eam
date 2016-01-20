Template.workTemplatesPage.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.workTemplatesPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.workTemplatesPage.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'workplans'

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
  'click .btnView': (e) ->
    Collections.Workplans.Current = this
    FlowRouter.go '/work/view-work'
  'click .btnEdit': (e) ->
    Collections.Workplans.Current = this
    FlowRouter.go '/work/edit-work'
  'click .btnDelete': (e) ->
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
            Meteor.call 'deleteWork', Collections.Workplans.Current._id
        return

Template.editWork.onRendered ->
  $('.tooltipped').tooltip {delay: 50}

Template.editWork.onDestroyed ->
  $('.tooltipped').tooltip 'remove'
